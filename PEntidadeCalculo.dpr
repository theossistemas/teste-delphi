program PEntidadeCalculo;

uses
  Forms,
  untEntidadeCalculo in 'untEntidadeCalculo.pas' {frmFuncionario},
  untFuncionarioDep in 'untFuncionarioDep.pas',
  untConexao in 'untConexao.pas' {udtConexao: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmFuncionario, frmFuncionario);
  Application.CreateForm(TudtConexao, udtConexao);
  Application.Run;
end.
