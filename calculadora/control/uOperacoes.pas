unit uOperacoes;

interface

type
  TOperacoes = class
    public
      function somar(primeiroNumero: Double; segundoNumero: Double) : Double;
      function subtrair(primeiroNumero: Double; segundoNumero: Double) : Double;
      function dividir(primeiroNumero: Double; segundoNumero: Double) : Double;
      function multiplicar(primeiroNumero: Double; segundoNumero: Double) : Double;
      function calcularImpostoA(baseCalculo: Double) : Double;
      function calcularImpostoB(baseCalculo: Double) : Double;
      function calcularImpostoC(baseCalculo: Double) : Double;
  end;

implementation

{ TOperacoes }

function TOperacoes.calcularImpostoA(baseCalculo: Double): Double;
begin
  Result := (baseCalculo * 0.20) - 500;
end;

function TOperacoes.calcularImpostoB(baseCalculo: Double): Double;
begin
  Result := calcularImpostoA(baseCalculo) - 15;
end;

function TOperacoes.calcularImpostoC(baseCalculo: Double): Double;
begin
  Result := calcularImpostoA(baseCalculo) + calcularImpostoB(baseCalculo);
end;

function TOperacoes.dividir(primeiroNumero, segundoNumero: Double): Double;
begin
  Result := primeiroNumero / segundoNumero;
end;

function TOperacoes.multiplicar(primeiroNumero, segundoNumero: Double): Double;
begin
  Result := primeiroNumero * segundoNumero;
end;

function TOperacoes.somar(primeiroNumero, segundoNumero: Double): Double;
begin
  Result := primeiroNumero + segundoNumero;
end;

function TOperacoes.subtrair(primeiroNumero, segundoNumero: Double): Double;
begin
  Result := primeiroNumero - segundoNumero;
end;

end.
