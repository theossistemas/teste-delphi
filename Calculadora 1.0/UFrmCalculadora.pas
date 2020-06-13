unit UFrmCalculadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, UIObserverCalculos,
  UICalculadora;

type
  TFrmCalculadora = class(TForm, IObserverCalculos)
    pnlOperacoes: TPanel;
    txtVisor: TStaticText;
    Panel1: TPanel;
    btnNumero1: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    txtDetalhe: TStaticText;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure clickBotoes(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
  private
    { Private declarations }
    ComandosCalculadora: ICalculadora;
    procedure EnviaComando(Key: Char);

  public

    procedure setCalculos(comandos: ICalculadora);
    procedure NotifyResultado(value: string);
    procedure NotifyDetalhe(value: string);

    { Public declarations }
  end;

var
  FrmCalculadora: TFrmCalculadora;

implementation

{$R *.dfm}

procedure TFrmCalculadora.Button16Click(Sender: TObject);
begin
  comandoscalculadora.Comando(imposto1);
end;

procedure TFrmCalculadora.Button17Click(Sender: TObject);
begin
  comandoscalculadora.Comando(imposto2);
end;

procedure TFrmCalculadora.Button18Click(Sender: TObject);
begin
  comandoscalculadora.Comando(imposto3);
end;

procedure TFrmCalculadora.Button19Click(Sender: TObject);
begin
  comandoscalculadora.Comando(clearMemory);
end;

procedure TFrmCalculadora.clickBotoes(Sender: TObject);
begin
  ComandosCalculadora.Comando(TButton(sender).Caption);
end;

procedure TFrmCalculadora.FormKeyPress(Sender: TObject; var Key: Char);

begin
  // trocar comandos back e cls por um tipo
  EnviaComando(key);
  if (key = #8) then
    ComandosCalculadora.Comando(backEspace);
  if (key = #13) then begin
    EnviaComando('=');
  end;

  if (key = #27) then begin
    ComandosCalculadora.Comando(clearMemory);
  end;
  key := #0;
  ActiveControl := nil;
end;
procedure TFrmCalculadora.EnviaComando(Key: Char);
  var i: integer;
begin
  if (Key in ['0'..'9', '/', '+', '-', '*', ',', '=']) then
    for i:=0 to self.ComponentCount-1 do
    begin
      if self.Components[i] is TButton then
        if TButton(self.Components[i]).Caption = key then
          clickBotoes(self.Components[i])
    end;
end;


procedure TFrmCalculadora.NotifyResultado(value: string);
  var valor: currency;
begin
  if tryStrToCurr(value, valor) then
    txtVisor.Caption := FormatCurr('#,##0.00', valor)
  else
    txtVisor.Caption := '0,00';

end;

procedure TFrmCalculadora.setCalculos(comandos: ICalculadora);
begin
  ComandosCalculadora := comandos;
end;

procedure TFrmCalculadora.NotifyDetalhe(value: string);
begin
  txtDetalhe.Caption := value;
end;

end.
