unit Model.Calculator.TaxC;

interface

uses
  System.SysUtils,
  Model.Calculator.Intf;

type
  TModelCalculatorTaxC = class(TInterfacedObject, IModelCalculatorTax)
  private
    FBase: Currency;
    FNotifyResult: TProc<string>;
  private
    FTaxA: IModelCalculatorTax;
    FTaxB: IModelCalculatorTax;
  protected
    function Base(const AValue: Currency): IModelCalculatorTax;
    function NotifyResult(AProc: TProc<string>): IModelCalculatorTax;
    function Execute: IModelCalculatorTax;
    function Return: Currency;
  public
    constructor Create(ATaxA: IModelCalculatorTax; ATaxB: IModelCalculatorTax);
    destructor Destroy; override;
    class function New(ATaxA: IModelCalculatorTax; ATaxB: IModelCalculatorTax): IModelCalculatorTax;
  end;

implementation

{ TModelCalculatorTaxC }

constructor TModelCalculatorTaxC.Create(ATaxA: IModelCalculatorTax; ATaxB: IModelCalculatorTax);
begin
  FTaxA := ATaxA;
  FTaxB := ATaxB;
end;

destructor TModelCalculatorTaxC.Destroy;
begin

  inherited;
end;

class function TModelCalculatorTaxC.New(ATaxA: IModelCalculatorTax; ATaxB: IModelCalculatorTax): IModelCalculatorTax;
begin
  Result := Self.Create(ATaxA, ATaxB);
end;

function TModelCalculatorTaxC.Execute: IModelCalculatorTax;
begin
  Result := Self;
  if Assigned(FNotifyResult) then
    FNotifyResult(CurrToStr(Self.Return));
end;

function TModelCalculatorTaxC.Base(const AValue: Currency): IModelCalculatorTax;
begin
  Result := Self;
  FBase := AValue;
end;

function TModelCalculatorTaxC.NotifyResult(AProc: TProc<string>): IModelCalculatorTax;
begin
  Result := Self;
  FNotifyResult := AProc;
end;

function TModelCalculatorTaxC.Return: Currency;
begin
  Result := FTaxA.Base(FBase).Return + FTaxB.Base(FBase).Return;
end;

end.
