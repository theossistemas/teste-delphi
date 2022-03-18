unit unFireDacConnection;

interface

uses
  unIDataBase, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Phys.FB;

type
  TFireDacConnection = class(TInterfacedObject, IConnection)
  private
    FDConnection: TFDConnection;
    class var FIntancia: TFireDacConnection;

    constructor Create;
  public
    destructor Destroy; override;
    class function New: IConnection;
    function GetConnection: TCustomConnection;

    function StartTransaction: IConnection;
    function Commit: IConnection;
    Function RollBack: IConnection;

  end;

implementation

uses
  System.SysUtils, Vcl.Forms, Winapi.Windows, unMyLibrary;

{ TFireDacConnection }

function TFireDacConnection.Commit: IConnection;
begin
  Result := Self;
  FDConnection.Commit;
end;

constructor TFireDacConnection.Create;
var
  vArquivoDeConfiguracao : string;
begin
  if not Assigned(FDConnection) then
  begin
    try
      vArquivoDeConfiguracao := ExtractFilePath(Application.ExeName) + ChangeFileExt(ExtractFileName(Application.ExeName), '.ini');

      FDConnection := TFDConnection.Create(nil);
      FDConnection.Params.Add('Database= ' + TMyLibrary.GetValorIni(vArquivoDeConfiguracao, 'CONFIGURACAO', 'LOCAL_DB'));
      FDConnection.Params.Add('User_Name=' + TMyLibrary.GetValorIni(vArquivoDeConfiguracao, 'CONFIGURACAO', 'USER_NAME'));
      FDConnection.Params.Add('Password='  + TMyLibrary.GetValorIni(vArquivoDeConfiguracao, 'CONFIGURACAO', 'PASSWORD'));
      FDConnection.Params.Add('Server='    + TMyLibrary.GetValorIni(vArquivoDeConfiguracao, 'CONFIGURACAO', 'SERVER'));
      FDConnection.Params.Add('Port='      + TMyLibrary.GetValorIni(vArquivoDeConfiguracao, 'CONFIGURACAO', 'PORT'));
      FDConnection.Params.Add('DriverID='  + TMyLibrary.GetValorIni(vArquivoDeConfiguracao, 'CONFIGURACAO', 'DRIVER_ID'));

      FDConnection.Connected := True;
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao tentar conectar no banco de dados! ' +
          #13#10 + 'Erro: ' + E.Message);
      end;
    end;

  end;
end;

destructor TFireDacConnection.Destroy;
begin
  if FDConnection.Connected then
    FDConnection.Connected := False;
  if Assigned(FDConnection) then
    FDConnection.DisposeOf;

  inherited;
end;

function TFireDacConnection.GetConnection: TCustomConnection;
begin
  Result := FDConnection;
end;

class function TFireDacConnection.New: IConnection;
begin
  if not Assigned(Self.FIntancia) then
    Self.FIntancia := Self.Create;

  Result := Self.FIntancia;
end;

function TFireDacConnection.RollBack: IConnection;
begin
  Result := Self;
  FDConnection.RollBack;
end;

function TFireDacConnection.StartTransaction: IConnection;
begin
  Result := Self;
  FDConnection.StartTransaction;
end;

end.
