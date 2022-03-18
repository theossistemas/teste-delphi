unit unDependenteController;

interface

uses
  System.SysUtils, unDependente, unDependenteService,
  System.Generics.Collections;

type
  TDependenteController = class
  private
    // FDependenteRepository: IFuncionarioRepository<TFuncionario>;  //Caso precise inserir registros sem passar pela validação
    FDependenteService: TDependenteService;
    // FDependente: TDependente;
  public
    constructor Create;
    destructor Destroy; override;

    function Post(obj: TDependente): TDependente; overload;
    function Put(obj: TDependente): TDependente; overload;
    function Delete(Id: integer): Boolean; overload;
    function Delete(obj: TDependente): Boolean; overload;

    function GetById(Id: integer): TDependente;
    function GetByFuncionario(idFuncionario: integer): TObjectList<TDependente>;
  end;

implementation

{ TDependenteController }

constructor TDependenteController.Create;
begin
  FDependenteService := TDependenteService.Create;
end;

function TDependenteController.Delete(obj: TDependente): Boolean;
begin
  Result := FDependenteService.Delete(obj);
end;

function TDependenteController.Delete(Id: integer): Boolean;
begin
  Result := FDependenteService.Delete(Id);
end;

destructor TDependenteController.Destroy;
begin
  FreeandNil(FDependenteService);
  inherited;
end;

function TDependenteController.GetByFuncionario(idFuncionario: integer): TObjectList<TDependente>;
begin
  Result := FDependenteService.GetByFuncionario(idFuncionario);
end;

function TDependenteController.GetById(Id: integer): TDependente;
begin
  Result := FDependenteService.GetById(Id);
end;

function TDependenteController.Post(obj: TDependente): TDependente;
begin
  Result := FDependenteService.Post(obj);
end;

function TDependenteController.Put(obj: TDependente): TDependente;
begin
  Result := FDependenteService.Put(obj);
end;

end.
