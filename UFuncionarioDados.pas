unit UFuncionarioDados;

interface

uses
  System.Generics.Collections, System.SysUtils, UFuncionario, UDm, System.Math;


Type
  TFuncionarioDados = class
  public
    function salvarFuncionario(const pFuncionario: TFuncionario):Boolean;
  end;

implementation

{ TFuncionarioDados }

function TFuncionarioDados.salvarFuncionario(
  const pFuncionario: TFuncionario): Boolean;
var
  i : integer;
begin
  FrmDM.limpaQuery;
  FrmDM.sqlQuery.SQL.Add('UPDATE OR INSERT INTO FUNCIONARIO (CPF, NOME, SALARIO) VALUES (:pCPF, :pNome, :pSalario)');
  FrmDM.sqlQuery.Params[0].AsString := pFuncionario.CPF;
  FrmDM.sqlQuery.Params[1].AsString := pFuncionario.Nome;
  FrmDM.sqlQuery.Params[2].AsFloat  := pFuncionario.Salario;
  try
    FrmDM.sqlQuery.ExecSQL();
    Result := FrmDM.sqlQuery.RowsAffected > 0;
  except
    FrmDM.sqlQuery.Cancel;
    raise Exception.Create('Ocorreu um erro ao salvar o Funcionário');
  end;


  if pFuncionario.ListaDependente.Count > 0 then
  begin
    for i := Pred(pFuncionario.ListaDependente.Count) downto 0 do
    begin
      FrmDM.limpaQuery;
      FrmDM.sqlQuery.SQL.Add('UPDATE OR INSERT INTO DEPENDENTE (ID, NOME, ISCALCULAIR, ISCALCULAINSS, CPF) VALUES (p:ID, p:NOME, p:ISCALCULAIR, p:ISCALCULAINSS, p:CPF)');
      FrmDM.sqlQuery.Params[0].AsInteger := pFuncionario.ListaDependente[i].ID;
      FrmDM.sqlQuery.Params[1].AsString  := pFuncionario.ListaDependente[i].Nome;
      FrmDM.sqlQuery.Params[2].AsInteger := ifthen(pFuncionario.ListaDependente[i].IsCalculaIR,1,0);
      FrmDM.sqlQuery.Params[3].AsFloat   := ifthen(pFuncionario.ListaDependente[i].IsCalculaINSS,1,0);
      FrmDM.sqlQuery.Params[4].AsString  := pFuncionario.ListaDependente[i].CPF;
      try
        FrmDM.sqlQuery.ExecSQL();
        Result := FrmDM.sqlQuery.RowsAffected > 0;
      except
        FrmDM.sqlQuery.Cancel;
        raise Exception.Create('Ocorreu um erro ao salvar o Dependente');
      end;
    end;
  end;

end;

end.
