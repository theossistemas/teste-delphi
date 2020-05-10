program TesteDelphiTheosSistemas;

uses
  Forms,
  MenuPrincipal in 'MenuPrincipal.pas' {MenuPrincipalF},
  Ex1Calculadora in 'Forms\Ex1Calculadora.pas' {Ex1CalculadoraF},
  Ex2EntidadesCalc in 'Forms\Ex2EntidadesCalc.pas' {Ex2EntidadesCalcF},
  CalculadoraU in 'Entidades\CalculadoraU.pas',
  FuncionarioU in 'Entidades\FuncionarioU.pas',
  ConnectionDM in 'ConnectionDM.pas' {ConnectionDMF: TDataModule},
  unitFuncoes in 'unitFuncoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Teste Delphi Theós Sistemas';
  Application.CreateForm(TMenuPrincipalF, MenuPrincipalF);
  Application.CreateForm(TEx1CalculadoraF, Ex1CalculadoraF);
  Application.CreateForm(TEx2EntidadesCalcF, Ex2EntidadesCalcF);
  Application.CreateForm(TConnectionDMF, ConnectionDMF);
  Application.Run;
end.
