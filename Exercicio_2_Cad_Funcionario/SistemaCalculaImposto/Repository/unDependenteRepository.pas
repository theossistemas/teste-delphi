unit unDependenteRepository;

interface

uses
  Data.DB, unIDataBase, unIDependenteRepository, unDependente, System.Generics.Collections;

type
  TDependenteRepository = class(TInterfacedObject, IDependenteRepository<TDependente>)
  private
    FQuery: IQuery;
    constructor Create;
  public
    destructor Destroy; override;

    class function New: IDependenteRepository<TDependente>;
    function GetById(Id: integer): TDependente;
    function GetAll: TObjectList<TDependente>;
    function Post(obj: TDependente): TDependente; overload;
    function Put(obj: TDependente): TDependente; overload;
    function Delete(Id: integer): Boolean; overload;
    function Delete(obj: TDependente): Boolean; overload;


    function GetByNome(Nome: string): TObjectList<TDependente>;
    function GetByFuncionario(idFuncionario: integer): TObjectList<TDependente>;

  end;

implementation

uses
  unFactoryQuery, System.SysUtils;

{ TDependenteRepository }

constructor TDependenteRepository.Create;
begin

end;

function TDependenteRepository.Delete(Id: integer): Boolean;
begin
  FQuery := TFactoryQuery.New.Query;
  FQuery.SQLClear;
  FQuery.SQLAdd('DELETE FROM DEPENDENTE WHERE CODIGO = :CODIGO');
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
      Result := False
    end;

  end;
end;

function TDependenteRepository.Delete(obj: TDependente): Boolean;
begin
  Result := Delete(obj.Codigo)
end;

destructor TDependenteRepository.Destroy;
begin

  inherited;
end;

function TDependenteRepository.GetAll: TObjectList<TDependente>;
begin
  raise Exception.Create('Não implementado');
end;

function TDependenteRepository.GetByFuncionario(idFuncionario: integer): TObjectList<TDependente>;
var
  Dependente: TDependente;
  lista_de_dependentes: TObjectList<TDependente>;
begin
  lista_de_dependentes := TObjectList<TDependente>.Create;

  FQuery := TFactoryQuery.New.Query;

  FQuery.Close;
  FQuery.SQLClear;
  FQuery.SQLAdd('SELECT * FROM DEPENDENTE ');
  FQuery.SQLAdd('WHERE CODIGO_FUNCIONARIO = :CODIGO_FUNCIONARIO');
  FQuery.SQLAdd('ORDER BY NOME ');

  FQuery.ParamByName('CODIGO_FUNCIONARIO', idFuncionario);

  FQuery.Open;

  if not FQuery.GetQuery.IsEmpty then
  begin
    while not FQuery.GetQuery.Eof do
    begin
      Dependente := TDependente.Create;
      Dependente.Codigo := FQuery.GetQuery.FieldByName('CODIGO').AsInteger;
      Dependente.Nome := FQuery.GetQuery.FieldByName('NOME').AsString;
      Dependente.CalcularINSS := FQuery.GetQuery.FieldByName('CALCULARINSS').AsInteger = 1;
      Dependente.CalcularIR := FQuery.GetQuery.FieldByName('CALCULARIR').AsInteger = 1;

      lista_de_dependentes.Add(Dependente);

      FQuery.GetQuery.Next;
    end;
  end;

  Result := lista_de_dependentes;

end;

function TDependenteRepository.GetById(Id: integer): TDependente;
var
  Dependente: TDependente;
begin
  FQuery := TFactoryQuery.New.Query;
  FQuery.Close;
  FQuery.SQLClear;
  FQuery.SQLAdd('SELECT * FROM DEPENDENTE ');
  FQuery.SQLAdd('WHERE CODIGO = :CODIGO');
  FQuery.ParamByName('CODIGO', Id);

  FQuery.Open;
  if not FQuery.GetQuery.IsEmpty then
  begin
    Dependente := TDependente.Create;
    Dependente.Codigo         := FQuery.GetQuery.FieldByName('CODIGO').AsInteger;
    Dependente.Nome           := FQuery.GetQuery.FieldByName('NOME').AsString;
    Dependente.CalcularINSS := FQuery.GetQuery.FieldByName('CALCULARINSS').AsInteger = 1;
    Dependente.CalcularIR   := FQuery.GetQuery.FieldByName('CALCULARIR').AsInteger = 1;
    Result := Dependente;
  end
  else
    Result := Nil;
end;

function TDependenteRepository.GetByNome(Nome: string)
  : TObjectList<TDependente>;
begin
  raise Exception.Create('Não implemntado.');
end;

class function TDependenteRepository.New: IDependenteRepository<TDependente>;
begin
  Result := self.Create;
end;

function TDependenteRepository.Post(obj: TDependente): TDependente;
var
  vId: integer;
begin
  FQuery := TFactoryQuery.New.Query;
  FQuery.Close;
  FQuery.SQLClear;
  FQuery.SQLAdd
    ('INSERT INTO DEPENDENTE (CODIGO, CODIGO_FUNCIONARIO, NOME, CALCULARINSS, CALCULARIR) ');
  FQuery.SQLAdd
    ('VALUES (:CODIGO, :CODIGO_FUNCIONARIO, :NOME, :CALCULARINSS, :CALCULARIR)            ');
  FQuery.SQLAdd('RETURNING CODIGO ');

  FQuery.ParamByName('NOME', obj.Nome);
  FQuery.ParamByName('CODIGO_FUNCIONARIO', obj.CodigoFuncionario);
  FQuery.ParamByName('CALCULARINSS', ord(obj.CalcularINSS));
  FQuery.ParamByName('CALCULARIR', ord(obj.CalcularIR));

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

function TDependenteRepository.Put(obj: TDependente): TDependente;
begin
  FQuery := TFactoryQuery.New.Query;
  FQuery.Close;
  FQuery.SQLClear;
  FQuery.SQLAdd('UPDATE DEPENDENTE ');
  FQuery.SQLAdd('SET NOME  = :NOME  , ');
  FQuery.SQLAdd('    CODIGO_FUNCIONARIO = :CODIGO_FUNCIONARIO , ');
  FQuery.SQLAdd('    CALCULARINSS = :CALCULARINSS,              ');
  FQuery.SQLAdd('    CALCULARIR = :CALCULARIR                   ');
  FQuery.SQLAdd('WHERE (CODIGO = :CODIGO )                      ');

  FQuery.ParamByName('NOME', obj.Nome);
  FQuery.ParamByName('CODIGO_FUNCIONARIO', obj.CodigoFuncionario);
  FQuery.ParamByName('CALCULARINSS', ord(obj.CalcularINSS));
  FQuery.ParamByName('CALCULARIR', ord(obj.CalcularIR));
  FQuery.ParamByName('CODIGO', obj.Codigo);

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
