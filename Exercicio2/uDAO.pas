unit uDAO;

interface

uses uFuncionario, uDependente, uDataModulo, FireDAC.Comp.Client, System.SysUtils;

type
  TDAO = class
    private
      FoConexao: TFDConnection;
      FoFDQuery: TFDQuery;
      function VerificaFuncionarioExiste(const pnFuncionario: Integer): Boolean;
      function VerificaDependenteExite(const pnDependente: Integer): Boolean;
    public
      function GeraIdFuncionario: Integer;
      function GeraIdDependente: Integer;
      function AtualizarFuncionario(const poFuncionario: TFuncionario): Boolean;
      function AtualizarDependente(const pnFuncionario: Integer; const poDependente: TDependente): Boolean;
      function InserirFuncionario(const poFuncionario: TFuncionario): Boolean;
      function InserirDependente(const pnFuncionario: Integer; const poDependente: TDependente): Boolean;
      function ExcluirFuncionario(const pnFuncionario: Integer): Boolean;
      function ExcluirDependente(const pnDependente: Integer): Boolean;
  end;

implementation

{ TDAO }

function TDAO.AtualizarDependente(const pnFuncionario: Integer;
  const poDependente: TDependente): Boolean;
begin
  FoConexao := DataModule1.FirebirdconnectionConnection;
  FoFDQuery := DataModule1.FDQuery;
  FoConexao.StartTransaction;

  FoFDQuery.Close;
  FoFDQuery.SQL.Clear;
  FoFDQuery.SQL.Add('update TB_DEPENDENTE SET ID_FUNCIONARIO=:id_funcionario, NOME=:nome, IS_CALCULA_INSS=:is_calcula_inss, IS_CALCULA_IR=:is_calcula_ir where ID=:id');
  FoFDQuery.ParamByName('ID').AsInteger := poDependente.codigo;
  FoFDQuery.ParamByName('ID_FUNCIONARIO').AsInteger := pnFuncionario;
  FoFDQuery.ParamByName('NOME').AsString := poDependente.nome;
  FoFDQuery.ParamByName('IS_CALCULA_INSS').AsString := poDependente.calculaINSS;
  FoFDQuery.ParamByName('IS_CALCULA_IR').AsString := poDependente.calculaIR;
  try
    FoFDQuery.ExecSQL;
    FoConexao.Commit;
    Result := true;
  except
    FoConexao.RollBack;
    Result := false;
  end;
end;

function TDAO.AtualizarFuncionario(const poFuncionario: TFuncionario): Boolean;
begin
  FoConexao := DataModule1.FirebirdconnectionConnection;
  FoFDQuery := DataModule1.FDQuery;
  FoConexao.StartTransaction;

  FoFDQuery.Close;
  FoFDQuery.SQL.Clear;
  FoFDQuery.SQL.Add('update TB_FUNCIONARIO set NOME=:nome, CPF=:cpf, SALARIO=:salario where ID = :id');
  FoFDQuery.ParamByName('ID').AsInteger := poFuncionario.codigo;
  FoFDQuery.ParamByName('NOME').AsString := poFuncionario.nome;
  FoFDQuery.ParamByName('CPF').AsString := poFuncionario.cpf;
  FoFDQuery.ParamByName('SALARIO').AsFloat := poFuncionario.salario;
  try
    FoFDQuery.ExecSQL;
    FoConexao.Commit;
    Result := true;
  except
    FoConexao.RollBack;
    Result := false;
  end;
end;

function TDAO.ExcluirDependente(const pnDependente: Integer): Boolean;
begin
  FoConexao := DataModule1.FirebirdconnectionConnection;
  FoFDQuery := DataModule1.FDQuery;
  FoConexao.StartTransaction;

  FoFDQuery.Close;
  FoFDQuery.SQL.Clear;
  FoFDQuery.SQL.Add('delete from TB_DEPENDENTE where ID = :id');
  FoFDQuery.ParamByName('ID').AsInteger := pnDependente;
  try
    FoFDQuery.ExecSQL;
    FoConexao.Commit;
    Result := true;
  except
    FoConexao.RollBack;
    Result := false;
  end;
end;

function TDAO.ExcluirFuncionario(const pnFuncionario: Integer): Boolean;
begin
  FoConexao := DataModule1.FirebirdconnectionConnection;
  FoFDQuery := DataModule1.FDQuery;
  FoConexao.StartTransaction;

  FoFDQuery.Close;
  FoFDQuery.SQL.Clear;
  FoFDQuery.SQL.Add('delete from TB_FUNCIONARIO where ID = :id');
  FoFDQuery.ParamByName('ID').AsInteger := pnFuncionario;
  try
    FoFDQuery.ExecSQL;
    FoConexao.Commit;
    Result := true;
  except
    FoConexao.RollBack;
    Result := false;
  end;
end;

function TDAO.GeraIdDependente: Integer;
begin
  FoFDQuery := DataModule1.FDQuery;
  FoFDQuery.Close;
  FoFDQuery.SQL.Clear;
  FoFDQuery.SQL.Add('select max(id) as ULT_ID from TB_DEPENDENTE');
  FoFDQuery.Open;
  Result := FoFDQuery.FieldByName('ULT_ID').AsInteger + 1;
end;

function TDAO.GeraIdFuncionario: Integer;
begin
  FoFDQuery := DataModule1.FDQuery;
  FoFDQuery.Close;
  FoFDQuery.SQL.Clear;
  FoFDQuery.SQL.Add('select max(id) as ULT_ID from TB_FUNCIONARIO');
  FoFDQuery.Open;
  Result := FoFDQuery.FieldByName('ULT_ID').AsInteger + 1;
end;

function TDAO.InserirDependente(const pnFuncionario: Integer;
  const poDependente: TDependente): Boolean;
begin
  if VerificaFuncionarioExiste(poDependente.codigo) then
  begin
    Result := AtualizarDependente(pnFuncionario, poDependente);
    exit;
  end;

  FoConexao := DataModule1.FirebirdconnectionConnection;
  FoFDQuery := DataModule1.FDQuery;
  FoConexao.StartTransaction;

  FoFDQuery.Close;
  FoFDQuery.SQL.Clear;
  FoFDQuery.SQL.Add('insert into TB_DEPENDENTE (ID, ID_FUNCIONARIO, NOME, IS_CALCULA_INSS, IS_CALCULA_IR) values(:id, :id_funcionario, :nome, :is_calcula_inss, :is_calcula_ir)');
  FoFDQuery.ParamByName('ID').AsInteger := poDependente.codigo;
  FoFDQuery.ParamByName('ID_FUNCIONARIO').AsInteger := pnFuncionario;
  FoFDQuery.ParamByName('NOME').AsString := poDependente.nome;
  FoFDQuery.ParamByName('IS_CALCULA_INSS').AsString := poDependente.calculaINSS;
  FoFDQuery.ParamByName('IS_CALCULA_IR').AsString := poDependente.calculaIR;
  try
    FoFDQuery.ExecSQL;
    FoConexao.Commit;
    Result := true;
  except
    FoConexao.RollBack;
    Result := false;
  end;
end;

function TDAO.InserirFuncionario(const poFuncionario: TFuncionario): Boolean;
begin
  if VerificaFuncionarioExiste(poFuncionario.codigo) then
  begin
    Result := AtualizarFuncionario(poFuncionario);
    exit;
  end;

  FoConexao := DataModule1.FirebirdconnectionConnection;
  FoFDQuery := DataModule1.FDQuery;
  FoConexao.StartTransaction;

  FoFDQuery.Close;
  FoFDQuery.SQL.Clear;
  FoFDQuery.SQL.Add('insert into TB_FUNCIONARIO (ID, NOME, CPF, SALARIO) values(:id, :nome, :cpf, :salario)');
  FoFDQuery.ParamByName('ID').AsInteger := poFuncionario.codigo;
  FoFDQuery.ParamByName('NOME').AsString := poFuncionario.nome;
  FoFDQuery.ParamByName('CPF').AsString := poFuncionario.cpf;
  FoFDQuery.ParamByName('SALARIO').AsFloat := poFuncionario.salario;
  try
    FoFDQuery.ExecSQL;
    FoConexao.Commit;
    Result := true;
  except
    FoConexao.RollBack;
    Result := false;
  end;
end;

function TDAO.VerificaDependenteExite(const pnDependente: Integer): Boolean;
begin
  FoFDQuery := DataModule1.FDQuery;
  FoFDQuery.Close;
  FoFDQuery.SQL.Clear;
  FoFDQuery.SQL.Add(Format('select count(ID) from TB_DEPENDENTE where ID=%d',[pnDependente]));
  FoFDQuery.Open;
  Result := FoFDQuery.RecordCount > 0;
end;

function TDAO.VerificaFuncionarioExiste(const pnFuncionario: Integer): Boolean;
begin
  FoFDQuery := DataModule1.FDQuery;
  FoFDQuery.Close;
  FoFDQuery.SQL.Clear;
  FoFDQuery.SQL.Add(Format('select count(ID) from TB_FUNCIONARIO where ID=%d',[pnFuncionario]));
  FoFDQuery.Open;
  Result := FoFDQuery.RecordCount > 0;
end;

end.
