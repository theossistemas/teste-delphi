unit UDM;

interface

uses
  SysUtils, Classes, Dialogs, DBXpress, FMTBcd, DB, DBClient, Provider, SqlExpr, CFuncionario, CDependente;

type
  TDM = class(TDataModule)
    DBSQLConnection: TSQLConnection;
    dsInserirDependente: TSQLDataSet;
    dsInserirDependenteNOME: TIntegerField;
    dsInserirDependenteISCALCULAIR: TIntegerField;
    dsInserirDependenteISCALCULAINSS: TIntegerField;
    dsInserirFuncionario: TSQLDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
    function geNextId(const generator: String): integer;
    function inserirFuncionario(oFuncionario: TFuncionario): Boolean;
    function inserirDependente(oDependente: TDependente): Boolean;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

{ TDM }

function TDM.geNextId(const generator: String): integer;
var
  _qry: TSQLDataSet;
begin
  _qry := TSQLDataSet.Create(Self);
  try
    _qry.SQLConnection := Self.DBSQLConnection;
    _qry.CommandText := 'SELECT GEN_ID( ' + generator + ', 1 ) FROM RDB$DATABASE;';
    _qry.Open;
    Result := _qry.Fields[0].AsInteger;
  finally
    _qry.Free;
  end;
end;

function TDM.inserirFuncionario(oFuncionario: TFuncionario): Boolean;
var
  i: SmallInt;
  idFuncionario: Integer;
  oDependente: TDependente;
begin

  idFuncionario := self.geNextId('GEN_FUNCIONARIO_ID');

  dsInserirFuncionario.Params[0].AsInteger := idFuncionario;
  dsInserirFuncionario.Params[1].AsString := oFuncionario.getNome;
  dsInserirFuncionario.Params[2].AsString := oFuncionario.getCpf;
  dsInserirFuncionario.Params[3].AsFloat := oFuncionario.getSalario;
  dsInserirFuncionario.Params[4].AsFloat := oFuncionario.getInss;
  dsInserirFuncionario.Params[5].AsFloat := oFuncionario.getIr;
  try
    dsInserirFuncionario.ExecSQL();

    oDependente := TDependente.Create;
    try
      for i:=0 to oFuncionario.getLista.Count-1 do
      begin
        oDependente := oFuncionario.getLista.Items[i];

        oDependente.setIdFuncionario(idFuncionario);

        self.inserirDependente(oDependente);
      end;
    finally
    end;

    result := true;
  except on E:Exception do
    begin
      ShowMessage(E.Message);
      result := false;
    end;
  end;
end;

function TDM.inserirDependente(oDependente: TDependente): Boolean;
begin
  dsInserirDependente.Params[0].AsInteger := self.geNextId('GEN_DEPENDENTE_ID');;
  dsInserirDependente.Params[1].AsInteger := oDependente.getIdFuncionario;
  dsInserirDependente.Params[2].AsString := oDependente.getNome;
  if oDependente.getIsCalculaIR then
    dsInserirDependente.Params[3].AsInteger := 1
  else
    dsInserirDependente.Params[3].AsInteger := 0;
  if oDependente.getIsCalculaINSS then
    dsInserirDependente.Params[4].AsInteger := 1
  else
    dsInserirDependente.Params[4].AsInteger := 0;
  try
    dsInserirDependente.ExecSQL();
    result := true;
  except on E:Exception do
    begin
      ShowMessage(E.Message);
      result := false;
    end;
  end;
end;

end.
