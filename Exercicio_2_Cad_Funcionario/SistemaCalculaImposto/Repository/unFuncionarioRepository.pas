unit unFuncionarioRepository;

interface

uses
  System.Generics.Collections, Data.DB, unIDataBase, unIFuncionarioRepository,
  unFuncionario;

type
  TFuncionarioRepository = class(TInterfacedObject,
    IFuncionarioRepository<TFuncionario>)
  private
    FQuery: IQuery;
    constructor Create;
  public
    destructor Destroy; override;

    class function New: IFuncionarioRepository<TFuncionario>;
    function GetById(Id: integer): TFuncionario;
    function GetAll: TObjectList<TFuncionario>;
    function Post(obj: TFuncionario): TFuncionario; overload;
    function Put(obj: TFuncionario): TFuncionario; overload;
    function Delete(Id: integer): Boolean; overload;
    function Delete(obj: TFuncionario): Boolean; overload;

    function GetByNome(Nome: string): TObjectList<TFuncionario>;

  end;

implementation

uses
  unFactoryQuery, System.SysUtils, unDependente, unIDependenteRepository,
  unDependenteRepository;

{ TFuncionarioRepository }

constructor TFuncionarioRepository.Create;
begin
  // Em cada método é instanciado uma nova query na variável FQuery
end;

function TFuncionarioRepository.Delete(Id: integer): Boolean;
begin
  FQuery := TFactoryQuery.New.Query;
  FQuery.SQLClear;
  FQuery.SQLAdd('DELETE FROM FUNCIONARIO WHERE CODIGO = :CODIGO');
  FQuery.ParamByName('CODIGO', Id);

  FQuery.Connection.StartTransaction;
  try
    FQuery.ExecSQL;
    FQuery.Connection.Commit;
    Result := True;
  except
    on E: Exception do
    begin
      FQuery.Connection.RollBack;
      Result := False;
      raise Exception.Create('Erro ao Excluir Funcionário. Erro: ' + E.Message);
    end;
  end;
end;

function TFuncionarioRepository.Delete(obj: TFuncionario): Boolean;
begin
  Result := Delete(obj.Codigo)
end;

destructor TFuncionarioRepository.Destroy;
begin

  inherited;
end;

function TFuncionarioRepository.GetAll: TObjectList<TFuncionario>;
var
  Funcionario: TFuncionario;
  lista_de_Funcionarios: TObjectList<TFuncionario>;
  FDependenteRepository: IDependenteRepository<TDependente>;
begin
  lista_de_Funcionarios := TObjectList<TFuncionario>.Create;
  try
    FQuery := TFactoryQuery.New.Query;

    FQuery.Close;
    FQuery.SQLClear;
    FQuery.SQLAdd('SELECT * FROM FUNCIONARIO ');
    FQuery.SQLAdd('ORDER BY NOME ');

    FQuery.Open;

    if not FQuery.GetQuery.IsEmpty then
    begin
      FDependenteRepository := TDependenteRepository.New;
      while not FQuery.GetQuery.Eof do
      begin
        Funcionario := TFuncionario.Create;
        Funcionario.Codigo := FQuery.GetQuery.FieldByName('CODIGO').AsInteger;
        Funcionario.Nome := FQuery.GetQuery.FieldByName('NOME').AsString;
        Funcionario.CPF := FQuery.GetQuery.FieldByName('CPF').AsString;
        Funcionario.Salario := FQuery.GetQuery.FieldByName('SALARIO').AsInteger;
        lista_de_Funcionarios.Add(Funcionario);
        FQuery.GetQuery.Next;
      end;

      for Funcionario in lista_de_Funcionarios do
      begin

        Funcionario.ListaDendentes := FDependenteRepository.GetByFuncionario
          (Funcionario.Codigo);
      end;
    end;

    Result := lista_de_Funcionarios;
  except
    on E: Exception do
    begin
      if Assigned(lista_de_Funcionarios) then
        FreeAndNil(lista_de_Funcionarios);
      raise Exception.Create(E.Message);
    end;
  end;

end;

function TFuncionarioRepository.GetById(Id: integer): TFuncionario;
var
  Funcionario: TFuncionario;
  FDependenteRepository: IDependenteRepository<TDependente>;
begin
  FQuery := TFactoryQuery.New.Query;
  FQuery.Close;
  FQuery.SQLClear;
  FQuery.SQLAdd('SELECT * FROM FUNCIONARIO ');
  FQuery.SQLAdd('WHERE CODIGO = :CODIGO');
  FQuery.ParamByName('CODIGO', Id);

  FQuery.Open;
  if not FQuery.GetQuery.IsEmpty then
  begin
    Funcionario := TFuncionario.Create;
    Funcionario.Codigo := FQuery.GetQuery.FieldByName('CODIGO').AsInteger;
    Funcionario.Nome := FQuery.GetQuery.FieldByName('NOME').AsString;
    Funcionario.CPF := FQuery.GetQuery.FieldByName('CPF').AsString;
    Funcionario.Salario := FQuery.GetQuery.FieldByName('SALARIO').AsFloat;
    FDependenteRepository := TDependenteRepository.New;
    Funcionario.ListaDendentes := FDependenteRepository.GetByFuncionario
      (FQuery.GetQuery.FieldByName('CODIGO').AsInteger);
    Result := Funcionario;
  end
  else
    Result := Nil;
end;

function TFuncionarioRepository.GetByNome(Nome: string)
  : TObjectList<TFuncionario>;
var
  Funcionario: TFuncionario;
  lista_de_Funcionarios: TObjectList<TFuncionario>;
  FDependenteRepository: IDependenteRepository<TDependente>;
begin
  lista_de_Funcionarios := TObjectList<TFuncionario>.Create;

  FQuery := TFactoryQuery.New.Query;

  FQuery.Close;
  FQuery.SQLClear;
  FQuery.SQLAdd('SELECT * FROM FUNCIONARIO ');
  FQuery.SQLAdd('WHERE UPPER(NOME) LIKE UPPER(:NOME)');
  FQuery.SQLAdd('ORDER BY NOME ');
  FQuery.ParamByName('NOME', Nome);
  FQuery.Open;

  if not FQuery.GetQuery.IsEmpty then
  begin
    FDependenteRepository := TDependenteRepository.New;
    while not FQuery.GetQuery.Eof do
    begin
      Funcionario := TFuncionario.Create;
      Funcionario.Codigo := FQuery.GetQuery.FieldByName('CODIGO').AsInteger;
      Funcionario.Nome := FQuery.GetQuery.FieldByName('NOME').AsString;
      Funcionario.CPF := FQuery.GetQuery.FieldByName('CPF').AsString;
      Funcionario.Salario := FQuery.GetQuery.FieldByName('SALARIO').AsInteger;
      lista_de_Funcionarios.Add(Funcionario);
      FQuery.GetQuery.Next;
    end;

    for Funcionario in lista_de_Funcionarios do
    begin
      // FreeAndNil(Funcionario.ListaDendentes);
      Funcionario.ListaDendentes := FDependenteRepository.GetByFuncionario
        (Funcionario.Codigo);
    end;
  end;

  Result := lista_de_Funcionarios;

end;

class function TFuncionarioRepository.New: IFuncionarioRepository<TFuncionario>;
begin
  Result := self.Create;
end;

function TFuncionarioRepository.Post(obj: TFuncionario): TFuncionario;
var
  vId: integer;
begin
  FQuery := TFactoryQuery.New.Query;
  FQuery.Close;
  FQuery.SQLClear;
  FQuery.SQLAdd('INSERT INTO FUNCIONARIO(NOME, CPF, SALARIO) ');
  FQuery.SQLAdd('VALUES (:NOME, :CPF, :SALARIO)');
  FQuery.SQLAdd('RETURNING CODIGO ');

  // FQuery.ParamByName('id', obj.Id);
  FQuery.ParamByName('NOME', obj.Nome);
  FQuery.ParamByName('CPF', obj.CPF);
  FQuery.ParamByName('SALARIO', obj.Salario);

  FQuery.Connection.StartTransaction;
  try
    FQuery.Open;
    FQuery.Connection.Commit;
  except
    on E: Exception do
      FQuery.Connection.RollBack;
  end;

  vId := FQuery.GetQuery.FieldByName('CODIGO').AsInteger;

  Result := GetById(vId);
end;

function TFuncionarioRepository.Put(obj: TFuncionario): TFuncionario;
begin
  FQuery := TFactoryQuery.New.Query;
  FQuery.Close;
  FQuery.SQLClear;
  FQuery.SQLAdd('UPDATE FUNCIONARIO ');
  FQuery.SQLAdd('SET NOME  = :NOME  , ');
  FQuery.SQLAdd('    CPF = :CPF , ');
  FQuery.SQLAdd('    SALARIO = :SALARIO   ');
  FQuery.SQLAdd('WHERE (CODIGO = :CODIGO )     ');

  FQuery.ParamByName('CODIGO', obj.Codigo);
  FQuery.ParamByName('NOME', obj.Nome);
  FQuery.ParamByName('CPF', obj.CPF);
  FQuery.ParamByName('SALARIO', obj.Salario);

  FQuery.Connection.StartTransaction;
  try
    FQuery.ExecSQL;
    FQuery.Connection.Commit;
  except
    on E: Exception do
      FQuery.Connection.RollBack;
  end;
  Result := GetById(obj.Codigo);

end;

end.
