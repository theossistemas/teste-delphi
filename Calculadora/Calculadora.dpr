program Calculadora;

uses
  Vcl.Forms,
  FormCalc in '..\..\..\Documents\Embarcadero\Studio\Projects\FormCalc.pas' {Form1},
  ClassCalc in '..\..\..\Documents\Embarcadero\Studio\Projects\ClassCalc.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
