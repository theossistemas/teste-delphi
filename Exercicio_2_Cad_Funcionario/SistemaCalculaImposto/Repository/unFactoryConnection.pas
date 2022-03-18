unit unFactoryConnection;

interface

uses
  Data.DB, System.SysUtils, unIDataBase;

type
  TFactoryConnection = class(TInterfacedObject, IFactoryConnection)
  private
    FConnection: IConnection;
    Constructor Create;
  public
    destructor Destroy; override;
    class function New: IFactoryConnection;

    function GetConnection: IConnection;
  end;

implementation

uses
  unFireDacConnection;

{ TFactoryConnection }

constructor TFactoryConnection.Create;
begin
  FConnection := TFireDacConnection.New;
end;

destructor TFactoryConnection.Destroy;
begin

  inherited;
end;

function TFactoryConnection.GetConnection: IConnection;
begin
  Result := FConnection;
end;

class function TFactoryConnection.New: IFactoryConnection;
begin
  Result := Self.Create;
end;

end.
