program calculadora;

uses
  Vcl.Forms,
  uFrmPrincipal in 'view\uFrmPrincipal.pas' {frmPrincipal},
  uCalculadora in 'control\uCalculadora.pas',
  uFuncoes in 'control\uFuncoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
