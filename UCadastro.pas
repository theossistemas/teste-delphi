unit UCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, UFuncionario, UFuncionarioDados,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, UDependente, System.Math,
  Vcl.Menus, UDados, UDm;

type
  TFrmCadastro = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSalvar: TButton;
    edSalario: TEdit;
    Label1: TLabel;
    edCPF: TMaskEdit;
    Label2: TLabel;
    edNome: TEdit;
    Label3: TLabel;
    gpDependente: TGroupBox;
    Label4: TLabel;
    edNomeDep: TEdit;
    cbCalculaIR: TCheckBox;
    cbCalculaINSS: TCheckBox;
    btnSalvarDependente: TButton;
    DBGrid1: TDBGrid;
    edIR: TEdit;
    Label5: TLabel;
    edINSS: TEdit;
    Label6: TLabel;
    cdDependente: TClientDataSet;
    dsDependente: TDataSource;
    cdDependenteNome: TStringField;
    cdDependentecalculaIR: TSmallintField;
    cdDependentecalculaINSS: TSmallintField;
    cdDependenteId: TSmallintField;
    cdDependentecpf: TStringField;
    PopupMenu1: TPopupMenu;
    ExcluirDependente: TMenuItem;
    procedure somenteNumero(Sender: TObject; var Key: Char);
    procedure formataMoeda(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSalvarDependenteClick(Sender: TObject);
    procedure edCPFExit(Sender: TObject);
    procedure cdDependentecalculaIRGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdDependentecalculaINSSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dsDependenteDataChange(Sender: TObject; Field: TField);
    procedure ExcluirDependenteClick(Sender: TObject);
    procedure cdDependenteAfterPost(DataSet: TDataSet);
  private
    aFuncionario : TFuncionario;
    aDependente : TDependente;
    aDados      : TDados;
    IDDep : Integer;
    procedure limpaDependente;
  end;

var
  FrmCadastro: TFrmCadastro;

implementation

{$R *.dfm}

procedure TFrmCadastro.btnSalvarClick(Sender: TObject);
var
  aFuncionarioDados : TFuncionarioDados;
begin
  aFuncionarioDados := TFuncionarioDados.Create;
  try
    aFuncionario.Nome    := edNome.Text;
    aFuncionario.Salario := StrToFloat(edSalario.Text);
    if aFuncionarioDados.salvarFuncionario(aFuncionario) then
      Close;
  finally
    aFuncionarioDados.Free;
  end;

end;

procedure TFrmCadastro.btnSalvarDependenteClick(Sender: TObject);
begin
  if (trim(edCPF.Text) <> '') then
  begin
    IDDep                     := aFuncionario.ListaDependente.Count -1;
    aDependente.ID            := IDDep;
    aDependente.Nome          := edNomeDep.Text;
    aDependente.IsCalculaIR   := cbCalculaIR.Checked;
    aDependente.IsCalculaINSS := cbCalculaINSS.Checked;
    aFuncionario.ListaDependente.Add(aDependente);

    cdDependente.InsertRecord([IDDep, edNomeDep.Text, ifthen(cbCalculaIR.Checked,1,0), ifthen(cbCalculaINSS.Checked,1,0), edCPF.Text]);

    limpaDependente;
  end
  else
    raise Exception.Create('Para Salvar Dependente é obrigatório informar o CPF do Funcionário');
end;

procedure TFrmCadastro.cdDependenteAfterPost(DataSet: TDataSet);
Var
  vlrIR : Double;
begin
  if TClientDataSet(DataSet).RecordCount > 0 then
  begin
    TClientDataSet(DataSet).First;
    TClientDataSet(DataSet).Filter := 'calculaIR = 1';
    TClientDataSet(DataSet).Filtered := True;
    if not TClientDataSet(DataSet).IsEmpty then
    begin
      edIR.Clear;
      vlrIR := 0;
      vlrIR := StrToFloat(edSalario.Text) - (TClientDataSet(DataSet).RecordCount * 100);
      vlrIR := vlrIR * 0.15;
      edIR.Text := FormatFloat('R$ #,##0,00',vlrIR);
    end;
    TClientDataSet(DataSet).First;
    TClientDataSet(DataSet).Filter := 'calculaINSS = 1';
    TClientDataSet(DataSet).Filtered := True;
    if not TClientDataSet(DataSet).IsEmpty then
    begin
      edINSS.Clear;
      edINSS.Text := FormatFloat('R$ #,##0,00', StrToFloat(edSalario.Text) * 0.08);
    end;
  end;
end;

procedure TFrmCadastro.cdDependentecalculaINSSGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if cdDependente.RecordCount > 0 then
  begin
    case cdDependentecalculaINSS.AsInteger of
      0: Text := 'Não';
      1: Text := 'Sim';
    end;
  end;
end;

procedure TFrmCadastro.cdDependentecalculaIRGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if cdDependente.RecordCount > 0 then
  begin
    case cdDependentecalculaIR.AsInteger of
      0: Text := 'Não';
      1: Text := 'Sim';
    end;
  end;
end;

procedure TFrmCadastro.dsDependenteDataChange(Sender: TObject; Field: TField);
begin
  ExcluirDependente.Enabled := cdDependente.RecNo > 0;
end;

procedure TFrmCadastro.edCPFExit(Sender: TObject);
begin
  aFuncionario.CPF := edCPF.Text;
end;

procedure TFrmCadastro.ExcluirDependenteClick(Sender: TObject);
begin
   IDDep := IDDep - 1;
   aFuncionario.ListaDependente.Delete(cdDependenteId.AsInteger);
   cdDependente.Delete;
end;

procedure TFrmCadastro.formataMoeda(Sender: TObject);
var
  valor: double;
begin
  valor := StrToCurr(edSalario.Text);
  if trim(edSalario.Text) <> '' then
    edSalario.Text := FormatFloat('#,##', valor)
end;

procedure TFrmCadastro.FormCreate(Sender: TObject);
begin
  aDados       := TDados.Create;
  aFuncionario := TFuncionario.Create;
  aDependente  := TDependente.Create;
  cdDependente.Open;
  IDDep := 0;
end;

procedure TFrmCadastro.FormDestroy(Sender: TObject);
begin
  aDados.Free;
  aFuncionario.Free;
  aDependente.Free;
  cdDependente.Close;
end;

procedure TFrmCadastro.limpaDependente;
begin
  edNomeDep.Clear;
  cbCalculaIR.Checked   := False;
  cbCalculaINSS.Checked := False;
end;

procedure TFrmCadastro.somenteNumero(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key,['0'..'9',#8]) then
    key := #0;
end;

end.
