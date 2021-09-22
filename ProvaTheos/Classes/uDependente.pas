unit uDependente;

interface

uses uPessoa;


type
  TDependente = class(TPessoa)
  private
    FIDFuncionario: Integer;
    FIDDependente: Integer;
    FIsCalculaIR: Boolean;
    FIsCalculaINSS: Boolean;

    function GetSQLInsert: String;
    function GetSQLUpdate: String;

    procedure SetIDFuncionario(const Value: Integer);
    procedure SetIDDependente(const Value: Integer);
    procedure SetIsCalculaINSS(const Value: Boolean);
    procedure SetIsCalculaIR(const Value: Boolean);
  public
    constructor Create;

    property IDFuncionario: Integer    read FIDFuncionario write SetIDFuncionario;
    property IDDependente : Integer    read FIDDependente  write SetIDDependente;
    property IsCalculaIR  : Boolean    read FIsCalculaIR   write SetIsCalculaIR;
    property IsCalculaINSS: Boolean    read FIsCalculaINSS write SetIsCalculaINSS;

    procedure Save; override;
    procedure Delete; override;
    procedure Update; override;
  end;

implementation

uses
  FireDAC.Comp.Client, DataModule, Vcl.Dialogs, System.UITypes, System.StrUtils,
  System.SysUtils, FireDAC.Stan.Param;

  const
    SIM = 'S';
    NAO = 'N';
{ TDependente }

procedure TDependente.Delete;
begin
  inherited;

  dm.qryDependente.Refresh;
end;

procedure TDependente.Update;
var
  vQry: TFDQuery;
begin
  dm.FDConnection.StartTransaction;
  inherited;

  vQry            := TFDQuery.Create(nil);
  vQry.Connection := dm.FDConnection;
  try
    try
      vQry.SQL.Text                               := GetSQLUpdate;
      vQry.ParamByName('IDDEPENDENTE').AsInteger  := FIDDependente;
      vQry.ParamByName('CALCULAIR').AsString      := IfThen(IsCalculaIR, SIM, NAO);
      vQry.ParamByName('CALCULAINSS').AsString    := IfThen(IsCalculaINSS, SIM, NAO);
      vQry.ExecSQL;

      dm.FDConnection.Commit;
    except on E: Exception do
      begin
        dm.FDConnection.Rollback;
        MessageDlg('Erro ao atualizar o Dependente.' + E.Message, mtError, [mbOK], 0);
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

  FIsCalculaIR     := False;
  FIsCalculaINSS   := False;
  FIDFuncionario   := 0;
  FIDDependente    := 0;
end;

function TDependente.GetSQLInsert: String;
begin
  Result := 'INSERT INTO DEPENDENTE (IDDEPENDENTE, IDPESSOA, IDFUNCIONARIO, CALCULAIR, CALCULAINSS)                    ' +
            '     VALUES (GEN_ID(GEN_DEPENDENTE_ID, 1), :IDPESSOA, :IDFUNCIONARIO, :CALCULAIR, :CALCULAINSS) ';
end;

function TDependente.GetSQLUpdate: String;
begin
  Result := ' UPDATE DEPENDENTE                      ' +
            '    SET CALCULAIR    = :CALCULAIR,      ' +
            '        CALCULAINSS  = :CALCULAINSS     ' +
            '  WHERE IDDEPENDENTE = :IDDEPENDENTE    ' ;
end;

procedure TDependente.Save;
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
      vQry.ParamByName('IDPESSOA').AsInteger       := Self.GetIDPessoa;
      vQry.ParamByName('IDFUNCIONARIO').AsInteger  := FIDFuncionario;
      vQry.ParamByName('CALCULAIR').AsString      := IfThen(IsCalculaIR, SIM, NAO);
      vQry.ParamByName('CALCULAINSS').AsString    := IfThen(IsCalculaINSS, SIM, NAO);
      vQry.ExecSQL;

      dm.FDConnection.Commit;
    except on E: Exception do
      begin
        dm.FDConnection.Rollback;
        MessageDlg('Não foi possivel salvar o Dependente.' + E.Message, mtError, [mbOK], 0);
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
    MessageDlg('Não existe funcionário cadastrado.', mtWarning, [mbOK], 0);
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