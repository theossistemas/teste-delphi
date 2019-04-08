unit Entities.Server.ParamConnection;

interface

type
  TParamConnection = class
    DriverID : string;
    HostName : string;
    Port     : integer;
    DataBase : string;
    UserName : string;
    Password : string;
    VendorLib : string;
  end;

implementation

end.
