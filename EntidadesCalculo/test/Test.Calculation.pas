unit Test.Calculation;

interface

uses
  System.SysUtils,
  DUnitX.TestFramework,
  Model.Calculation.Intf;

type
  [TestFixture]
  TCalculationTax = class(TObject)
  private
    FCalcINSS: IModelCalculation;
    FCalcIR: IModelCalculation;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestINSSWithDependent;

    [Test]
    procedure TestINSSWithoutDependent;

    [Test]
    procedure TestIRWithDependent;

    [Test]
    procedure TestIRWithoutDependent;

    [Test]
    procedure TestSalaryEmpty;
  end;

implementation

uses
  Model.Calculation.INSS,
  Model.Calculation.IR;

procedure TCalculationTax.Setup;
begin
  FCalcINSS := TModelCalculationINSS.New;
  FCalcIR   := TModelCalculationIR.New;
end;

procedure TCalculationTax.TearDown;
begin
  FCalcINSS := nil;
  FCalcIR := nil;
end;

procedure TCalculationTax.TestINSSWithDependent;
var
  lResult: string;
begin
  lResult := CurrToStr(FCalcINSS
              .EmployeeSalary(1000)
              .NumberOfDependents(2)
              .Execute);

  Assert.AreEqual(lResult, '80');
end;

procedure TCalculationTax.TestINSSWithoutDependent;
var
  lResult: string;
begin
  lResult := CurrToStr(FCalcINSS
              .EmployeeSalary(1000)
              .Execute);

  Assert.AreEqual(lResult, '0');
end;

procedure TCalculationTax.TestIRWithDependent;
var
  lResult: string;
begin
  lResult := CurrToStr(FCalcIR
              .EmployeeSalary(1305)
              .NumberOfDependents(4)
              .Execute);

  Assert.AreEqual(lResult, '135,75');
end;

procedure TCalculationTax.TestIRWithoutDependent;
var
  lResult: string;
begin
  lResult := CurrToStr(FCalcIR
              .EmployeeSalary(5000)
              .Execute);

  Assert.AreEqual(lResult, '0');
end;

procedure TCalculationTax.TestSalaryEmpty;
begin
  Assert.WillRaiseWithMessage(
    procedure
    begin
      FCalcIR
        .EmployeeSalary(0)
        .NumberOfDependents(1)
        .Execute;
    end,
    Exception,
    'Salário do funcionário deve ser maior de R$ 0,00.');
end;

initialization
  TDUnitX.RegisterTestFixture(TCalculationTax);

end.
