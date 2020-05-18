program CalculoImpostos;

uses
  Vcl.Forms,
  uFrmPrincipal in 'view\uFrmPrincipal.pas' {frmPrincipal},
  uFrmCadastroFuncionario in 'view\uFrmCadastroFuncionario.pas' {frmCadastroFuncionario},
  uFrmCalculoImpostos in 'view\uFrmCalculoImpostos.pas' {frmCaluloImpostos},
  uFuncoes in 'view\uFuncoes.pas',
  uDmConexao in 'DAO\uDmConexao.pas' {DmConexao: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDmConexao, DmConexao);
  Application.Run;
end.
