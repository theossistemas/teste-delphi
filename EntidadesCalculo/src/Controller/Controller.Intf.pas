unit Controller.Intf;

interface

uses
  Model.DAO.Intf,
  Model.Employee.Intf,
  Model.Dependent.Intf;

type
  IControllerEntities = interface;

  IController = interface
    ['{034E5FEE-BA36-45E2-A30D-8BA32EFD1EC2}']
    function Entities: IControllerEntities;
  end;

  IControllerEntities = interface
    ['{B8A76891-913A-4050-9B4F-1DC694DFFD60}']
    function Employee: IDAO<IModelEmployee>;
    function Dependent: IDAO<IModelDependent>;
  end;

implementation

end.
