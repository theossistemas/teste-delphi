unit Calculadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  UCalculos, StrUtils;

type
  TForm_Calculadora = class(TForm)
    Panel1: TPanel;
    Edit_resultado: TEdit;
    Btn_7: TButton;
    Btn_8: TButton;
    Btn_9: TButton;
    Btn_Divisao: TButton;
    Btn_Limpar: TButton;
    Btn_Resultado: TButton;
    Btn_Multiplicacao: TButton;
    Btn_Subtracao: TButton;
    Btn_3: TButton;
    Btn_Soma: TButton;
    Btn_Virgula: TButton;
    Btn_0: TButton;
    Btn_1: TButton;
    Btn_2: TButton;
    Btn_5: TButton;
    Btn_4: TButton;
    Btn_6: TButton;
    Btn_A: TButton;
    Btn_B: TButton;
    Btn_C: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Btn_AClick(Sender: TObject);
    procedure CliqueBotao(Sender : Tobject);
    procedure Btn_LimparClick(Sender: TObject);
    procedure Btn_BClick(Sender: TObject);
    procedure Btn_CClick(Sender: TObject);
    procedure Btn_ResultadoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    calculo : classCalculo;
  public
    { Public declarations }
  end;

var
  Form_Calculadora: TForm_Calculadora;

implementation

{$R *.dfm}

procedure TForm_Calculadora.Btn_AClick(Sender: TObject);
begin
     if Trim(Edit_resultado.Text) <> ''  then
        Edit_resultado.Text := FloatToStr( calculo.CalculaImpostoA(calculo.ValidaValor(Edit_resultado.Text)) ) ;
end;

procedure TForm_Calculadora.Btn_LimparClick(Sender: TObject);
begin
     Edit_resultado.Text := '';
     calculo.Reiniciar;
end;

procedure TForm_Calculadora.Btn_ResultadoClick(Sender: TObject);
var
  resultado : Extended;
begin
     resultado := 0;
     resultado := calculo.CalculaValores;

     calculo.PrimeiroNumero := resultado;
     Edit_resultado.Text    := Edit_resultado.Text + '=' + FloatToStr(resultado);
end;

procedure TForm_Calculadora.Btn_BClick(Sender: TObject);
begin
     if Trim(Edit_resultado.Text) <> ''  then
        Edit_resultado.Text := FloatToStr( calculo.CalculaImpostoB(calculo.ValidaValor(Edit_resultado.Text)) ) ;
end;

procedure TForm_Calculadora.Btn_CClick(Sender: TObject);
begin
     if Trim(Edit_resultado.Text) <> ''  then
        Edit_resultado.Text := FloatToStr( calculo.CalculaImpostoC(calculo.ValidaValor(Edit_resultado.Text)) ) ;
end;

procedure TForm_Calculadora.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     calculo.Free;
end;

procedure TForm_Calculadora.FormCreate(Sender: TObject);
begin
     calculo := classCalculo.Create;
end;

procedure TForm_Calculadora.CliqueBotao(Sender: Tobject);
var
   v_BotaoClicado,
   v_retorno  : String;
const
     numeros = ['0','1','2','3','4','5','6','7','8','9'];
begin
     if (Sender is  TButton) then
        v_BotaoClicado := (Sender as TButton).Name;

     if (Pos(copy(v_BotaoClicado,Length(v_BotaoClicado),1),'0|1|2|3|4|5|6|7|8|9') <> 0) then
        begin
             Edit_resultado.Text := Edit_resultado.Text + copy(v_BotaoClicado,Length(v_BotaoClicado),1);
             calculo.Numero      := calculo.Numero + copy(v_BotaoClicado,Length(v_BotaoClicado),1);
        end
     else
        if v_BotaoClicado = 'Btn_Virgula' then
           begin
                Edit_resultado.Text := Edit_resultado.Text + ',';
                calculo.Numero      := calculo.Numero + ',';
           end
        else
            begin
                 if calculo.PrimeiroNumero = 0 then
                    calculo.PrimeiroNumero := StrToFloat(Edit_resultado.Text);

                 calculo.Numero         := '';
                 v_retorno              := calculo.RetornaOperacao(v_BotaoClicado);

                 if v_retorno = '=' then
                    Edit_resultado.Text    := Edit_resultado.Text + v_retorno + Edit_resultado.Text
                 else
                    Edit_resultado.Text    := Edit_resultado.Text + v_retorno;

            end;
end;

end.
