unit Model.Calculator.TaxA;

interface

uses
  System.SysUtils,
  Model.Calculator.Intf;

type
  TModelCalculatorTaxA = class(TInterfacedObject, IModelCalculatorTax)
  private
    FBase: Currency;
    FNotifyResult: TProc<string>;
  protected
    function Base(const AValue: Currency): IModelCalculatorTax;
    function NotifyResult(AProc: TProc<string>): IModelCalculatorTax;
    function Execute: IModelCalculatorTax;
    function Return: Currency;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IModelCalculatorTax;
  end;

implementation

{ TModelCalculatorTaxA }

constructor TModelCalculatorTaxA.Create;
begin

end;

destructor TModelCalculatorTaxA.Destroy;
begin

  inherited;
end;

class function TModelCalculatorTaxA.New: IModelCalculatorTax;
begin
  Result := Self.Create;
end;

function TModelCalculatorTaxA.Execute: IModelCalculatorTax;
begin
  Result := Self;
  if Assigned(FNotifyResult) then
    FNotifyResult(CurrToStr(Self.Return));
end;

function TModelCalculatorTaxA.Base(const AValue: Currency): IModelCalculatorTax;
begin
  Result := Self;
  FBase := AValue;
end;

function TModelCalculatorTaxA.NotifyResult(AProc: TProc<string>): IModelCalculatorTax;
begin
  Result := Self;
  FNotifyResult := AProc;
end;

function TModelCalculatorTaxA.Return: Currency;
begin
  Result := (FBase * 0.2) - 500;
end;

end.
