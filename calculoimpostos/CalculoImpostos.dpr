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
  uFuncionarioController in 'controller\uFuncionarioController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDmConexao, DmConexao);
  Application.Run;
end.
