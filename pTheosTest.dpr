program pTheosTest;

uses
  Vcl.Forms,
  uFCalc in 'uFCalc.pas' {FCalc},
  uCalc in 'uCalc.pas',
  uFuncionario in 'uFuncionario.pas',
  uDependente in 'uDependente.pas',
  uDataBase in 'uDataBase.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFCalc, FCalc);
  Application.Run;
end.
