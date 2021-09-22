program TesteTheos;

uses
  Vcl.Forms,
  uCadastroDependente in 'Form\uCadastroDependente.pas' {frm_CadastroDependente},
  uCadastroFuncionario in 'Form\uCadastroFuncionario.pas' {frm_CadastroFuncionario},
  uCalculadora in 'Form\uCalculadora.pas' {fmr_Calculadora},
  uInicio in 'Form\uInicio.pas' {frm_Inicio},
  DataModule in 'Dm\DataModule.pas' {dm: TDataModule},
  uCalculo in 'Classes\uCalculo.pas',
  uDependente in 'Classes\uDependente.pas',
  uFuncionario in 'Classes\uFuncionario.pas',
  uPessoa in 'Classes\uPessoa.pas';
{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_Inicio, frm_Inicio);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(Tfmr_Calculadora, fmr_Calculadora);
  Application.CreateForm(Tfrm_CadastroDependente, frm_CadastroDependente);
  Application.CreateForm(Tfrm_CadastroDependente, frm_CadastroDependente);
  Application.CreateForm(Tfrm_CadastroFuncionario, frm_CadastroFuncionario);
  Application.CreateForm(Tfmr_Calculadora, fmr_Calculadora);
  Application.CreateForm(Tfrm_Inicio, frm_Inicio);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.