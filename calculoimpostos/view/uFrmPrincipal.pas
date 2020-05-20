unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Menus, uFrmCadastroFuncionario, uFrmCalculoImpostos;

type
  TfrmPrincipal = class(TForm)
    menu: TMainMenu;
    Cadastro1: TMenuItem;
    Funcionario: TMenuItem;
    Impostos1: TMenuItem;
    ClculodeImpostos1: TMenuItem;
    procedure FuncionarioClick(Sender: TObject);
    procedure ClculodeImpostos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.ClculodeImpostos1Click(Sender: TObject);
begin
  if (frmCalculoImpostos = nil) then begin
    frmCalculoImpostos := TfrmCalculoImpostos.Create(Application);
    frmCalculoImpostos.WindowState := wsNormal;
    frmCalculoImpostos.Show;
  end;
end;

procedure TfrmPrincipal.FuncionarioClick(Sender: TObject);
begin
  if (frmCadastroFuncionario = nil) then begin
    frmCadastroFuncionario := TfrmCadastroFuncionario.Create(Application);
    frmCadastroFuncionario.WindowState := wsNormal;
    frmCadastroFuncionario.Show;
  end;
end;

end.
