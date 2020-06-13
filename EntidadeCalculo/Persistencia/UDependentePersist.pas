unit UDependentePersist;

interface

uses
  UIPersist, UDependente, System.Generics.Collections, UConexao, Data.DB;

type TDependentePersist = class(TInterfacedObject, IPersist<TDependente>)

  public
    function Get(): TList<TDependente>;
    function GetDataSet() : TDataset;
    function GetById(Id: Integer): TDependente;
    function Save(Entidade: TDependente): boolean;
    function Delete(Entidade: TDependente): boolean;

    function GetDataSetByIdFuncionario(idfuncionario: Integer) : TDataset;

end;


implementation

{ TDependentePersist }

function TDependentePersist.Delete(Entidade: TDependente): boolean;
begin
  Tconexao.Instance.Execute('delete from dependente where id=:id',
    Tconexao.Instance.NewParams(['id'], [entidade.Id]));
end;

function TDependentePersist.Get: TList<TDependente>;
var
  Data: TDataSet;
  dependente: TDependente;
begin
  result := TList<TDependente>.Create;
  try
    Data := Tconexao.Instance().Get('select * from dependente');
    while not Data.Eof do
    begin
      dependente := TDependente.Create(Data.FieldByName('id').Value,
        Data.FieldByName('idfuncionario').Value,
        Data.FieldByName('nome').Value,
        Data.FieldByName('iscalculair').Value,
        Data.FieldByName('iscalculainss').Value);
      result.Add(dependente);
      Data.Next;
    end;
  finally
    if Assigned(Data) then
      Data.Free;
  end;
end;

function TDependentePersist.GetById(Id: Integer): TDependente;
 var dataset: TDataSet;
begin
  try
    dataset := Tconexao.Instance().Get('select * from funcionario where id=:id',
      Tconexao.Instance.NewParams(['id'], [Id]));
    result := TDependente.Create(
      dataset.FieldByName('id').asinteger,
      dataset.FieldByName('idfuncionario').AsInteger,
      dataset.FieldByName('nome').AsString,
      dataset.FieldByName('iscalculaIR').AsBoolean,
      dataset.FieldByName('iscalculainss').AsBoolean);
  finally
    dataset.Free
  end;

end;

function TDependentePersist.GetDataSet: TDataset;
begin
  result := Tconexao.Instance().Get('select * from dependente');
end;

function TDependentePersist.GetDataSetByIdFuncionario(idfuncionario: Integer): TDataset;
begin
  result := Tconexao.Instance().Get('select * from dependente where idfuncionario=:idfuncionario',
    tconexao.Instance.NewParams(['idfuncionario'], [idfuncionario]));
end;

function TDependentePersist.Save(Entidade: TDependente): boolean;
var
  sqlInsert: String;
  sqlUpdate: String;
begin
  sqlInsert :=
    'insert into dependente ( idfuncionario, nome, iscalculair, iscalculainss) values (:idfuncionario, :nome, :iscalculair, :iscalculainss)';
  sqlUpdate :=
    'update dependente set idfuncionario=:idfuncionario, nome=:nome, iscalculair=:iscalculair, iscalculainss=:iscalculainss where id=:id';

  if entidade.Id = 0 then
  begin
    if Tconexao.Instance.Execute(sqlInsert,
      Tconexao.Instance.NewParams(['idfuncionario','nome', 'iscalculair', 'iscalculainss'],
      [entidade.IdFuncionario,entidade.nome, entidade.IsCalculaIR, entidade.isCalculaINSS])) > 0 then
      result := true
    else
      result := false;

  end
  else
  begin
    if Tconexao.Instance.Execute(sqlUpdate,
      Tconexao.Instance.NewParams(['id', 'idfuncionario','nome', 'iscalculair', 'iscalculainss'],
      [entidade.Id, entidade.IdFuncionario, entidade.nome, entidade.IsCalculaIR, entidade.isCalculaINSS])) > 0 then
      result := true
    else
      result := false;
  end;

end;

initialization

finalization

end.
