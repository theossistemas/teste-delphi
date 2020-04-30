unit uTestCalculadora;

interface

uses
  DUnitX.TestFramework, uClasseCalculadora;

type
  [TestFixture]
  TestTCalculadora = class(TObject)
  strict private
    FCalculadora: TCalculadora;
  private



  public
    [Setup]
    procedure SetUp;
    [TearDown]
    procedure TearDown;
  published
    [Test]
    procedure TestSomar;
    [Test]
    procedure TestMultiplicar;
    [Test]
    procedure TestSubtrair;
    [Test]
    procedure TestDividir;
    [Test]
    procedure TestCalcularImpostoA;
    [Test]
    procedure TestCalcularImpostoB;
    [Test]
    procedure TestCalcularImpostoC;
  end;

implementation

procedure TestTCalculadora.SetUp;
begin
  FCalculadora := TCalculadora.Create;
end;

procedure TestTCalculadora.TearDown;
begin
  FCalculadora.Free;
  FCalculadora := nil;
end;

procedure TestTCalculadora.TestSomar;
begin
  FCalculadora.PrimeiroValor := 10;
  FCalculadora.SegundoValor := 5;
  FCalculadora.Somar;
  Assert.IsTrue(FCalculadora.Resultado = 15, 'Erro: Soma incorreta');
end;

procedure TestTCalculadora.TestMultiplicar;
begin
  FCalculadora.PrimeiroValor := 10;
  FCalculadora.SegundoValor := 5;
  FCalculadora.Multiplicar;
  Assert.IsTrue(FCalculadora.Resultado = 50, 'Erro: Multiplicação incorreta');
end;

procedure TestTCalculadora.TestSubtrair;
begin
  FCalculadora.PrimeiroValor := 10;
  FCalculadora.SegundoValor := 5;
  FCalculadora.Subtrair;
  Assert.IsTrue(FCalculadora.Resultado = 5, 'Erro: Subtração incorreta' );
end;

procedure TestTCalculadora.TestDividir;
begin
  FCalculadora.PrimeiroValor := 10;
  FCalculadora.SegundoValor := 2;
  FCalculadora.Dividir;
  Assert.IsTrue(FCalculadora.Resultado = 5, 'Erro: Divisão incorreta' );
end;

procedure TestTCalculadora.TestCalcularImpostoA;
var
  nBaseCalculo: integer;
  nResultado: double;
begin
  FCalculadora.Resultado := 5000;
  nResultado := FCalculadora.CalcularImpostoA;
  Assert.IsTrue(nResultado = 500, 'Erro: Imposto A incorreto');
end;

procedure TestTCalculadora.TestCalcularImpostoB;
var
  nBaseCalculo: integer;
  nResultado: double;
begin
  FCalculadora.Resultado := 5000;
  nResultado := FCalculadora.CalcularImpostoB;
  Assert.IsTrue(nResultado = 485, 'Erro: Imposto B incorreto');
end;

procedure TestTCalculadora.TestCalcularImpostoC;
var
  nBaseCalculo: integer;
  nResultado: double;
begin
  FCalculadora.Resultado := 5000;
  nResultado := FCalculadora.CalcularImpostoC;
  Assert.IsTrue(nResultado = 985, 'Erro: Imposto C incorreto');
end;

initialization
  TDUnitX.RegisterTestFixture(TestTCalculadora);
end.
