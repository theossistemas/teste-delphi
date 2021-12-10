unit Controller.Calculator;

interface

uses
  Controller.Calculator.Intf,
  Model.Calculator.Intf;

type
  TControllerCalculator = class(TInterfacedObject, IControllerCalculator)
  strict private
  private
    FServices: IModelCalculator;
  protected
    function Services: IModelCalculator;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IControllerCalculator;
  end;

implementation

uses
  Model.Calculator;

{ TControllerCalculator }

constructor TControllerCalculator.Create;
begin

end;

destructor TControllerCalculator.Destroy;
begin

  inherited;
end;

class function TControllerCalculator.New: IControllerCalculator;
begin
  Result := Self.Create;
end;

function TControllerCalculator.Services: IModelCalculator;
begin
  if not Assigned(FServices) then
    FServices := TModelCalculator.New;
  Result := FServices;
end;

end.

