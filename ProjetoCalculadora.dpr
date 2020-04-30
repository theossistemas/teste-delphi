program ProjetoCalculadora;

uses
  Vcl.Forms,
  uCalculadoraMain in 'View\uCalculadoraMain.pas' {frmCalculadoraMain},
  uClasseCalculadora in 'Model\uClasseCalculadora.pas',
  uControllerCalculadora in 'Controller\uControllerCalculadora.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCalculadoraMain, frmCalculadoraMain);
  Application.Run;
end.
