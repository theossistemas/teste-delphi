unit uTestCalculadora;

interface

uses
  TestFramework, uCalculo;

type
  TestTCalculadora = class(TTestCase)
  strict private
    FCalculoImposto: TCalculoImposto;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestImpostoA;
    procedure TestImpostoB;
    procedure TestImpostoC;
    procedure TestAdicao;
    procedure TestSubtracao;
    procedure TestMultiplicacao;
    procedure TestDivisao;
  end;

implementation

{ TestTFuncionario }

procedure TestTCalculadora.SetUp;
begin
  FCalculoImposto := TCalculoImposto.Create;
end;

procedure TestTCalculadora.TearDown;
begin
  FCalculoImposto.Free;
  FCalculoImposto := nil;
end;

procedure TestTCalculadora.TestAdicao;
begin
  CheckEquals(6, FCalculoImposto.Adicao(3, 3), 'O resultado da soma deveria ser 6 (seis)');
end;

procedure TestTCalculadora.TestDivisao;
begin
  CheckEquals(1, FCalculoImposto.Divisao(3, 3), 'O quociente da divisão deveria ser 1 (um)');
end;

procedure TestTCalculadora.TestImpostoA;
begin
  FCalculoImposto.ValorImposto := 3000;
  CheckEquals(100, FCalculoImposto.ImpostoA(FCalculoImposto), 'Imposto A com cálculo incorreto');
end;

procedure TestTCalculadora.TestImpostoB;
begin
  FCalculoImposto.ValorImposto := 3000;
  CheckEquals(85, FCalculoImposto.ImpostoB(FCalculoImposto), 'Imposto B com cálculo incorreto');
end;

procedure TestTCalculadora.TestImpostoC;
begin
  FCalculoImposto.ValorImposto := 3000;
  CheckEquals(185, FCalculoImposto.ImpostoC(FCalculoImposto), 'Imposto C com cálculo incorreto');
end;

procedure TestTCalculadora.TestMultiplicacao;
begin
  CheckEquals(9, FCalculoImposto.Multiplicacao(3, 3), 'O produto da multiplicação deveria ser 9 (nove)');
end;

procedure TestTCalculadora.TestSubtracao;
begin
  CheckEquals(0, FCalculoImposto.Subtracao(3, 3), 'A diferença da subtração deveria ser 0 (zero)');
end;

initialization
  RegisterTest(TestTCalculadora.Suite);

end.

