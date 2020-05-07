unit UDados;

interface

uses
  Data.SqlExpr, System.Rtti, System.SysUtils;

Type

  TDados = class
  protected
    Destructor Destroy; override;
  public
    FSqlQry  : TSqlQuery;
    constructor Create;
  end;

implementation

uses
  UDm, UPrincipal;

{ TDados }

constructor TDados.Create;
begin
  FrmDM := TFrmDM.Create(FrmMenu);
  FrmDM.sqlConn.Connected := True;
end;

destructor TDados.Destroy;
begin
  FrmDM.sqlConn.Connected := False;
  FrmDM.Free;
  inherited;
end;



end.
