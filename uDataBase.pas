unit uDataBase;

interface

uses System.Classes, System.SysUtils, DB,
     ZConnection, ZDataSet, System.Generics.Collections,
     System.IniFiles;

type

  TParameter  = TDictionary<string, variant>;
  TParameters = TDictionary<integer, TParameter>;

  TDBCommand = class
  private

    FUpdateSQL : string;
    FDeleteSQL : string;
    FInsertSQL : string;
    FSelectSQL : string;
    FExistSQL  : string;
    FSetSQL    : string;
    FConnection: TZConnection;
    FQuery     : TZQuery;
    FDelete    : boolean;
    FLoaded    : boolean;
    FRow       : TParameter;
    FRowSet    : TParameters;

    procedure DoExec(aSQL: string);
  protected

    FParameter: TParameter;

    procedure SetParameter(aName: string; aValue: variant; aNew: boolean = FALSE);

    procedure DoInsert;
    procedure DoUpdate;
    procedure DoDelete;

    procedure CloseQueryConnection;
    procedure BeforeOpen(aDataSet: TDataSet);
    procedure BeforeConnect(aSender: TObject);

    procedure SetRow(const aValue: TParameter);
    procedure SetRowSet(const aValue: TParameters);

    function  CheckExist: boolean;
  public

    constructor Create; virtual;
    destructor Destroy; override;

    procedure LoadFromPK;
    procedure LoadSet;

    property InsertSQL: string      read FInsertSQL write FInsertSQL;
    property UpdateSQL: string      read FUpdateSQL write FUpdateSQL;
    property DeleteSQL: string      read FDeleteSQL write FDeleteSQL;
    property SelectSQL: string      read FSelectSQL write FSelectSQL;
    property ExistSQL : string      read FExistSQL  write FExistSQL;
    property SetSQL   : string      read FSetSQL    write FSetSQL;
    property Delete   : boolean     read FDelete    write FDelete;
    property Loaded   : boolean     read FLoaded;
    property Exist    : boolean     read CheckExist;
    property Row      : TParameter  read FRow       write SetRow;
    property RowSet   : TParameters read FRowSet    write SetRowSet;
  end;

  TDBCDependente = class(TDBCommand)
  private

    FId: cardinal;

    procedure SetId(const aValue: cardinal);
    procedure SetFuncionario_CPF(const aValue: string);
  public

    constructor Create; override;

    property Id             : cardinal read FId write SetId;
    property Funcionario_CPF: string            write SetFuncionario_CPF;
  end;

  TDBCFuncionario = class(TDBCommand)
  private

    FCPF : string;

    procedure SetCPF(const aValue: string);
  public

    constructor Create; override;

    property CPF: string read FCPF write SetCPF;
  end;

implementation

const
  C_ERROR: string = '[TDBCommand.%s] - Falha na operação de %s no BD!'#13#10'Mensagem: %s';

procedure TDBCommand.DoExec(aSQL: string);
var

  I: integer;
begin

  if (aSQL <= emptyStr) OR (FParameter.Count = 0) then
    exit;

  FConnection.Connect;
  try

    try

      FQuery.Active   := FALSE;
      FQuery.SQL.Text := aSQL;

      for I := 0 to FQuery.Params.Count - 1 do
        FQuery.Params[I].Value := FParameter.Items[lowercase(FQuery.Params[I].Name)];

      FQuery.ExecSQL;
    except

      raise Exception.Create(Format(C_ERROR, ['DoExec', 'SALVAMENTO', Exception(ExceptObject).Message]));
    end;
  finally

    CloseQueryConnection;
  end;
end;

procedure TDBCommand.SetParameter(aName: string; aValue: variant; aNew: boolean = FALSE);
begin

  aNew := (aNew) OR (NOT Assigned(FParameter));

  if aNew then
  begin

    if Assigned(FParameter) then
      FreeAndNIL(FParameter);

    FParameter := TParameter.Create;
  end;

  FParameter.Add(lowercase(aName), aValue);
end;

procedure TDBCommand.DoUpdate;
begin

  if UpdateSQL <= emptyStr then
    exit;

  DoExec(UpdateSQL);
end;

procedure TDBCommand.DoDelete;
begin

  if DeleteSQL <= emptyStr then
    exit;

  DoExec(DeleteSQL);
end;

procedure TDBCommand.DoInsert;
begin

  if InsertSQL <= emptyStr then
    exit;

  DoExec(InsertSQL);
end;

procedure TDBCommand.LoadFromPK;
var

  I: integer;
begin

  FLoaded := FALSE;

  if (SelectSQL <= emptyStr) OR (FParameter.Count = 0) then
    exit;

  try

    FQuery.Active   := FALSE;
    FQuery.SQL.Text := SelectSQL;

    for I := 0 to FQuery.Params.Count - 1 do
      FQuery.Params[I].Value := FParameter.Items[lowercase(FQuery.Params[I].Name)];

    FRow.Clear;
    FQuery.Open;

    for I := 0 to FQuery.FieldCount - 1 do
      FRow.Add(lowercase(FQuery.Fields[I].FieldName),
               FQuery.Fields[I].Value);

    FLoaded := NOT FQuery.IsEmpty;
  except

    raise Exception.Create(Format(C_ERROR, ['LoadFromPK', 'LEITURA', Exception(ExceptObject).Message]));
  end;
end;

procedure TDBCommand.LoadSet;
var

  I, J: integer;
begin
  FLoaded := FALSE;

  if (SetSQL <= emptyStr) OR (FParameter.Count = 0) then
    exit;

  try

    FQuery.Active   := FALSE;
    FQuery.SQL.Text := SetSQL;

    for I := 0 to FQuery.Params.Count - 1 do
      FQuery.Params[I].Value := FParameter.Items[lowercase(FQuery.Params[I].Name)];

    J := 0;

    FQuery.Open;
    FQuery.First;
    FRowSet.Clear;
    while NOT FQuery.Eof do
    begin

      FRow.Clear;

      for I := 0 to FQuery.FieldCount - 1 do
        FRow.Add(lowercase(FQuery.Fields[I].FieldName),
                 FQuery.Fields[I].Value);

      FRowSet.Add(J, FRow);
      FQuery.Next;
      inc(J);
    end;

    FLoaded := NOT FQuery.IsEmpty;
  except

    raise Exception.Create(Format(C_ERROR, ['LoadSet', 'LEITURA', Exception(ExceptObject).Message]));
  end;
end;

function  TDBCommand.CheckExist: boolean;
var

  I: integer;
begin

  result := FALSE;

  if (ExistSQL <= emptyStr) OR (FParameter.Count = 0) then
    exit;

  try

    FQuery.Active   := FALSE;
    FQuery.SQL.Text := ExistSQL;

    for I := 0 to FQuery.Params.Count - 1 do
      FQuery.Params[I].Value := FParameter.Items[lowercase(FQuery.Params[I].Name)];

    FQuery.Open;

    result := NOT FQuery.IsEmpty;
  except

    raise Exception.Create(Format(C_ERROR, ['LoadSet', 'LEITURA', Exception(ExceptObject).Message]));
  end;
end;

procedure TDBCommand.CloseQueryConnection;
begin

  FQuery.Close;
  FConnection.Disconnect;
end;

procedure TDBCommand.BeforeOpen(aDataSet: TDataSet);
begin

  FConnection.Connected := TRUE;
end;

procedure TDBCommand.BeforeConnect(aSender: TObject);
const

  C_INIFILENAME: string = '%sTheos.ini';
var

  lIni: TIniFile;
begin

  // configuração de conexão do banco de dados;
  lIni := TIniFile.Create(Format(C_INIFILENAME, [ExtractFilePath(ParamStr(0))]));
  try

    //Read
    FConnection.HostName        := lIni.ReadString('SERVER', 'Host', 'localhost');
    FConnection.Port            := lIni.ReadInteger('SERVER', 'Port', 3306);
    FConnection.User            := lIni.ReadString('SERVER', 'User', 'root');
    FConnection.Protocol        := lIni.ReadString('SERVER', 'Protocol', 'MySQL');
    FConnection.Database        := lIni.ReadString('SERVER', 'DataBase', 'Theos');
    FConnection.LibraryLocation := lIni.ReadString('SERVER', 'LibraryPath', ExtractFilePath(ParamStr(0)) + 'libmysql.dll');
    FConnection.Password        := lIni.ReadString('SERVER', 'Password', 'Software1974');

    //Write
    lIni.WriteString('SERVER', 'Host', FConnection.HostName);
    lIni.WriteInteger('SERVER', 'Port', FConnection.Port);
    lIni.WriteString('SERVER', 'User', FConnection.User);
    lIni.WriteString('SERVER', 'Protocol', FConnection.Protocol);
    lIni.WriteString('SERVER', 'Database', FConnection.DataBase);
    lIni.WriteString('SERVER', 'LibraryPath', FConnection.LibraryLocation);
    lIni.WriteString('SERVER', 'Password', FConnection.Password);
  finally

    FreeAndNIL(lIni);
  end;
end;

procedure TDBCommand.SetRow(const aValue: TParameter);
begin

  FRow := aValue;

  FParameter.Clear;
  FParameter := aValue;

  if Delete then

    DoDelete
  else if CheckExist then

    DoUpdate
  else

    DoInsert;
end;

procedure TDBCommand.SetRowSet(const aValue: TParameters);
var

  I: integer;
begin

  FRowSet := aValue;

  // só é permitida a exclusão de um registro, via PK, sets de registro não podem ser excluídos
  FDelete := FALSE;

  I := 0;
  repeat

    // setando o registro o update ou insert será realizado
    Row := FRowSet.Items[I];
    inc(I);
  until I = FRowSet.Count;
end;

constructor TDBCommand.Create;
begin

  FConnection               := TZConnection.Create(NIL);
  FConnection.BeforeConnect := BeforeConnect;
  FQuery                    := TZQuery.Create(NIL);
  FQuery.Connection         := FConnection;
  FQuery.BeforeOpen         := BeforeOpen;
  FLoaded                   := FALSE;
  FParameter                := TParameter.Create;
  FRow                      := TParameter.Create;
  FRowSet                   := TParameters.Create;
end;

destructor TDBCommand.Destroy;
begin

  FreeAndNIL(FRow);
  FreeAndNIL(FRowSet);
  FreeAndNIL(FParameter);
  FreeAndNIL(FQuery);
  FreeAndNIL(FConnection);

  inherited Destroy;
end;

procedure TDBCDependente.SetId(const aValue: cardinal);
begin

  try

    SetParameter('Id', aValue, TRUE);
    LoadFromPK;

    if NOT Loaded then
      exit;

    FId := aValue;
  finally

    CloseQueryConnection;
  end;
end;

procedure TDBCDependente.SetFuncionario_CPF(const aValue: string);
begin

  try

    FDelete := FALSE;
    SetParameter('Funcionario_CPF', aValue, TRUE);
    LoadSet;
  finally

    CloseQueryConnection;
  end;
end;

constructor TDBCDependente.Create;
begin

  inherited Create;

  InsertSQL := ' INSERT INTO dependente '
             + '     (Funcionario_CPF, Nome, IsCalculaIR, IsCalculaINSS) '
             + ' VALUES (:Funcionario_CPF, :Nome, :IsCalculaIR, :IsCalculaINSS) ';

  UpdateSQL := ' UPDATE dependente '
             + ' SET Funcionario_CPF = :Funcionario_CPF, '
             + '     Nome = :Nome, '
             + '     IsCalculaIR = :IsCalculaIR, '
             + '     IsCalculaINSS = :IsCalculaINSS '
             + ' WHERE Id = :Id ';

  DeleteSQL := ' DELETE FROM dependente '
             + ' WHERE Id = :Id ';

  SelectSQL := ' SELECT * FROM dependente '
             + ' WHERE Id = :Id ';

  ExistSQL  := ' SELECT 1 FROM dependente '
             + ' WHERE Id = :Id ';

  SetSQL    := ' SELECT * FROM dependente '
             + ' WHERE Funcionario_CPF = :Funcionario_CPF ';
end;

procedure TDBCFuncionario.SetCPF(const aValue: string);
begin

  try

    SetParameter('CPF', aValue, TRUE);
    LoadFromPK;

    if NOT Loaded then
      exit;

    FCPF := aValue;
  finally

    CloseQueryConnection;
  end;
end;

constructor TDBCFuncionario.Create;
begin

  inherited Create;

  InsertSQL := ' INSERT INTO '
             + '   funcionario (CPF, Nome, Salario) '
             + '   VALUES (:CPF, :Nome, :Salario) ';

  UpdateSQL := ' UPDATE funcionario '
             + ' SET Nome = :Nome, '
             + ' Salario = :Salario '
             + ' WHERE CPF = :CPF ';

  DeleteSQL := ' DELETE FROM funcionario '
             + ' WHERE CPF = :CPF; ';

  SelectSQL := ' SELECT * FROM funcionario '
             + ' WHERE CPF = :CPF ';

  ExistSQL  := ' SELECT 1 FROM funcionario '
             + ' WHERE CPF = :CPF ';
end;


end.
