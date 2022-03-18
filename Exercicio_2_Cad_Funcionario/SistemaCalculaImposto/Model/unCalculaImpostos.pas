unit unCalculaImpostos;

interface

uses
  unFuncionario, unDependente;

type
  ICalculaImposto = Interface
    ['{390DB8F4-3115-4D26-A651-976A4E44C880}']
    function Calcular(pFuncionario: TFuncionario): Double;
  End;

  TCalculaImpostoIR = class(TInterfacedObject, ICalculaImposto)
    function Calcular(pFuncionario: TFuncionario): Double; overload;
  end;

  TCalculaImpostoINSS = class(TInterfacedObject, ICalculaImposto)
    function Calcular(pFuncionario: TFuncionario): Double; overload;
  end;

implementation

{ TCalculaImpostoIR }

function TCalculaImpostoIR.Calcular(pFuncionario: TFuncionario): Double;
const
  FATOR_PERCENTUAL_IR = 0.15;
  FATOR_BASE_DESCONTO_IR = 100.00;
var
  vQtdDependentesIsCalculaIR: Byte;
  vDependente: TDependente;
  vTotalDoIR : Real;
begin
  vQtdDependentesIsCalculaIR := 0;
  for vDependente in pFuncionario.ListaDendentes do
    if vDependente.CalcularIR then
      inc(vQtdDependentesIsCalculaIR);

  vTotalDoIR :=  pFuncionario.Salario - (vQtdDependentesIsCalculaIR * FATOR_BASE_DESCONTO_IR);

  Result := vTotalDoIR * FATOR_PERCENTUAL_IR;
end;

{ TCalculaImpostoINSS }

function TCalculaImpostoINSS.Calcular(pFuncionario: TFuncionario): Double;
const
  FATOR_PERCENTUAL_INSS = 0.08;
var
  vTotalDoINSS: Real;
  vDependente: TDependente;
begin
  vTotalDoINSS := 0;

  for vDependente in pFuncionario.ListaDendentes do
  begin
    if vDependente.CalcularINSS then
    begin
      vTotalDoINSS := vTotalDoINSS +
        (pFuncionario.Salario * FATOR_PERCENTUAL_INSS);
      Break
    end;
  end;

  Result := vTotalDoINSS;
end;

end.
