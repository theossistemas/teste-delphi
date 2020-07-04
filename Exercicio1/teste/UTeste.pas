unit UTeste;

interface
uses
  DUnitX.TestFramework, UCalculos;

type

  [TestFixture]
  TMyTestObject = class(TObject)
  private
    calculo : classCalculo;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [test]
    procedure TestaImpostoA;
    [test]
    procedure TestaImpostoB;
    [test]
    procedure TestaImpostoC;
  end;

implementation

procedure TMyTestObject.Setup;
begin
    calculo := classCalculo.Create;
end;

procedure TMyTestObject.TearDown;
begin
end;


procedure TMyTestObject.TestaImpostoA;
begin
     Assert.IsTrue( calculo.CalculaImpostoA(1000) = 199500,'UCalculos - Calculo do imposto A' );
end;

procedure TMyTestObject.TestaImpostoB;
begin
     Assert.IsTrue( calculo.CalculaImpostoB(1000) = 199485,'UCalculos - Calculo do imposto B' );
end;

procedure TMyTestObject.TestaImpostoC;
begin
     Assert.IsTrue( calculo.CalculaImpostoC(1000) = 398985,'UCalculos - Calculo do imposto C' );
end;

initialization
  TDUnitX.RegisterTestFixture(TMyTestObject);
end.
