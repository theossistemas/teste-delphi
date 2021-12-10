unit Model.Calculator.TaxB;

interface

uses
  System.SysUtils,
  Model.Calculator.Intf;

type
  TModelCalculatorTaxB = class(TInterfacedObject, IModelCalculatorTax)
  private
    FBase: Currency;
    FNotifyResult: TProc<string>;
  private
    FTaxA: IModelCalculatorTax;
  protected
    function Base(const AValue: Currency): IModelCalculatorTax;
    function NotifyResult(AProc: TProc<string>): IModelCalculatorTax;
    function Execute: IModelCalculatorTax;
    function Return: Currency;
  public
    constructor Create(ATaxA: IModelCalculatorTax);
    destructor Destroy; override;
    class function New(ATaxA: IModelCalculatorTax): IModelCalculatorTax;
  end;

implementation

{ TModelCalculatorTaxB }

constructor TModelCalculatorTaxB.Create(ATaxA: IModelCalculatorTax);
begin
  FTaxA := ATaxA;
end;

destructor TModelCalculatorTaxB.Destroy;
begin

  inherited;
end;

class function TModelCalculatorTaxB.New(ATaxA: IModelCalculatorTax): IModelCalculatorTax;
begin
  Result := Self.Create(ATaxA);
end;

function TModelCalculatorTaxB.Execute: IModelCalculatorTax;
begin
  Result := Self;
  if Assigned(FNotifyResult) then
    FNotifyResult(CurrToStr(Self.Return));
end;

function TModelCalculatorTaxB.Base(const AValue: Currency): IModelCalculatorTax;
begin
  Result := Self;
  FBase := AValue;
end;

function TModelCalculatorTaxB.NotifyResult(AProc: TProc<string>): IModelCalculatorTax;
begin
  Result := Self;
  FNotifyResult := AProc;
end;

function TModelCalculatorTaxB.Return: Currency;
begin
  Result := FTaxA.Base(FBase).Return - 15;
end;

end.
