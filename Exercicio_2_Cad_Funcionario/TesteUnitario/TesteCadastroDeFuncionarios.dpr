program TesteCadastroDeFuncionarios;
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
  TestunCalculaImpostos in 'TestunCalculaImpostos.pas',
  unCalculaImpostos in '..\SistemaCalculaImposto\Model\unCalculaImpostos.pas',
  unFuncionario in '..\SistemaCalculaImposto\Model\unFuncionario.pas',
  unDependente in '..\SistemaCalculaImposto\Model\unDependente.pas';

{$R *.RES}

begin
  ReportMemoryLeaksOnShutdown := False;
  DUnitTestRunner.RunRegisteredTests;
end.

