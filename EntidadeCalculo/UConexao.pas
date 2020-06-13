unit UConexao;

interface

uses FireDac.comp.client, System.SysUtils, FireDac.stan.def, FireDac.Phys.Intf,
  FireDac.Phys, FireDac.Phys.FB, FireDac.stan.async, FireDac.VCLUI.Wait,
  System.Classes, Data.DB, FireDac.stan.Param, FireDac.Dapt;

type
  TConexao = class
  const
    //PATH_DATABASE = '..\..\..\dados.fdb'; para teste unitario
    PATH_DATABASE = '..\..\dados.fdb';
  private
    FConexao: TFDConnection;
    FPhysDriverLink1: TFDPhysFBDriverLink;
    FErros: TStringList;

    procedure addErros(erro: String);

  public

    constructor Create();
    destructor Destroy(); override;

    class function Instance(): TConexao;
    function Execute(sql: string; params: TFDParams): integer;
    function GetGenId(generator: string): integer;
    function Get(sql: string; params: TFDParams): TDataSet; overload;
    function Get(sql: string): TDataSet; overload;
    function getErros(): String;

    function NewParams(const Fields: array of string;
      const Values: array of variant): TFDParams;

  end;

Var
  ConexaoSingle: TConexao;

implementation

{ TConexao }

procedure TConexao.addErros(erro: String);
begin
  FErros.Add(erro);
end;

constructor TConexao.Create;
begin
  FPhysDriverLink1 := TFDPhysFBDriverLink.Create(nil);
  FConexao := TFDConnection.Create(nil);
  FErros := TStringList.Create;

  FConexao.DriverName := 'FB';
  FConexao.LoginPrompt := false;
  FConexao.params.Database := PATH_DATABASE;
  FConexao.params.UserName := 'SYSDBA';
  FConexao.params.Password := 'masterkey';

end;

destructor TConexao.Destroy;
begin
  FreeAndNil(FConexao);
  FreeAndNil(FErros);
  FreeAndNil(FPhysDriverLink1);
end;

function TConexao.Execute(sql: string; params: TFDParams): integer;
var
  qry: TFDQuery;
begin
  qry := TFDQuery.Create(nil);
  qry.Connection := FConexao;
  qry.sql.Text := sql;
  qry.params := params;
  qry.ExecSQL;
  result := qry.RowsAffected;
  if assigned(params) then
    params.Free;
  if assigned(qry) then
    qry.Free;
end;


function TConexao.Get(sql: string): TDataSet;
begin
  result := Get(sql, TFDParams.Create);
end;

function TConexao.Get(sql: string; params: TFDParams): TDataSet;
var
  qry: TFDQuery;
begin
  qry := TFDQuery.Create(nil);
  qry.Connection := FConexao;
  qry.sql.Text := sql;
  qry.params := params;
  qry.Open();
  if assigned(params) then
    params.Free;
  result := qry;
end;

function TConexao.getErros: String;
begin
  result := FErros.GetText();
end;

function TConexao.GetGenId(generator: string): integer;
  var dataset: TDataset;
begin

  try
    dataset := get(format('select gen_id(%s, 1) as id from rdb$database', [generator]));
    result := dataset.FieldByName('id').AsInteger;
  finally
    dataset.Free;
  end;
end;

class function TConexao.Instance: TConexao;
begin
  if not Assigned(ConexaoSingle) then
    ConexaoSingle := TConexao.Create();
  result := ConexaoSingle;
end;

function TConexao.NewParams(const Fields: array of string;
  const Values: array of variant): TFDParams;
var
  params: TFDParams;
  countParam: integer;
begin
  params := TFDParams.Create;
  if length(fields) <> length(values) then
    raise Exception.Create('Quantidade de campos é diferente da quantidade de valores.');
  for countParam := 0 to length(Fields) - 1 do
  begin
    params.Add(Fields[countParam], Values[countParam] );
  end;
  result := params;
end;

initialization

finalization
  if assigned(conexaosingle) then
    ConexaoSingle.Free

end.





