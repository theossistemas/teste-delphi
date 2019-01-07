program Calculadora;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {FrmPrincipal},
  uIOperacaoMatematica in 'uIOperacaoMatematica.pas',
  uCalculadora in 'uCalculadora.pas',
  uSomar in 'uSomar.pas',
  uSubtrair in 'uSubtrair.pas',
  uDividir in 'uDividir.pas',
  uMultiplicar in 'uMultiplicar.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
