unit uOperacoes;

interface

type
  TOperacoes = class
    public
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

end.
