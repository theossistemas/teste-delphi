unit uCalculadoraTestes;

interface

uses
  TestFramework, SysUtils, uObjCalculadora;

type
  TCalculadoraTestes = class(TTestCase)
  private
    FCalculadora: TCalculadora;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestGetResultadoSoma;
    procedure TestGetResultadoMultiplicacao;
    procedure TestGetResultadoSubtracao;
    procedure TestGetResultadoDivisao;
    procedure TestGetResultadoSemPrimeiroNumero;
    procedure TestGetResultadoSemSegundoNumero;
    procedure TestGetResultadoDivisaoZero;
    procedure TestCalcularImpostoA;
    procedure TestCalcularImpostoB;
    procedure TestCalcularImpostoC;
  end;

implementation

{ TCalculadoraTestes }

procedure TCalculadoraTestes.SetUp;
begin
  inherited;
  FCalculadora := TCalculadora.Create;
end;

procedure TCalculadoraTestes.TearDown;
begin
  inherited;
  FCalculadora.Free;
end;

procedure TCalculadoraTestes.TestCalcularImpostoA;
var
 nResultado: String;
begin
  nResultado := FCalculadora.CalcularImpostoA('4000');
  CheckEquals('300',nResultado,'Cálculo do imposto A está incorreto.');
end;

procedure TCalculadoraTestes.TestCalcularImpostoB;
var
 nResultado: String;
begin
  FCalculadora.SetImpostoA(450);
  nResultado := FCalculadora.CalcularImpostoB;
  CheckEquals('435',nResultado,'Cálculo do imposto B está incorreto.');
end;

procedure TCalculadoraTestes.TestCalcularImpostoC;
var
 nResultado: String;
begin
  FCalculadora.SetImpostoA(1000);
  FCalculadora.SetImpostoB(985);
  nResultado := FCalculadora.CalcularImpostoC;
  CheckEquals('1985',nResultado,'Cálculo do imposto C está incorreto.');
end;

procedure TCalculadoraTestes.TestGetResultadoDivisao;
var
  sResultado: string;
begin
  FCalculadora.PrimeiroValor := '25';
  FCalculadora.SegundoValor := '2';
  FCalculadora.OperacaoAtual := oDivisao;
  sResultado := FCalculadora.GetResultado;
  CheckEquals('12,5',sResultado,'Divisão incorreta.');
end;

procedure TCalculadoraTestes.TestGetResultadoDivisaoZero;
var
  sResultado: string;
begin
  FCalculadora.PrimeiroValor := '3';
  FCalculadora.SegundoValor := '0';
  FCalculadora.OperacaoAtual := oDivisao;
  try
    sResultado := FCalculadora.GetResultado;
  except
    on e: Exception do
      Check(True, 'Exceção não ocorreu como esperado.');
  end;
end;

procedure TCalculadoraTestes.TestGetResultadoMultiplicacao;
var
  sResultado: string;
begin
  FCalculadora.PrimeiroValor := '3';
  FCalculadora.SegundoValor := '5';
  FCalculadora.OperacaoAtual := oMultiplicacao;
  sResultado := FCalculadora.GetResultado;
  CheckEquals('15',sResultado,'Multiplicação incorreta.');
end;

procedure TCalculadoraTestes.TestGetResultadoSemPrimeiroNumero;
var
  sResultado: string;
begin
  FCalculadora.SegundoValor := '2';
  FCalculadora.OperacaoAtual := oSoma;
  sResultado := FCalculadora.GetResultado;
  CheckEquals('2',sResultado,'Resultado incorreto.');
end;

procedure TCalculadoraTestes.TestGetResultadoSemSegundoNumero;
var
  sResultado: string;
begin
  FCalculadora.PrimeiroValor := '3';
  FCalculadora.OperacaoAtual := oSubtracao;
  sResultado := FCalculadora.GetResultado;
  CheckEquals('3',sResultado,'Resultado incorreto.');
end;

procedure TCalculadoraTestes.TestGetResultadoSoma;
var
  sResultado: string;
begin
  FCalculadora.PrimeiroValor := '1';
  FCalculadora.SegundoValor := '2';
  FCalculadora.OperacaoAtual := oSoma;
  sResultado := FCalculadora.GetResultado;
  CheckEquals('3',sResultado,'Soma incorreta.');
end;

procedure TCalculadoraTestes.TestGetResultadoSubtracao;
var
  sResultado: string;
begin
  FCalculadora.PrimeiroValor := '10';
  FCalculadora.SegundoValor := '3';
  FCalculadora.OperacaoAtual := oSubtracao;
  sResultado := FCalculadora.GetResultado;
  CheckEquals('7',sResultado,'Subtração incorreta.');
end;

initialization
  TestFramework.RegisterTest('Tests Calculadora Suite', TCalculadoraTestes.Suite);

end.
