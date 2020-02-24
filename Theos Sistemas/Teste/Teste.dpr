program Teste;

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  uTestCalculadora in 'uTestCalculadora.pas',
  uTestCalculoFuncionario in 'uTestCalculoFuncionario.pas',
  uFuncionario in '..\uFuncionario.pas',
  uPessoa in '..\uPessoa.pas',
  DataModulo in '..\DataModulo.pas' {dm: TDataModule},
  uCadastroFuncionario in '..\uCadastroFuncionario.pas' {frm_CadastroFuncionario},
  uCadastroDependente in '..\uCadastroDependente.pas' {frm_CadastroDependente},
  uDependente in '..\uDependente.pas',
  uCalculadora in '..\uCalculadora.pas' {fmr_Calculadora},
  uCalculo in '..\uCalculo.pas';

{$R *.res}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

