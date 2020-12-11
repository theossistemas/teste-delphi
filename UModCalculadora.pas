unit UModCalculadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  UCalculadora;

type
  TFrmCalculadora = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    edtvalor: TEdit;
    edtoperacao: TEdit;
    BitBtn20: TBitBtn;
    BitBtn21: TBitBtn;
    BitBtn22: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
  private
    { Private declarations }
  public

    FlagPrimeiraVez : integer;

    FCalculadora : TCalculadora;

    procedure Operacao(variavel : string);

    { Public declarations }
  end;

var
  FrmCalculadora: TFrmCalculadora;

implementation

{$R *.dfm}

procedure TFrmCalculadora.BitBtn10Click(Sender: TObject);
begin
  Operacao('5');
end;

procedure TFrmCalculadora.BitBtn11Click(Sender: TObject);
begin
  Operacao('6');
end;

procedure TFrmCalculadora.BitBtn12Click(Sender: TObject);
begin
  Operacao('-');
end;

procedure TFrmCalculadora.BitBtn13Click(Sender: TObject);
begin
  Operacao('7');
end;

procedure TFrmCalculadora.BitBtn14Click(Sender: TObject);
begin
  Operacao('8');
end;

procedure TFrmCalculadora.BitBtn15Click(Sender: TObject);
begin
  Operacao('9');
end;

procedure TFrmCalculadora.BitBtn16Click(Sender: TObject);
begin
  Operacao('*');
end;

procedure TFrmCalculadora.BitBtn17Click(Sender: TObject);
begin
  edtvalor.Clear;
  edtoperacao.Clear;
  FlagPrimeiraVez := 0;
end;

procedure TFrmCalculadora.BitBtn18Click(Sender: TObject);
begin
  Operacao('/');
end;

procedure TFrmCalculadora.BitBtn19Click(Sender: TObject);
begin
  Operacao('%');
end;

procedure TFrmCalculadora.BitBtn1Click(Sender: TObject);
begin
  Operacao('<');
end;

procedure TFrmCalculadora.BitBtn20Click(Sender: TObject);
begin

  Try
    StrToFloat(edtvalor.text)
  Except
    begin
      Showmessage('Informe um Valor para Executar a Função');
      exit;
    end;
  End;

  edtoperacao.Text := edtvalor.Text + '*' + '20%' + ' - 500';
  edtvalor.Text := FloatToStr(FCalculadora.FuncaoA(strtofloat(edtvalor.Text)));

end;

procedure TFrmCalculadora.BitBtn21Click(Sender: TObject);
begin

  Try
    StrToFloat(edtvalor.text)
  Except
    begin
      Showmessage('Informe um Valor para Executar a Função');
      exit;
    end;
  End;

  edtoperacao.Text := '(' + edtvalor.Text + '*' + '20%' + ' - 500' + ') - 15';
  edtvalor.Text := FloatToStr(FCalculadora.FuncaoB(strtofloat(edtvalor.Text)));

end;

procedure TFrmCalculadora.BitBtn22Click(Sender: TObject);
begin

  Try
    StrToFloat(edtvalor.text)
  Except
    begin
      Showmessage('Informe um Valor para Executar a Função');
      exit;
    end;
  End;

  edtoperacao.Text := '(' + edtvalor.Text + '*' + '20%' + ' - 500' + ') + ' +
                      '(' + edtvalor.Text + '*' + '20%' + ' - 500' + ') - 15';
  edtvalor.Text := FloatToStr(FCalculadora.FuncaoC(strtofloat(edtvalor.Text)));

end;

procedure TFrmCalculadora.BitBtn2Click(Sender: TObject);
begin
  Operacao('0');
end;

procedure TFrmCalculadora.BitBtn3Click(Sender: TObject);
begin
  Operacao(',');
end;

procedure TFrmCalculadora.BitBtn4Click(Sender: TObject);
begin
  Operacao('=');
end;

procedure TFrmCalculadora.BitBtn5Click(Sender: TObject);
begin
  Operacao('1');
end;

procedure TFrmCalculadora.BitBtn6Click(Sender: TObject);
begin
  Operacao('2');
end;

procedure TFrmCalculadora.BitBtn7Click(Sender: TObject);
begin
  Operacao('3');

end;

procedure TFrmCalculadora.BitBtn8Click(Sender: TObject);
begin
  Operacao('+');
end;

procedure TFrmCalculadora.BitBtn9Click(Sender: TObject);
begin
  Operacao('4');
end;

procedure TFrmCalculadora.FormCreate(Sender: TObject);
begin
  FlagPrimeiraVez := 0;
  FCalculadora := TCalculadora.Create;
end;

procedure TFrmCalculadora.Operacao(variavel: string);
var
Str : string;
begin

  Str := edtoperacao.Text;

  if variavel = '<' then begin
    Delete(str,length(Str),1);
    edtoperacao.Text := Str;
    exit;
  end;

  if FlagPrimeiraVez = 0 then begin
    if StrToIntDef(variavel,999) = 999 then begin
      FlagPrimeiraVez := 1;
    end;
    if StrToIntDef(variavel,999) <> 999 then begin
      edtvalor.Text := edtvalor.Text + variavel;
    end;
  end;

  edtoperacao.Text := edtoperacao.Text + variavel;

  if variavel = '=' then begin
    edtvalor.Text := FCalculadora.Operacao(edtoperacao.Text);
  end;

end;

end.
