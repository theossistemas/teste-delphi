unit uFuncionario;

interface

uses
  uPessoa, DataModule, uDependente, System.Generics.Collections;

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

    procedure Save; override;
    procedure Delete; override;
    procedure Update; override;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs, System.UITypes, FireDAC.Comp.Client,
  FireDAC.Stan.Param, Math, System.StrUtils;

  Const
  SIM = 'S';
{ TFuncionario }

function TFuncionario.AdicionarDependenteList(pIDFuncionario: Integer): TObjectList<TDependente>;
var
  I: Integer;
begin
  I := 0;
  FListaDependente.Clear;

  dm.qryDependente.Close;
  dm.qryDependente.ParamByName('IDFUNCIONARIO').AsInteger := pIDFuncionario;
  dm.qryDependente.Open;

  while not dm.qryDependente.Eof do
  begin
    FListaDependente.Add(TDependente.Create);
    FListaDependente[I].IDDependente  := dm.qryDependenteIDDEPENDENTE.AsInteger;
    FListaDependente[I].Nome          := dm.qryDependenteNOME.AsString;
    FListaDependente[I].CPF           := dm.qryDependenteCPF.AsString;
    FListaDependente[I].IsCalculaIR   := dm.qryDependenteCALCULAIR.AsString = SIM;
    FListaDependente[I].IsCalculaINSS := dm.qryDependenteCALCULAINSS.AsString = SIM;
    Inc(I);
    dm.qryDependente.Next;
  end;

  Result := FListaDependente;
end;

procedure TFuncionario.Delete;
var
  vQry: TFDQuery;
begin
  dm.FDConnection.StartTransaction;
  vQry            := TFDQuery.Create(nil);
  vQry.Connection := dm.FDConnection;
  try
    try
      vQry.SQL.Text                                := GetSQLDeleteDependente;
      vQry.ParamByName('IDFUNCIONARIO').AsInteger := FIDFuncionario;
      vQry.ExecSQL;

      dm.FDConnection.Commit;
    except on E: Exception do
      begin
        dm.FDConnection.Rollback;
        MessageDlg('Erro ao apagar os Dependentes do Funcionário.' + E.Message, mtError, [mbOK], 0);
        Abort;
      end;
    end;
  finally
    vQry.Free;
  end;

  inherited;

  dm.qryFuncionario.Refresh;
end;

procedure TFuncionario.Update;
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
      vQry.ParamByName('IDFUNCIONARIO').AsInteger := FIDFuncionario;
      vQry.ParamByName('SALARIO').AsCurrency       := FSalario;
      vQry.ExecSQL;

      dm.FDConnection.Commit;
    except on E: Exception do
      begin
        dm.FDConnection.Rollback;
        MessageDlg('Erro ao atualizar o Funcionário.' + E.Message, mtError, [mbOK], 0);
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
    vQry.Filter   := ' IDFUNCIONARIO = ' + QuotedStr(dm.qryFuncionarioIDFUNCIONARIO.AsString);
    vQry.Filtered := True;
    vQry.Open;

    Result := TFuncionario.Create;
    Result.IDFuncionario      := vQry.FieldByName('IDFUNCIONARIO').AsInteger;
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
    vQry.ParamByName('IDFUNCIONARIO').AsInteger := dm.qryFuncionarioIDFUNCIONARIO.AsInteger;
    vQry.Open;

    Result := vQry.FieldByName('QTDE').AsInteger;
  finally
    vQry.Free;
  end;
end;

function TFuncionario.GetSQLDeleteDependente: String;
begin
  Result := ' DELETE FROM PESSOA                                                          ' +
            '       WHERE PESSOA.IDPESSOA = (SELECT DEPENDENTE.IDPESSOA                        ' +
            '                            FROM DEPENDENTE                                  ' +
            '                           WHERE DEPENDENTE.IDFUNCIONARIO = :IDFUNCIONARIO)';
end;

function TFuncionario.GetSQLInsert: String;
begin
  Result := 'INSERT INTO FUNCIONARIO (IDFUNCIONARIO, IDPESSOA, SALARIO)                  ' +
            '     VALUES (GEN_ID(GEN_FUNCIONARIO_ID, 1), :IDPESSOA, :SALARIO) ';
end;

function TFuncionario.GetSQLSelectDependente(pImposto: String): String;
begin
  Result := 'SELECT COUNT(*) QTDE                   ' +
            '  FROM DEPENDENTE                      ' +
            ' WHERE IDFUNCIONARIO = :IDFUNCIONARIO';

  Result := Result + IfThen(pImposto = 'IR', ' AND CALCULAIR = ''S'' ', ' AND CALCULAINSS = ''S'' ');
end;

function TFuncionario.GetSQLUpdate: String;
begin
  Result := ' UPDATE FUNCIONARIO                    ' +
            '    SET SALARIO       = :SALARIO       ' +
            '  WHERE IDFUNCIONARIO = :IDFUNCIONARIO ';
end;

procedure TFuncionario.Save;
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
      vQry.ParamByName('IDPESSOA').AsInteger := Self.GetIDPessoa;
      vQry.ParamByName('SALARIO').AsCurrency  := FSalario;
      vQry.ExecSQL;

      dm.FDConnection.Commit;
    except on E: Exception do
      begin
        dm.FDConnection.Rollback;
        MessageDlg('Erro ao salvar o Funcionário.' +  E.Message, mtError, [mbOK], 0);
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
    MessageDlg('É necessário informar o salário.', mtWarning, [mbOK], 0);
    Abort;
  end;

  FSalario := Value;
end;

end.