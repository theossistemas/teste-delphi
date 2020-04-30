unit uEntidadesCalculoMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, uControllerFuncionario;

type
  TfrmEntidadesCalculoMain = class(TForm)
    pnlCadastro: TPanel;
    edtSalario: TMaskEdit;
    Label1: TLabel;
    edtCPF: TMaskEdit;
    LogradouroLabel: TLabel;
    edtNomeFuncionario: TMaskEdit;
    Nome: TLabel;
    Panel2: TPanel;
    groupDependentes: TGroupBox;
    edtNomeDependente: TMaskEdit;
    Label2: TLabel;
    cbINSS: TCheckBox;
    cbIR: TCheckBox;
    btnAdicionarDependente: TButton;
    listDependente: TListBox;
    btnCancelar: TButton;
    btnSalvar: TButton;
    btnNovo: TButton;
    edtINSS: TMaskEdit;
    edtIR: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    btnINSS: TButton;
    btnIR: TButton;
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAdicionarDependenteClick(Sender: TObject);
    procedure btnINSSClick(Sender: TObject);
    procedure btnIRClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FControllerFuncionario: TControllerFuncionario;
    procedure HabilitarDesabilitarComponentes(const bStatus: boolean);
    procedure LimparCampos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEntidadesCalculoMain: TfrmEntidadesCalculoMain;

implementation

{$R *.dfm}

procedure TfrmEntidadesCalculoMain.btnAdicionarDependenteClick(
  Sender: TObject);
begin
  FControllerFuncionario.AdicionarDependente(edtNomeDependente.Text, cbINSS.Checked, cbIR.Checked);
  listDependente.AddItem(edtNomeDependente.Text, FControllerFuncionario.Dependente);
  edtNomeDependente.Text := EmptyStr;
  cbIR.Checked := False;
  cbINSS.Checked := False;
  edtNomeDependente.SetFocus;
end;

procedure TfrmEntidadesCalculoMain.btnCancelarClick(Sender: TObject);
begin
  LimparCampos;
  HabilitarDesabilitarComponentes(False);
  FreeAndNil(FControllerFuncionario);
end;

procedure TfrmEntidadesCalculoMain.btnINSSClick(Sender: TObject);
begin
  if FControllerFuncionario.Funcionario.Salario = 0 then
    raise Exception.Create('Salário não informado. Não é possível calcular.');

  edtINSS.Text := FloatToStr(FControllerFuncionario.Funcionario.CalcularINSS);
end;

procedure TfrmEntidadesCalculoMain.btnIRClick(Sender: TObject);
begin
  if FControllerFuncionario.Funcionario.Salario = 0 then
    raise Exception.Create('Salário não informado. Não é possível calcular.');

  edtIR.Text := FloatToStr(FControllerFuncionario.Funcionario.CalcularIR);
end;

procedure TfrmEntidadesCalculoMain.btnNovoClick(Sender: TObject);
begin
  btnINSS.Enabled := False;
  btnIR.Enabled := False;
  HabilitarDesabilitarComponentes(True);
  LimparCampos;

  if Assigned(FControllerFuncionario) then
    FreeAndNil(FControllerFuncionario);

  FControllerFuncionario := TControllerFuncionario.Create;
  edtNomeFuncionario.SetFocus;
end;

procedure TfrmEntidadesCalculoMain.btnSalvarClick(Sender: TObject);
begin
  FControllerFuncionario.Funcionario.Nome := edtNomeFuncionario.Text;
  FControllerFuncionario.Funcionario.CPF := edtCPF.Text;
  FControllerFuncionario.Funcionario.Salario := StrToFloat(edtSalario.Text);
  FControllerFuncionario.Funcionario.InserirFuncionario;
  FControllerFuncionario.Funcionario.InserirDependentes;
  btnINSS.Enabled := True;
  btnIR.Enabled := True;
  btnSalvar.Enabled := False;
end;

procedure TfrmEntidadesCalculoMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(FControllerFuncionario);
end;

procedure TfrmEntidadesCalculoMain.FormShow(Sender: TObject);
begin
  HabilitarDesabilitarComponentes(False);
end;

procedure TfrmEntidadesCalculoMain.HabilitarDesabilitarComponentes(const bStatus: boolean);
begin
  pnlCadastro.Enabled := bStatus;
  btnCancelar.Enabled := bStatus;
  btnSalvar.Enabled := bStatus;
end;

procedure TfrmEntidadesCalculoMain.LimparCampos;
begin
  edtSalario.Clear;
  edtCPF.Clear;
  edtNomeFuncionario.Clear;
  edtNomeDependente.Clear;
  edtINSS.Clear;
  edtIR.Clear;
  listDependente.Clear;
  cbINSS.Checked := False;
  cbIR.Checked := False;
end;
end.
