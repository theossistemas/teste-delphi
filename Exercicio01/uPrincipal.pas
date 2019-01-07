(*
Autor..: Alexandre Pedro
Contato: alexandre.pedro@gmail.com
*)


unit uPrincipal;

interface

uses
  uCalculadora, uIOperacaoMatematica, uSomar, uSubtrair, uDividir, uMultiplicar,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmPrincipal = class(TForm)
    MmoHistorico: TMemo;
    EdtVlr01: TEdit;
    EdtVlr02: TEdit;
    EdtResultado: TEdit;
    BtnSomar: TButton;
    BtnSubtrair: TButton;
    BtnDividir: TButton;
    BtnMultiplicar: TButton;
    Label1: TLabel;
    BtnIgual: TButton;
    lblVlr2: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BtnLimpar: TButton;
    EdtImpA: TEdit;
    Label4: TLabel;
    EdtImpB: TEdit;
    EdtImpC: TEdit;
    EdtBaseCalc: TEdit;
    BtnImpA: TButton;
    BtnImpB: TButton;
    BtnImpC: TButton;
    BtnLimparHistorico: TButton;
    BtnCalcularImpostos: TButton;
    Panel1: TPanel;
    BtnSair: TButton;
    procedure BtnSomarClick(Sender: TObject);
    procedure BtnCalcularImpostosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnImpAClick(Sender: TObject);
    procedure BtnImpBClick(Sender: TObject);
    procedure BtnImpCClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VerificarValoresDigitados(Sender: TObject; var Key: Char);
    procedure BtnLimparHistoricoClick(Sender: TObject);
    procedure EdtBaseCalcExit(Sender: TObject);
    procedure BtnIgualClick(Sender: TObject);
    procedure BtnSubtrairClick(Sender: TObject);
    procedure BtnDividirClick(Sender: TObject);
    procedure BtnMultiplicarClick(Sender: TObject);
  private
    { Private declarations }
    Calculadora : TCalculadora;
    procedure CalculadoraLiberar;
    procedure MemoriaCalculo(Valor:String);
    procedure Operacao(TipoOperacao:IOperacaoMatematica);
    procedure CalculadoraCriar;
    procedure DefinirBaseCalculo;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.BtnLimparClick(Sender: TObject);
begin
  EdtVlr01.Clear;
  EdtVlr02.Clear;
  EdtResultado.Clear;
  EdtVlr01.SetFocus;
  CalculadoraLiberar;
  CalculadoraCriar;
end;

procedure TFrmPrincipal.BtnSairClick(Sender: TObject);
begin
  CalculadoraLiberar;
  Close;
end;

procedure TFrmPrincipal.BtnSomarClick(Sender: TObject);
begin
  Operacao(Calculadora.Somar);
end;

procedure TFrmPrincipal.BtnSubtrairClick(Sender: TObject);
begin
Operacao(Calculadora.Subtrair);
end;

procedure TFrmPrincipal.BtnDividirClick(Sender: TObject);
begin
  Operacao(Calculadora.Dividir);
end;

procedure TFrmPrincipal.BtnIgualClick(Sender: TObject);
begin
  if not(Calculadora.PrimeiraOperacao)
  then
    Operacao(Calculadora.UltimaOperacao);
end;

procedure TFrmPrincipal.BtnImpAClick(Sender: TObject);
begin
  DefinirBaseCalculo;
  Calculadora.CalcularImpostoA;
  EdtImpA.Text := FloatToStr(Calculadora.ImpostoA);
  MemoriaCalculo('Imposto A...: ' + EdtImpA.Text);
end;

procedure TFrmPrincipal.BtnImpBClick(Sender: TObject);
begin
  DefinirBaseCalculo;
  Calculadora.CalcularImpostoB;
  EdtImpB.Text := FloatToStr(Calculadora.ImpostoB);
  MemoriaCalculo('Imposto B...: ' + EdtImpB.Text);
end;

procedure TFrmPrincipal.BtnImpCClick(Sender: TObject);
begin
  DefinirBaseCalculo;
  Calculadora.CalcularImpostoC;
  EdtImpC.Text := FloatToStr(Calculadora.ImpostoC);
  MemoriaCalculo('Imposto C...: ' + EdtImpC.Text);
end;

procedure TFrmPrincipal.BtnLimparHistoricoClick(Sender: TObject);
begin
  MmoHistorico.Clear;
end;

procedure TFrmPrincipal.BtnMultiplicarClick(Sender: TObject);
begin
  Operacao(Calculadora.Multiplicar);
end;

procedure TFrmPrincipal.BtnCalcularImpostosClick(Sender: TObject);
begin
  EdtImpA.Clear;
  EdtImpB.Clear;
  EdtImpC.Clear;
  DefinirBaseCalculo;
  Calculadora.CalcularImpostos;
  EdtImpA.Text := FloatToStr(Calculadora.ImpostoA);
  EdtImpB.Text := FloatToStr(Calculadora.ImpostoB);
  EdtImpC.Text := FloatToStr(Calculadora.ImpostoC);

  MemoriaCalculo('Imposto A...: ' + EdtImpA.Text);
  MemoriaCalculo('Imposto B...: ' + EdtImpB.Text);
  MemoriaCalculo('Imposto C...: ' + EdtImpC.Text);

end;

procedure TFrmPrincipal.CalculadoraCriar;
begin
  if not Assigned(Calculadora)
  then
    Calculadora := TCalculadora.Create;
end;

procedure TFrmPrincipal.CalculadoraLiberar;
begin
  if Assigned(Calculadora)
  then
    FreeAndNil(Calculadora);
end;


procedure TFrmPrincipal.DefinirBaseCalculo;
begin
  Calculadora.BaseCalculo := StrToFloatDef(EdtBaseCalc.Text,0);
end;

procedure TFrmPrincipal.EdtBaseCalcExit(Sender: TObject);
begin
  EdtImpA.Clear;
  EdtImpB.Clear;
  EdtImpC.Clear;

  DefinirBaseCalculo;

  if EdtBaseCalc.Text <> ''
  then
    MemoriaCalculo('Base Calculo: ' + EdtBaseCalc.Text);
end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CalculadoraLiberar;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  CalculadoraCriar;
  EdtVlr01.OnKeyPress := VerificarValoresDigitados;
  EdtVlr02.OnKeyPress := VerificarValoresDigitados;
  EdtBaseCalc.OnKeyPress := VerificarValoresDigitados;
end;

procedure TFrmPrincipal.MemoriaCalculo(Valor: String);
begin
  if Valor <> ''
  then
    MmoHistorico.Lines.Add(Valor);
end;

procedure TFrmPrincipal.Operacao(TipoOperacao: IOperacaoMatematica);
var
  Op:IOperacaoMatematica;
begin
  if (TipoOperacao is TSomar)       then Op := (TipoOperacao as TSomar);
  if (TipoOperacao is TSubtrair)    then Op := (TipoOperacao as TSubtrair);
  if (TipoOperacao is TDividir)     then Op := (TipoOperacao as TDividir);
  if (TipoOperacao is TMultiplicar) then Op := (TipoOperacao as TMultiplicar);

  {
  if Calculadora.PrimeiraOperacao then
  begin
    Calculadora.Valor01 := StrToFloatDef(EdtVlr01.Text,0);
    Calculadora.Valor02 := StrToFloatDef(EdtVlr02.Text,0);
  end;
  }

  Calculadora.Valor01 := StrToFloatDef(EdtVlr01.Text,0);
  Calculadora.Valor02 := StrToFloatDef(EdtVlr02.Text,0);

  Op.Valor01 := Calculadora.Valor01;
  Op.Valor02 := Calculadora.Valor02;

  Calculadora.Resultado     := Op.Calcular();
  EdtVlr01.Text := FloatToStr(Calculadora.Resultado);
  EdtVlr02.Clear;
  EdtVlr02.Text := '0';
  EdtVlr02.SetFocus;
  EdtVlr02.SelectAll;

  MemoriaCalculo(Format('%f [%s] %f = %f',[Op.Valor01,Op.SinalOperacao,Op.Valor02,Calculadora.Resultado]));

  Calculadora.PrimeiraOperacao := False;
  Calculadora.UltimaOperacao   := Op;

  EdtResultado.Text := FloatToStr(Calculadora.Resultado);
end;


procedure TFrmPrincipal.VerificarValoresDigitados(Sender: TObject;
  var Key: Char);
begin

  if (Sender is TEdit)
  then
    if ((Sender as TEdit).Name = 'EdtVlr02') and (Key = #13)
    then
      BtnIgual.Click;

  if not(Key in['0'..'9',',',#8])
  then
    Key := #0;
end;

end.
