unit unDAODependente;

interface

uses
  unConection, Dependente, Funcionario, FireDAC.Stan.Param, System.Generics.Collections;

type

  TDAODependente = class
  private
    class procedure ExecutarQuery(var Query: TQuery; objDependente: TDependente);
  public
    class procedure Insert(objDependente: TDependente);
    class procedure Update(objDependente: TDependente);
    class procedure Delete(objDependente: TDependente);
    class function ObterListaDeDependentes(objFuncionario: TFuncionario): TObjectList<TDependente>;
  end;

implementation

{ TDAODependente }

class procedure TDAODependente.Delete(objDependente: TDependente);
const
  SQL_DELETE: string = (
    'DELETE FROM DEPENDENTE WHERE ID = :ID'
  );
begin
  if not Assigned(objDependente) then
    Exit;

   var Query := TConexao.GetQuery;
   try
     try
       Query.SQL.Text := SQL_DELETE;
       Query.Close;
       Query.ParamByName('ID').AsInteger := objDependente.Id;
       Query.ExecSQL;
       Query.Close;
     except
       TConexao.GetInstance.RollbackRetaining;
     end;
   finally
     Query.DisposeOf;
   end;
end;

class procedure TDAODependente.ExecutarQuery(var Query: TQuery;
  objDependente: TDependente);
begin
  Query.Close;
  Query.ParamByName('ID').AsInteger := objDependente.Id;
  Query.ParamByName('ID_FUNCIONARIO').AsInteger := objDependente.IdFuncionario;
  Query.ParamByName('NOME').AsString := objDependente.Nome;
  Query.ParamByName('CALCULAIR').AsInteger := Integer(objDependente.CalculaIR);
  Query.ParamByName('CALCULAINSS').AsInteger := Integer(objDependente.CalculaINSS);
  Query.ExecSQL;
  Query.Close;
end;

class procedure TDAODependente.Insert(objDependente: TDependente);
const
  SQL_INSERT: string = (
    'INSERT INTO DEPENDENTE (' + sLineBreak +
    '     ID,' + sLineBreak +
    '     ID_FUNCIONARIO,' + sLineBreak +
    '     NOME,' + sLineBreak +
    '     CALCULAIR,' + sLineBreak +
    '     CALCULAINSS' + sLineBreak +
    ') VALUES (' + sLineBreak +
    '     :ID,' + sLineBreak +
    '     :ID_FUNCIONARIO,' + sLineBreak +
    '     :NOME,' + sLineBreak +
    '     :CALCULAIR,' + sLineBreak +
    '     :CALCULAINSS' + sLineBreak +
    ')'
  );
begin
  if not Assigned(objDependente) then
    Exit;

   var Query := TConexao.GetQuery;
   var NextId := TConexao.GetNextId('DEPENDENTE', 'ID');

   try
     try
       objDependente.Id := NextId;
       Query.SQL.Text := SQL_INSERT;
       ExecutarQuery(Query, objDependente);
     except
       TConexao.GetInstance.RollbackRetaining;
     end;
   finally
     Query.DisposeOf;
   end;
end;

class function TDAODependente.ObterListaDeDependentes(
  objFuncionario: TFuncionario): TObjectList<TDependente>;
const
  SQL_SELECT: string = (
    'SELECT * FROM DEPENDENTE WHERE ID_FUNCIONARIO = :ID_FUNCIONARIO ORDER BY ID'
  );
begin
  Result := TObjectList<TDependente>.Create;
  Result.Clear;

  var Query := TConexao.GetQuery;
  try
    try
      Query.SQL.Text := SQL_SELECT;
      Query.Close;
      Query.ParamByName('ID_FUNCIONARIO').AsInteger := objFuncionario.Id;
      Query.Open;
      Query.First;
      while not Query.Eof do
      begin
        var Dependente := TDependente.Create;
        Dependente.Id := Query.FieldByName('ID').AsInteger;
        Dependente.IdFuncionario := Query.FieldByName('ID_FUNCIONARIO').AsInteger;
        Dependente.Nome := Query.FieldByName('NOME').AsString;
        Dependente.CalculaIR := Boolean(Query.FieldByName('CALCULAIR').AsInteger);
        Dependente.CalculaINSS := Boolean(Query.FieldByName('CALCULAINSS').AsInteger);

        Result.Add(Dependente);
        Query.Next;
      end;
    except
      TConexao.GetInstance.RollbackRetaining;
    end;
  finally
    Query.DisposeOf;
  end;
end;

class procedure TDAODependente.Update(objDependente: TDependente);
const
  SQL_UPDATE: string = (
    'UPDATE DEPENDENTE SET' + sLineBreak +
    '   ID_FUNCIONARIO = :ID_FUNCIONARIO,' + sLineBreak +
    '   NOME = :NOME,' + sLineBreak +
    '   CALCULAIR = :CALCULAIR,' + sLineBreak +
    '   CALCULAINSS = :CALCULAINSS' + sLineBreak +
    'WHERE' + sLineBreak +
    '   ID = :ID'
  );
begin
  if not Assigned(objDependente) then
    Exit;

   var Query := TConexao.GetQuery;
   try
     try
       Query.SQL.Text := SQL_UPDATE;
       ExecutarQuery(Query, objDependente);
     except
       TConexao.GetInstance.RollbackRetaining;
     end;
   finally
     Query.DisposeOf;
   end;
end;

end.
