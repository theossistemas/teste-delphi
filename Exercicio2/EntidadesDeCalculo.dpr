program EntidadesDeCalculo;

uses
  Vcl.Forms,
  uFormEntidadesDeCalculo in 'uFormEntidadesDeCalculo.pas' {frmEntidadesDeCalculo},
  uDataModulo in 'uDataModulo.pas' {DataModule1: TDataModule},
  uFuncionario in 'uFuncionario.pas',
  uDependente in 'uDependente.pas',
  uDAO in 'uDAO.pas',
  uControle in 'uControle.pas',
  uCalculo in 'uCalculo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmEntidadesDeCalculo, frmEntidadesDeCalculo);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
