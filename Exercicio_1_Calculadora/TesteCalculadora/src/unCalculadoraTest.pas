unit unCalculadoraTest;

interface

uses
   TestFramework, unOperacoes;

type

  TCalculadora = class(TTestCase)
  public
    procedure Setup;
    procedure TearDown;

  published
    procedure Adicao;
    procedure Subtracao;
    procedure Multiplicacao;
    procedure Divisao;
    procedure OperacaoImpostoA ;
    procedure OperacaoImpostoB ;
    procedure OperacaoImpostoC ;
  end;

implementation

uses
  System.SysUtils;

procedure TCalculadora.Divisao;
var
  vOperacaoDivisao: IOperacao;
begin
  vOperacaoDivisao := TOperacaoDivisao.Create;
  CheckEquals(250, vOperacaoDivisao.Calcular([5000, 20]));
end;

procedure TCalculadora.Multiplicacao;
var
  vOperacaoMultiplicacao: IOperacao;
begin
  vOperacaoMultiplicacao := TOperacaoMultiplicacao.Create;
  CheckEquals(5000, vOperacaoMultiplicacao.Calcular([250, 20]));
end;

procedure TCalculadora.OperacaoImpostoA;
var
  vOperacaoImpostoA: IOperacao;
begin
  vOperacaoImpostoA := TOperacaoImpostoA.Create;
  CheckEquals(1100, vOperacaoImpostoA.Calcular([8000]));
end;

procedure TCalculadora.OperacaoImpostoB;
var
  vOperacaoImpostoB: IOperacao;
begin
  vOperacaoImpostoB := TOperacaoImpostoB.Create;
  CheckEquals(1085, vOperacaoImpostoB.Calcular([8000]));
end;

procedure TCalculadora.OperacaoImpostoC;
var
  vOperacaoImpostoC: IOperacao;
begin
  vOperacaoImpostoC := TOperacaoImpostoC.Create;
  CheckEquals(2185, vOperacaoImpostoC.Calcular([8000]));
end;

procedure TCalculadora.Setup;
begin

end;

procedure TCalculadora.Subtracao;
var
  vOperacaoSubtracao: IOperacao;
begin
  vOperacaoSubtracao := TOperacaoSubtracao.Create;
  CheckEquals(50, vOperacaoSubtracao.Calcular([56.00, 6.00]));
end;


procedure TCalculadora.TearDown;
begin
end;

procedure TCalculadora.Adicao;
var
  vOperacaoAdicao: IOperacao;
begin
  vOperacaoAdicao := TOperacaoAdicao.Create;
  CheckEquals(14.5, vOperacaoAdicao.Calcular([8.9, 5.6]));
end;

initialization

RegisterTest(TCalculadora.Suite);

end.
