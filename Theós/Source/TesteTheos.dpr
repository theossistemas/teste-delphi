program TesteTheos;

uses
  Vcl.Forms,
  untFrmPrincipal in 'untFrmPrincipal.pas' {frmPrincipal},
  untFrmBase in 'untFrmBase.pas' {FrmBase},
  untFrmExercicio1 in 'untFrmExercicio1.pas' {FrmExercicio1},
  untCalculoImposto in 'untCalculoImposto.pas',
  untDtmExercicio2 in 'untDtmExercicio2.pas' {dtmExercicio2: TDataModule},
  untFrmExercicio2 in 'untFrmExercicio2.pas' {FrmExercicio2},
  untFuncionario in 'untFuncionario.pas',
  untDependente in 'untDependente.pas',
  untDAOExercicio2 in 'untDAOExercicio2.pas',
  untControllerExercicio2 in 'untControllerExercicio2.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
