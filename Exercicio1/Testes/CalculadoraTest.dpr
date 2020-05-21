program CalculadoraTest;

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  TestCalculadora in 'TestCalculadora.pas',
  uInterfaceOperacao in '..\uInterfaceOperacao.pas',
  uOperacao in '..\uOperacao.pas',
  uCalculadora in '..\uCalculadora.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

