unit FrmCalculadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, BCalculadora, Math;

type
  TFCalculadora = class(TForm)
    btnSete: TButton;
    btnoito: TButton;
    btnNove: TButton;
    btnSeis: TButton;
    btnCinco: TButton;
    btnQuatro: TButton;
    btnTres: TButton;
    btnDois: TButton;
    btnUm: TButton;
    edtResultado: TEdit;
    btnZero: TButton;
    btnLimpar: TButton;
    btnIgual: TButton;
    btnMais: TButton;
    btnMenos: TButton;
    btnMultiplicar: TButton;
    btnDividir: TButton;
    btnImpostoA: TButton;
    btnImpostoC: TButton;
    btnImpostoB: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure NumeroClick(Sender: TObject);
    procedure OperacaoClick(Sender: TObject);
    procedure btnIgualClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnImpostoClick(Sender: TObject);
  private
    { Private declarations }
    oCalcular: TBCalculadora;
    procedure calcular;
    procedure Limpar;
  public
    { Public declarations }
  end;

var
  FCalculadora: TFCalculadora;

implementation

{$R *.dfm}

procedure TFCalculadora.FormCreate(Sender: TObject);
begin
  oCalcular := TBCalculadora.Create;
  Limpar;
end;

procedure TFCalculadora.Limpar;
begin
  edtResultado.Text := IntToStr(ZeroValue);
  oCalcular.oCalculadora.setValor(ZeroValue);
  oCalcular.oCalculadora.setValorAnterior(ZeroValue);
  oCalcular.oCalculadora.setTotal(ZeroValue);
  oCalcular.oCalculadora.setOperacao('+');
  oCalcular.oCalculadora.setIsOpIgual(False);
  oCalcular.oCalculadora.setImpostoA(ZeroValue);
  oCalcular.oCalculadora.setImpostoB(ZeroValue);
  oCalcular.oCalculadora.setImpostoB(ZeroValue);
end;

procedure TFCalculadora.NumeroClick(Sender: TObject);
begin
  if (oCalcular.oCalculadora.getValorAnterior = ZeroValue) then
    edtResultado.Text := TButton(Sender).Caption
  else
    edtResultado.Text := edtResultado.Text + TButton(Sender).Caption;

  oCalcular.oCalculadora.setValorAnterior(StrToCurrDef(edtResultado.Text, ZeroValue));
end;

procedure TFCalculadora.OperacaoClick(Sender: TObject);
begin
  if (oCalcular.oCalculadora.getValorAnterior = ZeroValue) then
    oCalcular.oCalculadora.setValorAnterior(StrToCurrDef(edtResultado.Text, ZeroValue));

  self.calcular;

  oCalcular.oCalculadora.setIsOpIgual(False);

  oCalcular.oCalculadora.setOperacao(TButton(Sender).Caption);
end;

procedure TFCalculadora.btnIgualClick(Sender: TObject);
begin
  oCalcular.oCalculadora.setIsOpIgual(True);
  self.calcular;
end;

procedure TFCalculadora.calcular;
begin
  if (oCalcular.oCalculadora.getValorAnterior = ZeroValue) then
    oCalcular.oCalculadora.setValor(StrToCurrDef(edtResultado.Text, ZeroValue))
  else if (oCalcular.oCalculadora.getIsOpIgual) then
    oCalcular.oCalculadora.setValor(oCalcular.oCalculadora.getValorAnterior)
  else
    oCalcular.oCalculadora.setValor(StrToCurrDef(edtResultado.Text, ZeroValue));

  edtResultado.Text := CurrToStr(oCalcular.getCalculo);
end;

procedure TFCalculadora.btnLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TFCalculadora.btnImpostoClick(Sender: TObject);
begin
  oCalcular.oCalculadora.setValor(StrToCurrDef(edtResultado.Text, ZeroValue));
  edtResultado.Text := CurrToStr(oCalcular.getCalculo(TButton(Sender).Caption));
end;

procedure TFCalculadora.FormDestroy(Sender: TObject);
begin
  FreeAndNil(oCalcular);
end;

end.
