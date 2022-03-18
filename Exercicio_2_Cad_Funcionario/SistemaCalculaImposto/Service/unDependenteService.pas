unit unDependenteService;

interface

uses
  unDependente, unIDependenteRepository, System.Generics.Collections;

type
  TDependenteService = class
  private
    FDependenteRepository: IDependenteRepository<TDependente>;
  public
    constructor Create;
    destructor Destroy; override;

    function Post(obj: TDependente): TDependente; overload;
    function Put(obj: TDependente): TDependente; overload;
    function Delete(Id: integer): Boolean; overload;
    function Delete(obj: TDependente): Boolean; overload;

    function GetAll: TObjectList<TDependente>;
    function GetById(Id: integer): TDependente;
    function GetByFuncionario(idFuncionario: integer): TObjectList<TDependente>;

  end;

implementation

uses
  System.SysUtils, unDependenteRepository;

{ TDependenteService }

constructor TDependenteService.Create;
begin
 FDependenteRepository := TDependenteRepository.New;
end;

function TDependenteService.Delete(obj: TDependente): Boolean;
begin
  if (obj.Codigo <= 0) then
    raise Exception.Create('Informe o id');

  Result := FDependenteRepository.Delete(obj);
end;

function TDependenteService.Delete(Id: integer): Boolean;
begin
  if (Id <= 0) then
    raise Exception.Create('Informe o id');

  Result := FDependenteRepository.Delete(Id);
end;

destructor TDependenteService.Destroy;
begin

  inherited;
end;

function TDependenteService.GetAll: TObjectList<TDependente>;
begin
  raise Exception.Create('Não implementado');
end;

function TDependenteService.GetByFuncionario(idFuncionario: integer): TObjectList<TDependente>;
begin
  Result := FDependenteRepository.GetByFuncionario(idFuncionario);
end;

function TDependenteService.GetById(Id: integer): TDependente;
begin
  Result := FDependenteRepository.GetById(id);
end;

function TDependenteService.Post(obj: TDependente): TDependente;
begin
  if (obj.CodigoFuncionario <= 0) then
    raise Exception.Create('Informe o Código Funcionário.');

  if (obj.Nome = '') or (Length(obj.Nome) < 3) then
    raise Exception.Create('Informe o nome com ao menos 3 caracteres.');



  Result := FDependenteRepository.Post(obj);
end;

function TDependenteService.Put(obj: TDependente): TDependente;
begin
   if (obj.CodigoFuncionario <= 0) then
    raise Exception.Create('Informe o Código Funcionário.');

  if (obj.Nome = '') or (Length(obj.Nome) < 3) then
    raise Exception.Create('Informe o nome com ao menos 3 caracteres.');

  Result := FDependenteRepository.Put(obj);
end;

end.
