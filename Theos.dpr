program Theos;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {Form1},
  UCalculadora in 'UCalculadora.pas',
  UModCalculadora in 'UModCalculadora.pas' {FrmCalculadora};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFrmCalculadora, FrmCalculadora);
  Application.Run;
end.
