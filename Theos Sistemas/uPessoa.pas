unit uPessoa;

interface

type
  TPessoa = class
  private
    FCPF: String;
    FNome: String;

    function GetSQLSelectID: String;
    function GetSelectExistsCPF: String;
    function GetSQLDelete: String;
    function GetSQLInsert: String;
    function GetSQLUpdate: String;

    procedure SetCPF(const Value: String);
    procedure SetNome(const Value: String);
  protected
    constructor Create;

    function GetIDPessoa: Integer;

    procedure Salvar; virtual;
    procedure Apagar; virtual;
    procedure Atualizar; virtual;
    procedure VerificarCPF; virtual;
  public
    property CPF: String read FCPF write SetCPF;
    property Nome: String read FNome write SetNome;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs, System.UITypes, FireDAC.Comp.Client,
  DataModulo, FireDAC.Stan.Param, DB;

procedure TPessoa.Apagar;
var
  vQry: TFDQuery;
begin
  vQry            := TFDQuery.Create(nil);
  vQry.Connection := dm.FDConnection;
  try
    try
      vQry.SQL.Text                    := GetSQLDelete;
      vQry.ParamByName('CPF').AsString := FCPF;
      vQry.ExecSQL;

    except on E: Exception do
      begin
        MessageDlg('Erro ao apagar a Pessoa.' + #13 + 'Erro original: ' + E.Message, mtError, [mbOK], 0);
        Abort;
      end;
    end;
  finally
    vQry.Free;
  end;
end;

procedure TPessoa.Atualizar;
var
  vQry: TFDQuery;
begin
  vQry            := TFDQuery.Create(nil);
  vQry.Connection := dm.FDConnection;
  try
    try
      vQry.SQL.Text                     := GetSQLUpdate;
      vQry.ParamByName('NOME').AsString := FNome;
      vQry.ParamByName('CPF').AsString  := FCPF;
      vQry.ExecSQL;

    except on E: Exception do
      begin
        MessageDlg('Erro ao atualizar a Pessoa.' + #13 + 'Erro original: ' + E.Message, mtError, [mbOK], 0);
        Abort;
      end;
    end;
  finally
    vQry.Free;
  end;
end;

constructor TPessoa.Create;
begin
  FNome := EmptyStr;
  FCPF  := EmptyStr;
end;

function TPessoa.GetIDPessoa: Integer;
var
  vQry: TFDQuery;
begin
  vQry            := TFDQuery.Create(nil);
  vQry.Connection := dm.FDConnection;
  try
    vQry.SQL.Text := GetSQLSelectID;
    vQry.Open;

    Result := vQry.FieldByName('ID').AsInteger;
  finally
    vQry.Free;
  end;
end;

function TPessoa.GetSelectExistsCPF: String;
begin
  Result := 'SELECT 1          ' +
            '  FROM PESSOA     ' +
            ' WHERE CPF = :CPF ';
end;

function TPessoa.GetSQLDelete: String;
begin
  Result := 'DELETE FROM PESSOA WHERE CPF = :CPF';
end;

function TPessoa.GetSQLInsert: String;
begin
  Result := 'INSERT INTO PESSOA (ID, NOME, CPF)                  ' +
            '     VALUES (GEN_ID(GEN_PESSOA_ID, 1), :NOME, :CPF) ';
end;

function TPessoa.GetSQLSelectID: String;
begin
  Result := 'SELECT MAX(ID) ID ' +
            '  FROM PESSOA     ';
end;

function TPessoa.GetSQLUpdate: String;
begin
  Result := 'UPDATE PESSOA SET NOME = :NOME WHERE CPF = :CPF';
end;

procedure TPessoa.Salvar;
var
  vQry: TFDQuery;
begin
  VerificarCPF;

  vQry            := TFDQuery.Create(nil);
  vQry.Connection := dm.FDConnection;
  try
    try
      vQry.SQL.Text                     := GetSQLInsert;
      vQry.ParamByName('NOME').AsString := FNome;
      vQry.ParamByName('CPF').AsString  := FCPF;
      vQry.ExecSQL;

    except on E: Exception do
      begin
        MessageDlg('Erro ao salvar a Pessoa.' + #13 + 'Erro original: ' + E.Message, mtError, [mbOK], 0);
        Abort;
      end;
    end;
  finally
    vQry.Free;
  end;
end;

procedure TPessoa.SetCPF(const Value: String);
begin
  if Value = EmptyStr then
  begin
    MessageDlg('Informe o CPF.', mtWarning, [mbOK], 0);
    Abort;
  end;

  if Length(Value) <> 11 then
  begin
    MessageDlg('CPF precisa conter 11 dígitos.', mtWarning, [mbOK], 0);
    Abort;
  end;

  FCPF := Value;
end;

procedure TPessoa.SetNome(const Value: String);
begin
  if Value = EmptyStr then
  begin
    MessageDlg('Informe o Nome.', mtWarning, [mbOK], 0);
    Abort;
  end;

  FNome := Value;
end;

procedure TPessoa.VerificarCPF;
var
  vQry: TFDQuery;
begin
  vQry            := TFDQuery.Create(nil);
  vQry.Connection := dm.FDConnection;
  try
    vQry.SQL.Text                    := GetSelectExistsCPF;
    vQry.ParamByName('CPF').AsString := FCPF;
    vQry.Open;

    if not vQry.IsEmpty then
    begin
      MessageDlg('Já existe uma pessoa cadastrada com esse CPF.', mtWarning, [mbOK], 0);
      Abort;
    end;
  finally
    vQry.Free
  end;
end;

end.
