program Theos.Test;
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
  Theos.Api.Calculadora.Test in 'Test\Theos.Api.Calculadora.Test.pas',
  Theos.Api.Calculadora in 'Api\Theos.Api.Calculadora.pas',
  Theos.Lib.Nullable in 'Lib\Theos.Lib.Nullable.pas',
  Theos.Lib.Resource in 'Lib\Theos.Lib.Resource.pas',
  Theos.Api.Pessoa.Test in 'Test\Theos.Api.Pessoa.Test.pas',
  Theos.Api.Pessoa in 'Api\Theos.Api.Pessoa.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

