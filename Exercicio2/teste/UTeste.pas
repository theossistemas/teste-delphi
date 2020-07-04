unit UTeste;

interface

uses DUnitX.TestFramework, UControllers, System.SysUtils, math;

type

  [TestFixture]
  TMyTestObject = class(TObject) 
  private

  public
        FuncController : controllerFuncionario;
        [Setup]
        procedure Setup;
        [TearDown]
        procedure TearDown;
        [Test]
        procedure TestarCalculoINSS;

        [Test] procedure TestarCalculoIR;
  end;

implementation

procedure TMyTestObject.Setup;
begin
end;

procedure TMyTestObject.TearDown;
begin
end;


procedure TMyTestObject.TestarCalculoINSS;
var
  resultadoEsperado : Extended;
begin
     resultadoEsperado := 80;
     Assert.IsTrue(FuncController.CalculaINSS(1000) = resultadoEsperado, 'Controller Funcionario - Calcular INSS');
end;

procedure TMyTestObject.TestarCalculoIR;
var
  resultadoEsperado : Extended;
begin
     resultadoEsperado := 120;
     Assert.IsTrue( round( FuncController.CalculaIR(1000,2)) = round(resultadoEsperado), 'Controller Funcionario - Calcular IR');

end;

initialization
  TDUnitX.RegisterTestFixture(TMyTestObject);
end.
