unit Classe;

interface

uses System.SysUtils;

type
  TCalc = class(TObject)
  private
    FBotao: String;
    FVisor: String;
    FSoma: String;
    FSubt: String;
    FMult : double;
    FImpA : string;

  protected
    procedure setBotao (v1: String);

  public
      procedure setSubt (v1: String);

    function Mult(x, y: double): double;
    function Soma(x, y: string): string;
    function ImpA(x : string): string;
    function ImpB(x : string): string;
    function ImpC( x, y : string): string;

    property Botao:String read FBotao write setBotao;
    property Visor:String read FVisor write FVisor;
    property Subt:String read FSubt write setSubt;

  end;

implementation

// Preeche o LVisor com o valor definido

procedure TCalc.setBotao(v1: string);
begin
  if (FVisor='0') then
  begin
    FBotao := v1;
  end
  else
  begin
    FBotao := FVisor + v1;
  end;
end;

// Trata a Subtraçao de Valores
procedure TCalc.setSubt(v1: string);
begin
  FSubt := FormatFloat( '###0' ,(StrToFloat(v1) - (StrToFloat(FVisor))));
end;

// Efetua a Soma de x + y
function TCalc.Soma( x, y : string) : string;
begin
  Result := FormatFloat( '###0' ,(StrToFloat(x) + StrToFloat(y)));
end;

// Retorna o produto de x * y
 function TCalc.Mult(x, y: double): double;
 begin
   Result := x * y;
 end;

 // Calcula Imposto A (Valor * 20% - 500)
 function TCalc.ImpA( x : string): string;
 begin
   result := FormatFloat( '###0' ,(StrToFloat(x)*(20/100))-500);
 end;

  // Calcula Imposto B (Valor_Imposto_A - 15)
 function TCalc.ImpB( x : string): string;
 begin
   result := FormatFloat( '###0' ,((StrToFloat(x)-15)));
 end;

  // Calcula Imposto C (Valor_Imposto_A + Valor_Imposto_B)
 function TCalc.ImpC( x, y : string): string;
 begin
   result := FormatFloat( '###0' ,((StrToFloat(x)+StrToFloat(y))));
 end;

end.
