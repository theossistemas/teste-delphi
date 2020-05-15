unit TelaCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uControllerCadastro;

type
  TFrm_TelaExercicio2 = class(TForm)
    edtNomeFuncionario: TEdit;
    edtCPF: TEdit;
    edtSalario: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnSalvar: TButton;
    gbDependente: TGroupBox;
    edtNomeDependente: TEdit;
    Label4: TLabel;
    cbxCalculaINSS: TCheckBox;
    cbxCalculaIR: TCheckBox;
    btAdicionar: TButton;
    gbImpostos: TGroupBox;
    Label5: TLabel;
    edtINSS: TEdit;
    Label6: TLabel;
    edtIR: TEdit;
    btnCalcular: TButton;
    procedure edtCPFKeyPress(Sender: TObject; var Key: Char);
    procedure edtSalarioKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btAdicionarClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
  private
    FController: TControllerCadastro;

    function ValidarApenasNumeros(Key: Char): boolean;
  end;

var
  Frm_TelaExercicio2: TFrm_TelaExercicio2;

implementation

uses
  uobjCalculaImpostos;

{$R *.dfm}

procedure TFrm_TelaExercicio2.edtCPFKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not ValidarApenasNumeros(Key) then
    Key := #0;
end;

function TFrm_TelaExercicio2.ValidarApenasNumeros(Key: Char): boolean;
begin
  result := (Key in [#8, '0'..'9']);
end;

procedure TFrm_TelaExercicio2.edtSalarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not ValidarApenasNumeros(Key) then
    Key := #0;
end;

procedure TFrm_TelaExercicio2.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FController);

  inherited;
end;

procedure TFrm_TelaExercicio2.btnSalvarClick(Sender: TObject);
begin
  FController.Funcionario.Nome := edtNomeFuncionario.Text;
  FController.Funcionario.CPF := edtCPF.Text;
  FController.Funcionario.Salario := StrToFloatDef(edtSalario.Text, 0);
  if FController.Salvar then
  begin
    ShowMessage('Cadastro salvo com sucesso.');
    gbImpostos.Enabled := True;
    btnCalcular.Enabled := True;
  end;
end;

procedure TFrm_TelaExercicio2.FormShow(Sender: TObject);
begin
  FController := TControllerCadastro.Create;
end;

procedure TFrm_TelaExercicio2.btAdicionarClick(Sender: TObject);
begin
  if Trim(edtNomeDependente.Text) = '' then
  begin
    ShowMessage('É necessário preencher o nome do dependente.');
    Exit;
  end;  

  FController.CriarDependente;
  FController.Dependente.Nome := edtNomeDependente.Text;
  FController.Dependente.IsCalcularIR := cbxCalculaIR.Checked;
  FController.Dependente.IsCalcularINSS := cbxCalculaINSS.Checked;
  FController.AdicionarDependente;
  ShowMessage('Dependente adicionado.');
end;

procedure TFrm_TelaExercicio2.btnCalcularClick(Sender: TObject);
var
  oCalculaImpostos: TCalculaImpostos;
begin
  oCalculaImpostos := TCalculaImpostos.Create;
  try
    oCalculaImpostos.Funcionario := FController.Funcionario;
    oCalculaImpostos.Calcular;

    edtINSS.Text := FloatToStr(oCalculaImpostos.ImpostoINSS);
    edtIR.Text := FloatToStr(oCalculaImpostos.ImpostoIR);
  finally
    FreeAndNil(oCalculaImpostos);
  end;
end;

end.
