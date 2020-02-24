program TheoSistemas;

uses
  Vcl.Forms,
  uIniciar in 'uIniciar.pas' {frm_Iniciar},
  uPessoa in 'uPessoa.pas',
  uFuncionario in 'uFuncionario.pas',
  uDependente in 'uDependente.pas',
  uCadastroFuncionario in 'uCadastroFuncionario.pas' {frm_CadastroFuncionario},
  DataModulo in 'DataModulo.pas' {dm: TDataModule},
  uCadastroDependente in 'uCadastroDependente.pas' {frm_CadastroDependente},
  uCalculadora in 'uCalculadora.pas' {fmr_Calculadora},
  uCalculo in 'uCalculo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_Iniciar, frm_Iniciar);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(Tfrm_CadastroDependente, frm_CadastroDependente);
  Application.CreateForm(Tfmr_Calculadora, fmr_Calculadora);
  Application.Run;
end.
