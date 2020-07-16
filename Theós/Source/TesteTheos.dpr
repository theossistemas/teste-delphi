program TesteTheos;

uses
  Vcl.Forms,
  untFrmPrincipal in 'untFrmPrincipal.pas' {frmPrincipal},
  untFrmBase in 'untFrmBase.pas' {FrmBase},
  untFrmExercicio1 in 'untFrmExercicio1.pas' {FrmExercicio1},
  untFrmExercicio2 in 'untFrmExercicio2.pas' {FrmExercicio2},
  untCalculoImposto in 'untCalculoImposto.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
