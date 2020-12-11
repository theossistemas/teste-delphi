unit UCalculadora;

interface

uses
  System.SysUtils, System.Variants, System.Classes, Vcl.Dialogs, StrUtils;

type

  TCalculadora = class
  private
  public
    constructor Create;
    destructor Destroy; override;
    function Operacao(const aStr: string): string;
    function FuncaoA(const aValor: double): double;
    function FuncaoB(const aValor: double): double;
    function FuncaoC(const aValor: double): double;
  end;

  TCalculadoraFuncao = class (TCalculadora)
  public
  end;

implementation

{ TCalculadora }

constructor TCalculadora.Create;
begin
end;

destructor TCalculadora.Destroy;
begin
  Free;
  inherited;
end;

function TCalculadora.FuncaoA(const aValor: double): double;
begin
 Result := ( avalor * (20/100)) - 500;
end;

function TCalculadora.FuncaoB(const aValor: double): double;
begin
  Result := FuncaoA(aValor) - 15;
end;

function TCalculadora.FuncaoC(const aValor: double): double;
begin
  Result := FuncaoA(aValor) + FuncaoB(aValor);
end;

function TCalculadora.Operacao(const aStr: string): string;
var
  Indexador, Primeiravez : Integer;
  Str, Stra, Sinal, Operador, nanterior, natual : String;
  resultado : Double;
begin

  if  pos('/0',aStr) > 0 then begin
    Result := 'Error';
    exit;
  end;


  Str := '';
  Indexador := 0;

  Primeiravez := 0;

  nanterior := '';
  natual    := '';
  resultado := 0;

  Operador := 'N';

  while  Indexador <= Length(aStr) do begin

    Indexador := Indexador + 1;

    Str := copy(aStr,indexador,1);

    Stra := '';
    if (Str = '+') or (Str = '-') or (Str = '*') or (Str = '/') or (Str = '%')  then begin
      if Primeiravez = 1 then begin
        Stra := Str;
        Str  := sinal;
      end;
    end;

    if Str = '+' then begin
      if Primeiravez = 0 then begin
        resultado := StrToFloat(nanterior);
      end;
      if Primeiravez = 1 then begin
        resultado := resultado + StrToFloat(natual);
      end;
      natual := '';
      Primeiravez := 1;
      if Stra = ''  then sinal := '+' else sinal := Stra;
      Continue;
    end;
    if Str = '-' then begin
      if Primeiravez = 0 then begin
        resultado := StrToFloat(nanterior);
      end;
      if Primeiravez = 1 then begin
        resultado := resultado - StrToFloat(natual);
      end;
      natual := '';
      if Stra = ''  then sinal := '-' else sinal := Stra;
      Primeiravez := 1;
      Continue;
    end;
    if Str = '*' then begin
      if Primeiravez = 0 then begin
        resultado := StrToFloat(nanterior);
      end;
      if Primeiravez = 1 then begin
        resultado := resultado * StrToFloat(natual);
      end;
      natual := '';
      if Stra = ''  then sinal := '*' else sinal := Stra;
      Primeiravez := 1;
      Continue;
    end;
    if Str = '/' then begin
      sinal := '/';
      if Primeiravez = 0 then begin
        resultado := StrToFloat(nanterior);
      end;
      if Primeiravez = 1 then begin
        resultado := resultado / StrToFloat(natual);
      end;
      natual := '';
      if Stra = ''  then sinal := '/' else sinal := Stra;
      Primeiravez := 1;
      Continue;
    end;
    if Str = '%' then begin
      if Primeiravez = 0 then begin
        resultado := StrToFloat(nanterior);
      end;
      if Primeiravez = 1 then begin
        resultado := resultado / StrToFloat(natual);
      end;
      natual := '';
      if Stra = ''  then sinal := '/' else sinal := Stra;
      Primeiravez := 1;
      Continue;
    end;

    if Str = '=' then begin
      case AnsiIndexStr(sinal,['+','-','*','/','%']) of
        0 : resultado := resultado + StrToFloat(natual);
        1 : resultado := resultado - StrToFloat(natual);
        2 : resultado := resultado * StrToFloat(natual);
        3 : resultado := resultado / StrToFloat(natual);
        4 : resultado := resultado / StrToFloat(natual);
      end;
    end;

    if PrimeiraVez = 0 then begin
      nanterior := nanterior + Str;
    end;
    if PrimeiraVez = 1 then begin
      natual := natual + Str;
    end;

  end;

  Result := FloatToStr(resultado);
end;

{
function TImpostoCalc.GetImpostoA(const aBaseCalculo: double): double;
begin
  Result := (aBaseCalculo * 0.02) - 500;
end;

function TImpostoCalc.GetImpostoB(const aBaseCalculo: double): double;
begin
  Result := Self.GetImpostoA(aBaseCalculo) - 15;
end;

function TImpostoCalc.GetImpostoC(const aBaseCalculo: double): double;
begin
  Result := Self.GetImpostoA(aBaseCalculo) + Self.GetImpostoB(aBaseCalculo);
end;
}

end.
