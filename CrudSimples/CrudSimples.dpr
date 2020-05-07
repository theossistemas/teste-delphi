program CrudSimples;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form1},
  uClasses in 'uClasses.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := True;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
