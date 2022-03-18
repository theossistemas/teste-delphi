unit unFuncionarioController;

interface

uses
  unIFuncionarioRepository, unFuncionario, unFuncionarioService, unFuncionarioRepository,
  System.SysUtils, System.Generics.Collections;

type
  TFuncionarioController = class
  private
    //FFuncionarioRepository: IFuncionarioRepository<TFuncionario>;  //Caso precise inserir registros sem passar pela validação
    FFuncionarioService: TFuncionarioService;
    //FFuncionario: TFuncionario;
  public
    constructor Create;
    destructor Destroy; override;

    function Post(obj: TFuncionario): TFuncionario; overload;
    function Put(obj: TFuncionario): TFuncionario; overload;
    function Delete(Id: integer): Boolean; overload;

    function GetAll: TObjectList<TFuncionario>;
    function GetByNome(nome: string): TObjectList<TFuncionario>;
  end;

implementation

{ TClienteResource }

constructor TFuncionarioController.Create;
begin
  //FFuncionario := TFuncionario.Create;
  FFuncionarioService := TFuncionarioService.Create;
  //FFuncionarioRepository := TFuncionarioRepository.New;
end;

function TFuncionarioController.Delete(Id: integer): Boolean;
begin
  Result := FFuncionarioService.Delete(id);
end;

destructor TFuncionarioController.Destroy;
begin
  FreeandNil(FFuncionarioService);
  //FreeandNil(FFuncionario);
  inherited;
end;

function TFuncionarioController.GetAll: TObjectList<TFuncionario>;
begin
   Result := FFuncionarioService.GetAll;
end;

function TFuncionarioController.GetByNome(
  nome: string): TObjectList<TFuncionario>;
begin
  Result := FFuncionarioService.GetByNome(nome);
end;

function TFuncionarioController.Post(obj: TFuncionario): TFuncionario;
begin
  Result := FFuncionarioService.Post(obj);
end;

function TFuncionarioController.Put(obj: TFuncionario): TFuncionario;
begin
  Result := FFuncionarioService.Put(obj);
end;

end.
