unit Model.DB.Connection.FireDAC;

interface

uses
  System.SysUtils,
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.VCLUI.Wait,
  FireDAC.Phys.FBDef,
  FireDAC.Phys.MSAccDef,
  FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSAcc,
  FireDAC.Phys.IBBase,
  FireDAC.Phys.FB,
  FireDAC.Comp.UI,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Model.DB.Intf;

type
  TFDConnection = FireDAC.Comp.Client.TFDConnection;

  TModelConnectionFireDAC = class(TInterfacedObject, IModelConnection)
  strict private
    procedure CheckAssigned;
    function IsAssigned: Boolean;
  private
    FConnection: TFDConnection;
    FOwner: Boolean;
  protected
    function AddParams(const AParamName: string; const AParamValue: string): IModelConnection; overload;
    function AddParams(const AParamName: string; const AParamValue: string; const AArgs: array of const): IModelConnection; overload;
    function Connect: IModelConnection;
    function Disconnect: IModelConnection;
    function Connected: Boolean;
    function Component: TCustomConnection;
    function CreateStatement: IModelStatement;
  public
    constructor Create(const AConnection: TFDConnection);
    destructor Destroy; override;
    class function New: IModelConnection; overload;
    class function New(const AConnection: TFDConnection): IModelConnection; overload;
  end;

implementation

uses
  Model.DB.Statement.FireDAC;

{ TModelConnectionFireDAC }

constructor TModelConnectionFireDAC.Create(const AConnection: TFDConnection);
begin
  FOwner := False;
  FConnection := AConnection;
  if FConnection = nil then
  begin
    FConnection := TFDConnection.Create(nil);
    FConnection.LoginPrompt := False;
    FConnection.Params.Clear;
    FOwner := True;
  end;
end;

function TModelConnectionFireDAC.CreateStatement: IModelStatement;
begin
  Result := TModelStatamentFireDAC.New(Self);
end;

destructor TModelConnectionFireDAC.Destroy;
begin
  Disconnect;
  if FOwner and IsAssigned then
    FreeAndNil(FConnection);

  inherited;
end;

class function TModelConnectionFireDAC.New(const AConnection: TFDConnection): IModelConnection;
begin
  Result := Self.Create(AConnection);
end;

class function TModelConnectionFireDAC.New: IModelConnection;
begin
  Result := Self.Create(nil);
end;

function TModelConnectionFireDAC.IsAssigned: Boolean;
begin
  Result := Assigned(FConnection);
end;

function TModelConnectionFireDAC.AddParams(const AParamName, AParamValue: string): IModelConnection;
begin
  Result := Self;
  FConnection.Params.AddPair(AParamName, AParamValue);
end;

function TModelConnectionFireDAC.AddParams(const AParamName, AParamValue: string;
  const AArgs: array of const): IModelConnection;
begin
  Result := Self.AddParams(AParamName, Format(AParamValue, AArgs));
end;

procedure TModelConnectionFireDAC.CheckAssigned;
begin
  if not IsAssigned then
    raise Exception.Create('Connection not defined.');
end;

function TModelConnectionFireDAC.Component: TCustomConnection;
begin
  Result := FConnection;
end;

function TModelConnectionFireDAC.Connect: IModelConnection;
begin
  Result := Self;
  CheckAssigned;
  if not FConnection.Connected then
    FConnection.Connected := True;
end;

function TModelConnectionFireDAC.Connected: Boolean;
begin
  Result := False;
  if IsAssigned then
    Result := FConnection.Connected;
end;

function TModelConnectionFireDAC.Disconnect: IModelConnection;
begin
  Result := Self;
  if IsAssigned and FConnection.Connected then
    FConnection.Connected := False;
end;

end.

