unit unFactoryQuery;

interface

uses
  Data.DB, System.SysUtils, unIDatabase;

type
  TFactoryQuery = class(TInterfacedObject, IFactoryQuery)
  private
    constructor Create;
  public
    destructor Destroy; override;
    class function New: IFactoryQuery;

    function Query: IQuery;
  end;

implementation

uses
  unFireDacQuery;

{ TFactoryQuery }

constructor TFactoryQuery.Create;
begin

end;

destructor TFactoryQuery.Destroy;
begin

  inherited;
end;

class function TFactoryQuery.New: IFactoryQuery;
begin
  Result := Self.Create;
end;

function TFactoryQuery.Query: IQuery;
begin
  Result := TFireDacQuery.New;  //Alterar a chamada aqui
end;

end.
