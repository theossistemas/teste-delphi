unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, uCalculadora;

type
  TfrmPrincipal = class(TForm)
    btnZero: TButton;
    btnUm: TButton;
    btnDois: TButton;
    btnTres: TButton;
    btnQuatro: TButton;
    btnCinco: TButton;
    btnSeis: TButton;
    btnSete: TButton;
    btnOito: TButton;
    btnNove: TButton;
    btnSeparadorMilhar: TButton;
    btnSomar: TButton;
    btnSubtrair: TButton;
    btnDividir: TButton;
    btnMultiplicar: TButton;
    btnC: TButton;
    edtVisor: TEdit;
    lblHistoricoCalculo: TLabel;
    btnIgual: TButton;
    btnImpostoA: TButton;
    btnImpostoB: TButton;
    btnImpostoC: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EnviarComando(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    Calculadora: TCalculadora;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.EnviarComando(Sender: TObject);
begin
  Calculadora.ReceberComando(TButton(Sender).Caption);
  lblHistoricoCalculo.Caption := Calculadora.HistoricoCalculo;
  edtVisor.Text := Calculadora.Visor;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  Calculadora := TCalculadora.Create();
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Calculadora);
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_NUMPAD0) then
    btnZero.Click
  else if (Key = VK_NUMPAD1) then
    btnUm.Click
  else if (Key = VK_NUMPAD2) then
    btnDois.Click
  else if (Key = VK_NUMPAD3) then
    btnTres.Click
  else if (Key = VK_NUMPAD4) then
    btnQuatro.Click
  else if (Key = VK_NUMPAD5) then
    btnCinco.Click
  else if (Key = VK_NUMPAD6) then
    btnSeis.Click
  else if (Key = VK_NUMPAD7) then
    btnSete.Click
  else if (Key = VK_NUMPAD8) then
    btnOito.Click
  else if (Key = VK_NUMPAD9) then
    btnNove.Click
  else if (Key = VK_ADD) then
    btnSomar.Click
  else if (Key = VK_SUBTRACT) then
    btnSubtrair.Click
  else if (Key = VK_MULTIPLY) then
    btnMultiplicar.Click
  else if (Key = VK_DIVIDE) then
    btnDividir.Click
  else if (Key = VK_ESCAPE) then
    btnC.Click;
end;

end.
