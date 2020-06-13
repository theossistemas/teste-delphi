unit UFuncionarioPersist;

interface

uses UIPersist, UFuncionario, System.Generics.Collections, UConexao,
  UDependente, UDependentePersist, Data.DB;

type
  TFuncionarioPersist = class(TInterfacedObject, IPersist<TFuncionario>)

  private

    procedure CarregarDependentes(entidade: TFuncionario);
  public
    function GetDataSet(): TDataSet; overload;
    function Get(): TList<TFuncionario>;
    function GetById(Id: Integer): TFuncionario;
    function Save(entidade: TFuncionario): boolean;
    function Delete(entidade: TFuncionario): boolean;
  end;

implementation

uses
  System.SysUtils;

{ TFuncionarioPersist }

procedure TFuncionarioPersist.CarregarDependentes(entidade: TFuncionario);
var
  Data: TDataSet;
begin
  Data := Tconexao.Instance.Get
    ('select * from dependente where idfuncionario=:idfuncionario',
    Tconexao.Instance.NewParams(['idfuncionario'], [entidade.Id]));
  try
    while not Data.Eof do
    begin
      entidade.AddDependente(TDependente.Create(
        Data.FieldByName('id').AsInteger,
        Data.FieldByName('idfuncionario').AsInteger,
        Data.FieldByName('nome').AsString,
        Data.FieldByName('iscalculair').AsInteger = 1  ,
        Data.FieldByName('iscalculainss').AsInteger = 1 ));
      Data.Next;
    end;
  finally
    if Assigned(Data) then
      Data.Free;
  end;

end;

function TFuncionarioPersist.Delete(entidade: TFuncionario): boolean;
begin
  Tconexao.Instance.Execute('delete from funcionario where id=:id',
    Tconexao.Instance.NewParams(['id'], [entidade.Id]));
end;

function TFuncionarioPersist.Get: TList<TFuncionario>;
var
  Data: TDataSet;
  func: TFuncionario;
begin
  result := TList<TFuncionario>.Create;
  try
    Data := Tconexao.Instance().Get('select * from funcionario');
    while not Data.Eof do
    begin
      func := TFuncionario.Create(Data.FieldByName('id').Value,
        Data.FieldByName('nome').Value, Data.FieldByName('cpf').Value,
        Data.FieldByName('salario').Value);
      CarregarDependentes(func);
      result.Add(func);
      Data.Next;
    end;
  finally
    if Assigned(Data) then
      Data.Free;
  end;

end;

function TFuncionarioPersist.GetById(Id: Integer): TFuncionario;
var
  dataset: TDataSet;
  nome, cpf: string;
  salario: Currency;
begin
  try
    dataset := Tconexao.Instance().Get('select * from funcionario where id=:id',
      Tconexao.Instance.NewParams(['id'], [Id]));

    nome := dataset.FieldByName('nome').AsString;
    cpf := dataset.FieldByName('cpf').AsString;
    salario := dataset.FieldByName('salario').ascurrency;
    result := TFuncionario.Create(Id, nome, cpf, salario);
    CarregarDependentes(result);
  finally
    dataset.Free;
  end;

end;

function TFuncionarioPersist.GetDataSet: TDataSet;
begin
  result := Tconexao.Instance().Get('select * from funcionario');
end;

function TFuncionarioPersist.Save(entidade: TFuncionario): boolean;
var
  sqlInsert: String;
  sqlUpdate: String;
  dep: TDependente;
  dependentePersist: TDependentePersist;
begin
  sqlInsert :=
    'insert into funcionario (id, nome, cpf, salario) values (:id, :nome, :cpf, :salario)';
  sqlUpdate :=
    'update funcionario set nome=:nome, cpf=:cpf, salario=:salario where id=:id';

  dependentePersist :=  TDependentePersist.Create();
  try
    if entidade.Id = 0 then
    begin
      entidade.Id :=Tconexao.Instance.getGenId('funcionario_gen');
      if Tconexao.Instance.Execute(sqlInsert,
        Tconexao.Instance.NewParams(['id', 'nome', 'cpf', 'salario'],
        [entidade.Id, entidade.nome, entidade.cpf, entidade.salario])) > 0 then
      begin
        entidade.ForInDependentes( procedure (dep: TDependente) begin
          dep.IdFuncionario := entidade.Id;
          dependentePersist.Save(dep);
        end);
        result := true
      end
      else
        result := false;
    end
    else
    begin
      if Tconexao.Instance.Execute(sqlUpdate,
        Tconexao.Instance.NewParams(['id', 'nome', 'cpf', 'salario'],
        [entidade.Id, entidade.nome, entidade.cpf, entidade.salario])) > 0 then
        result := true
      else
        result := false;
    end;
  finally
    dependentePersist.Free;
  end;
end;

end.
