unit uDmFuncionario;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr,
  uDmConexao, uFuncionario;

type
  TDmFuncionario = class(TDataModule)
    SQLInserir: TSQLDataSet;
    SQLAlterar: TSQLDataSet;
    SQLExcluir: TSQLDataSet;
  private
    { Private declarations }
  public
    function Inserir(oFuncionario: TFuncionario; out sErro: String): Boolean;
    function Atualizar(oFuncionario: TFuncionario; out sErro: String): Boolean;
    function Excluir(iID: Integer; out sErro: String): Boolean;
    function CPFJaCadastrado(sCPF: String): Boolean;
  end;

var
  DmFuncionario: TDmFuncionario;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmFuncionario }

function TDmFuncionario.Atualizar(oFuncionario: TFuncionario;
  out sErro: String): Boolean;
begin
  with SQLAlterar do begin
    ParamByName('ID').AsInteger := oFuncionario.ID;
    ParamByName('NOME').AsString := oFuncionario.Nome;
    ParamByName('CPF').AsString := oFuncionario.CPF;
    ParamByName('SALARIO').AsFloat := oFuncionario.Salario;
    try
      ExecSQL;
      Result := True;
    except on E:Exception do
      begin
        sErro := 'Erro ao tentar atualizar funcionário!' + sLineBreak + E.Message;
        Result := False;
      end;
    end;
  end;
end;

function TDmFuncionario.CPFJaCadastrado(sCPF: String): Boolean;
var
  sqlCPF: TSQLDataset;
begin
  sqlCPF := TSQLDataset.Create(nil);
  try
    sqlCPF.SQLConnection := DmConexao.SQLConexao;
    sqlCPF.CommandText := 'SELECT COUNT(*) AS QTD FROM FUNCIONARIO '+
      'WHERE CPF = '''+sCPF+'''';
    sqlCPF.Open;

    Result := sqlCPF.FieldByName('QTD').AsInteger > 0;
  finally
    FreeAndNil(sqlCPF);
  end;
end;

function TDmFuncionario.Excluir(iID: Integer; out sErro: String): Boolean;
begin
  with SQLExcluir do begin
    ParamByName('ID').AsInteger := iID;
    try
      ExecSQL;
      Result := True;
    except on E: Exception do
      begin
        sErro := 'Erro ao excluir funcionário!' + sLineBreak + E.Message;
        Result := False;
      end;
    end;
  end;
end;

function TDmFuncionario.Inserir(oFuncionario: TFuncionario; out sErro: String): Boolean;
begin
  with SQLInserir do begin
    ParamByName('ID').AsInteger := oFuncionario.ID;
    ParamByName('NOME').AsString := oFuncionario.Nome;
    ParamByName('CPF').AsString := oFuncionario.CPF;
    ParamByName('SALARIO').AsFloat := oFuncionario.Salario;
    try
      ExecSQL;
      Result := True;
    except on E:Exception do
      begin
        sErro := 'Erro ao tentar inserir funcionário!' + sLineBreak + E.Message;
        Result := False;
      end;
    end;
  end;
end;

end.
