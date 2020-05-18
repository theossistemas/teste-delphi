program CalculoImpostos;

uses
  Vcl.Forms,
  uFrmPrincipal in 'view\uFrmPrincipal.pas' {frmPrincipal},
  uFrmCadastroFuncionario in 'view\uFrmCadastroFuncionario.pas' {frmCadastroFuncionario},
  uFrmCalculoImpostos in 'view\uFrmCalculoImpostos.pas' {frmCaluloImpostos},
  uFuncoes in 'view\uFuncoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
