program Exec2;

uses
  Vcl.Forms,
  Funcionario in 'Funcionario.pas' {FrmFuncionario},
  uConexaoBanco in 'uConexaoBanco.pas',
  uControle in 'uControle.pas',
  uDependenteControle in 'uDependenteControle.pas',
  uFuncionarioControle in 'uFuncionarioControle.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmFuncionario, FrmFuncionario);
  Application.Run;
end.
