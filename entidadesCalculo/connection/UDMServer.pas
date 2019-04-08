unit UDMServer;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Comp.UI, FireDAC.Phys.IBBase,
  Forms, Windows;

type
  TdmServer = class(TDataModule)
    FDConnection: TFDConnection;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDTransaction: TFDTransaction;
  private
    { Private declarations }
    function ConfigureConnection() : boolean;
  public
    { Public declarations }
    constructor Create(Sender : TComponent; AConnect : boolean = true); reintroduce;
    function CheckConnection() : boolean;

    function GetConnection<T:class>(AConnectionName: String = 'FDConnection'): T;

    procedure StartTransaction();
    procedure RollbackTransaction();
    procedure CommitTransaction();

    function GetDriverName() : string;
  end;

var
  dmServer: TdmServer;

implementation

uses
  Dialogs, Controller.Server.Connection;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmServer }

function TdmServer.CheckConnection: boolean;
begin
  if FDConnection.Connected then
    result := true
  else
    result := ConfigureConnection()
end;

procedure TdmServer.CommitTransaction();
begin
  if FDConnection.InTransaction then
    FDConnection.Commit();
end;

function TdmServer.ConfigureConnection: boolean;
var
  ctrl : TConnectionController;
  sMessage : string;
begin
  result := false;

  ctrl := TConnectionController.Create();
  try
    try
      FDConnection.Connected := false;

      if (not ctrl.TryConnect(FDConnection, FDPhysFBDriverLink, sMessage)) or (not FDConnection.Connected) then
        raise Exception.Create(sMessage);

      result := true;
    except
      on e : Exception do
      begin
        result := false;
        ShowMessage('FALHA na conexão... ' + #13#10 + sMessage);
      end;
    end;
  finally
    if Assigned(ctrl) then
      FreeAndNil(ctrl);
  end;
end;

constructor TdmServer.Create(Sender: TComponent; AConnect: boolean);
var
  sPath : string;
begin
  inherited Create(Sender);
  FDConnection.Connected := false;
  FDConnection.LoginPrompt := false;
  FDConnection.Params.MonitorBy := mbFlatFile;

  if AConnect then
  begin
    //--- checa conexao
    if not CheckConnection() then
    begin
      Application.Tag := -1;
      Application.Terminate;
      ExitProcess(0);
    end;
  end;

end;

function TdmServer.GetConnection<T>(AConnectionName: String): T;
var
  I: Integer;
begin
  result := nil;
  for I := 0 to dmServer.ComponentCount - 1 do
  begin
    if ( UpperCase(dmServer.Components[I].Name) = UpperCase(AConnectionName) ) then
    begin
      result := T( dmServer.Components[I] );
      break;
    end;
  end;
end;

function TdmServer.GetDriverName: string;
begin
    result := FDConnection.DriverName;
end;

procedure TdmServer.RollbackTransaction();
begin
  if FDConnection.InTransaction then
    FDConnection.Rollback();
end;

procedure TdmServer.StartTransaction();
begin
  if not FDConnection.InTransaction then
    FDConnection.StartTransaction();
end;

end.
