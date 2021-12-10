unit Test.Calculator.Tax;

interface

uses
  DUnitX.TestFramework,
  Model.Calculator.Intf;

type
  [TestFixture]
  TTestCalculatorTax = class(TObject)
  private
    FBuilder: IModelCalculatorTaxBuilder;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestTaxA;

    [Test]
    procedure TestTaxB;

    [Test]
    procedure TestTaxC;
  end;

implementation

uses
  Model.Calculator.Tax.Builder;

procedure TTestCalculatorTax.Setup;
begin
  FBuilder := TModelCalculatorTaxBuilder.New;
end;

procedure TTestCalculatorTax.TearDown;
begin
  FBuilder := nil;
end;

procedure TTestCalculatorTax.TestTaxA;
var
  lResult: string;
begin
  FBuilder.TaxA
    .NotifyResult(
      procedure(AValue: string)
      begin
        lResult := AValue;
      end)
    .Base(10)
    .Execute;

  Assert.AreEqual('-498', lResult);
end;

procedure TTestCalculatorTax.TestTaxB;
var
  lResult: string;
begin
  FBuilder.TaxB
    .NotifyResult(
      procedure(AValue: string)
      begin
        lResult := AValue;
      end)
    .Base(10)
    .Execute;

  Assert.AreEqual('-513', lResult);
end;

procedure TTestCalculatorTax.TestTaxC;
var
  lResult: string;
begin
  FBuilder.TaxC
    .NotifyResult(
      procedure(AValue: string)
      begin
        lResult := AValue;
      end)
    .Base(10)
    .Execute;

  Assert.AreEqual('-1011', lResult);
end;

initialization

TDUnitX.RegisterTestFixture(TTestCalculatorTax);

end.
