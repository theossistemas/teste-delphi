program Calculadora;

uses
  Vcl.Forms,
  uFrmCalculadora in 'uFrmCalculadora.pas' {FrmCalculadora},
  uCalculadora in 'uCalculadora.pas',
  uICalculadora in 'uICalculadora.pas',
  Types in 'Types.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmCalculadora, FrmCalculadora);
  Application.Run;
end.
