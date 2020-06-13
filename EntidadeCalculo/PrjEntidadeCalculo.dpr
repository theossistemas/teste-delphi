program PrjEntidadeCalculo;

uses
  Vcl.Forms,
  UFrmFuncionario in 'UFrmFuncionario.pas' {frmFuncionario},
  UConexao in 'UConexao.pas',
  UFuncionario in 'Entidades\UFuncionario.pas',
  UDependente in 'Entidades\UDependente.pas',
  UFuncionarioPersist in 'Persistencia\UFuncionarioPersist.pas',
  UDependentePersist in 'Persistencia\UDependentePersist.pas',
  UIPersist in 'Persistencia\UIPersist.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFuncionario, frmFuncionario);
  Application.Run;
end.
