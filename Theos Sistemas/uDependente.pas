unit uDependente;

interface

uses uPessoa;

resourcestring
  SIM = 'S';
  NAO = 'N';

type
  TDependente = class(TPessoa)
  private
    FIsCalculaINSS: Boolean;
    FIsCalculaIR: Boolean;
    FIDFuncionario: Integer;
    FIDDependente: Integer;

    function GetSQLInsert: String;
    function GetSQLUpdate: String;

    procedure SetIsCalculaINSS(const Value: Boolean);
    procedure SetIsCalculaIR(const Value: Boolean);
    procedure SetIDFuncionario(const Value: Integer);
    procedure SetIDDependente(const Value: Integer);
  public
    constructor Create;

    property IsCalculaIR: Boolean read FIsCalculaIR write SetIsCalculaIR;
    property IsCalculaINSS: Boolean read FIsCalculaINSS write SetIsCalculaINSS;
    property IDFuncionario: Integer read FIDFuncionario write SetIDFuncionario;
    property IDDependente: Integer read FIDDependente write SetIDDependente;

    procedure Salvar; override;
    procedure Apagar; override;
    procedure Atualizar; override;
  end;

implementation

uses
  FireDAC.Comp.Client, DataModulo, Vcl.Dialogs, System.UITypes, System.StrUtils,
  System.SysUtils, FireDAC.Stan.Param;

{ TDependente }

procedure TDependente.Apagar;
begin
  inherited;

  dm.qryDependente.Refresh;
end;

procedure TDependente.Atualizar;
var
  vQry: TFDQuery;
begin
  dm.FDConnection.StartTransaction;
  inherited;

  vQry            := TFDQuery.Create(nil);
  vQry.Connection := dm.FDConnection;
  try
    try
      vQry.SQL.Text                                := GetSQLUpdate;
      vQry.ParamByName('ID_DEPENDENTE').AsInteger  := FIDDependente;
      vQry.ParamByName('CALCULA_IR').AsString      := IfThen(IsCalculaIR, SIM, NAO);
      vQry.ParamByName('CALCULA_INSS').AsString    := IfThen(IsCalculaINSS, SIM, NAO);
      vQry.ExecSQL;

      dm.FDConnection.Commit;
    except on E: Exception do
      begin
        dm.FDConnection.Rollback;
        MessageDlg('Erro ao atualizar o Dependente.' + #13 + 'Erro original: ' + E.Message, mtError, [mbOK], 0);
        Abort;
      end;
    end;
  finally
    vQry.Free;
  end;

  dm.qryDependente.Cancel;
  dm.qryDependente.Refresh;
end;

constructor TDependente.Create;
begin
  inherited Create;

  FIsCalculaINSS := False;
  FIsCalculaIR   := False;
  FIDFuncionario := 0;
  FIDDependente  := 0;
end;

function TDependente.GetSQLInsert: String;
begin
  Result := 'INSERT INTO DEPENDENTE (ID, ID_PESSOA, ID_FUNCIONARIO, CALCULA_IR, CALCULA_INSS)                    ' +
            '     VALUES (GEN_ID(GEN_DEPENDENTE_ID, 1), :ID_PESSOA, :ID_FUNCIONARIO, :CALCULA_IR, :CALCULA_INSS) ';
end;

function TDependente.GetSQLUpdate: String;
begin
  Result := 'UPDATE DEPENDENTE SET CALCULA_IR = :CALCULA_IR, CALCULA_INSS = :CALCULA_INSS WHERE ID = :ID_DEPENDENTE';
end;

procedure TDependente.Salvar;
var
  vQry: TFDQuery;
begin
  dm.FDConnection.StartTransaction;
  inherited;

  vQry            := TFDQuery.Create(nil);
  vQry.Connection := dm.FDConnection;
  try
    try
      vQry.SQL.Text                                := GetSQLInsert;
      vQry.ParamByName('ID_PESSOA').AsInteger      := Self.GetIDPessoa;
      vQry.ParamByName('ID_FUNCIONARIO').AsInteger := FIDFuncionario;
      vQry.ParamByName('CALCULA_IR').AsString      := IfThen(IsCalculaIR, SIM, NAO);
      vQry.ParamByName('CALCULA_INSS').AsString    := IfThen(IsCalculaINSS, SIM, NAO);
      vQry.ExecSQL;

      dm.FDConnection.Commit;
    except on E: Exception do
      begin
        dm.FDConnection.Rollback;
        MessageDlg('Erro ao salvar o Dependente.' + #13 + 'Erro original: ' + E.Message, mtError, [mbOK], 0);
        Abort;
      end;
    end;
  finally
    vQry.Free;
  end;

  dm.qryDependente.Cancel;
  dm.qryDependente.Refresh;
  dm.qryDependente.Last;
end;

procedure TDependente.SetIDDependente(const Value: Integer);
begin
  FIDDependente := Value;
end;

procedure TDependente.SetIDFuncionario(const Value: Integer);
begin
  if Value = 0 then
  begin
    MessageDlg('Não há funcionário cadastrado.', mtWarning, [mbOK], 0);
    Abort;
  end;

  FIDFuncionario := Value;
end;

procedure TDependente.SetIsCalculaINSS(const Value: Boolean);
begin
  FIsCalculaINSS := Value;
end;

procedure TDependente.SetIsCalculaIR(const Value: Boolean);
begin
  FIsCalculaIR := Value;
end;

end.
