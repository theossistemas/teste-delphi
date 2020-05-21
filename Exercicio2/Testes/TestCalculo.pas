unit TestCalculo;

interface

uses
  TestFramework, Generics.Collections, uFuncionario, uDependente, uCalculo,
  System.SysUtils;

type

  TestTCalculo = class(TTestCase)
  strict private
    FCalculo: TCalculo;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestCalcularINSS;
    procedure TestCalcularIR;
    procedure TestCalcularINSSSemSalario;
    procedure TestCalcularINSSSemDependente;
    procedure TestCalcularIRSemSalario;
    procedure TestCalcularIRSemDependente;
  end;

implementation

procedure TestTCalculo.SetUp;
begin
  FCalculo := TCalculo.Create;
end;

procedure TestTCalculo.TearDown;
begin
  FreeAndNil(FCalculo);
end;

procedure TestTCalculo.TestCalcularINSS;
var
  dResultado: Double;
  oDependente: TDependente;
  oFuncionario: TFuncionario;
begin
  oFuncionario := TFuncionario.Create;
  oFuncionario.salario := 1000;
  oDependente := TDependente.Create;
  oDependente.calculaINSS := 'S';
  oDependente.calculaIR := 'S';
  oFuncionario.dependentes.Add(oDependente);
  oDependente := TDependente.Create;
  oDependente.calculaINSS := 'N';
  oDependente.calculaIR := 'S';
  oFuncionario.dependentes.Add(oDependente);
  oDependente := TDependente.Create;
  oDependente.calculaINSS := 'N';
  oDependente.calculaIR := 'N';
  oFuncionario.dependentes.Add(oDependente);

  dResultado := FCalculo.CalcularINSS(oFuncionario);
  CheckEquals(80,dResultado,'Valor INSS incorreto!');
end;

procedure TestTCalculo.TestCalcularIR;
var
  dResultado: Double;
  oDependente: TDependente;
  oFuncionario: TFuncionario;
begin
  oFuncionario := TFuncionario.Create;
  oFuncionario.salario := 1000;
  oDependente := TDependente.Create;
  oDependente.calculaINSS := 'S';
  oDependente.calculaIR := 'S';
  oFuncionario.dependentes.Add(oDependente);
  oDependente := TDependente.Create;
  oDependente.calculaINSS := 'N';
  oDependente.calculaIR := 'S';
  oFuncionario.dependentes.Add(oDependente);
  oDependente := TDependente.Create;
  oDependente.calculaINSS := 'N';
  oDependente.calculaIR := 'N';
  oFuncionario.dependentes.Add(oDependente);

  dResultado := FCalculo.CalcularIR(oFuncionario);
  CheckEquals(120,dResultado,'Valor IR incorreto!');
end;

procedure TestTCalculo.TestCalcularIRSemDependente;
var
  dResultado: Double;
  oFuncionario: TFuncionario;
begin
  oFuncionario := TFuncionario.Create;
  oFuncionario.salario := 1000;

  dResultado := FCalculo.CalcularIR(oFuncionario);
  CheckEquals(150,dResultado,'Valor IR incorreto!');
end;

procedure TestTCalculo.TestCalcularIRSemSalario;
var
  dResultado: Double;
  oDependente: TDependente;
  oFuncionario: TFuncionario;
begin
  oFuncionario := TFuncionario.Create;
  oFuncionario.salario := 0;
  oDependente := TDependente.Create;
  oDependente.calculaINSS := 'S';
  oDependente.calculaIR := 'S';
  oFuncionario.dependentes.Add(oDependente);

  dResultado := FCalculo.CalcularIR(oFuncionario);
  CheckEquals(0,dResultado,'Valor IR incorreto!');
end;

procedure TestTCalculo.TestCalcularINSSSemDependente;
var
  dResultado: Double;
  oFuncionario: TFuncionario;
begin
  oFuncionario := TFuncionario.Create;
  oFuncionario.salario := 1000;

  dResultado := FCalculo.CalcularINSS(oFuncionario);
  CheckEquals(0,dResultado,'Valor INSS incorreto!');
end;

procedure TestTCalculo.TestCalcularINSSSemSalario;
var
  dResultado: Double;
  oDependente: TDependente;
  oFuncionario: TFuncionario;
begin
  oFuncionario := TFuncionario.Create;
  oFuncionario.salario := 0;
  oDependente := TDependente.Create;
  oDependente.calculaINSS := 'S';
  oDependente.calculaIR := 'S';
  oFuncionario.dependentes.Add(oDependente);

  dResultado := FCalculo.CalcularINSS(oFuncionario);
  CheckEquals(0,dResultado,'Valor INSS incorreto!');
end;

initialization
  RegisterTest(TestTCalculo.Suite);
end.

