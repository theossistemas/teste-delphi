unit Controller;

interface

uses
  Controller.Intf;

type
  TController = class(TInterfacedObject, IController)
  strict private
  private
    FEntities: IControllerEntities;
  protected
    function Entities: IControllerEntities;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IController;
  end;

implementation

uses
  Controller.Entities;

{ TController }

constructor TController.Create;
begin

end;

destructor TController.Destroy;
begin

  inherited;
end;

function TController.Entities: IControllerEntities;
begin
  if not Assigned(FEntities) then
    FEntities := TControllerEntities.New(Self);
  Result := FEntities;
end;

class function TController.New: IController;
begin
  Result := Self.Create;
end;

end.

