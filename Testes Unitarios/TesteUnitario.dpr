program TesteUnitario;

uses
  Forms,
  TestFrameWork,
  GuiTestRunner,
  uobjCalculaImpostos in '..\uobjCalculaImpostos.pas',
  uImpostosTestes in 'uImpostosTestes.pas',
  uFuncionario in '..\Entidades\uFuncionario.pas',
  uDependente in '..\Entidades\uDependente.pas';

{$R *.res}

begin
  Application.Initialize;
  GUITestRunner.RunRegisteredTests;
end.
