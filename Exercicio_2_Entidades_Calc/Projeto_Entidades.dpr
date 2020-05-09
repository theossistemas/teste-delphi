program Projeto_Entidades;

uses
  Forms,
  uTela in 'uTela.pas' {Frm_EntidadesCalculo},
  uDMCadastro in 'uDMCadastro.pas' {DMCadastro: TDataModule},
  uTelaDependentes in 'uTelaDependentes.pas' {Frm_Dependentes},
  uobjCalculaImpostos in 'uobjCalculaImpostos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrm_EntidadesCalculo, Frm_EntidadesCalculo);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TFrm_Dependentes, Frm_Dependentes);
  Application.Run;
end.
