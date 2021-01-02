program Theos.Avaliacao;

{$WARN DUPLICATE_CTOR_DTOR OFF}

uses
  Vcl.Forms,
  Theos.View.Principal in 'View\Theos.View.Principal.pas' {ViewPrincipal},
  Theos.Controller.Principal in 'Controller\Theos.Controller.Principal.pas',
  Theos.View.Calculadora in 'View\Theos.View.Calculadora.pas' {ViewCalculadora},
  Theos.Controller.Calculadora in 'Controller\Theos.Controller.Calculadora.pas',
  Theos.Api.Calculadora in 'Api\Theos.Api.Calculadora.pas',
  Theos.Lib.Nullable in 'Lib\Theos.Lib.Nullable.pas',
  Theos.Dao.DB in 'Dao\Theos.Dao.DB.pas',
  Theos.Lib.Resource in 'Lib\Theos.Lib.Resource.pas',
  Theos.View.Funcionario.Lista in 'View\Theos.View.Funcionario.Lista.pas' {ViewFuncionarioLista},
  Theos.View.Funcionario.Ficha in 'View\Theos.View.Funcionario.Ficha.pas' {ViewFuncionarioFicha},
  Theos.Controller.Funcionario.Lista in 'Controller\Theos.Controller.Funcionario.Lista.pas',
  Theos.Model.Funcionario in 'Model\Theos.Model.Funcionario.pas',
  Theos.Model.Dependente in 'Model\Theos.Model.Dependente.pas',
  Theos.Controller.Funcionario.Ficha in 'Controller\Theos.Controller.Funcionario.Ficha.pas',
  Theos.Dao.Operacao in 'Dao\Theos.Dao.Operacao.pas',
  Theos.Api.Pessoa in 'Api\Theos.Api.Pessoa.pas',
  Theos.View.Funcionario.Base in 'View\Theos.View.Funcionario.Base.pas' {ViewFuncionarioBase},
  Theos.Controller.Funcionario.Base in 'Controller\Theos.Controller.Funcionario.Base.pas',
  Theos.View.Dependente.Lista in 'View\Theos.View.Dependente.Lista.pas' {ViewDependenteLista},
  Theos.Controller.Dependente.Lista in 'Controller\Theos.Controller.Dependente.Lista.pas',
  Theos.Controller.Dependente.Ficha in 'Controller\Theos.Controller.Dependente.Ficha.pas',
  Theos.View.Dependente.Ficha in 'View\Theos.View.Dependente.Ficha.pas' {ViewDependenteFicha};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TControllerPrincipal.Instance;
  Application.Run;
end.
