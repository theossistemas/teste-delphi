unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, UDados, UCadastro;

type
  TFrmMenu = class(TForm)
    btnExe01: TButton;
    btnExe02: TButton;
    procedure btnExe02Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenu: TFrmMenu;

implementation

{$R *.dfm}

procedure TFrmMenu.btnExe02Click(Sender: TObject);
var
  aDados : TDados;
begin
  aDados := TDados.Create;
  Application.CreateForm(TFrmCadastro, FrmCadastro);
  try
    FrmCadastro.ShowModal;
  finally
    FreeAndNil(FrmCadastro);
    aDados.Free;
  end;

end;

end.
