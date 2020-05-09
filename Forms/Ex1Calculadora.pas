unit Ex1Calculadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, Grids;

type
  TEx1CalculadoraF = class(TForm)
    edtHistorico: TEdit;
    edtVisor: TEdit;
    btnSete: TButton;
    btnQuatro: TButton;
    btnZero: TButton;
    bntUm: TButton;
    btnOito: TButton;
    btnCinco: TButton;
    btnDois: TButton;
    btnVirgula: TButton;
    btnNove: TButton;
    btnSeis: TButton;
    btnTres: TButton;
    btnLimpar: TButton;
    btnSomar: TButton;
    btnDividir: TButton;
    btnMultiplicar: TButton;
    btnDiminuir: TButton;
    btnIgual: TButton;
    btnApagar: TButton;
    redtHistorico: TRichEdit;
    btnHistorico: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSomarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSeteClick(Sender: TObject);
    procedure btnOitoClick(Sender: TObject);
    procedure btnNoveClick(Sender: TObject);
    procedure btnQuatroClick(Sender: TObject);
    procedure btnCincoClick(Sender: TObject);
    procedure btnSeisClick(Sender: TObject);
    procedure bntUmClick(Sender: TObject);
    procedure btnDoisClick(Sender: TObject);
    procedure btnTresClick(Sender: TObject);
    procedure btnZeroClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure edtVisorKeyPress(Sender: TObject; var Key: Char);
    procedure btnIgualClick(Sender: TObject);
    procedure btnDividirClick(Sender: TObject);
    procedure btnMultiplicarClick(Sender: TObject);
    procedure btnDiminuirClick(Sender: TObject);
    procedure btnHistoricoClick(Sender: TObject);
    procedure btnVirgulaClick(Sender: TObject);
  private
    procedure digitarOperacao(poperacao:String);
    procedure digitarNumero(pnumero:String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ex1CalculadoraF: TEx1CalculadoraF;
  vgDigitouOperacao:Boolean;


implementation

uses MenuPrincipal, CalculadoraU;


var
  Calculadora: TCalculadora;


{$R *.dfm}

//Exercício 1 – Calculadora
//Criar uma calculadora usando conceitos de orientação a objetos.
//Gostaríamos que sigam um pensamento simples e não se prendam muito a interface gráfica,

//* Quando digitarmos um número e escolhermos uma operação, a calculadora checa se é a primeira vez.
//	* Se for, o resultado é o número do visor.

//* Conforme trocamos, as operações são executadas, o valor é armazenado e a operação é atualizada.
//* Ao clicar em igual, checamos se é a primeira vez.
//	* Se for, executamos a última operação com o número do visor.
//	* Caso não seja, a operação será executada, mas usamos o que guardamos do visor no primeiro clique de igual.
//Isso permite que façamos 5 / 5 * 2 (igual, igual). 

procedure TEx1CalculadoraF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  MenuPrincipalF.fecharForm(self, key);
end;

procedure TEx1CalculadoraF.FormShow(Sender: TObject);
begin
  Calculadora := TCalculadora.Create;
  redtHistorico.Clear;
end;

procedure TEx1CalculadoraF.btnSeteClick(Sender: TObject);
begin
  digitarNumero(TButton(Sender).Caption);
end;

procedure TEx1CalculadoraF.btnOitoClick(Sender: TObject);
begin
  digitarNumero(TButton(Sender).Caption);
end;

procedure TEx1CalculadoraF.btnNoveClick(Sender: TObject);
begin
  digitarNumero(TButton(Sender).Caption);
end;

procedure TEx1CalculadoraF.btnQuatroClick(Sender: TObject);
begin
  digitarNumero(TButton(Sender).Caption);
end;

procedure TEx1CalculadoraF.btnCincoClick(Sender: TObject);
begin
  digitarNumero(TButton(Sender).Caption);
end;

procedure TEx1CalculadoraF.btnSeisClick(Sender: TObject);
begin
  digitarNumero(TButton(Sender).Caption);
end;

procedure TEx1CalculadoraF.bntUmClick(Sender: TObject);
begin
  digitarNumero(TButton(Sender).Caption);
end;

procedure TEx1CalculadoraF.btnDoisClick(Sender: TObject);
begin
  digitarNumero(TButton(Sender).Caption);
end;

procedure TEx1CalculadoraF.btnTresClick(Sender: TObject);
begin
  digitarNumero(TButton(Sender).Caption);
end;

procedure TEx1CalculadoraF.btnZeroClick(Sender: TObject);
begin
  digitarNumero(TButton(Sender).Caption);
end;

procedure TEx1CalculadoraF.btnLimparClick(Sender: TObject);
begin
  edtVisor.Clear;
  edtHistorico.Clear;
  Calculadora.FreeInstance;
  Calculadora := TCalculadora.Create;
  redtHistorico.Clear;  
end;

procedure TEx1CalculadoraF.btnApagarClick(Sender: TObject);
begin
  edtVisor.Clear;
  edtVisor.SetFocus;
end;

procedure TEx1CalculadoraF.edtVisorKeyPress(Sender: TObject;
  var Key: Char);
var vlOperacao :String;
begin
  if (key in [#13,'+', '-', '/', '*', '=']) then
  begin
    if Key = #13 then
      vlOperacao := '='
    else
      vlOperacao := Key;
      
    digitarOperacao(vlOperacao);
    key := #0;//anula a tecla
    edtVisor.SelectAll;
  end else
  if not(key in [#8,',','0'..'9'])then
    key := #0;//anula a tecla


end;

procedure TEx1CalculadoraF.btnSomarClick(Sender: TObject);
begin
  digitarOperacao(TButton(Sender).Caption);
end;

procedure TEx1CalculadoraF.btnIgualClick(Sender: TObject);
begin
  digitarOperacao(TButton(Sender).Caption);
end;



procedure TEx1CalculadoraF.btnDividirClick(Sender: TObject);
begin
  digitarOperacao(TButton(Sender).Caption);
end;

procedure TEx1CalculadoraF.btnMultiplicarClick(Sender: TObject);
begin
  digitarOperacao(TButton(Sender).Caption);
end;

procedure TEx1CalculadoraF.btnDiminuirClick(Sender: TObject);
begin
  digitarOperacao(TButton(Sender).Caption);
end;

procedure TEx1CalculadoraF.btnHistoricoClick(Sender: TObject);
begin
  redtHistorico.Visible := not redtHistorico.Visible;
  if redtHistorico.Visible then
    Width := 410
  else
    Width := 225;
end;

procedure TEx1CalculadoraF.btnVirgulaClick(Sender: TObject);
begin
  digitarNumero(TButton(Sender).Caption);
end;

procedure TEx1CalculadoraF.digitarNumero(pnumero: String);
begin
  if vgDigitouOperacao then
  begin
    edtVisor.Clear;
    vgDigitouOperacao := False;
  end;
  edtVisor.Text := edtVisor.Text + pnumero;
end;

procedure TEx1CalculadoraF.digitarOperacao(poperacao: String);
var
  vHistorico: string;
  vOperacaoAtual: TOperacao;
begin
  if edtVisor.Text = '' then
    Exit;

  vgDigitouOperacao := True;

  vOperacaoAtual := Calculadora.getOperacaoToConvert(poperacao);

  edtVisor.Text := FloatToStr(Calculadora.calcular(edtVisor.Text, vOperacaoAtual, vHistorico));
  edtHistorico.Text := vHistorico;

  with Calculadora do
  begin
    redtHistorico.Lines.Add('NumeroA: '+getnumeroAtoString);
    redtHistorico.Lines.Add('NumeroB: '+getnumeroBtoString);
    redtHistorico.Lines.Add('Operacao: '+getOperacaoToString(getOperacao));
    redtHistorico.Lines.Add('Ultima Operacao: '+getOperacaoToString(getUltimaOperacao));
    redtHistorico.Lines.Add('Historico: '+getHistoricoCalculo);
    redtHistorico.Lines.Add('Resultado: '+getResultadotoString);
    redtHistorico.Lines.Add('');
  end;
end;

end.

