unit Model.Calculator.Intf;

interface

uses
  System.SysUtils,
  Model.Calculator.Types;

type
  IModelCalculatorArithmetic = interface;

  IModelCalculatorTax = interface;

  IModelCalculatorTaxBuilder = interface;

  IModelCalculator = interface
    ['{5CA94936-24DB-4F51-8B55-FF714DCED2CE}']
    function Arithmetic: IModelCalculatorArithmetic;
    function Tax: IModelCalculatorTaxBuilder;
  end;

  IModelCalculatorArithmetic = interface
    ['{7CF3B491-9A9D-4BF9-A9F0-27DA08F6B022}']
    function NotifyResult(AProc: TProc<string>): IModelCalculatorArithmetic;
    function NotifyHistoric(AProc: TProc<string>): IModelCalculatorArithmetic;
    function Clear: IModelCalculatorArithmetic;
    function AddNumber(const AValue: Currency): IModelCalculatorArithmetic;
    function SetOperation(const AValue: TOperatorKind): IModelCalculatorArithmetic;
    procedure Execute;
    function &End: IModelCalculator;
  end;

  IModelCalculatorTax = interface
    ['{96258816-D65D-4E1C-9642-EA55DD5ACAF6}']
    function Base(const AValue: Currency): IModelCalculatorTax;
    function NotifyResult(AProc: TProc<string>): IModelCalculatorTax;
    function Execute: IModelCalculatorTax;
    function Return: Currency;
  end;

  IModelCalculatorTaxBuilder = interface
    ['{78651DA1-A348-4194-9BD8-6DC6064D88AA}']
    function TaxA: IModelCalculatorTax;
    function TaxB: IModelCalculatorTax;
    function TaxC: IModelCalculatorTax;
  end;

implementation

end.
