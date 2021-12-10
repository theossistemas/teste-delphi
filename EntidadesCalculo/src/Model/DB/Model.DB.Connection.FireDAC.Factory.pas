unit Model.DB.Connection.FireDAC.Factory;

interface

uses
  System.SysUtils,
  Model.DB.Intf;

type
  TModelConnectionFireDACFactory = class(TInterfacedObject, IModelConnectionFactory)
  private
    FCreateProc: TFunc<IModelConnection>;
  protected
    function CreateConnection: IModelConnection;
  public
    constructor Create(ACreateProc: TFunc<IModelConnection>);
  end;

implementation

{ TModelConnectionFireDACFactory }

constructor TModelConnectionFireDACFactory.Create(ACreateProc: TFunc<IModelConnection>);
begin
  FCreateProc := ACreateProc;
end;

function TModelConnectionFireDACFactory.CreateConnection: IModelConnection;
begin
  Result := FCreateProc;
end;

end.
