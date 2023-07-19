program CalculoFuncionario;

uses
  Vcl.Forms,
  unPrincipal in 'View\unPrincipal.pas' {frmPrincipal},
  Funcionario in 'Classe\Entidade\Funcionario.pas',
  Dependente in 'Classe\Entidade\Dependente.pas',
  unCadFuncionario in 'View\unCadFuncionario.pas' {frmCadFuncionario},
  unControllerFuncionario in 'Classe\Controller\unControllerFuncionario.pas',
  unDAOFuncionario in 'Classe\DAO\unDAOFuncionario.pas',
  unConection in 'Classe\Conexao\unConection.pas',
  unCadDependente in 'View\unCadDependente.pas' {frmCadDependente},
  unDAODependente in 'Classe\DAO\unDAODependente.pas',
  unControllerDependente in 'Classe\Controller\unControllerDependente.pas',
  unPesquisa in 'View\unPesquisa.pas' {frmPesquisa},
  unMaskEditHelper in 'Helper\unMaskEditHelper.pas',
  unUtils in 'Utils\unUtils.pas',
  unCalculaImpostos in 'unCalculaImpostos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
