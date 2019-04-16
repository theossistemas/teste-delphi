program PCalculadora;

uses
  Forms,
  untCalculadora in 'untCalculadora.pas' {frmCalculadora};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmCalculadora, frmCalculadora);
  Application.Run;
end.
