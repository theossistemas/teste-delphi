unit unOperacoes;

interface

uses
  System.SysUtils;

type
  IOperacao = Interface
    ['{E8818C31-A404-4ED8-B9DE-53054E726D48}']
    function Calcular(pListaOperadores: array of Double): Double;
  End;

  TOperacaoAdicao = class(TInterfacedObject, IOperacao)
  public
    function Calcular(pListaOperadores: array of Double): Double;
  end;

  TOperacaoSubtracao = class(TInterfacedObject, IOperacao)
  public
    function Calcular(pListaOperadores: array of Double): Double;
  end;

  TOperacaoMultiplicacao = class(TInterfacedObject, IOperacao)
  public
    function Calcular(pListaOperadores: array of Double): Double;
  end;

  TOperacaoDivisao = class(TInterfacedObject, IOperacao)
  public
    function Calcular(pListaOperadores: array of Double): Double;
  end;

  TOperacaoImpostoA = class(TInterfacedObject, IOperacao)
  public
    function Calcular(pListaOperadores: array of Double): Double;
  end;

  TOperacaoImpostoB = class(TInterfacedObject, IOperacao)
  public
    function Calcular(pListaOperadores: array of Double): Double;
  end;

  TOperacaoImpostoC = class(TInterfacedObject, IOperacao)
  public
    function Calcular(pListaOperadores: array of Double): Double;
  end;

implementation

{ TOpercaoAdicao }
function TOperacaoAdicao.Calcular(pListaOperadores: array of Double): Double;
var
  i: integer;
begin
  for i := Low(pListaOperadores) to High(pListaOperadores) do
  begin
    if i = 0 then
      result := pListaOperadores[i]
    else
      result := result + pListaOperadores[i];
  end;
end;

{ TOpercaoSubtracao }

function TOperacaoSubtracao.Calcular(pListaOperadores: array of Double): Double;
var
  i: integer;
begin
  for i := Low(pListaOperadores) to High(pListaOperadores) do
  begin
    if i = 0 then
      result := pListaOperadores[i]
    else
      result := result - pListaOperadores[i];
  end;
end;

{ TOpercaoMultiplicacao }

function TOperacaoMultiplicacao.Calcular(pListaOperadores
  : array of Double): Double;
var
  i: integer;
begin
  for i := Low(pListaOperadores) to High(pListaOperadores) do
  begin
    if i = 0 then
      result := pListaOperadores[i]
    else
      result := result * pListaOperadores[i];
  end;
end;

{ TOpercaoDivisao }

function TOperacaoDivisao.Calcular(pListaOperadores: array of Double): Double;
var
  i: integer;
begin
  for i := Low(pListaOperadores) to High(pListaOperadores) do
  begin
    if i = 0 then
      result := pListaOperadores[i]
    else
    begin
      if pListaOperadores[i] = 0 then
        raise Exception.Create('Divisão por Zero não é uma operação válida.');
      result := result / pListaOperadores[i];
    end;
  end;
end;

{ TOpercaoImpostoA }

function TOperacaoImpostoA.Calcular(pListaOperadores: array of Double): Double;
var
  AuxImposto: Double;
const
  IMPOSTO = 0.2;
  FATOR_DE_SUBTRACAO = 500;
begin
  AuxImposto := pListaOperadores[0];
  AuxImposto := (AuxImposto * IMPOSTO) - FATOR_DE_SUBTRACAO;
  if AuxImposto < 0 then
    AuxImposto := 0;

  result := AuxImposto;
end;

{ TOpercaoImpostoB }

function TOperacaoImpostoB.Calcular(pListaOperadores: array of Double): Double;
const
  FATOR_DE_SUBTRACAO = 15;
var
  vImpostoA: IOperacao;
  AuxImposto: Double;
begin
  vImpostoA := TOperacaoImpostoA.Create;
  AuxImposto := vImpostoA.Calcular(pListaOperadores);

  result := AuxImposto - FATOR_DE_SUBTRACAO;
  if result < 0 then
    result := 0;
end;

{ TOpercaoImpostoC }

function TOperacaoImpostoC.Calcular(pListaOperadores: array of Double): Double;
var
  vImpostoA, vImpostoB: IOperacao;
  AuxImpostoA, AuxImpostoB: Double;
begin
  vImpostoA := TOperacaoImpostoA.Create;
  AuxImpostoA := vImpostoA.Calcular(pListaOperadores);

  vImpostoB := TOperacaoImpostoB.Create;
  AuxImpostoB := vImpostoB.Calcular(pListaOperadores);

  result := AuxImpostoA + AuxImpostoB;

end;

end.
