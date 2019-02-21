program TesteUnidades;

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  TestUCalc in 'TestUCalc.pas',
  Classe in '..\Calculadora\Classe.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

