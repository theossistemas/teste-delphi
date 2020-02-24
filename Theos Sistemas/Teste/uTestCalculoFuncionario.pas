unit uTestCalculoFuncionario;

interface

uses
  TestFramework, uFuncionario;

type
  TestTFuncionario = class(TTestCase)
  strict private
    FFuncionario: TFuncionario;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestCalculoIR;
    procedure TestCalculoINSS;
  end;

implementation

{ TestTFuncionario }

procedure TestTFuncionario.SetUp;
begin
  FFuncionario := TFuncionario.Create;
end;

procedure TestTFuncionario.TearDown;
begin
  FFuncionario.Free;
  FFuncionario := nil;
end;

procedure TestTFuncionario.TestCalculoINSS;
begin
  FFuncionario.IDFuncionario      := 1;
  FFuncionario.Nome               := 'Eduardo';
  FFuncionario.CPF                := '11111111111';
  FFuncionario.Salario            := 1000;
  FFuncionario.QtdeDependenteIR   := 2;
  FFuncionario.QtdeDependenteINSS := 1;
  CheckEquals(80,FFuncionario.CalcularINSS(FFuncionario), 'INSS com cálculo incorreto');
end;

procedure TestTFuncionario.TestCalculoIR;
begin
  FFuncionario.IDFuncionario      := 1;
  FFuncionario.Nome               := 'Eduardo';
  FFuncionario.CPF                := '11111111111';
  FFuncionario.Salario            := 1000;
  FFuncionario.QtdeDependenteIR   := 2;
  FFuncionario.QtdeDependenteINSS := 1;
  CheckEquals(120,FFuncionario.CalcularIR(FFuncionario), 'IR com cálculo incorreto');
end;

initialization
  RegisterTest(TestTFuncionario.Suite);

end.

