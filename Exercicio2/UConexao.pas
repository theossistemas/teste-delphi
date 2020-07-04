unit UConexao;

interface

uses FireDAC.Stan.Intf, Vcl.Forms, FireDAC.Stan.Option, FireDAC.Stan.Error,
     FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.VCLUI.Wait,
     FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.DB, FireDAC.Comp.Client,
     FireDAC.Phys.FB, System.SysUtils, FireDAC.DApt;

type classConexao = class
     private
           FConn: TFDConnection;
     public
          function CriarQuery: TFDQuery;

          constructor Create;
          destructor Destroy; override;
end;
implementation

function classConexao.CriarQuery: TFDQuery;
var
   Query: TFDQuery;
begin
     Query := TFDQuery.Create(nil);
     Query.Connection := FConn;

     Result := Query;
end;

constructor classConexao.Create;
begin
  inherited;
     try
       FConn := TFDConnection.Create(nil);
       FConn.Params.DriverID := 'FB';
       FConn.Params.Database := ExtractFilePath(Application.ExeName) + 'arquivos\DB.FDB';
       FConn.Params.UserName := 'SYSDBA';
       FConn.Params.Password := 'masterkey';
       FConn.Open;
     except
           Raise exception.Create('Não foi possível criar a conexão com o banco de dados.');
     end;
end;

destructor classConexao.Destroy;
begin
     FConn.Close;
     FConn.Free;
  inherited;
end;

end.
