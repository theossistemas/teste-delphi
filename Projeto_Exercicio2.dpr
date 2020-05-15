program Projeto_Exercicio2;

uses
  Forms,
  TelaCadastro in 'TelaCadastro.pas' {Frm_TelaExercicio2},
  uFuncionario in 'Entidades\uFuncionario.pas',
  uDependente in 'Entidades\uDependente.pas',
  uDMCadastro in 'uDMCadastro.pas' {DMCadastro: TDataModule},
  uControllerCadastro in 'Controller\uControllerCadastro.pas',
  uFuncionarioDAO in 'DAO\uFuncionarioDAO.pas',
  uobjCalculaImpostos in 'uobjCalculaImpostos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrm_TelaExercicio2, Frm_TelaExercicio2);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.Run;
end.
