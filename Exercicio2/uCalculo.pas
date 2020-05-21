unit uCalculo;

interface

uses uFuncionario, uDependente, Generics.Collections;

type
  TCalculo = class
  public
    function CalcularINSS(poFuncionario: TFuncionario): Double;
    function CalcularIR(poFuncionario: TFuncionario): Double;
  end;

implementation

{ TCalculo }

function TCalculo.CalcularINSS(poFuncionario: TFuncionario): Double;
var
  i: Integer;
  lsDependentes: TObjectList<TDependente>;
begin
  Result := 0;

  if poFuncionario.salario <= 0 then
    exit;

  lsDependentes := poFuncionario.dependentes;

  if lsDependentes.Count = 0 then
    exit;

  for i := 0 to lsDependentes.Count - 1 do
  begin
    if lsDependentes[i].calculaINSS = 'S' then
    begin
      Result := poFuncionario.salario * 0.08;
      break;
    end;
  end;
end;

function TCalculo.CalcularIR(poFuncionario: TFuncionario): Double;
var
  i: Integer;
  lsDependentes: TObjectList<TDependente>;
begin
  Result := 0;

  if poFuncionario.salario <= 0 then
    exit;

  Result := poFuncionario.salario;

  lsDependentes := poFuncionario.dependentes;

  if lsDependentes.Count > 0 then
  begin
    for i := 0 to lsDependentes.Count - 1 do
    begin
      if lsDependentes[i].calculaIR = 'S' then
        Result := Result - 100;
    end;
  end;

  Result := Result * 0.15;
end;

end.
