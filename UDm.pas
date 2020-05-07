unit UDm;

interface

uses
  System.SysUtils, System.Classes, Data.DBXFirebird, Data.DB, Data.SqlExpr,
  Data.FMTBcd;

type
  TFrmDM = class(TDataModule)
    SQLConn: TSQLConnection;
    sqlQuery: TSQLQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure limpaQuery;
  end;

var
  FrmDM: TFrmDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TFrmDM }

procedure TFrmDM.limpaQuery;
begin
  sqlQuery.Close;
  sqlQuery.SQL.Clear;
  sqlQuery.Params.Clear;
end;

end.
