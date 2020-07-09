unit uConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client;

type
  TConexao = class
  private
    FConn: TFDConnection;
    procedure ConfigurarConexao(CaminhoBanco : String);


  public
    constructor Create(CaminhoBanco : String);
    destructor Destroy; override;
     function CriarQuery: TFDQuery;
    function GetConn: TFDConnection;

  Const
    PATH_BANCO: string = 'C:\BancosDados\Firebird\BANCOEXERCICIO2.FDB';
  end;

implementation

{ TConexao }

procedure TConexao.ConfigurarConexao(CaminhoBanco : String);
begin
  FConn.Params.DriverID := 'FB';
  FConn.Params.Database := CaminhoBanco;
  FConn.Params.UserName := 'SYSDBA';
  FConn.Params.Password := '250388';
  FConn.LoginPrompt := False;
end;

constructor TConexao.Create(CaminhoBanco : String);
begin
  FConn := TFDConnection.Create(nil);

  Self.ConfigurarConexao(CaminhoBanco);
end;

function TConexao.CriarQuery: TFDQuery;
var
 VQuery : TFDQuery;
begin
 VQuery := TFDQuery.Create(nil);
 VQuery.Connection := FConn;

 Result := VQuery;
end;

destructor TConexao.Destroy;
begin
  FreeAndNil(FConn);
  inherited;
end;

function TConexao.GetConn: TFDConnection;
begin
  Result := FConn;
end;

end.
