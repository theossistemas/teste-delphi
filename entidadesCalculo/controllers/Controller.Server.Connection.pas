unit Controller.Server.Connection;

interface

uses FireDAC.Comp.Client, Entities.Server.ParamConnection,
  FireDAC.Phys;

type
  TConnectionController = class
    function TryConnect(AConnection : TFDConnection; ADriver : TFDPhysDriverLink; AParamConnection : TParamConnection; var AMessage : string; AShowFormDialog : boolean = false) : boolean; overload;
    function TryConnect(AConnection : TFDConnection; ADriver : TFDPhysDriverLink;var AMessage : string) : boolean; overload;

    function SaveParamConnection(AParamConnection : TParamConnection; var AMessage : string; AFile : string = '') : boolean;
    function LoadParamConnection(AParamConnection : TParamConnection; var AMessage : string; AFile : string = '') : boolean;

    function ShowFormDialogConnection(AConnection : TFDConnection; ADriver : TFDPhysDriverLink; AParamConnection : TParamConnection) : boolean;

  end;

implementation

{ TConnectionController }

uses
  SysUtils, IniFiles, IOUtils,
  FireDAC.Stan.Error,
  System.UITypes, UFConnectDialog, Constante.Connection;

function TConnectionController.LoadParamConnection(
  AParamConnection: TParamConnection; var AMessage: string;
  AFile: string): boolean;
var
  ini : TIniFile;
begin
  result := false;
  try
    if AFile = EmptyStr then
    begin
      //AFile := gsAppPath + 'config';
      AFile := ExtractFilePath(ParamStr(0)) + 'config';

      if not DirectoryExists(AFile) then
        ForceDirectories(AFile);

      AFile := TPath.Combine( AFile, _CONNECTION_INI );
    end;

    ini := TIniFile.Create(AFile);
    try
      AParamConnection.DriverID := ini.ReadString( _SESSION_CONNECTION_DB, 'DriverID', 'FB' );
      AParamConnection.HostName := ini.ReadString( _SESSION_CONNECTION_DB, 'HostName', 'localhost' );
      AParamConnection.Port     := StrToIntDef(ini.ReadString( _SESSION_CONNECTION_DB, 'Port', _DB_PORT ), StrToInt(_DB_PORT));
      AParamConnection.DataBase := ini.ReadString( _SESSION_CONNECTION_DB, 'DataBase', _DB_DEFAULT );
      AParamConnection.UserName := ini.ReadString( _SESSION_CONNECTION_DB, 'UserName', _USER_DEFAULT_DB );
      AParamConnection.Password := ini.ReadString( _SESSION_CONNECTION_DB, 'Password', _PASS_DEFAULT_DB) ;
      AParamConnection.VendorLib:= ini.ReadString( _SESSION_CONNECTION_DB, 'VendorLib', EmptyStr ) ;

      result := true;
    finally
      FreeAndNil(ini);
    end;

  except
    on e : Exception do
    begin
      result := false;
      AMessage := e.Message;
    end;
  end;
end;

function TConnectionController.SaveParamConnection(
  AParamConnection: TParamConnection; var AMessage: string;
  AFile: string): boolean;
var
  ini : TIniFile;
begin
  result := false;
  try
    if AFile = EmptyStr then
    begin
      //AFile := gsAppPath + 'config';
      AFile := ExtractFilePath(ParamStr(0))+ 'config';
      if not DirectoryExists(AFile) then
        ForceDirectories(AFile);

      AFile := TPath.Combine( AFile, _CONNECTION_INI );
    end;

    ini := TIniFile.Create(AFile);
    try
      ini.WriteString( _SESSION_CONNECTION_DB, 'DriverID', AParamConnection.DriverID );
      ini.WriteString( _SESSION_CONNECTION_DB, 'HostName', AParamConnection.HostName );
      ini.WriteString( _SESSION_CONNECTION_DB, 'Port',     AParamConnection.Port.ToString() );
      ini.WriteString( _SESSION_CONNECTION_DB, 'DataBase', AParamConnection.DataBase );
      ini.WriteString( _SESSION_CONNECTION_DB, 'UserName', AParamConnection.UserName );
      ini.WriteString( _SESSION_CONNECTION_DB, 'Password', AParamConnection.Password );
      ini.WriteString( _SESSION_CONNECTION_DB, 'VendorLib', AParamConnection.VendorLib );

      result := true;
    finally
      FreeAndNil(ini);
    end;

  except
    on e : Exception do
    begin
      result := false;
      AMessage := e.Message;
    end;
  end;
end;

function TConnectionController.ShowFormDialogConnection(
  AConnection: TFDConnection; ADriver : TFDPhysDriverLink; AParamConnection: TParamConnection): boolean;
var
  frm : TfrmConnectDialog;
begin
  frm := nil;
  result := false;

  frm := TfrmConnectDialog.Create(nil);
  frm.FDConnection     := AConnection;
  frm.FDPhysDriverLink := ADriver;
  frm.ParamConnection  := AParamConnection;
  try
    frm.BringToFront();
    result := frm.ShowModal() = mrOk;
  finally
    if Assigned(frm) then
      FreeAndNil(frm);
  end;
end;

function TConnectionController.TryConnect(AConnection: TFDConnection; ADriver : TFDPhysDriverLink;
  var AMessage: string): boolean;
var
  param : TParamConnection;
begin
  param := TParamConnection.Create();
  try
    try
      //--- carrega parametros
      if not LoadParamConnection( param, AMessage ) then
        raise Exception.Create('FALHA ao ler arquivo de parâmetros de Conexão: ' + AMessage);

      //--- tena conexao
      result := TryConnect(AConnection, ADriver, param, AMessage, true);
    except
      on e : Exception do
      begin
        result := false;
        AMessage := e.Message;
      end;
    end;
  finally
    if Assigned(param) then
      FreeAndNil(param);
  end;
end;

function TConnectionController.TryConnect(AConnection: TFDConnection; ADriver : TFDPhysDriverLink;
  AParamConnection: TParamConnection; var AMessage: string; AShowFormDialog : boolean = false): boolean;
begin
  result := false;
  try
    try
      //--- efetua configuracao do componente de conexao
      AConnection.Connected := false;
      AConnection.LoginPrompt := false;

      if Assigned(ADriver) then
        ADriver.VendorLib := AParamConnection.VendorLib;

      with AConnection.Params do
      begin
        Clear();

        Add('DriverID='  + AParamConnection.DriverID);
        Add('Server='    + AParamConnection.HostName);
        Add('Port='      + AParamConnection.Port.ToString());
        Add('DataBase='  + AParamConnection.DataBase);
        Add('User_Name=' + AParamConnection.UserName);
        Add('Password='  + AParamConnection.Password);
      end;

      //--- efetua conexao
      AConnection.Connected := true;
    except
      on E: EFDDBEngineException do

        case E.Kind of
          ekUserPwdInvalid  : raise Exception.Create('Usuário ou Senha Inválidos'); // user name or password are incorrect
          ekUserPwdExpired  : raise Exception.Create('Senha expirada'); // user password is expired
          ekServerGone      : raise Exception.Create('Servidor inacessível no momento'); // DBMS is not accessible due to some reason
//            ekObjNotExists    : ;
//            ekOther           : raise;
//            ekNoDataFound     : raise;
//            ekTooManyRows     : raise;
//            ekRecordLocked    : raise;
//            ekUKViolated      : raise;
//            ekFKViolated      : raise;
//            ekCmdAborted      : raise;
//            ekServerOutput    : raise;
//            ekArrExecMalfunc  : raise;
//            ekInvalidParams   : raise;
          else
          begin
            raise;           // other issues
          end;

        end;
    end;

    result := true
  except
    on e : Exception do
    begin
      result := false;
      AMessage := e.Message;
      AConnection.Connected := false;
    end;
  end;

  //--- abre form de conexao
  if (not result) and (AShowFormDialog) then
    result := ShowFormDialogConnection(AConnection, ADriver, AParamConnection);
end;

end.
