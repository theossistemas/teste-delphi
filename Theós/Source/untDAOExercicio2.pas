unit untDAOExercicio2;

interface

uses
  untFuncionario, untDependente, FireDAC.Comp.Client, untDtmExercicio2,
  System.SysUtils;

type
  TDAOExercicio2 = class
  private
    FConexao: TFDConnection;
    FQuery: TFDQuery;

    function fcGerarId(const pNomeGerador: String): Integer;
    function fcValidarFuncionarioExiste(const pId_Funcionario: Integer): Boolean;
    function fcValidarDependenteExiste(const pId_Dependente: Integer): Boolean;

    procedure prPrepararConexao;
    procedure prPrepararQueryAuxiliar(const pSQL: String);
  public
    // Funcionário
    function fcGerarIdFuncionario: Integer;
    function fcInserirFuncionario(const pFuncionario: TFuncionario): Boolean;
    function fcAtualizarFuncionario(const pFuncionario: TFuncionario): Boolean;
    function fcExcluirFuncionario(const pId_Funcionario: Integer): Boolean;

    // Dependente
    function fcGerarIdDependente: Integer;
    function fcInserirDependente(const pId_Funcionario: Integer; const pDependente: TDependente): Boolean;
    function fcAtualizarDependente(const pDependente: TDependente): Boolean;
    function fcExcluirDependente(const pId_Dependente: Integer): Boolean;
  end;

implementation

{ TDAOExercicio2 }

function TDAOExercicio2.fcAtualizarDependente(const pDependente: TDependente): Boolean;
const
  cSQL = 'UPDATE CADDEPENDENTE SET NOME = :PNOME, ISCALCULAIR = :PISCALCULAIR, ISCALCULAINSS = :PISCALCULAINSS WHERE ID_DEPENDENTE = :PID_DEPENDENTE';
begin
  prPrepararConexao;
  FConexao.StartTransaction;

  prPrepararQueryAuxiliar(cSQL);

  try
    FQuery.ParamByName('PID_DEPENDENTE').AsInteger := pDependente.Id_Dependente;
    FQuery.ParamByName('PNOME').AsString := pDependente.Nome;
    FQuery.ParamByName('PISCALCULAIR').AsInteger := pDependente.IsCalcularIR;
    FQuery.ParamByName('PISCALCULAINSS').AsInteger :=
      pDependente.IsCalcularINSS;
    FQuery.ExecSQL;

    FConexao.Commit;
    Result := True;
  finally
    FConexao.Rollback;
    Result := False;
  end;
end;

function TDAOExercicio2.fcAtualizarFuncionario(const pFuncionario: TFuncionario): Boolean;
const
  cSQL = 'UPDATE CADFUNCIONARIO SET NOME = :PNOME, CPF = :PCPF, SALARIO = :PSALARIO WHERE ID_FUNCIONARIO = :PID_FUNCIONARIO';
begin
  prPrepararConexao;
  FConexao.StartTransaction;

  prPrepararQueryAuxiliar(cSQL);

  try
    FQuery.ParamByName('PID_FUNCIONARIO').AsInteger :=
      pFuncionario.Id_Funcionario;
    FQuery.ParamByName('PNOME').AsString := pFuncionario.Nome;
    FQuery.ParamByName('PCPF').AsString := pFuncionario.CPF;
    FQuery.ParamByName('PSALARIO').AsFloat := pFuncionario.Salario;
    FQuery.ExecSQL;

    FConexao.Commit;
    Result := True;
  except
    FConexao.Rollback;
    Result := False;
  end;
end;

function TDAOExercicio2.fcExcluirDependente(const pId_Dependente: Integer): Boolean;
const
  cSQL = 'DELETE FROM CADDEPENDENTE WHERE ID_DEPENDENTE = :PID_DEPENDENTE';
begin
  prPrepararConexao;
  FConexao.StartTransaction;

  prPrepararQueryAuxiliar(cSQL);

  try
    FQuery.ParamByName('PID_DEPENDENTE').AsInteger := pId_Dependente;
    FQuery.ExecSQL;

    FConexao.Commit;
    Result := True;
  except
    FConexao.Rollback;
    Result := False;
  end;
end;

function TDAOExercicio2.fcExcluirFuncionario(const pId_Funcionario: Integer): Boolean;
const
  cSQL = 'DELETE FROM CADFUNCIONARIO WHERE ID_FUNCIONARIO = :PID_FUNCIONARIO';
begin
  prPrepararConexao;
  FConexao.StartTransaction;

  prPrepararQueryAuxiliar(cSQL);

  try
    FQuery.ParamByName('PID_FUNCIONARIO').AsInteger := pId_Funcionario;
    FQuery.ExecSQL;

    FConexao.Commit;
    Result := True;
  except
    FConexao.Rollback;
    Result := False;
  end;
end;

function TDAOExercicio2.fcGerarId(const pNomeGerador: String): Integer;
const
  cSQL = 'SELECT GEN_ID(%s , 1) AS ID FROM RDB$DATABASE';
begin
  prPrepararQueryAuxiliar(Format(cSQL, [pNomeGerador]));

  try
    FQuery.Open;

    Result := FQuery.FieldByName('ID').AsInteger;
  finally
    FQuery.Active := False;
  end;
end;

function TDAOExercicio2.fcInserirDependente(const pId_Funcionario: Integer; const pDependente: TDependente): Boolean;
const
  cSQL = 'INSERT INTO CADDEPENDENTE (ID_DEPENDENTE, NOME, ISCALCULAIR, ISCALCULAINSS, ID_FUNCIONARIO) VALUES (:PID_DEPENDENTE, :PNOME, :PISCALCULAIR, :PISCALCULAINSS, :PID_FUNCIONARIO)';
begin
  if fcValidarDependenteExiste(pDependente.Id_Dependente) then
  begin
    Result := fcAtualizarDependente(pDependente);
    Exit;
  end;

  prPrepararConexao;
  FConexao.StartTransaction;

  prPrepararQueryAuxiliar(cSQL);

  try
    FQuery.ParamByName('PID_DEPENDENTE').AsInteger := pDependente.Id_Dependente;
    FQuery.ParamByName('PNOME').AsString := pDependente.Nome;
    FQuery.ParamByName('PISCALCULAIR').AsInteger := pDependente.IsCalcularIR;
    FQuery.ParamByName('PISCALCULAINSS').AsInteger :=
      pDependente.IsCalcularINSS;
    FQuery.ParamByName('PID_FUNCIONARIO').AsInteger := pId_Funcionario;
    FQuery.ExecSQL;

    FConexao.Commit;
    Result := True;
  except
    FConexao.Rollback;
    Result := False;
  end;
end;

function TDAOExercicio2.fcInserirFuncionario(const pFuncionario: TFuncionario): Boolean;
const
  cSQL = 'INSERT INTO CADFUNCIONARIO (ID_FUNCIONARIO, NOME, CPF, SALARIO) VALUES (:PID_FUNCIONARIO, :PNOME, :PCPF, :PSALARIO)';
begin
  if fcValidarFuncionarioExiste(pFuncionario.Id_Funcionario) then
  begin
    Result := fcAtualizarFuncionario(pFuncionario);
    Exit;
  end;

  prPrepararConexao;
  FConexao.StartTransaction;

  prPrepararQueryAuxiliar(cSQL);

  try
    FQuery.ParamByName('PID_FUNCIONARIO').AsInteger :=
      pFuncionario.Id_Funcionario;
    FQuery.ParamByName('PNOME').AsString := pFuncionario.Nome;
    FQuery.ParamByName('PCPF').AsString := pFuncionario.CPF;
    FQuery.ParamByName('PSALARIO').AsFloat := pFuncionario.Salario;
    FQuery.ExecSQL;

    FConexao.Commit;
    Result := True;
  except
    FConexao.Rollback;
    Result := False;
  end;
end;

procedure TDAOExercicio2.prPrepararConexao;
begin
  if not Assigned(FConexao) then
    FConexao := dtmExercicio2.fdCnx;
end;

procedure TDAOExercicio2.prPrepararQueryAuxiliar(const pSQL: String);
begin
  if pSQL = '' then
    Exit;

  if not Assigned(FQuery) then
    FQuery := dtmExercicio2.qryAuxiliar;

  FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(pSQL);
end;

function TDAOExercicio2.fcGerarIdDependente: Integer;
begin
  Result := fcGerarId('GEN_CADDEPENDENTE');
end;

function TDAOExercicio2.fcGerarIdFuncionario: Integer;
begin
  Result := fcGerarId('GEN_CADFUNCIONARIO');
end;

function TDAOExercicio2.fcValidarDependenteExiste(const pId_Dependente: Integer): Boolean;
const
  cSQL = 'SELECT FIRST 1 1 AS EXISTE FROM CADDEPENDENTE WHERE ID_DEPENDENTE = :PID_DEPENDENTE';
begin
  prPrepararQueryAuxiliar(cSQL);

  FQuery.ParamByName('PID_DEPENDENTE').AsInteger := pId_Dependente;
  FQuery.Open;

  Result := FQuery.FieldByName('EXISTE').AsInteger > 0;
end;

function TDAOExercicio2.fcValidarFuncionarioExiste(const pId_Funcionario: Integer): Boolean;
const
  cSQL = 'SELECT FIRST 1 1 AS EXISTE FROM CADFUNCIONARIO WHERE ID_FUNCIONARIO = :PID_FUNCIONARIO';
begin
  prPrepararQueryAuxiliar(cSQL);

  FQuery.ParamByName('PID_FUNCIONARIO').AsInteger := pId_Funcionario;
  FQuery.Open;

  Result := FQuery.FieldByName('EXISTE').AsInteger > 0;
end;

end.
