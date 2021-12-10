unit Controller.Entities;

interface

uses
  Controller.Intf,
  Model.DAO.Intf,
  Model.Employee.Intf,
  Model.Dependent.Intf;

type
  TControllerEntities = class(TInterfacedObject, IControllerEntities)
  private
    [weak]
    FParent: IController;
  private
    FEmployee: IDAO<IModelEmployee>;
  protected
    function Employee: IDAO<IModelEmployee>;
    function Dependent: IDAO<IModelDependent>;
    function &End: IController;
  public
    constructor Create(AParent: IController);
    destructor Destroy; override;
    class function New(AParent: IController): IControllerEntities;
  end;

implementation

uses
  Model.Employee.DAO,
  Model.Dependent.DAO;

{ TControllerEntities }

constructor TControllerEntities.Create(AParent: IController);
begin
  FParent := AParent;
end;

destructor TControllerEntities.Destroy;
begin

  inherited;
end;

class function TControllerEntities.New(AParent: IController): IControllerEntities;
begin
  Result := Self.Create(AParent);
end;

function TControllerEntities.Employee: IDAO<IModelEmployee>;
begin
  if not Assigned(FEmployee) then
    FEmployee := TModelEmployeeDAO.New;
  Result := FEmployee;
end;

function TControllerEntities.&End: IController;
begin
  Result := FParent;
end;

function TControllerEntities.Dependent: IDAO<IModelDependent>;
begin
  Result := TModelDependentDAO.New;
end;

end.
