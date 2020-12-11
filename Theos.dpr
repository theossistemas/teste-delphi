program Theos;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal},
  UCalculadora in 'UCalculadora.pas',
  UModCalculadora in 'UModCalculadora.pas' {FrmCalculadora},
  UFuncionarioControle in 'UFuncionarioControle.pas',
  UControle in 'UControle.pas',
  UConexaoBanco in 'UConexaoBanco.pas',
  UCadFuncionario in 'UCadFuncionario.pas' {FrmFuncionario};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmCalculadora, FrmCalculadora);
  Application.CreateForm(TFrmFuncionario, FrmFuncionario);
  Application.Run;
end.
