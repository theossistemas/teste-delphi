unit Model.Employee.Intf;

interface

uses
  System.Generics.Collections,
  Model.Dependent.Intf,
  Model.DAO.Intf;

type
  IModelEmployee = interface
    ['{04A4D53C-DC0D-4BC4-8A79-E075E554795C}']
    function Id(const AValue: string): IModelEmployee; overload;
    function Id: string; overload;
    function Name(const AValue: string): IModelEmployee; overload;
    function Name: string; overload;
    function CPF(const AValue: string): IModelEmployee; overload;
    function CPF: string; overload;
    function Salary(const AValue: Currency): IModelEmployee; overload;
    function Salary: Currency; overload;
    function AddDependent(const AValue: IDAO<IModelDependent>): IModelEmployee;
    function Dependents: TList<IDAO<IModelDependent>>;
    function GetIR: Currency;
    function GetINSS: Currency;
    function Clear: IModelEmployee;
    function &End: IDAO<IModelEmployee>;
  end;

  IModelEmployeeDependent = interface
    ['{E09358D3-D1CB-410A-ABE5-E830D67AEAB9}']
    function GetCountIR: Int32;
    function GetCountINSS: Int32;
  end;

implementation

end.
