unit FormCalc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, ClassCalc;

type
  TForm1 = class(TForm)
    Visor: TEdit;
    SpButton1: TSpeedButton;
    SpButton2: TSpeedButton;
    SpButton3: TSpeedButton;
    SpButton4: TSpeedButton;
    SpButton5: TSpeedButton;
    SpButton6: TSpeedButton;
    SpButton7: TSpeedButton;
    SpButton8: TSpeedButton;
    SpButton9: TSpeedButton;
    SpButtonSomar: TSpeedButton;
    SpButtonSubtrair: TSpeedButton;
    SpButtonMultiplicar: TSpeedButton;
    SpButtonDividir: TSpeedButton;
    SpButtonLimpar: TSpeedButton;
    SpButton0: TSpeedButton;
    SpButtonMaisMenos: TSpeedButton;
    SpButtonPonto: TSpeedButton;
    SpButtonIgual: TSpeedButton;
    procedure SpButton1Click(Sender: TObject);
    procedure SpButton2Click(Sender: TObject);
    procedure SpButton3Click(Sender: TObject);
    procedure SpButton4Click(Sender: TObject);
    procedure SpButton5Click(Sender: TObject);
    procedure SpButton6Click(Sender: TObject);
    procedure SpButton7Click(Sender: TObject);
    procedure SpButton8Click(Sender: TObject);
    procedure SpButton9Click(Sender: TObject);
    procedure SpButton0Click(Sender: TObject);
    procedure SpButtonSomarClick(Sender: TObject);
    procedure SpButtonSubtrairClick(Sender: TObject);
    procedure SpButtonDividirClick(Sender: TObject);
    procedure SpButtonMultiplicarClick(Sender: TObject);
    procedure SpButtonMaisMenosClick(Sender: TObject);
    procedure SpButtonPontoClick(Sender: TObject);
    procedure SpButtonLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpButtonIgualClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure Equacoes;

var
  Form1: TForm1;
  iValor1: Real;
  iValor2: Real;
  iValorTotal: Real;
  iFuncao: Integer;
  bPrimeiraVez,bEquacaofeita:Boolean;



implementation

{$R *.dfm}


procedure TForm1.FormShow(Sender: TObject);
begin
  iValor1 := 0;
  iValor2 := 0;
  bPrimeiraVez:= true;
  bEquacaofeita:= false;
end;

procedure TForm1.SpButton0Click(Sender: TObject);
begin
 if not bEquacaofeita then
  visor.Text := visor.Text + (Sender as TSpeedButton).Caption
 else
 begin
   visor.Text := '';
   visor.Text := visor.Text + (Sender as TSpeedButton).Caption;
   bEquacaofeita:= false;
 end;
end;

procedure TForm1.SpButton1Click(Sender: TObject);
begin
 if not bEquacaofeita then
  visor.Text := visor.Text + (Sender as TSpeedButton).Caption
 else
 begin
   visor.Text := '';
   visor.Text := visor.Text + (Sender as TSpeedButton).Caption;
   bEquacaofeita:= false;
 end;
end;

procedure TForm1.SpButton2Click(Sender: TObject);
begin
 if not bEquacaofeita then
  visor.Text := visor.Text + (Sender as TSpeedButton).Caption
 else
 begin
   visor.Text := '';
   visor.Text := visor.Text + (Sender as TSpeedButton).Caption;
   bEquacaofeita:= false;
 end;
end;

procedure TForm1.SpButton3Click(Sender: TObject);
begin
 if not bEquacaofeita then
  visor.Text := visor.Text + (Sender as TSpeedButton).Caption
 else
 begin
   visor.Text := '';
   visor.Text := visor.Text + (Sender as TSpeedButton).Caption;
   bEquacaofeita:= false;
 end;
end;

procedure TForm1.SpButton4Click(Sender: TObject);
begin
 if not bEquacaofeita then
  visor.Text := visor.Text + (Sender as TSpeedButton).Caption
 else
 begin
   visor.Text := '';
   visor.Text := visor.Text + (Sender as TSpeedButton).Caption;
   bEquacaofeita:= false;
 end;
end;

procedure TForm1.SpButton5Click(Sender: TObject);
begin
 if not bEquacaofeita then
  visor.Text := visor.Text + (Sender as TSpeedButton).Caption
 else
 begin
   visor.Text := '';
   visor.Text := visor.Text + (Sender as TSpeedButton).Caption;
   bEquacaofeita:= false;
 end;
end;

procedure TForm1.SpButton6Click(Sender: TObject);
begin
 if not bEquacaofeita then
  visor.Text := visor.Text + (Sender as TSpeedButton).Caption
 else
 begin
   visor.Text := '';
   visor.Text := visor.Text + (Sender as TSpeedButton).Caption;
   bEquacaofeita:= false;
 end;
end;

procedure TForm1.SpButton7Click(Sender: TObject);
begin
 if not bEquacaofeita then
  visor.Text := visor.Text + (Sender as TSpeedButton).Caption
 else
 begin
   visor.Text := '';
   visor.Text := visor.Text + (Sender as TSpeedButton).Caption;
   bEquacaofeita:= false;
 end;
end;

procedure TForm1.SpButton8Click(Sender: TObject);
begin
 if not bEquacaofeita then
  visor.Text := visor.Text + (Sender as TSpeedButton).Caption
 else
 begin
   visor.Text := '';
   visor.Text := visor.Text + (Sender as TSpeedButton).Caption;
   bEquacaofeita:= false;
 end;
end;

procedure TForm1.SpButton9Click(Sender: TObject);
begin
 if not bEquacaofeita then
  visor.Text := visor.Text + (Sender as TSpeedButton).Caption
 else
 begin
   visor.Text := '';
   visor.Text := visor.Text + (Sender as TSpeedButton).Caption;
   bEquacaofeita:= false;
 end;
end;

procedure TForm1.SpButtonLimparClick(Sender: TObject);
begin
 visor.Text:='';
 iValor1:=0;
 iValor2:=0;
 iFuncao:=0;
 bPrimeiraVez:= true;
 bEquacaofeita:= false;
end;

procedure TForm1.SpButtonMaisMenosClick(Sender: TObject);
begin
 visor.Text:='-'+visor.Text;
end;

procedure TForm1.SpButtonPontoClick(Sender: TObject);
begin
  visor.Text := visor.Text + '.';
end;

procedure TForm1.SpButtonSomarClick(Sender: TObject);
begin
  if bPrimeiraVez then
    ivalor1 := StrToFloat(visor.Text)
  else
    ivalor1 := iValorTotal;
  visor.Text := '';
  ifuncao := 1;
  if not bPrimeiraVez then
    Equacoes;
end;

procedure TForm1.SpButtonSubtrairClick(Sender: TObject);
begin
  if  bPrimeiraVez then
    ivalor1 := StrToFloat(visor.Text)
  else
    ivalor1 := iValorTotal;
  visor.Text := '';
  ifuncao := 2;
 if not  bPrimeiraVez then
  Equacoes;
end;

procedure TForm1.SpButtonDividirClick(Sender: TObject);
begin
  if  bPrimeiraVez then
    ivalor1 := StrToFloat(visor.Text)
  else
    ivalor1 := iValorTotal;
  visor.Text := '';
  ifuncao := 3;
  if not bPrimeiraVez then
    Equacoes;
end;

procedure TForm1.SpButtonMultiplicarClick(Sender: TObject);
begin
  if  bPrimeiraVez then
    ivalor1 := StrToFloat(visor.Text)
  else
    ivalor1 := iValorTotal;
  visor.Text := '';
  ifuncao := 4;
  if not bPrimeiraVez then
    Equacoes;
end;

procedure TForm1.SpButtonIgualClick(Sender: TObject);
var
   cCalc: TCalc; // Objeto da Classe das Operações
begin

   Equacoes;

  {
   iValor2 :=StrToFloat(Visor.Text);
   case(ifuncao)of
     1: //Somar
     begin
       Visor.Text:= FloatToStr(cCalc.Somar(iValor1,iValor2));
     end;
     2: //Subtrair
     begin
       Visor.Text:= FloatToStr(cCalc.Subtrair(iValor1,iValor2));
     end;
     3: //Dividir
     begin
       if (iValor2 <> 0) then
          Visor.Text:= FloatToStr(cCalc.Dividir(iValor1,iValor2))
       else
       begin
         SHowMessage('Divisão por zero!!');
         visor.Text:='ERRO';
       end;
     end;
     4: //Multiplicar
     begin
       Visor.Text:= FloatToStr(cCalc.Multiplicar(iValor1,iValor2));
     end;
   end; }
end;


procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_NUMPAD1 then
    SpButton1.Click;
  if Key = VK_NUMPAD2 then
    SpButton2.click;
  if Key = VK_NUMPAD3 then
    SpButton3.click;
  if Key = VK_NUMPAD4 then
    SpButton4.click;
  if Key = VK_NUMPAD5 then
    SpButton5.click;
  if Key = VK_NUMPAD6 then
    SpButton6.click;
  if Key = VK_NUMPAD7 then
    SpButton7.click;
  if Key = VK_NUMPAD8 then
    SpButton8.click;
  if Key = VK_NUMPAD9 then
    SpButton9.click;
  if Key = VK_NUMPAD0 then
    SpButton0.click;
  if Key = VK_ADD then
    SpButtonSomar.click;
  if Key = VK_SUBTRACT then
    SpButtonSubtrair.click;
  if Key = VK_MULTIPLY then
    SpButtonMultiplicar.click;
  if Key = VK_DIVIDE then
    SpButtonDividir.click;
  if Key = VK_RETURN then
    SpButtonIgual.click;
  if Key = VK_DECIMAL then
    SpButtonPonto.Click;
  if Key = VK_DELETE then
    SpButtonLimpar.click;
end;

procedure Equacoes;
var
   cCalc: TCalc; // Objeto da Classe das Operações
begin
 with Form1 do
 begin
   bEquacaofeita:= true;
   iValor2 :=StrToFloat(Visor.Text);
   case(ifuncao)of
     1: //Somar
     begin
       Visor.Text:= FloatToStr(cCalc.Somar(iValor1,iValor2));
       iValorTotal:= cCalc.Somar(iValor1,iValor2);
     end;
     2: //Subtrair
     begin
       Visor.Text:= FloatToStr(cCalc.Subtrair(iValor1,iValor2));
       iValorTotal:= cCalc.Somar(iValor1,iValor2);
     end;
     3: //Dividir
     begin
       if (iValor2 <> 0) then
       begin
          Visor.Text:= FloatToStr(cCalc.Dividir(iValor1,iValor2));
          iValorTotal:= cCalc.Somar(iValor1,iValor2);
       end
       else
       begin
         SHowMessage('Não é possível fazer uma divisão por zero!');
         visor.Text:='0';
       end;
     end;
     4: //Multiplicar
     begin
       Visor.Text:= FloatToStr(cCalc.Multiplicar(iValor1,iValor2));
       iValorTotal:= cCalc.Somar(iValor1,iValor2);
     end;
   end;
 end;
  bPrimeiraVez:= false;
end;


end.
