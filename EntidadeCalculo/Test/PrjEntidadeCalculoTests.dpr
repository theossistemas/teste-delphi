program PrjEntidadeCalculoTests;
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
  TestUConexao in 'TestUConexao.pas',
  UConexao in '..\UConexao.pas',
  TestUFuncionario in 'TestUFuncionario.pas',
  UFuncionario in '..\Entidades\UFuncionario.pas',
  UDependente in '..\Entidades\UDependente.pas',
  TestUFuncionarioPersist in 'TestUFuncionarioPersist.pas',
  UFuncionarioPersist in '..\Persistencia\UFuncionarioPersist.pas',
  UIPersist in '..\Persistencia\UIPersist.pas',
  UDependentePersist in '..\Persistencia\UDependentePersist.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

