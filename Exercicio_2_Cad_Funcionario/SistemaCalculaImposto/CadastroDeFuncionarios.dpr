program CadastroDeFuncionarios;

uses
  Vcl.Forms,
  unFuncionario in 'Model\unFuncionario.pas',
  unDependente in 'Model\unDependente.pas',
  unCalculaImpostos in 'Model\unCalculaImpostos.pas',
  unIDataBase in 'Repository\Interface\unIDataBase.pas',
  unIRepository in 'Repository\Interface\unIRepository.pas',
  unFactoryConnection in 'Repository\unFactoryConnection.pas',
  unFactoryQuery in 'Repository\unFactoryQuery.pas',
  unFireDacConnection in 'Repository\unFireDacConnection.pas',
  unFireDacQuery in 'Repository\unFireDacQuery.pas',
  unIFuncionarioRepository in 'Repository\Interface\unIFuncionarioRepository.pas',
  unFuncionarioRepository in 'Repository\unFuncionarioRepository.pas',
  unFuncionarioController in 'Controller\unFuncionarioController.pas',
  unFuncionarioService in 'Service\unFuncionarioService.pas',
  unDependenteController in 'Controller\unDependenteController.pas',
  unDependenteService in 'Service\unDependenteService.pas',
  unIDependenteRepository in 'Repository\Interface\unIDependenteRepository.pas',
  unDependenteRepository in 'Repository\unDependenteRepository.pas',
  unMyLibrary in 'Library\unMyLibrary.pas',
  unIModelGenerico in 'Model\Interface\unIModelGenerico.pas',
  unEnum in 'View\unEnum.pas',
  unTelaHeranca in 'View\unTelaHeranca.pas' {frmTelaHeranca},
  unFrmFuncionario in 'View\unFrmFuncionario.pas' {frmFuncionarios},
  unDmGeral in 'View\unDmGeral.pas' {dmGeral: TDataModule},
  unFormBase in 'View\unFormBase.pas',
  unFormBasePadrao in 'View\unFormBasePadrao.pas' {frmFormBasePadrao},
  unFrmConfigBanco in 'View\unFrmConfigBanco.pas' {frmConfigBanco},
  unFrmPrincipal in 'View\unFrmPrincipal.pas' {frmPrincipal};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := False;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmGeral, dmGeral);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
