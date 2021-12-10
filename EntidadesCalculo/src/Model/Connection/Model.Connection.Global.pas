unit Model.Connection.Global;

interface

uses
  Model.DB.Intf;

type
  IModelConnection = Model.DB.Intf.IModelConnection;
  IModelStatement  = Model.DB.Intf.IModelStatement;

var
  GlobalConnection: IModelConnectionFactory;

implementation

uses
  Model.DB.Connection.FireDAC.Factory,
  Model.DB.Connection.FireDAC;

initialization
begin
  GlobalConnection := TModelConnectionFireDACFactory.Create(
    function: IModelConnection
    begin
      Result := TModelConnectionFireDAC.New;
      Result
        .AddParams('DriverID', 'FB')
        .AddParams('Database', 'D:\Developer\Theos\EntidadesCalculo\db\data.fdb')
        .AddParams('User_Name', 'SYSDBA')
        .AddParams('Password', 'masterkey')
        .AddParams('Port', '3050')
        .Connect;
    end);
end;

end.
