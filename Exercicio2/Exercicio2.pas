unit Exercicio2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  UModels, UControllers, System.Generics.Collections;

type
  TForm_Funcionario = class(TForm)
    Panel1: TPanel;
    Edit_Nome: TEdit;
    Edit_Cpf: TEdit;
    Edit_Salario: TEdit;
    Btn_Cadastrar: TButton;
    GroupBox1: TGroupBox;
    Edit_nomeDependente: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Btn_IncluirDependente: TButton;
    Ch_CalculaIR: TCheckBox;
    Ch_CalculaInss: TCheckBox;
    Label_Impostos: TLabel;
    Btn_CalcularImpostos: TButton;
    procedure Btn_CadastrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Btn_IncluirDependenteClick(Sender: TObject);
    procedure Btn_CalcularImpostosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
    funcionario           : classFuncionario;
    FuncController        : controllerFuncionario;
    funcionarioDependente : classDependente;

    procedure LimpaCampos;
    procedure LimpaCamposDependente;
  public
    { Public declarations }
  end;

var
  Form_Funcionario: TForm_Funcionario;

implementation

{$R *.dfm}

procedure TForm_Funcionario.Btn_CadastrarClick(Sender: TObject);
begin
     try
        Btn_CalcularImpostosClick(Sender);
        ShowMessage(FuncController.CadastrarFuncionario(funcionario));
        LimpaCampos;

     finally
           FreeAndNil(funcionario);
     end;
end;

procedure TForm_Funcionario.Btn_IncluirDependenteClick(Sender: TObject);
begin
     try
        funcionarioDependente                := classDependente.Create;
        funcionarioDependente.Nome           := Edit_nomeDependente.Text;
        funcionarioDependente.IsCalcularIR   := Ch_CalculaIR.Checked;
        funcionarioDependente.IsCalcularINSS := Ch_CalculaInss.Checked;

        funcionario.ListaDependentes.Add(funcionarioDependente);
        LimpaCamposDependente;
     Except
           ShowMessage('Não foi possível cadastrar o dependente.');
     end;


end;

procedure TForm_Funcionario.Btn_CalcularImpostosClick(Sender: TObject);
begin
     funcionario.Nome       := Edit_Nome.Text;
     funcionario.Cpf        := Edit_Cpf.Text;
     funcionario.Salario    := StrToFloat(Edit_Salario.Text);
     Label_Impostos.Caption := FuncController.RetornaImpostos(funcionario);
     Btn_Cadastrar.Enabled  := True;
end;

procedure TForm_Funcionario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     FreeAndNil(funcionarioDependente);
     FreeAndNil(funcionario);
     FreeAndNil(FuncController);
end;

procedure TForm_Funcionario.FormCreate(Sender: TObject);
begin
     funcionario    := classFuncionario.Create;
     funcController := controllerFuncionario.Create();
end;

procedure TForm_Funcionario.LimpaCampos;
begin
     Edit_Nome.Clear;
     Edit_Cpf.Clear;
     Edit_Salario.Clear;

     Label_Impostos.Caption := 'IR: 00 INSS: 00';

     Edit_Nome.SetFocus;
end;

procedure TForm_Funcionario.LimpaCamposDependente;
begin
     Edit_nomeDependente.Clear;
     Ch_CalculaIR.Checked   := False;
     Ch_CalculaInss.Checked := False;

     Edit_nomeDependente.SetFocus;
end;

end.
