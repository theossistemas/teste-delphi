unit TestCalculadora;

interface

uses
  TestFramework, System.SysUtils, uInterfaceOperacao, uCalculadora, uOperacao;

type
  TestTCalculadora = class(TTestCase)
  strict private
    FCalculadora: TCalculadora;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestSimboloParaOperadorSoma;
    procedure TestSimboloParaOperadorSubtracao;
    procedure TestSimboloParaOperadorDivisao;
    procedure TestSimboloParaOperadorMultiplicacao;
    procedure TestSimboloParaOperadorIgual;
    procedure TestSimboloParaOperadorNenhum;
    procedure TestOperadorParaSimboloSoma;
    procedure TestOperadorParaSimboloSubtracao;
    procedure TestOperadorParaSimboloDivisao;
    procedure TestOperadorParaSimboloMultiplicacao;
    procedure TestOperadorParaSimboloNenhum;
    procedure TestCalcularResultadoOperadorIgual;
    procedure TestCalcularResultadoOperadorDoisOperadores;
    procedure TestCalcularResultadoOperadorPressionadoOperador;
    procedure TestCalcularResultadoOperadorDivisaoPorZero;
    procedure TestCalcularResultadoOperadorDivisaoZeroPorZero;
    procedure TestImpostoA;
    procedure TestImpostoB;
    procedure TestImpostoAMenorZero;
    procedure TestImpostoBMenorZero;
    procedure TestImpostoC;
  end;

implementation

procedure TestTCalculadora.SetUp;
begin
  FCalculadora := TCalculadora.Create;
end;

procedure TestTCalculadora.TearDown;
begin
  FreeAndNil(FCalculadora);
end;

procedure TestTCalculadora.TestSimboloParaOperadorSoma;
var
  eOperador: TOperador;
begin
  eOperador := FCalculadora.SimboloParaOperador(SOMA);
  CheckEquals(Ord(opSoma),Ord(eOperador),'Operador incorreto!');
end;

procedure TestTCalculadora.TestSimboloParaOperadorSubtracao;
var
  eOperador: TOperador;
begin
  eOperador := FCalculadora.SimboloParaOperador(SUBTRACAO);
  CheckEquals(Ord(opSubtracao),Ord(eOperador),'Operador incorreto!');
end;

procedure TestTCalculadora.TestSimboloParaOperadorDivisao;
var
  eOperador: TOperador;
begin
  eOperador := FCalculadora.SimboloParaOperador(DIVISAO);
  CheckEquals(Ord(opDivisao),Ord(eOperador),'Operador incorreto!');
end;

procedure TestTCalculadora.TestSimboloParaOperadorMultiplicacao;
var
  eOperador: TOperador;
begin
  eOperador := FCalculadora.SimboloParaOperador(MULTIPLICACAO);
  CheckEquals(Ord(opMultiplicacao),Ord(eOperador),'Operador incorreto!');
end;

procedure TestTCalculadora.TestSimboloParaOperadorIgual;
var
  eOperador: TOperador;
begin
  eOperador := FCalculadora.SimboloParaOperador(IGUAL);
  CheckEquals(Ord(opNenhuma),Ord(eOperador),'Operador incorreto!');
end;

procedure TestTCalculadora.TestSimboloParaOperadorNenhum;
var
  eOperador: TOperador;
begin
  eOperador := FCalculadora.SimboloParaOperador(VAZIO);
  CheckEquals(Ord(opNenhuma),Ord(eOperador),'Operador incorreto!');
end;

procedure TestTCalculadora.TestOperadorParaSimboloDivisao;
var
  sOperador: string;
begin
  sOperador := FCalculadora.OperadorParaSimbolo(opDivisao);
  CheckEquals(DIVISAO,sOperador,'Operador incorreto!');
end;

procedure TestTCalculadora.TestOperadorParaSimboloMultiplicacao;
var
  sOperador: string;
begin
  sOperador := FCalculadora.OperadorParaSimbolo(opMultiplicacao);
  CheckEquals(MULTIPLICACAO,sOperador,'Operador incorreto!');
end;

procedure TestTCalculadora.TestOperadorParaSimboloNenhum;
var
  sOperador: string;
begin
  sOperador := FCalculadora.OperadorParaSimbolo(opNenhuma);
  CheckEquals(VAZIO,sOperador,'Operador incorreto!');
end;

procedure TestTCalculadora.TestOperadorParaSimboloSoma;
var
  sOperador: string;
begin
  sOperador := FCalculadora.OperadorParaSimbolo(opSoma);
  CheckEquals(SOMA,sOperador,'Operador incorreto!');
end;

procedure TestTCalculadora.TestOperadorParaSimboloSubtracao;
var
  sOperador: string;
begin
  sOperador := FCalculadora.OperadorParaSimbolo(opSubtracao);
  CheckEquals(SUBTRACAO,sOperador,'Operador incorreto!');
end;

procedure TestTCalculadora.TestCalcularResultadoOperadorDivisaoPorZero;
var
  sResultado: string;
begin
  sResultado := FCalculadora.CalcularResultado('10', opDivisao);
  sResultado := FCalculadora.CalcularResultado('0', opIgual);
  CheckEquals('Não é possível dividir por zero',sResultado,'Valor inválido retornado!')
end;

procedure TestTCalculadora.TestCalcularResultadoOperadorDivisaoZeroPorZero;
var
  sResultado: string;
begin
  sResultado := FCalculadora.CalcularResultado('0', opDivisao);
  sResultado := FCalculadora.CalcularResultado('0', opIgual);
  CheckEquals('Resultado infinito',sResultado,'Valor inválido retornado!')
end;

procedure TestTCalculadora.TestCalcularResultadoOperadorDoisOperadores;
var
  sResultado: string;
begin
  sResultado := FCalculadora.CalcularResultado('25', opSoma);
  sResultado := FCalculadora.CalcularResultado('10', opSubtracao);
  sResultado := FCalculadora.CalcularResultado('5', opDivisao);
  sResultado := FCalculadora.CalcularResultado('2', opSoma);
  CheckEquals('15',sResultado,'Valor inválido retornado!')
end;

procedure TestTCalculadora.TestCalcularResultadoOperadorIgual;
var
  sResultado: string;
begin
  sResultado := FCalculadora.CalcularResultado('25', opIgual);
  CheckEquals('25',sResultado,'Valor inválido retornado!')
end;

procedure TestTCalculadora.TestCalcularResultadoOperadorPressionadoOperador;
var
  sResultado: string;
begin
  sResultado := FCalculadora.CalcularResultado('25', opSoma);
  FCalculadora.pressionadoOperacao := True;
  sResultado := FCalculadora.CalcularResultado('25', opSubtracao);
  CheckEquals('25',sResultado,'Valor inválido retornado!')
end;

procedure TestTCalculadora.TestImpostoA;
var
  sImposto: string;
begin
  sImposto := FCalculadora.ImpostoA('10000');
  CheckEquals('1500',sImposto,'ImpostoA inválido!');
end;

procedure TestTCalculadora.TestImpostoAMenorZero;
var
  sImposto: string;
begin
  sImposto := FCalculadora.ImpostoA('1000');
  CheckEquals('0',sImposto,'ImpostoA inválido!');
end;

procedure TestTCalculadora.TestImpostoB;
var
  sImposto: string;
begin
  sImposto := FCalculadora.ImpostoB('10000');
  CheckEquals('1485',sImposto,'ImpostoB inválido!');
end;

procedure TestTCalculadora.TestImpostoBMenorZero;
var
  sImposto: string;
begin
  sImposto := FCalculadora.ImpostoB('1000');
  CheckEquals('0',sImposto,'ImpostoB inválido!');
end;

procedure TestTCalculadora.TestImpostoC;
var
  sImposto: string;
begin
  sImposto := FCalculadora.ImpostoC('10000');
  CheckEquals('2985',sImposto,'ImpostoC inválido!');

end;

initialization
  RegisterTest(TestTCalculadora.Suite);
end.

