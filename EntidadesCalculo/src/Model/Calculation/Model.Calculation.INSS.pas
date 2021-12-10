unit Model.Calculation.INSS;

interface

uses
  System.SysUtils,
  Model.Calculation.Intf;

type
  TModelCalculationINSS = class(TInterfacedObject, IModelCalculation)
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

{ TModelCalculationINSS }

procedure TModelCalculationINSS.CheckSalary;
begin
  if FEmployeeSalary <= 0 then
    raise Exception.Create('Salário do funcionário deve ser maior de R$ 0,00.');
end;

constructor TModelCalculationINSS.Create;
begin
  FEmployeeSalary := 0;
  FNumberOfDependents := 0;
end;

destructor TModelCalculationINSS.Destroy;
begin

  inherited;
end;

class function TModelCalculationINSS.New: IModelCalculation;
begin
  Result := Self.Create;
end;

function TModelCalculationINSS.EmployeeSalary(const AValue: Currency): IModelCalculation;
begin
  Result := Self;
  FEmployeeSalary := AValue;
end;

function TModelCalculationINSS.Execute: Currency;
begin
  if FNumberOfDependents = 0 then
    Exit(0);

  CheckSalary;
  Result := (FEmployeeSalary * 0.08);
end;

function TModelCalculationINSS.NumberOfDependents(const AValue: Word): IModelCalculation;
begin
  Result := Self;
  FNumberOfDependents := AValue;
end;

end.

