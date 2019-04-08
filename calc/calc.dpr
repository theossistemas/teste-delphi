program calc;

uses
  Vcl.Forms,
  UFPrincipal in 'UFPrincipal.pas' {frmCalc},
  Common.Constante in 'common\Common.Constante.pas',
  Entities.Calculadora in 'entities\Entities.Calculadora.pas',
  Entities.Calculadora.Interfaces in 'entities\Entities.Calculadora.Interfaces.pas',
  Entities.Calculadora.Somar in 'entities\Entities.Calculadora.Somar.pas',
  Entities.Calculadora.Subtrair in 'entities\Entities.Calculadora.Subtrair.pas',
  Entities.Calculadora.Multiplicar in 'entities\Entities.Calculadora.Multiplicar.pas',
  Entities.Calculadora.Dividir in 'entities\Entities.Calculadora.Dividir.pas',
  Entities.Calculadora.Operacao in 'entities\Entities.Calculadora.Operacao.pas',
  Entities.Calculadora.Eventos in 'entities\Entities.Calculadora.Eventos.pas',
  Controller.Calculadora in 'controllers\Controller.Calculadora.pas',
  Controller.Calculadora.Interfaces in 'controllers\Controller.Calculadora.Interfaces.pas',
  Controller.Calculadora.Eventos in 'controllers\Controller.Calculadora.Eventos.pas',
  Entities.Calculadora.ImpostoA in 'entities\Entities.Calculadora.ImpostoA.pas',
  Entities.Calculadora.ImpostoB in 'entities\Entities.Calculadora.ImpostoB.pas',
  Entities.Calculadora.ImpostoC in 'entities\Entities.Calculadora.ImpostoC.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 Blue');
  Application.CreateForm(TfrmCalc, frmCalc);
  Application.Run;
end.
