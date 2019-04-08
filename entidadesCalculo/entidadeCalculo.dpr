program entidadeCalculo;

uses
  Vcl.Forms,
  UFPrincipal in 'UFPrincipal.pas' {frmPrincipal},
  Entities.Funcionario in 'entities\Entities.Funcionario.pas',
  Entities.Dependente in 'entities\Entities.Dependente.pas',
  Entities.Imposto.Interfaces in 'entities\Entities.Imposto.Interfaces.pas',
  Entities.Imposto.Calculo in 'entities\Entities.Imposto.Calculo.pas',
  Entities.Imposto.IR in 'entities\Entities.Imposto.IR.pas',
  Entities.Imposto.INSS in 'entities\Entities.Imposto.INSS.pas',
  Controller.CalculoImposto in 'controllers\Controller.CalculoImposto.pas',
  Controller.Calculo.Interfaces in 'controllers\Controller.Calculo.Interfaces.pas',
  Controller.Calculo.Eventos in 'controllers\Controller.Calculo.Eventos.pas',
  UDMServer in 'connection\UDMServer.pas' {dmServer: TDataModule},
  Entities.Server.ParamConnection in 'entities\Entities.Server.ParamConnection.pas',
  Controller.Server.Connection in 'controllers\Controller.Server.Connection.pas',
  Constante.Connection in 'connection\Constante.Connection.pas',
  UFConnectDialog in 'connection\UFConnectDialog.pas' {frmConnectDialog},
  Controller.DAL.Base in 'controllers\Controller.DAL.Base.pas',
  Controller.DAL.Funcionario in 'controllers\Controller.DAL.Funcionario.pas',
  Controller.Interfaces in 'controllers\Controller.Interfaces.pas',
  Controller.Funcionario in 'controllers\Controller.Funcionario.pas',
  Controller.DAL.Dependente in 'controllers\Controller.DAL.Dependente.pas',
  Common.Constantes in 'common\Common.Constantes.pas',
  Controller.Dependente in 'controllers\Controller.Dependente.pas',
  Vcl.Themes,
  Vcl.Styles,
  Common.Util in 'common\Common.Util.pas',
  UFTemplate in 'UFTemplate.pas' {frmTemplate},
  UFFuncionario in 'UFFuncionario.pas' {frmFuncionario},
  UDMView in 'connection\UDMView.pas' {dmView: TDataModule},
  UFDependente in 'UFDependente.pas' {frmDependente};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;

  {$REGION 'DataModules'}
    dmServer := TdmServer.Create(Application);
    dmView := TdmView.Create(Application);
  {$ENDREGION}

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 Blue');
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
