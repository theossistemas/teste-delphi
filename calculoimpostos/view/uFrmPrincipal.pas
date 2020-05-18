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
    procedure FuncionarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FuncionarioClick(Sender: TObject);
begin
  if (frmCadastroFuncionario = nil) then begin
    frmCadastroFuncionario := TfrmCadastroFuncionario.Create(Application);
    frmCadastroFuncionario.WindowState := wsNormal;
    frmCadastroFuncionario.Show;
  end;
end;

end.
