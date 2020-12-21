unit uDataBase;

interface

uses System.Classes, System.SysUtils, uFuncionario, uDependente, DB,
     ZConnection, ZDataSet;

type

  TDBCommand = class
  private

    FUpdateSQL : string;
    FDeleteSQL : string;
    FInsertSQL : string;
    FSelectSQL : string;
    FConnection: TZConnection;
    FQuery     : TZQuery;
    FDelete    : boolean;

    procedure DoExec(aSQL: string; aParams: TParams);
  protected

    procedure DoInsert(aParams: TParams);
    procedure DoUpdate(aParams: TParams);
    procedure DoDelete(aParams: TParams);
    procedure LoadFromPK(aParamsPK: TParams); virtual;
  public

    constructor Create;
    destructor Destroy; override;

    property InsertSQL: string  read FInsertSQL write FInsertSQL;
    property UpdateSQL: string  read FUpdateSQL write FUpdateSQL;
    property DeleteSQL: string  read FDeleteSQL write FDeleteSQL;
    property SelectSQL: string  read FSelectSQL write FSelectSQL;
    property Delete   : boolean read FDelete    write FDelete;
  end;

  TDBCDependente = class(TDBCommand)
  private

    FDependente: TDependente;

    procedure SetDependente(const aValue: TDependente);
  protected

    procedure LoadFromPK(aParams: TParams); override;
  public

    constructor Create;
    destructor Destroy; override;

    property Dependente: TDependente read FDependente write SetDependente;
  end;

  TDBCFuncionario = class(TDBCommand)
  private

    FFuncionario: TFuncionario;
    FDependente : TDBCDependente;

    procedure SetFuncionario(const aValue: TFuncionario);
  protected

    procedure LoadFromPK(aParams: TParams); override;
  public

    constructor Create;
    destructor Destroy; override;

    property Funcionario: TFuncionario read FFuncionario write SetFuncionario;
  end;

implementation

const
  C_ERROR: string = '[TDBCommand.%s] - Falha na operação de %s no BD!'#13#10'Mensagem: %s';

procedure TDBCommand.DoExec(aSQL: string; aParams: TParams);
var

  I: cardinal;
begin

  if aSQL <= emptyStr then
    exit;

  try

    FQuery.Active   := FALSE;
    FQuery.SQL.Text := aSQL;

    for I := 0 to aParams.Count - 1 do
      FQuery.Params[I].Value := aParams.ParamByName(FQuery.Params[I].Name).Value;

    FQuery.ExecSQL;
  except

    raise Exception.Create(Format(C_ERROR, ['DoExec', 'SALVAMENTO', Exception(ExceptObject).Message]));
  end;
end;

procedure TDBCommand.DoUpdate(aParams: TParams);
begin

  if UpdateSQL <= emptyStr then
    exit;

  DoExec(UpdateSQL, aParams);
end;

procedure TDBCommand.DoDelete(aParams: TParams);
begin

  if DeleteSQL <= emptyStr then
    exit;

  DoExec(DeleteSQL, aParams);
end;

procedure TDBCommand.DoInsert(aParams: TParams);
begin

  if InsertSQL <= emptyStr then
    exit;

  DoExec(InsertSQL, aParams);
end;

procedure TDBCommand.LoadFromPK(aParamsPK: TParams);
var

  I: cardinal;
begin

  if SelectSQL <= emptyStr then
    exit;

  try

    FQuery.Active   := FALSE;
    FQuery.SQL.Text := SelectSQL;

    for I := 0 to aParamsPK.Count - 1 do
      FQuery.Params[I].Value := aParamsPK.ParamByName(FQuery.Params[I].Name).Value;

    FQuery.Open;
  except

    raise Exception.Create(Format(C_ERROR, ['LoadFromPK', 'LEITURA', Exception(ExceptObject).Message]));
  end;
end;

constructor TDBCommand.Create;
begin

  FConnection       := TZConnection.Create(NIL);
  FQuery            := TZQuery.Create(NIL);
  FQuery.Connection := FConnection;
end;

destructor TDBCommand.Destroy;
begin

  FreeAndNIL(FQuery);
  FreeAndNIL(FConnection);

  inherited Destroy;
end;

procedure TDBCFuncionario.SetFuncionario(const aValue: TFuncionario);
begin


end;


constructor TDBCFuncionario.Create;
begin

  UpdateSQL := ' UPDATE OR INSERT INTO '
             + '   funcionario (CPF, Nome, Salario) '
             + '   VALUES (:CPF, :Nome, :Salario) '
             + '   MATCHING (CPF) ';

  DeleteSQL := ' DELETE FROM funcionario '
             + ' WHERE CPF = :CPF ';

  SelectSQL := ' SELECT * FROM funcionario '
             + ' WHERE CPF = :CPF ';
end;

constructor TDBCDependente.Create;
begin

  InsertSQL := ' INSERT INTO funcionario_dependente '
             + '     (Funcionario_CPF, Nome, IsCalculaIR, IsCalculaINSS) '
             + ' VALUES (:Funcionario_CPF, :Nome, :IsCalculaIR, :IsCalculaINSS) ';

  UpdateSQL := ' UPDATE funcionario_dependente '
             + ' SET Funcionario_CPF = :Funcionario_CPF, '
             + '     Nome = :Nome, '
             + '     IsCalculaIR = :IsCalculaIR, '
             + '     IsCalculaINSS = :IsCalculaINSS '
             + ' WHERE Id = :Id ';

  DeleteSQL := ' DELETE FROM funcionario_dependente '
             + ' WHERE Id = :Id ';

  SelectSQL := ' SELECT * FROM funcionario_dependente '
             + ' WHERE Id = :Id ';
end;

end.
