unit uDmDependente;

interface

uses
  System.SysUtils, System.Classes, uDmConexao, Data.FMTBcd, Data.DB,
  Data.SqlExpr, uDependente;

type
  TDmDependente = class(TDataModule)
    SQLInserir: TSQLDataSet;
    SQLAtualizar: TSQLDataSet;
    SQLExcluir: TSQLDataSet;
  private
    { Private declarations }
  public
    function GetIDNovoDependente: Integer;
    function Inserir(oDependente: TDependente; out sErro: String): Boolean;
    function Excluir(iID: Integer; sErro: String): Boolean;
  end;

var
  DmDependente: TDmDependente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmDependente }

function TDmDependente.Excluir(iID: Integer; sErro: String): Boolean;
begin
  with SQLExcluir do begin
    ParamByName('ID').AsInteger := iID;

    try
      ExecSQL;
      Result := True;
    except on E:Exception do
      begin
        sErro := 'Erro ao tentar excluir dependente!' + sLineBreak + E.Message;
        Result := False;
      end;
    end;
  end;
end;

function TDmDependente.GetIDNovoDependente: Integer;
var
  sqlDependente: TSQLDataset;
begin
  sqlDependente := TSQLDataset.Create(nil);
  try
    sqlDependente.SQLConnection := DmConexao.SQLConexao;
    sqlDependente.CommandText := 'SELECT GEN_ID(GEN_ID_DEPENDENTE, 1) AS ID FROM RDB$DATABASE';
    sqlDependente.Open;

    Result := sqlDependente.FieldByName('ID').AsInteger;
  finally
    FreeAndNil(sqlDependente);
  end;
end;

function TDmDependente.Inserir(oDependente: TDependente; out sErro: String): Boolean;
begin
  with SQLInserir do begin
    ParamByName('ID').AsInteger := oDependente.ID;
    ParamByName('NOME').AsString := oDependente.Nome;
    if oDependente.IsCalculaINSS then begin
      ParamByName('CALCULAINSS').AsString := 'T';
    end else begin
      ParamByName('CALCULAINSS').AsString := 'F';
    end;
    if oDependente.IsCalculaIR then begin
      ParamByName('CALCULAIR').AsString := 'T';
    end else begin
      ParamByName('CALCULAIR').AsString := 'F';
    end;
    try
      ExecSQL;
      Result := True;
    except on E:Exception do
      begin
        sErro := 'Erro ao tentar inserir dependente!' + sLineBreak + E.Message;
        Result := False;
      end;
    end;
  end;
end;

end.
