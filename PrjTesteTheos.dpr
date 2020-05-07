program PrjTesteTheos;

uses
  Vcl.Forms,
  UDm in 'UDm.pas' {FrmDM: TDataModule},
  UDados in 'UDados.pas',
  UFuncionario in 'UFuncionario.pas',
  UDependente in 'UDependente.pas',
  UFuncionarioDados in 'UFuncionarioDados.pas',
  UCadastro in 'UCadastro.pas' {FrmCadastro};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmCadastro, FrmCadastro);
  Application.Run;
end.
