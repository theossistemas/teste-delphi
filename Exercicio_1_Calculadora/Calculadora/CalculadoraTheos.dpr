program CalculadoraTheos;

uses
  Vcl.Forms,
  unCalculadora in 'src\unCalculadora.pas',
  unFactoryOperacoes in 'src\unFactoryOperacoes.pas',
  unFrmCalculadora in 'src\unFrmCalculadora.pas' {frmPrincipal},
  unOperacoes in 'src\unOperacoes.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := False;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
