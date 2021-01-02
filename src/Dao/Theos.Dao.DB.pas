unit Theos.Dao.DB;

interface

uses
  Data.DB, System.SysUtils, Vcl.Forms, System.Classes,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client,

  FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,

  Theos.Lib.Resource;

type
  TConexao = class
  private
    class var
      FInstance: TConexao;
  strict private
    type
      ECreateSingletonTConexao = class(Exception);
      EOpenTConexao = class(Exception);

    var
      FConexao: TFDConnection;

    constructor CreatePrivate;
    class function GetInstance: TConexao; static;
  public
    class property Instance: TConexao read GetInstance;
    constructor Create; reintroduce;
    destructor Destroy; override;
    property Conexao: TFDConnection read FConexao write FConexao;
    function CriaQuery(const SQL: string; Parametros: TParams = nil): TDataSet;
    function Open(var Erro: string): Boolean;
  end;

implementation

constructor TConexao.Create;
begin
  raise ECreateSingletonTConexao.CreateFmt(MENSAGEM_ERRO_CREATE_SINGLETON, [Self.ClassName]);
end;

constructor TConexao.CreatePrivate;
var
  Erro: string;
begin
  inherited Create;
  FConexao := TFDConnection.Create(nil);
  if not Open(Erro) then
    raise EOpenTConexao.Create(Erro);
end;

function TConexao.CriaQuery(const SQL: string; Parametros: TParams = nil): TDataSet;
begin
  Result := TFDQuery.Create(nil);
  TFDQuery(Result).Connection := FConexao;
  TFDQuery(Result).Close;
  TFDQuery(Result).SQL.Clear;

  var Where := String.Empty;
  if Assigned(Parametros) then
  begin
    for var I := 0 to Parametros.Count - 1 do
    begin
      var PrimeiraPalavra := ' AND ';
      if Where.IsEmpty then
        PrimeiraPalavra := ' WHERE ';
      Where := Where + PrimeiraPalavra + Parametros[i].Name + ' = :' + Parametros[i].Name;
    end;
  end;

  TFDQuery(Result).SQL.Text := SQL + Where;

  if Assigned(Parametros) then
  begin
    for var I := 0 to Parametros.Count - 1 do
      TFDQuery(Result).ParamByName(Parametros[i].Name).Value := Parametros[i].Value;
  end;

  TFDQuery(Result).Open;

  for var Field in TFDQuery(Result).Fields do
    Field.AutoGenerateValue := TAutoRefreshFlag.arDefault;
end;

destructor TConexao.Destroy;
begin
  FConexao.Free;
  inherited Destroy;
end;

class function TConexao.GetInstance: TConexao;
begin
  if not Assigned(FInstance) then
    FInstance := TConexao.CreatePrivate;
  Result := FInstance;
end;

function TConexao.Open(var Erro: string): Boolean;
begin
  try
    FConexao.Connected := False;
    FConexao.LoginPrompt := False;
    FConexao.Params.Clear;
    FConexao.Params.Add('Database=' + ExtractFileDir(Application.ExeName) +  '\DADOS.FDB');
    FConexao.Params.Add('User_Name=SYSDBA');
    FConexao.Params.Add('Password=masterkey');
    FConexao.Params.Add('Protocol=TCPIP');
    FConexao.Params.Add('Server=127.0.0.1');
    FConexao.Params.Add('Port=3050');
    FConexao.Params.Add('CharacterSet=WIN1252');
    FConexao.Params.Add('DriverID=FB');
    FConexao.UpdateOptions.CheckRequired := False;
    FConexao.Connected := True;
    Result := FConexao.Connected
  except
    on E: Exception do
    begin
      Result := False;
      Erro := E.Message;
    end;
  end;
end;

initialization

finalization
  if Assigned(TConexao.FInstance) then
    FreeAndNil(TConexao.FInstance);
end.
