program Theos.Avaliacao;

{$WARN DUPLICATE_CTOR_DTOR OFF}

uses
  Vcl.Forms,
  Theos.View.Principal in 'View\Theos.View.Principal.pas' {ViewPrincipal},
  Theos.Controller.Principal in 'Controller\Theos.Controller.Principal.pas',
  Theos.View.Calculadora in 'View\Theos.View.Calculadora.pas' {ViewCalculadora},
  Theos.Controller.Calculadora in 'Controller\Theos.Controller.Calculadora.pas',
  Theos.Api.Calculadora in 'Api\Theos.Api.Calculadora.pas',
  Theos.Lib.Nullable in 'Lib\Theos.Lib.Nullable.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TControllerPrincipal.Instance;
  Application.Run;
end.
