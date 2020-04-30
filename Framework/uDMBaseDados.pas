unit uDMBaseDados;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Data.DBXInterBase, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TdmBaseDados = class(TDataModule)
    Conexao: TFDConnection;
    FDQuery: TFDQuery;
  private
    { Private declarations }
  public
    function Conectar: boolean;
    function Desconectar: boolean;
    function getDataSet(strQry: string): TDataSet;
    function execSql(strQry: string): boolean;
  end;

var
  dmBaseDados: TdmBaseDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TdmBaseDados.Conectar: boolean;
begin
  try
    Conexao.Connected := true;
    result := true;
  except
    result := false;
  end;
end;

function TdmBaseDados.Desconectar:boolean;
begin
  try
    Conexao.Connected := false;
    result := true;
  except
    result := false;
  end;
end;

function TdmBaseDados.getDataSet(strQry: string): TDataSet;
begin
  FDQuery.Close;
  FDQuery.Params.Clear;
  FDQuery.SQL.Text := strQry;
  FDQuery.Open;
  result := FDQuery;
end;

function TdmBaseDados.execSql(strQry: string): boolean;
Var
  msgErro:string;
begin
  result := false;
  FDQuery.Close;
  FDQuery.Params.Clear;
  FDQuery.SQL.Text := strQry;
  try
    FDQuery.ExecSQL;
    result := true;
  except
   on e: Exception do begin
     raise Exception.Create(e.Message)
   end;
  end;
end;

end.
