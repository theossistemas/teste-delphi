unit Model.Employee;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Model.Employee.Intf,
  Model.DAO.Intf,
  Model.Dependent.Intf;

type
  TModelEmployee = class(TInterfacedObject, IModelEmployee)
  private
    [weak]
    FParent: IDAO<IModelEmployee>;
  private
    FId: string;
    FName: string;
    FCPF: string;
    FSalary: Currency;
    FDependents: TList<IDAO<IModelDependent>>;
  protected
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
  public
    constructor Create(AParent: IDAO<IModelEmployee>);
    destructor Destroy; override;
    class function New(AParent: IDAO<IModelEmployee>): IModelEmployee;
  end;

implementation

uses
  Utils.Global,
  Model.Calculation.INSS,
  Model.Calculation.IR;

{ TModelEmployee }

function TModelEmployee.&End: IDAO<IModelEmployee>;
begin
  Result := FParent;
end;

function TModelEmployee.GetINSS: Currency;
var
  lEmpDep: IModelEmployeeDependent;
begin
  Result := 0;
  if Supports(FParent, IModelEmployeeDependent, lEmpDep) then
    Result := TModelCalculationINSS.New
                .NumberOfDependents(lEmpDep.GetCountINSS)
                .EmployeeSalary(FSalary)
                .Execute;
end;

function TModelEmployee.GetIR: Currency;
var
  lEmpDep: IModelEmployeeDependent;
begin
  Result := 0;
  if Supports(FParent, IModelEmployeeDependent, lEmpDep) then
    Result := TModelCalculationIR.New
                .NumberOfDependents(lEmpDep.GetCountIR)
                .EmployeeSalary(FSalary)
                .Execute;
end;

constructor TModelEmployee.Create(AParent: IDAO<IModelEmployee>);
begin
  FParent := AParent;
  FDependents := TList<IDAO<IModelDependent>>.Create;
  Self.Clear;
end;

destructor TModelEmployee.Destroy;
begin
  FDependents.DisposeOf;

  inherited;
end;

class function TModelEmployee.New(AParent: IDAO<IModelEmployee>): IModelEmployee;
begin
  Result := Self.Create(AParent);
end;

function TModelEmployee.AddDependent(const AValue: IDAO<IModelDependent>): IModelEmployee;
begin
  Result := Self;
  if Assigned(AValue) then
    FDependents.Add(AValue);
end;

function TModelEmployee.Clear: IModelEmployee;
begin
  Result  := Self;
  FId     := EmptyStr;
  FName   := EmptyStr;
  FCPF    := EmptyStr;
  FSalary := 0;
  FDependents.Clear;
end;

function TModelEmployee.CPF(const AValue: string): IModelEmployee;
begin
  Result := Self;
  FCPF := AValue;
  if (not FCPF.Trim.IsEmpty) and (not TGlobalUtils.CPFIsValid(TGlobalUtils.OnlyNumber(FCPF))) then
    raise Exception.Create('CPF inválido.');
end;

function TModelEmployee.CPF: string;
begin
  Result := FCPF;
end;

function TModelEmployee.Id(const AValue: string): IModelEmployee;
begin
  Result := Self;
  FId := AValue;
end;

function TModelEmployee.Id: string;
begin
  Result := FId;
end;

function TModelEmployee.Dependents: TList<IDAO<IModelDependent>>;
begin
  Result := FDependents;
end;

function TModelEmployee.Name: string;
begin
  Result := FName;
end;

function TModelEmployee.Name(const AValue: string): IModelEmployee;
begin
  Result := Self;
  FName := AValue;
end;

function TModelEmployee.Salary(const AValue: Currency): IModelEmployee;
begin
  Result := Self;
  FSalary := AValue;
end;

function TModelEmployee.Salary: Currency;
begin
  Result := FSalary;
end;

end.
