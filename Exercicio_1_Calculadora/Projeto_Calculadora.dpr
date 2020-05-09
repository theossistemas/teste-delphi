program Projeto_Calculadora;

uses
  Forms,
  uCalculadora in 'uCalculadora.pas' {Frm_Calculadora},
  uObjCalculadora in 'uObjCalculadora.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrm_Calculadora, Frm_Calculadora);
  Application.Run;
end.
