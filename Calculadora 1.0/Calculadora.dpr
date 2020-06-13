program Calculadora;

uses
  Vcl.Forms,
  UFrmCalculadora in 'UFrmCalculadora.pas' {FrmCalculadora},
  UIObserverCalculos in 'UIObserverCalculos.pas',
  UICalculadora in 'UICalculadora.pas',
  UFactoryCalculadora in 'UFactoryCalculadora.pas',
  UCalculadora in 'UCalculadora.pas',
  UCalculadoraImpostos in 'UCalculadoraImpostos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TFactoryCalculadora.CriarCalculadora;
  ReportMemoryLeaksOnShutdown := true;
  Application.Run;
end.
