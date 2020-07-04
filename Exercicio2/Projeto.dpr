program Projeto;

uses
  Vcl.Forms,
  Exercicio2 in 'Exercicio2.pas' {Form_Funcionario},
  UModels in 'UModels.pas',
  UControllers in 'UControllers.pas',
  UConexao in 'UConexao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm_Funcionario, Form_Funcionario);
  Application.Run;
end.
