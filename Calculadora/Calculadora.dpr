program Calculadora;

uses
  Vcl.Forms,
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  unClasseCalculadora in 'Classes\unClasseCalculadora.pas',
  unClasseImpostos in 'Classes\unClasseImpostos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
