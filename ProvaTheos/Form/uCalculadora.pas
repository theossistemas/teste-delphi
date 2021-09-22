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
    edtResult: TEdit;
    edtOperacao: TEdit;
    edtPrimeiroValor: TEdit;
    btnCE: TSpeedButton;
    btnC: TSpeedButton;
    btnImpostoA: TSpeedButton;
    btnImpostoB: TSpeedButton;
    btnImpostoC: TSpeedButton;
    procedure btnUmClick(Sender: TObject);
    procedure btnAdicaoClick(Sender: TObject);
    procedure btnIgualClick(Sender: TObject);
    procedure btnCClick(Sender: TObject);
    procedure btnCEClick(Sender: TObject);
    procedure btnImpostoAClick(Sender: TObject);
  end;

  procedure ChamarTela;

var
  fmr_Calculadora: Tfmr_Calculadora;

implementation

{$R *.dfm}

procedure ChamarTela;
begin
  Application.CreateForm(Tfmr_Calculadora, fmr_Calculadora);
  fmr_Calculadora.ShowModal;
end;

procedure Tfmr_Calculadora.btnAdicaoClick(Sender: TObject);
begin
  edtOperacao.Text := (TSpeedButton(Sender).Caption);

  if edtResult.Text <> EmptyStr then
  begin
    edtPrimeiroValor.Text := edtResult.Text;
  end;

  edtResult.Clear;
end;

procedure Tfmr_Calculadora.btnCClick(Sender: TObject);
begin
  edtOperacao.Clear;
  edtResult.Clear;
  edtPrimeiroValor.Clear;
end;

procedure Tfmr_Calculadora.btnCEClick(Sender: TObject);
begin
  edtResult.Clear;
end;

procedure Tfmr_Calculadora.btnIgualClick(Sender: TObject);
begin
  if edtOperacao.Text <> EmptyStr then
  begin
    case Copy(edtOperacao.Text, Low(edtOperacao.Text), Low(edtOperacao.Text))[1] of
      '+': edtResult.Text := FloatToStr(TCalculoImposto.Adicao(StrToFloatDef(edtPrimeiroValor.Text, 0), StrToFloatDef(edtResult.Text, 0)));
      '-': edtResult.Text := FloatToStr(TCalculoImposto.Subtracao(StrToFloatDef(edtPrimeiroValor.Text, 0), StrToFloatDef(edtResult.Text, 0)));
      '*': edtResult.Text := FloatToStr(TCalculoImposto.Multiplicacao(StrToFloatDef(edtPrimeiroValor.Text, 0), StrToFloatDef(edtResult.Text, 0)));
      '/': edtResult.Text := FloatToStr(TCalculoImposto.Divisao(StrToFloatDef(edtPrimeiroValor.Text, 0), StrToFloatDef(edtResult.Text, 0)));
    end;
  end;
end;

procedure Tfmr_Calculadora.btnImpostoAClick(Sender: TObject);
var
  vCalculoImposto: TCalculoImposto;
begin
  vCalculoImposto := TCalculoImposto.Create;
  try
    vCalculoImposto.ValorImposto := StrToFloatDef(edtResult.Text, 0);

    case Copy(TSpeedButton(Sender).Name, Length(TSpeedButton(Sender).Name), Length(TSpeedButton(Sender).Name))[1] of
      'A': edtResult.Text := FloatToStr(vCalculoImposto.ImpostoA(vCalculoImposto));
      'B': edtResult.Text := FloatToStr(vCalculoImposto.ImpostoB(vCalculoImposto));
      'C': edtResult.Text := FloatToStr(vCalculoImposto.ImpostoC(vCalculoImposto));
    end;
  finally
    vCalculoImposto.Free;
  end;
end;

procedure Tfmr_Calculadora.btnUmClick(Sender: TObject);
begin
  edtResult.Text := edtResult.Text + (TSpeedButton(Sender).Caption);
end;

end.
