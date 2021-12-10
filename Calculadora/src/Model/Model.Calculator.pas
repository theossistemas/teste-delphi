unit Model.Calculator;

interface

uses
  Model.Calculator.Intf;

type
  TModelCalculator = class(TInterfacedObject, IModelCalculator)
  strict private
  private
    FArithmetic: IModelCalculatorArithmetic;
  protected
    function Arithmetic: IModelCalculatorArithmetic;
    function Tax: IModelCalculatorTaxBuilder;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IModelCalculator;
  end;

implementation

uses
  Model.Calculator.Arithmetic,
  Model.Calculator.Tax.Builder;

{ TModelCalculator }

constructor TModelCalculator.Create;
begin

end;

destructor TModelCalculator.Destroy;
begin

  inherited;
end;

class function TModelCalculator.New: IModelCalculator;
begin
  Result := Self.Create;
end;

function TModelCalculator.Arithmetic: IModelCalculatorArithmetic;
begin
  if not Assigned(FArithmetic) then
    FArithmetic := TModelCalculatorArithmetic.New(Self);
  Result := FArithmetic;
end;

function TModelCalculator.Tax: IModelCalculatorTaxBuilder;
begin
  Result := TModelCalculatorTaxBuilder.New;
end;

end.
