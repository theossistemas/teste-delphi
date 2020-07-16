program TesteUnitarioTheos;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  untCalculoImpostoTest in 'untCalculoImpostoTest.pas',
  untCalculoImposto in '..\untCalculoImposto.pas',
  untCalcularImpostoExercicio2Test in 'untCalcularImpostoExercicio2Test.pas',
  untCalcularImpostoExercicio2 in '..\untCalcularImpostoExercicio2.pas',
  untFuncionario in '..\untFuncionario.pas',
  untDependente in '..\untDependente.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

