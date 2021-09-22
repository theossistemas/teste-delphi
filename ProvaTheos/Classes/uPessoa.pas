unit uPessoa;

interface

type
  TPessoa = class
  private
    FCPF: String;
    FNome: String;
    function GetSQLDelete: String;
    function GetSQLInsert: String;
    function GetSQLUpdate: String;
    function GetSQLSelectID: String;
    function GetSelectExistsCPF: String;
    procedure SetCPF(const Value: String);
    procedure SetNome(const Value: String);

protected
    constructor Create;

    procedure Save; virtual;
    procedure Delete; virtual;
    procedure Update; virtual;
    function GetIDPessoa: Integer;
    procedure VerificarCPF; virtual;
  public
    property CPF: String read FCPF write SetCPF;
    property Nome: String read FNome write SetNome;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs, System.UITypes, FireDAC.Comp.Client,
  DataModule, FireDAC.Stan.Param, DB;

procedure TPessoa.Delete;
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
        MessageDlg('Erro ao apagar a Pessoa.'  + E.Message, mtError, [mbOK], 0);
        Abort;
      end;
    end;
  finally
    vQry.Free;
  end;
end;

procedure TPessoa.Update;
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
        MessageDlg('Erro ao atualizar a Pessoa.' + E.Message, mtError, [mbOK], 0);
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
  Result := 'INSERT INTO PESSOA (IDPESSOA, NOME, CPF)                  ' +
            '     VALUES (GEN_ID(GEN_PESSOA_ID, 1), :NOME, :CPF) ';
end;

function TPessoa.GetSQLSelectID: String;
begin
  Result := 'SELECT MAX(IDPESSOA) ID ' +
            '  FROM PESSOA     ';
end;

function TPessoa.GetSQLUpdate: String;
begin
  Result := 'UPDATE PESSOA SET NOME = :NOME WHERE CPF = :CPF';
end;

procedure TPessoa.Save;
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
        MessageDlg('Erro ao salvar a Pessoa.' + E.Message, mtError, [mbOK], 0);
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
      MessageDlg('CPF já cadastrado.', mtWarning, [mbOK], 0);
      Abort;
    end;
  finally
    vQry.Free
  end;
end;

end.