unit uCalculadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Graphics, uCalculo, System.UITypes;

type
  Tfmr_Calculadora = class(TForm)
    pnlBase: TPanel;
    btnSete: TSpeedButton;
    btnOito: TSpeedButton;
    btnNove: TSpeedButton;
    btnQuatro: TSpeedButton;
    btnCinco: TSpeedButton;
    btnSeis: TSpeedButton;
    btnUm: TSpeedButton;
    btnDois: TSpeedButton;
    btnTres: TSpeedButton;
    btnZero: TSpeedButton;
    btnVirgula: TSpeedButton;
    btnAdicao: TSpeedButton;
    btnSubtracao: TSpeedButton;
    btnMultiplicacao: TSpeedButton;
    btnDivisao: TSpeedButton;
    btnIgual: TSpeedButton;
    edtResultado: TEdit;
    edtOperacao: TEdit;
    edtPrimeiroValor: TEdit;
    btnCE: TSpeedButton;
    btnC: TSpeedButton;
    btnImpostoA: TSpeedButton;
    btnImpostoB: TSpeedButton;
    btnImpostoC: TSpeedButton;
    procedure btnUmClick(Sender: TObject);
    procedure btnAdicaoClick(Sender: TObject);
    procedure edtOperacaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtOperacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnIgualClick(Sender: TObject);
    procedure btnCClick(Sender: TObject);
    procedure btnCEClick(Sender: TObject);
    procedure btnImpostoAClick(Sender: TObject);
  end;

  procedure AbrirTela;

var
  fmr_Calculadora: Tfmr_Calculadora;

implementation

{$R *.dfm}

procedure AbrirTela;
begin
  Application.CreateForm(Tfmr_Calculadora, fmr_Calculadora);
  fmr_Calculadora.ShowModal;
end;

procedure Tfmr_Calculadora.btnAdicaoClick(Sender: TObject);
begin
  edtOperacao.Text := (TSpeedButton(Sender).Caption);

  if edtResultado.Text <> EmptyStr then
  begin
    edtPrimeiroValor.Text := edtResultado.Text;
  end;

  edtResultado.Clear;
end;

procedure Tfmr_Calculadora.btnCClick(Sender: TObject);
begin
  edtOperacao.Clear;
  edtResultado.Clear;
  edtPrimeiroValor.Clear;
end;

procedure Tfmr_Calculadora.btnCEClick(Sender: TObject);
begin
  edtResultado.Clear;
end;

procedure Tfmr_Calculadora.btnIgualClick(Sender: TObject);
begin
  if edtOperacao.Text <> EmptyStr then
  begin
    case Copy(edtOperacao.Text, Low(edtOperacao.Text), Low(edtOperacao.Text))[1] of
      '+': edtResultado.Text := FloatToStr(TCalculoImposto.Adicao(StrToFloatDef(edtPrimeiroValor.Text, 0), StrToFloatDef(edtResultado.Text, 0)));
      '-': edtResultado.Text := FloatToStr(TCalculoImposto.Subtracao(StrToFloatDef(edtPrimeiroValor.Text, 0), StrToFloatDef(edtResultado.Text, 0)));
      '*': edtResultado.Text := FloatToStr(TCalculoImposto.Multiplicacao(StrToFloatDef(edtPrimeiroValor.Text, 0), StrToFloatDef(edtResultado.Text, 0)));
      '/': edtResultado.Text := FloatToStr(TCalculoImposto.Divisao(StrToFloatDef(edtPrimeiroValor.Text, 0), StrToFloatDef(edtResultado.Text, 0)));
    end;
  end;
end;

procedure Tfmr_Calculadora.btnImpostoAClick(Sender: TObject);
var
  vCalculoImposto: TCalculoImposto;
begin
  vCalculoImposto := TCalculoImposto.Create;
  try
    vCalculoImposto.ValorImposto := StrToFloatDef(edtResultado.Text, 0);

    case Copy(TSpeedButton(Sender).Name, Length(TSpeedButton(Sender).Name), Length(TSpeedButton(Sender).Name))[1] of
      'A': edtResultado.Text := FloatToStr(vCalculoImposto.ImpostoA(vCalculoImposto));
      'B': edtResultado.Text := FloatToStr(vCalculoImposto.ImpostoB(vCalculoImposto));
      'C': edtResultado.Text := FloatToStr(vCalculoImposto.ImpostoC(vCalculoImposto));
    end;
  finally
    vCalculoImposto.Free;
  end;
end;

procedure Tfmr_Calculadora.btnUmClick(Sender: TObject);
begin
  edtResultado.Text := edtResultado.Text + (TSpeedButton(Sender).Caption);
end;

procedure Tfmr_Calculadora.edtOperacaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key <> VKSHIFT then
  begin
    edtOperacao.Clear;
  end;
end;

procedure Tfmr_Calculadora.edtOperacaoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key <> VK_ADD)      and
     (Key <> VK_SUBTRACT) and
     (Key <> VK_MULTIPLY) and
     (Key <> VK_DIVIDE)   and
     (Key <> VKRETURN)    and
     (Key <> VK_BACK)     and
     (Key <> VKTAB)       and
     (key <> VKMINUS)     then
  begin
    MessageDlg('Somente operações matemáticas aceitas por essa calculadora.', mtWarning, [mbOK], 0);
    edtOperacao.Clear;
  end
  else
  begin
    edtPrimeiroValor.Text := edtResultado.Text;
  end;
end;

end.
