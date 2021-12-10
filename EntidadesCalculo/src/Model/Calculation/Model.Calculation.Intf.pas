unit Model.Calculation.Intf;

interface

type
  IModelCalculation = interface
    ['{787C6671-8C72-449B-A73C-7B716D70CB92}']
    function EmployeeSalary(const AValue: Currency): IModelCalculation;
    function NumberOfDependents(const AValue: Word): IModelCalculation;
    function Execute: Currency;
  end;

implementation

end.
