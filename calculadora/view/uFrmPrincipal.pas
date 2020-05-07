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
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EnviarComando(Sender: TObject);
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

end.
