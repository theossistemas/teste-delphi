program pTheosTest;

uses
  Vcl.Forms,
  uFCalc in 'uFCalc.pas' {FCalc},
  uCalc in 'uCalc.pas',
  uFuncionario in 'uFuncionario.pas',
  uDependente in 'uDependente.pas',
  uDataBase in 'uDataBase.pas',
  uTest in 'uTest.pas' {FTest},
  uFTestFuncionarioDependente in 'uFTestFuncionarioDependente.pas' {FTestFuncionarioDependente};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFTest, FTest);
  Application.CreateForm(TFTestFuncionarioDependente, FTestFuncionarioDependente);
  Application.Run;
end.
