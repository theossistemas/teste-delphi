program Exercicio1;

uses
  Vcl.Forms,
  Calculadora in 'Calculadora.pas' {Form_Calculadora},
  UCalculos in 'UCalculos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm_Calculadora, Form_Calculadora);
  Application.Run;
end.
