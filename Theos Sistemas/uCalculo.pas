unit uCalculo;

interface

type
  TCalculo = class
  public
    class function Adicao(pN1, pN2: Double): Double; overload; virtual; abstract;
    class function Adicao(pN1, pN2: String): Double; overload; virtual; abstract;
    class function Adicao(pN1, pN2: Integer): Double; overload; virtual; abstract;
    class function Subtracao(pN1, pN2: Double): Double; overload; virtual; abstract;
    class function Subtracao(pN1, pN2: String): Double; overload; virtual; abstract;
    class function Subtracao(pN1, pN2: Integer): Double; overload; virtual; abstract;
    class function Multiplicacao(pN1, pN2: Double): Double; overload; virtual; abstract;
    class function Multiplicacao(pN1, pN2: String): Double; overload; virtual; abstract;
    class function Multiplicacao(pN1, pN2: Integer): Double; overload; virtual; abstract;
    class function Divisao(pN1, pN2: Double): Double; overload; virtual; abstract;
    class function Divisao(pN1, pN2: String): Double; overload; virtual; abstract;
    class function Divisao(pN1, pN2: Integer): Double; overload; virtual; abstract;
  end;

type
  TCalculoImposto = class(TCalculo)
  private
    FValorImposto: Double;

    procedure SetValorImposto(const Value: Double);
  public
    constructor Create;

    property ValorImposto: Double read FValorImposto write SetValorImposto;

    class function Adicao(pN1, pN2: Double): Double; overload; override;
    class function Adicao(pN1, pN2: String): Double; overload; override;
    class function Adicao(pN1, pN2: Integer): Double; overload; override;
    class function Subtracao(pN1, pN2: Double): Double; overload; override;
    class function Subtracao(pN1, pN2: String): Double; overload; override;
    class function Subtracao(pN1, pN2: Integer): Double; overload; override;
    class function Multiplicacao(pN1, pN2: Double): Double; overload; override;
    class function Multiplicacao(pN1, pN2: String): Double; overload; override;
    class function Multiplicacao(pN1, pN2: Integer): Double; overload; override;
    class function Divisao(pN1, pN2: Double): Double; overload; override;
    class function Divisao(pN1, pN2: String): Double; overload; override;
    class function Divisao(pN1, pN2: Integer): Double; overload; override;
    class function ImpostoA(pCalculoImposto: TCalculoImposto): Double;
    class function ImpostoB(pCalculoImposto: TCalculoImposto): Double;
    class function ImpostoC(pCalculoImposto: TCalculoImposto): Double;
  end;

implementation

uses
  Vcl.Dialogs, System.UITypes, System.SysUtils, Math;

{ TCalculoImposto }

class function TCalculoImposto.Adicao(pN1, pN2: Double): Double;
begin
  Result := pN1 + pN2;
end;

class function TCalculoImposto.Adicao(pN1, pN2: String): Double;
begin
  Result := StrToFloat(pN1) + StrToFloat(pN2);
end;

class function TCalculoImposto.Adicao(pN1, pN2: Integer): Double;
begin
  Result := pN1 + pN2;
end;

class function TCalculoImposto.Divisao(pN1, pN2: String): Double;
begin
  if (StrToFloat(pN2) <> 0) then
  begin
    Result := StrToFloat(pN1) / StrToFloat(pN2);
  end
  else
  begin
    raise Exception.Create('Não pode haver divisão por 0 (zero)');
  end;
end;

class function TCalculoImposto.Divisao(pN1, pN2: Double): Double;
begin
  if (pN2 <> 0) then
  begin
    Result := pN1 / pN2;
  end
  else
  begin
    raise Exception.Create('Não pode haver divisão por 0 (zero)');
  end;
end;

class function TCalculoImposto.Divisao(pN1, pN2: Integer): Double;
begin
  if (pN2 <> 0) then
  begin
    Result := pN1 / pN2;
  end
  else
  begin
    raise Exception.Create('Não pode haver divisão por 0 (zero)');
  end;
end;

class function TCalculoImposto.Multiplicacao(pN1, pN2: String): Double;
begin
  Result := StrToFloat(pN1) * StrToFloat(pN2);
end;

class function TCalculoImposto.Multiplicacao(pN1, pN2: Double): Double;
begin
  Result := pN1 * pN2;
end;

class function TCalculoImposto.Multiplicacao(pN1, pN2: Integer): Double;
begin
  Result := pN1 * pN2;
end;

class function TCalculoImposto.Subtracao(pN1, pN2: Integer): Double;
begin
  Result := pN1 - pN2;
end;

class function TCalculoImposto.Subtracao(pN1, pN2: String): Double;
begin
  Result := StrToFloat(pN1) - StrToFloat(pN2);
end;

class function TCalculoImposto.Subtracao(pN1, pN2: Double): Double;
begin
  Result := pN1 - pN2;
end;

constructor TCalculoImposto.Create;
begin
  FValorImposto := 0;
end;

class function TCalculoImposto.ImpostoA(pCalculoImposto: TCalculoImposto): Double;
begin
  Result := IfThen(pCalculoImposto.FValorImposto = 0,
                   0,
                   pCalculoImposto.Subtracao(pCalculoImposto.Multiplicacao(pCalculoImposto.FValorImposto, pCalculoImposto.Divisao(20, 100)), 500));
end;

class function TCalculoImposto.ImpostoB(pCalculoImposto: TCalculoImposto): Double;
begin
  Result := IfThen(pCalculoImposto.FValorImposto = 0,
                   0,
                   pCalculoImposto.Subtracao(Self.ImpostoA(pCalculoImposto), 15));
end;

class function TCalculoImposto.ImpostoC(pCalculoImposto: TCalculoImposto): Double;
begin
  Result := IfThen(pCalculoImposto.FValorImposto = 0,
                   0,
                   pCalculoImposto.Adicao(Self.ImpostoA(pCalculoImposto), Self.ImpostoB(pCalculoImposto)));
end;

procedure TCalculoImposto.SetValorImposto(const Value: Double);
begin
  if Value = 0 then
  begin
    MessageDlg('Valor para calcular o imposto não pode ser 0 (zero) ou nulo.', mtWarning, [mbOK], 0);
    Abort;
  end;

  FValorImposto := Value;
end;

end.
