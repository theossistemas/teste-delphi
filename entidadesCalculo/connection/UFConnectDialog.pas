unit UFConnectDialog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Comp.Client, Entities.Server.ParamConnection,
  Controller.Server.Connection, Vcl.Buttons, FireDAC.Phys;

type
  TfrmConnectDialog = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ActionList: TActionList;
    actTestar: TAction;
    actConfirmar: TAction;
    actCancelar: TAction;
    imgAnyDAC: TImage;
    Label1: TLabel;
    edtHostName: TEdit;
    Label2: TLabel;
    edtDataBase: TEdit;
    Label3: TLabel;
    edtUserName: TEdit;
    Label4: TLabel;
    edtPassword: TEdit;
    Label5: TLabel;
    edtPort: TEdit;
    Label6: TLabel;
    edtResult: TMemo;
    Label7: TLabel;
    cmbDriver: TComboBox;
    Label8: TLabel;
    Label9: TLabel;
    OpenDialog: TOpenDialog;
    btnVendorLib: TSpeedButton;
    edtVendorLib: TEdit;
    btnFileName: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actConfirmarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actTestarExecute(Sender: TObject);
    procedure cmbDriverChange(Sender: TObject);
    procedure btnVendorLibClick(Sender: TObject);
    procedure btnFileNameClick(Sender: TObject);
  private
    FConnectionCtrl : TConnectionController;
    FFDConnection: TFDConnection;
    FParamConnection: TParamConnection;
    FFDPhysDriverLink: TFDPhysDriverLink;
    { Private declarations }
    procedure SetEditsFromParam();
    procedure SetParamFromEdits();
  public
    { Public declarations }

  published
    property FDConnection    : TFDConnection      read FFDConnection      write FFDConnection;
    property FDPhysDriverLink    : TFDPhysDriverLink      read FFDPhysDriverLink      write FFDPhysDriverLink;
    property ParamConnection : TParamConnection   read FParamConnection   write FParamConnection;
  end;

var
  frmConnectDialog: TfrmConnectDialog;

implementation

{$R *.dfm}

procedure TfrmConnectDialog.actCancelarExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmConnectDialog.actConfirmarExecute(Sender: TObject);
var
  sMessage : string;
begin
  if not FConnectionCtrl.SaveParamConnection( FParamConnection, sMessage ) then
    ShowMessage('FALHA ao gravar o arquivo com os parâmetros de Conexão... ' + #13#10+ sMessage);

  ModalResult := mrOk;
end;

procedure TfrmConnectDialog.actTestarExecute(Sender: TObject);
var
  sMessage : string;
begin
  actConfirmar.Enabled := false;
  //--- seta classe param
  SetParamFromEdits();

  //--- tenta conexao
  if FConnectionCtrl.TryConnect(FFDConnection, FDPhysDriverLink, FParamConnection, sMessage, false) then
  begin
    edtResult.Lines.Add('Conexão realizada com SUCESSO!' );
    actConfirmar.Enabled := true;
  end
  else
    edtResult.Lines.Add('FALHA na conexão: ' + sMessage );
end;

procedure TfrmConnectDialog.btnFileNameClick(Sender: TObject);
begin
  OpenDialog.DefaultExt := '*.fdb';
  OpenDialog.Filter := 'fdb|*.fdb';

  if (edtVendorLib.Enabled) and (OpenDialog.Execute(Handle)) then
    edtDataBase.Text := OpenDialog.FileName;
end;

procedure TfrmConnectDialog.btnVendorLibClick(Sender: TObject);
begin
  OpenDialog.DefaultExt := '*.dll';
  OpenDialog.Filter := 'DLL|*.dll';

  if (edtVendorLib.Enabled) and (OpenDialog.Execute(Handle)) then
    edtVendorLib.Text := OpenDialog.FileName;
end;

procedure TfrmConnectDialog.cmbDriverChange(Sender: TObject);
var
  bEnableHost : boolean;
begin
  bEnableHost := not (cmbDriver.ItemIndex in [1]);

  edtHostName.Enabled   := bEnableHost;
  edtPort.Enabled       := bEnableHost;
//  edtVendorLib.Enabled  := not bEnableHost;

  if bEnableHost then
    edtVendorLib.Clear()
  else
  begin
    edtHostName.Clear();
    edtPort.Clear();
  end;
end;

procedure TfrmConnectDialog.FormCreate(Sender: TObject);
begin
  FConnectionCtrl := TConnectionController.Create();
  actConfirmar.Enabled := false;
end;

procedure TfrmConnectDialog.FormDestroy(Sender: TObject);
begin
  FreeAndNil( FConnectionCtrl );
end;

procedure TfrmConnectDialog.FormShow(Sender: TObject);
begin
  cmbDriver.ItemIndex := 0;

  SetEditsFromParam();
  if edtHostName.CanFocus then
    edtHostName.SetFocus();
end;

procedure TfrmConnectDialog.SetEditsFromParam;
begin
  if FParamConnection.DriverID = 'FB' then
    cmbDriver.ItemIndex := 0;

  cmbDriver.OnChange(cmbDriver);

  edtHostName.Text  := FParamConnection.HostName;

  if FParamConnection.Port > 0 then
    edtPort.Text      := FParamConnection.Port.ToString();

  edtDataBase.Text  := FParamConnection.DataBase;
  edtUserName.Text  := FParamConnection.UserName;
  edtPassword.Text  := FParamConnection.Password;
  edtVendorLib.Text := FParamConnection.VendorLib;

  edtResult.Clear();

  if FFDConnection.Connected then
    edtResult.Lines.Add( 'Conectado...'  );
end;

procedure TfrmConnectDialog.SetParamFromEdits;
begin
  case cmbDriver.ItemIndex of
    0 : FParamConnection.DriverID := 'FB';
  end;

  if edtHostName.Enabled then
    FParamConnection.HostName := edtHostName.Text
  else
    FParamConnection.HostName := EmptyStr;

  if edtPort.Enabled then
    FParamConnection.Port     := StrToInt(edtPort.Text)
  else
    FParamConnection.Port := 0;

  FParamConnection.DataBase := edtDataBase.Text;
  FParamConnection.UserName := edtUserName.Text;
  FParamConnection.Password := edtPassword.Text;
  FParamConnection.VendorLib := edtVendorLib.Text;
end;

end.
