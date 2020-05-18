program CalculoImpostos;

uses
  Vcl.Forms,
  uFrmPrincipal in 'view\uFrmPrincipal.pas' {frmPrincipal},
  uFrmCadastroFuncionario in 'view\uFrmCadastroFuncionario.pas' {frmCadastroFuncionario},
  uFrmCalculoImpostos in 'view\uFrmCalculoImpostos.pas' {frmCaluloImpostos},
  uFuncoes in 'view\uFuncoes.pas',
  uDmConexao in 'DAO\uDmConexao.pas' {DmConexao: TDataModule},
  uFuncionario in 'model\uFuncionario.pas',
  uDmFuncionario in 'DAO\uDmFuncionario.pas' {DmFuncionario: TDataModule},
  uFuncionarioController in 'controller\uFuncionarioController.pas',
  uDependente in 'model\uDependente.pas',
  uDmDependente in 'DAO\uDmDependente.pas' {DmDependente: TDataModule},
  uDependenteController in 'controller\uDependenteController.pas',
  uDmFuncionarioDependente in 'DAO\uDmFuncionarioDependente.pas' {DmFuncionarioDependente: TDataModule},
  uFuncionarioDependente in 'model\uFuncionarioDependente.pas',
  uFuncionarioDependenteController in 'controller\uFuncionarioDependenteController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDmConexao, DmConexao);
  Application.CreateForm(TDmFuncionarioDependente, DmFuncionarioDependente);
  Application.Run;
end.
