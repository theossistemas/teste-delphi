unit Model.Calculator.Tax.Builder;

interface

uses
  Model.Calculator.Intf;

type
  TModelCalculatorTaxBuilder = class(TInterfacedObject, IModelCalculatorTaxBuilder)
  protected
    function TaxA: IModelCalculatorTax;
    function TaxB: IModelCalculatorTax;
    function TaxC: IModelCalculatorTax;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IModelCalculatorTaxBuilder;
  end;

implementation

uses
  Model.Calculator.TaxA,
  Model.Calculator.TaxB,
  Model.Calculator.TaxC;

{ TModelCalculatorTaxBuilder }

constructor TModelCalculatorTaxBuilder.Create;
begin

end;

destructor TModelCalculatorTaxBuilder.Destroy;
begin

  inherited;
end;

class function TModelCalculatorTaxBuilder.New: IModelCalculatorTaxBuilder;
begin
  Result := Self.Create;
end;

function TModelCalculatorTaxBuilder.TaxA: IModelCalculatorTax;
begin
  Result := TModelCalculatorTaxA.New;
end;

function TModelCalculatorTaxBuilder.TaxB: IModelCalculatorTax;
begin
  Result := TModelCalculatorTaxB.New(
              TModelCalculatorTaxA.New
            );
end;

function TModelCalculatorTaxBuilder.TaxC: IModelCalculatorTax;
begin
  Result := TModelCalculatorTaxC.New(
              TModelCalculatorTaxA.New,
              TModelCalculatorTaxB.New(
                TModelCalculatorTaxA.New
              )
            );
end;

end.
