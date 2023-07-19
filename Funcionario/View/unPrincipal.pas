unit unPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, unCadFuncionario;

type
  TfrmPrincipal = class(TForm)
    btnCadastrarFuncionario: TButton;
    procedure btnCadastrarFuncionarioClick(Sender: TObject);
  private
    procedure ChamarCadastroFuncionario();

    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnCadastrarFuncionarioClick(Sender: TObject);
begin
  ChamarCadastroFuncionario();
end;

procedure TfrmPrincipal.ChamarCadastroFuncionario;
begin
  if not Assigned(frmCadFuncionario) then
    Application.CreateForm(TfrmCadFuncionario, frmCadFuncionario);
  try
    frmCadFuncionario.ShowModal;
  finally
    FreeAndNil(frmCadFuncionario);
  end;
end;

end.
