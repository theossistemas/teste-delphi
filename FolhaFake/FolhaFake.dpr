program FolhaFake;

uses
  Vcl.Forms,
  UMain in 'UMain.pas' {FMain},
  dm in 'dm.pas' {Dm1: TDataModule},
  myLib in 'C:\Users\Panda\Documents\GitHub\teste-delphi\FolhaFake\myLib.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TDm1, Dm1);
  Application.Run;
end.
