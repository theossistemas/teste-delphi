unit unFuncionarioService;

interface

uses
  unIFuncionarioRepository, unFuncionario, unFuncionarioRepository,
  System.Generics.Collections;

type
TFuncionarioService = class
  private
    FFuncionarioRepository: IFuncionarioRepository<TFuncionario>;
  public
    constructor Create;
    destructor Destroy; override;

    function Post(obj: TFuncionario): TFuncionario; overload;
    function Put(obj: TFuncionario): TFuncionario; overload;
    function Delete(Id: integer): Boolean; overload;
    function Delete(obj: TFuncionario): Boolean; overload;

    function GetAll: TObjectList<TFuncionario>;
    function GetByNome(nome: string): TObjectList<TFuncionario>;

end;

implementation

uses
  System.SysUtils;

{ TFuncionarioService }

constructor TFuncionarioService.Create;
begin
  FFuncionarioRepository := TFuncionarioRepository.New;
end;

function TFuncionarioService.Delete(Id: integer): Boolean;
begin
 if (Id <= 0) then
    raise Exception.Create('Informe o id');

  Result := FFuncionarioRepository.Delete(Id);
end;

function TFuncionarioService.Delete(obj: TFuncionario): Boolean;
begin
  if obj.Codigo <= 0 then
    raise Exception.Create('Informe o Código do Funcionário.');

  Result := FFuncionarioRepository.Delete(obj)
end;

destructor TFuncionarioService.Destroy;
begin

  inherited;
end;

function TFuncionarioService.GetAll: TObjectList<TFuncionario>;
begin
   Result := FFuncionarioRepository.GetAll;
end;

function TFuncionarioService.GetByNome(nome: string): TObjectList<TFuncionario>;
begin
  Result := FFuncionarioRepository.GetByNome(nome);
end;

function TFuncionarioService.Post(obj: TFuncionario): TFuncionario;
begin
  if (obj.Nome = '') or (Length(obj.Nome) < 5) then
    raise Exception.Create('Informe o nome com ao menos 5 caracteres.');

  if (obj.CPF = '')then
    raise Exception.Create('Informe um CPF.');

  Result := FFuncionarioRepository.Post(obj);
end;

function TFuncionarioService.Put(obj: TFuncionario): TFuncionario;
begin
  if (obj.Codigo <= 0) then
    raise Exception.Create('Informe o id.');

  if (obj.Nome = '') or (Length(obj.Nome) < 5) then
    raise Exception.Create('Informe o nome com ao menos 5 caracteres.');

  if (obj.CPF = '') then
    raise Exception.Create('Informe um CPF.');

  Result := FFuncionarioRepository.Put(obj);
end;

end.
