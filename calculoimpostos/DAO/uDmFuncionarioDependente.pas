unit uDmFuncionarioDependente;

interface

uses
  System.SysUtils, System.Classes, uDmConexao, Data.FMTBcd, Data.DB,
  Data.SqlExpr, uFuncionarioDependente;

type
  TDmFuncionarioDependente = class(TDataModule)
    SQLInserir: TSQLDataSet;
    SQLExcluir: TSQLDataSet;
    SQLExcluirTodos: TSQLDataSet;
  private
    { Private declarations }
  public
    function Inserir(oFuncionarioDependente: TFuncionarioDependente;
      out sErro: String): Boolean;
    function Excluir(oFuncionarioDependente: TFuncionarioDependente;
      out sErro: String): Boolean;
    function ExcluirTodos(iIDFuncionario: Integer; out sErro: String): Boolean;
  end;

var
  DmFuncionarioDependente: TDmFuncionarioDependente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmFuncionarioDependente }

function TDmFuncionarioDependente.Excluir(
  oFuncionarioDependente: TFuncionarioDependente; out sErro: String): Boolean;
begin
  with SQLExcluir do begin
    ParamByName('IDFUNCIONARIO').AsInteger := oFuncionarioDependente.IDFuncionario;
    ParamByName('IDDEPENDENTE').AsInteger := oFuncionarioDependente.IDDependente;
    try
      ExecSQL;
      Result := True;
    except on E: Exception do
      begin
        sErro := 'Problemas ao excluir relação de funcionário com dependente ' +
          sLineBreak + E.Message;
        Result := False;
      end;
    end;
  end;
end;

function TDmFuncionarioDependente.ExcluirTodos(iIDFuncionario: Integer;
  out sErro: String): Boolean;
begin
  with SQLExcluirTodos do begin
    ParamByName('IDFUNCIONARIO').AsInteger := iIDFuncionario;
    try
      ExecSQL;
      Result := True;
    except on E: Exception do
      begin
        sErro := 'Problemas ao excluir relação de funcionário com dependentes ' +
          sLineBreak + E.Message;
        Result := False;
      end;
    end;
  end;
end;

function TDmFuncionarioDependente.Inserir(
  oFuncionarioDependente: TFuncionarioDependente; out sErro: String): Boolean;
begin
  with SQLInserir do begin
    ParamByName('IDFUNCIONARIO').AsInteger := oFuncionarioDependente.IDFuncionario;
    ParamByName('IDDEPENDENTE').AsInteger := oFuncionarioDependente.IDDependente;
    try
      ExecSQL;
      Result := True;
    except on E: Exception do
      begin
        sErro := 'Problemas ao adicionar relação de funcionário com dependente ' +
          sLineBreak + E.Message;
        Result := False;
      end;
    end;
  end;
end;

end.
