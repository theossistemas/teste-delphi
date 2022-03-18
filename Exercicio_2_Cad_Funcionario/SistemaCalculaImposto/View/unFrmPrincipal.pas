unit unFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unFormBasePadrao, Vcl.StdCtrls,
  Vcl.Buttons, unDmGeral;

type
  TfrmPrincipal = class(TfrmFormBasePadrao)
    btnCadastroFuncionario: TBitBtn;
    btnConfigBanco: TBitBtn;
    procedure btnCadastroFuncionarioClick(Sender: TObject);
    procedure btnConfigBancoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses unFrmFuncionario, unFrmConfigBanco, System.SysUtils, unMyLibrary;

procedure TfrmPrincipal.btnConfigBancoClick(Sender: TObject);
begin
  TMyLibrary.CriarFormularioModal(TfrmConfigBanco);
end;

procedure TfrmPrincipal.btnCadastroFuncionarioClick(Sender: TObject);
begin
   TMyLibrary.CriarFormularioModal(TfrmFuncionarios);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  if not TMyLibrary.ExisteArquivoDeConfiguracao then
    btnConfigBancoClick(btnConfigBanco);
end;

end.

