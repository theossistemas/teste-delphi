program Calculadora;

uses
  Vcl.Forms,
  uFormCalculadora in 'uFormCalculadora.pas' {frmCalculadora},
  uInterfaceOperacao in 'uInterfaceOperacao.pas',
  uOperacao in 'uOperacao.pas',
  uCalculadora in 'uCalculadora.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCalculadora, frmCalculadora);
  Application.Run;
end.
