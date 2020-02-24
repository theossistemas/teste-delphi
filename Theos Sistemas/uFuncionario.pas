unit uFuncionario;

interface

uses
  uPessoa, DataModulo, uDependente, System.Generics.Collections;

resourcestring
  SIM = 'S';

type
  TFuncionario = class(TPessoa)
  private
    FSalario: Currency;
    FListaDependente: TObjectList<TDependente>;
    FIDFuncionario: Integer;
    FQtdeDependenteIR: Integer;
    FQtdeDependenteINSS: Integer;

    function GetSQLInsert: String;
    function GetSQLUpdate: String;
    function GetSQLDeleteDependente: String;
    function GetQtdeDependente(pImposto: String): Integer;
    function GetSQLSelectDependente(pImposto: String): String;

    procedure SetSalario(const Value: Currency);
    procedure SetIDFuncionario(const Value: Integer);
    procedure SetQtdeDependenteIR(const Value: Integer);
    procedure SetQtdeDependenteINSS(const Value: Integer);
  public
    constructor Create;
    destructor Destroy; override;

    property Salario: Currency read FSalario write SetSalario;
    property ListaDependente: TObjectList<TDependente> read FListaDependente write FListaDependente;
    property IDFuncionario: Integer read FIDFuncionario write SetIDFuncionario;
    property QtdeDependenteIR: Integer read FQtdeDependenteIR write SetQtdeDependenteIR;
    property QtdeDependenteINSS: Integer read FQtdeDependenteINSS write SetQtdeDependenteINSS;

    function AdicionarDependenteList(pIDFuncionario: Integer): TObjectList<TDependente>;
    function CalcularIR(pFuncionario: TFuncionario): Currency;
    function CalcularINSS(pFuncionario: TFuncionario): Currency;
    function FindOne: TFuncionario;

    procedure Salvar; override;
    procedure Apagar; override;
    procedure Atualizar; override;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs, System.UITypes, FireDAC.Comp.Client,
  FireDAC.Stan.Param, Math, System.StrUtils;

{ TFuncionario }

function TFuncionario.AdicionarDependenteList(pIDFuncionario: Integer): TObjectList<TDependente>;
var
  I: Integer;
begin
  I := 0;
  FListaDependente.Clear;

  dm.qryDependente.Close;
  dm.qryDependente.ParamByName('ID_FUNCIONARIO').AsInteger := pIDFuncionario;
  dm.qryDependente.Open;

  while not dm.qryDependente.Eof do
  begin
    FListaDependente.Add(TDependente.Create);
    FListaDependente[I].IDDependente  := dm.qryDependenteID.AsInteger;
    FListaDependente[I].Nome          := dm.qryDependenteNOME.AsString;
    FListaDependente[I].CPF           := dm.qryDependenteCPF.AsString;
    FListaDependente[I].IsCalculaIR   := dm.qryDependenteCALCULA_IR.AsString = SIM;
    FListaDependente[I].IsCalculaINSS := dm.qryDependenteCALCULA_INSS.AsString = SIM;
    Inc(I);
    dm.qryDependente.Next;
  end;

  Result := FListaDependente;
end;

procedure TFuncionario.Apagar;
var
  vQry: TFDQuery;
begin
  dm.FDConnection.StartTransaction;
  vQry            := TFDQuery.Create(nil);
  vQry.Connection := dm.FDConnection;
  try
    try
      vQry.SQL.Text                                := GetSQLDeleteDependente;
      vQry.ParamByName('ID_FUNCIONARIO').AsInteger := FIDFuncionario;
      vQry.ExecSQL;

      dm.FDConnection.Commit;
    except on E: Exception do
      begin
        dm.FDConnection.Rollback;
        MessageDlg('Erro ao apagar os Dependentes do Funcionário.' + #13 + 'Erro original: ' + E.Message, mtError, [mbOK], 0);
        Abort;
      end;
    end;
  finally
    vQry.Free;
  end;

  inherited;

  dm.qryFuncionario.Refresh;
end;

procedure TFuncionario.Atualizar;
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
      vQry.ParamByName('ID_FUNCIONARIO').AsInteger := FIDFuncionario;
      vQry.ParamByName('SALARIO').AsCurrency       := FSalario;
      vQry.ExecSQL;

      dm.FDConnection.Commit;
    except on E: Exception do
      begin
        dm.FDConnection.Rollback;
        MessageDlg('Erro ao atualizar o Funcionário.' + #13 + 'Erro original: ' + E.Message, mtError, [mbOK], 0);
        Abort;
      end;
    end;
  finally
    vQry.Free;
  end;

  dm.qryFuncionario.Cancel;
  dm.qryFuncionario.Refresh;
end;

function TFuncionario.CalcularINSS(pFuncionario: TFuncionario): Currency;
begin
  Result := IfThen(pFuncionario.FQtdeDependenteINSS > 0, (pFuncionario.FSalario * 0.08), 0);
end;

function TFuncionario.CalcularIR(pFuncionario: TFuncionario): Currency;
begin
  Result := IfThen(pFuncionario.FQtdeDependenteIR > 0, (pFuncionario.FSalario - (pFuncionario.FQtdeDependenteIR * 100)) * 0.15, 0);
end;

constructor TFuncionario.Create;
begin
  inherited Create;

  FSalario            := 0;
  FQtdeDependenteIR   := 0;
  FQtdeDependenteINSS := 0;
  FIDFuncionario      := 0;
  FListaDependente    := TObjectList<TDependente>.Create(False);
end;

destructor TFuncionario.Destroy;
begin
  FreeAndNil(FListaDependente);
  inherited;
end;

function TFuncionario.FindOne: TFuncionario;
var
  vQry: TFDQuery;
begin
  vQry            := TFDQuery.Create(nil);
  vQry.Connection := dm.FDConnection;
  try
    vQry.SQL.Text := dm.qryFuncionario.SQL.Text;
    vQry.Filter   := ' ID = ' + QuotedStr(dm.qryFuncionarioID.AsString);
    vQry.Filtered := True;
    vQry.Open;

    Result := TFuncionario.Create;
    Result.IDFuncionario      := vQry.FieldByName('ID').AsInteger;
    Result.Nome               := vQry.FieldByName('NOME').AsString;
    Result.CPF                := vQry.FieldByName('CPF').AsString;
    Result.Salario            := vQry.FieldByName('SALARIO').AsCurrency;
    Result.QtdeDependenteIR   := GetQtdeDependente('IR');
    Result.QtdeDependenteINSS := GetQtdeDependente('INSS');
  finally
    vQry.Free;
  end;
end;

function TFuncionario.GetQtdeDependente(pImposto: String): Integer;
var
  vQry: TFDQuery;
begin
  vQry            := TFDQuery.Create(nil);
  vQry.Connection := dm.FDConnection;
  try
    vQry.SQL.Text := GetSQLSelectDependente(pImposto);
    vQry.ParamByName('ID_FUNCIONARIO').AsInteger := dm.qryFuncionarioID.AsInteger;
    vQry.Open;

    Result := vQry.FieldByName('QTDE').AsInteger;
  finally
    vQry.Free;
  end;
end;

function TFuncionario.GetSQLDeleteDependente: String;
begin
  Result := ' DELETE FROM PESSOA                                                          ' +
            '       WHERE PESSOA.ID = (SELECT DEPENDENTE.ID_PESSOA                        ' +
            '                            FROM DEPENDENTE                                  ' +
            '                           WHERE DEPENDENTE.ID_FUNCIONARIO = :ID_FUNCIONARIO)';
end;

function TFuncionario.GetSQLInsert: String;
begin
  Result := 'INSERT INTO FUNCIONARIO (ID, ID_PESSOA, SALARIO)                  ' +
            '     VALUES (GEN_ID(GEN_FUNCIONARIO_ID, 1), :ID_PESSOA, :SALARIO) ';
end;

function TFuncionario.GetSQLSelectDependente(pImposto: String): String;
begin
  Result := 'SELECT COUNT(*) QTDE                   ' +
            '  FROM DEPENDENTE                      ' +
            ' WHERE ID_FUNCIONARIO = :ID_FUNCIONARIO';

  Result := Result + IfThen(pImposto = 'IR', ' AND CALCULA_IR = ''S'' ', ' AND CALCULA_INSS = ''S'' ');
end;

function TFuncionario.GetSQLUpdate: String;
begin
  Result := 'UPDATE FUNCIONARIO SET SALARIO = :SALARIO WHERE ID = :ID_FUNCIONARIO';
end;

procedure TFuncionario.Salvar;
var
  vQry: TFDQuery;
begin
  dm.FDConnection.StartTransaction;
  inherited;

  vQry            := TFDQuery.Create(nil);
  vQry.Connection := dm.FDConnection;
  try
    try
      vQry.SQL.Text                           := GetSQLInsert;
      vQry.ParamByName('ID_PESSOA').AsInteger := Self.GetIDPessoa;
      vQry.ParamByName('SALARIO').AsCurrency  := FSalario;
      vQry.ExecSQL;

      dm.FDConnection.Commit;
    except on E: Exception do
      begin
        dm.FDConnection.Rollback;
        MessageDlg('Erro ao salvar o Funcionário.' + #13 + 'Erro original: ' + E.Message, mtError, [mbOK], 0);
        Abort;
      end;
    end;
  finally
    vQry.Free;
  end;

  dm.qryFuncionario.Cancel;
  dm.qryFuncionario.Refresh;
  dm.qryFuncionario.Last;
end;

procedure TFuncionario.SetIDFuncionario(const Value: Integer);
begin
  FIDFuncionario := Value;
end;

procedure TFuncionario.SetQtdeDependenteINSS(const Value: Integer);
begin
  FQtdeDependenteINSS := Value;
end;

procedure TFuncionario.SetQtdeDependenteIR(const Value: Integer);
begin
  FQtdeDependenteIR := Value;
end;

procedure TFuncionario.SetSalario(const Value: Currency);
begin
  if Value = 0 then
  begin
    MessageDlg('Informe o salário.', mtWarning, [mbOK], 0);
    Abort;
  end;

  FSalario := Value;
end;

end.
