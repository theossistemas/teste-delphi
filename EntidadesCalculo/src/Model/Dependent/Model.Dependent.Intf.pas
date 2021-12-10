unit Model.Dependent.Intf;

interface

uses Model.DAO.Intf;

type
  IModelDependent = interface
    ['{1D20A610-E1A6-40B3-AAD0-BA9C1D241B9A}']
    function Id(const AValue: string): IModelDependent; overload;
    function Id: string; overload;
    function Name(const AValue: string): IModelDependent; overload;
    function Name: string; overload;
    function IsCalculateIR(const AValue: Boolean): IModelDependent; overload;
    function IsCalculateIR: Boolean; overload;
    function IsCalculateINSS(const AValue: Boolean): IModelDependent; overload;
    function IsCalculateINSS: Boolean; overload;
    function Clear: IModelDependent;
    function &End: IDAO<IModelDependent>;
  end;

implementation

end.
