unit uClasseCalculadora;

interface

type
  TCalculadora = class
  private
    FResultado: double;
    FResultadoAnterior: double;
    FPrimeiroValor: double;
    FSegundoValor: double;
    procedure SetPrimeiroValor(const Value: double);
    procedure SetSegundoValor(const Value: double);
    procedure SetResultado(const Value: double);
    procedure SetResultadoAnterior;
  public
    constructor Create;
    procedure Dividir;
    procedure Multiplicar;
    procedure Somar;
    procedure Subtrair;
    function CalcularImpostoA: double;
    function CalcularImpostoB: double;
    function CalcularImpostoC: double;
    property PrimeiroValor: double read FPrimeiroValor write SetPrimeiroValor;
    property SegundoValor: double read FSegundoValor write SetSegundoValor;
    property Resultado: double read FResultado write SetResultado;
  end;

implementation

{ TCalculadora }

constructor TCalculadora.Create;
begin
  FResultado := 0;
end;

procedure TCalculadora.SetPrimeiroValor(const Value: double);
begin
  FPrimeiroValor := Value;
end;

procedure TCalculadora.SetSegundoValor(const Value: double);
begin
  FSegundoValor := Value;
end;


procedure TCalculadora.SetResultado(const Value: double);
begin
  FResultado := Value;
  SetResultadoAnterior;
end;

procedure TCalculadora.SetResultadoAnterior;
begin
  if FResultado = FResultadoAnterior then
    exit;

  FResultadoAnterior := FResultado;
end;

procedure TCalculadora.Dividir;
begin
  FResultado := FPrimeiroValor / FSegundoValor;
end;

procedure TCalculadora.Multiplicar;
begin
  FResultado := FPrimeiroValor * FSegundoValor;
end;

procedure TCalculadora.Somar;
begin
  FResultado := FPrimeiroValor + FSegundoValor;
end;

procedure TCalculadora.Subtrair;
begin
  FResultado := FPrimeiroValor - FSegundoValor;
end;

function TCalculadora.CalcularImpostoA: double;
begin
  Result := (FResultado * 0.2) - 500;
end;

function TCalculadora.CalcularImpostoB: double;
begin
  Result := CalcularImpostoA - 15;
end;

function TCalculadora.CalcularImpostoC: double;
begin
  Result := CalcularImpostoA + CalcularImpostoB;
end;

end.
