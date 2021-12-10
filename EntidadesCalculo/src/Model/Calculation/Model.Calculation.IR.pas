unit Model.Calculation.IR;

interface

uses
  System.SysUtils,
  Model.Calculation.Intf;

type
  TModelCalculationIR = class(TInterfacedObject, IModelCalculation)
  strict private
    procedure CheckSalary;
  private
    FEmployeeSalary: Currency;
    FNumberOfDependents: Word;
  protected
    function EmployeeSalary(const AValue: Currency): IModelCalculation;
    function NumberOfDependents(const AValue: Word): IModelCalculation;
    function Execute: Currency;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IModelCalculation;
  end;

implementation

{ TModelCalculationIR }

procedure TModelCalculationIR.CheckSalary;
begin
  if FEmployeeSalary <= 0 then
    raise Exception.Create('Salário do funcionário deve ser maior de R$ 0,00.');
end;

constructor TModelCalculationIR.Create;
begin
  FEmployeeSalary := 0;
  FNumberOfDependents := 0;
end;

destructor TModelCalculationIR.Destroy;
begin

  inherited;
end;

class function TModelCalculationIR.New: IModelCalculation;
begin
  Result := Self.Create;
end;

function TModelCalculationIR.EmployeeSalary(const AValue: Currency): IModelCalculation;
begin
  Result := Self;
  FEmployeeSalary := AValue;
end;

function TModelCalculationIR.Execute: Currency;
var
  lBase: Currency;
begin
  if FNumberOfDependents = 0 then
    Exit(0);

  CheckSalary;

  // * IR – O cálculo de IR será deduzido da base, salário 100 reais para cada dependente que possuir calcula IR e por fim desconta 15% do salário do funcionário.
  // * IR = 1000,00 - (2 * 100) = 800,00 – 15% = 120,00.
  lBase := FEmployeeSalary - (FNumberOfDependents * 100);
  Result := (lBase * 0.15);
end;

function TModelCalculationIR.NumberOfDependents(const AValue: Word): IModelCalculation;
begin
  Result := Self;
  FNumberOfDependents := AValue;
end;

end.
