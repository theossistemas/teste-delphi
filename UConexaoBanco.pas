unit UConexaoBanco;

interface

uses
  SqlExpr, iniFiles, SysUtils, Forms, Dialogs;

type

TConexaoBanco = class
private
  { private declarations }
  FConexaoBanco : TSQLConnection;
protected
  { protected declarations }
public
  { public declarations }
  Constructor Create;
  Destructor Destroy; override;
  function GetConexao : TSQLConnection;
  property ConexaoBanco : TSQLConnection read GetConexao;
published
  { published declarations }
end;

implementation

{ TConexaoBanco }

constructor TConexaoBanco.Create;
var
  arquivoini, hostname, database, drivername, username, password : String;
  localserver : Integer;
  configuracoes : Tinifile;
begin

  arquivoini := extractfilepath(application.exename) + 'config.ini';

  if not fileexists(arquivoini) then begin
    configuracoes := TIniFile.Create(arquivoini);
    configuracoes.WriteString('dados', 'Hostname', 'aqui o ip');
    configuracoes.WriteString('dados', 'DataBase', 'aqui o nome do banco de dados');
    configuracoes.WriteString('dados', 'DriverName', 'MSSQL');
    configuracoes.WriteString('dados', 'UserName', 'aqui o usuário');
    configuracoes.WriteString('dados', 'Password', 'aqui a senha');
    configuracoes.free;
  end;

  // conexao com o mssql
  FConexaoBanco := TSQLConnection.Create(Application);
  FConexaoBanco.Connected := False;
  FConexaoBanco.ConnectionName := 'PROVATHEOS';
  FConexaoBanco.Params.Clear;
  FConexaoBanco.LoadParamsFromIniFile(arquivoini);
  FConexaoBanco.KeepConnection := False;
  FConexaoBanco.DriverName := 'MSSQL';
  FConexaoBanco.LibraryName := 'dbxmss.dll';
  FConexaoBanco.VendorLib := 'sqlncli.dll';
  FConexaoBanco.GetDriverFunc := 'getSQLDriverMSSQL';
  FConexaoBanco.LoginPrompt := False;
  FConexaoBanco.Connected := True;

end;

destructor TConexaoBanco.Destroy;
begin
  FreeAndNil( FConexaoBanco );
  inherited;
end;

function TConexaoBanco.GetConexao: TSQLConnection;
begin

  Result := FConexaoBanco;

end;


end.
