program ProjetoEntidadesCalculo;

uses
  Vcl.Forms,
  uEntidadesCalculoMain in 'View\uEntidadesCalculoMain.pas' {frmEntidadesCalculoMain},
  uClasseFuncionario in 'Model\uClasseFuncionario.pas',
  uControllerFuncionario in 'Controller\uControllerFuncionario.pas',
  uEntity in 'Framework\uEntity.pas',
  uEntityFuncionario in 'Framework\uEntityFuncionario.pas',
  uEntityAtributo in 'Framework\uEntityAtributo.pas',
  uDMBaseDados in 'Framework\uDMBaseDados.pas' {dmBaseDados: TDataModule},
  uGenericDAO in 'Framework\uGenericDAO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmEntidadesCalculoMain, frmEntidadesCalculoMain);
  Application.CreateForm(TdmBaseDados, dmBaseDados);
  Application.Run;
end.
