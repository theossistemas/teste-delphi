unit untCalculadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmCalculadora = class(TForm)
    btnSete: TBitBtn;
    btnNove: TBitBtn;
    btnOito: TBitBtn;
    btnSoma: TBitBtn;
    btnQuatro: TBitBtn;
    btnCinco: TBitBtn;
    btnSeis: TBitBtn;
    btnSubtr: TBitBtn;
    btnUm: TBitBtn;
    btnDois: TBitBtn;
    btnTres: TBitBtn;
    btnMult: TBitBtn;
    btnLimpar: TBitBtn;
    btnZero: TBitBtn;
    btnCalcular: TBitBtn;
    btnDiv: TBitBtn;
    edtResultado: TEdit;
    btnImpA: TBitBtn;
    btnImpB: TBitBtn;
    btnImpC: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnSomaClick(Sender: TObject);
    procedure btnSubtrClick(Sender: TObject);
    procedure btnMultClick(Sender: TObject);
    procedure btnDivClick(Sender: TObject);
    procedure btnNumeroClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnImpAClick(Sender: TObject);
    procedure btnImpBClick(Sender: TObject);
    procedure btnImpCClick(Sender: TObject);
  private
    { Private declarations }

    FOperacao : Char;
    FTotal : Double;
    FUltimoNumero : Double;
    FImpA : Double;
    FImpB : Double;

    procedure Calcular;
    Procedure Limpar;
  public
    { Public declarations }
  end;

var
  frmCalculadora: TfrmCalculadora;

implementation

{$R *.dfm}

procedure TfrmCalculadora.FormCreate(Sender: TObject);
begin
  SysLocale.MiddleEast := true;
  edtResultado.BiDiMode := bdRightToLeft;
  Limpar;
  btnImpB.Enabled := False;
  btnImpC.Enabled := False;
end;

procedure TfrmCalculadora.btnSomaClick(Sender: TObject);
begin
  FUltimoNumero := StrToFloat(edtResultado.Text);
  Calcular;
  FOperacao := '+';
end;

procedure TfrmCalculadora.Calcular;
begin
  case FOperacao of
    '+' : FTotal := FTotal + StrToFloat(edtResultado.Text);
    '-' : FTotal := FTotal - StrToFloat(edtResultado.Text);
    '*' : FTotal := FTotal * StrToFloat(edtResultado.Text);
    '/' : FTotal := FTotal / StrToFloat(edtResultado.Text);
  end;

  edtResultado.Text := FloatToStr(FTotal);
  FUltimoNumero := 0;
end;

procedure TfrmCalculadora.Limpar;
begin
  edtResultado.Text := '0';
  FUltimoNumero := 0;
  FOperacao := '+';
  FTotal := 0;
end;

procedure TfrmCalculadora.btnSubtrClick(Sender: TObject);
begin
  FUltimoNumero := StrToFloat(edtResultado.Text);
  Calcular;
  FOperacao := '-';
end;

procedure TfrmCalculadora.btnMultClick(Sender: TObject);
begin
  FUltimoNumero := StrToFloat(edtResultado.Text);
  Calcular;
  FOperacao := '*';
end;

procedure TfrmCalculadora.btnDivClick(Sender: TObject);
begin
  FUltimoNumero := StrToFloat(edtResultado.Text);
  Calcular;
  FOperacao := '/';

end;

procedure TfrmCalculadora.btnNumeroClick(Sender: TObject);
begin
  if FUltimoNumero = 0 then
    edtResultado.Text := TButton(Sender).Caption
  else
    edtResultado.Text := edtResultado.Text + TButton(Sender).Caption;

  FUltimoNumero := StrToFloat(edtResultado.Text);
end;

procedure TfrmCalculadora.btnCalcularClick(Sender: TObject);
begin
  Calcular;
  btnImpB.Enabled := False;
  btnImpC.Enabled := False;
end;

procedure TfrmCalculadora.btnLimparClick(Sender: TObject);
begin
  Limpar;
  btnImpB.Enabled := False;
  btnImpC.Enabled := False;
end;

procedure TfrmCalculadora.btnImpAClick(Sender: TObject);
begin

  FTotal :=  (StrToFloat(edtResultado.Text)* 20) - 500;
  edtResultado.Text := FormatFloat('0.00', FTotal/100);
  FImpA := StrToFloat(edtResultado.Text);
  btnImpB.Enabled := True;
end;

procedure TfrmCalculadora.btnImpBClick(Sender: TObject);
begin
  FTotal  := StrToFloat(edtResultado.Text) - 15;
  edtResultado.Text := FloatToStr(FTotal);
  FImpB   := FTotal;
  btnImpC.Enabled := True;
end;

procedure TfrmCalculadora.btnImpCClick(Sender: TObject);
begin
  edtResultado.Text := FloatToStr(FImpA + FImpB);
end;

end.
