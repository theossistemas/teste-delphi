program CalculationEntities;

uses
  Vcl.Forms,
  View.Main in '..\src\View\View.Main.pas' {ViewMain},
  Model.Employee.Intf in '..\src\Model\Employee\Model.Employee.Intf.pas',
  Model.Dependent.Intf in '..\src\Model\Dependent\Model.Dependent.Intf.pas',
  Model.Calculation.Intf in '..\src\Model\Calculation\Model.Calculation.Intf.pas',
  Model.Calculation.INSS in '..\src\Model\Calculation\Model.Calculation.INSS.pas',
  Model.Calculation.IR in '..\src\Model\Calculation\Model.Calculation.IR.pas',
  Model.DB.Connection.FireDAC in '..\src\Model\DB\Model.DB.Connection.FireDAC.pas',
  Model.DB.Intf in '..\src\Model\DB\Model.DB.Intf.pas',
  Model.DB.Statement.FireDAC in '..\src\Model\DB\Model.DB.Statement.FireDAC.pas',
  Model.DB.Connection.FireDAC.Factory in '..\src\Model\DB\Model.DB.Connection.FireDAC.Factory.pas',
  Model.Connection.Global in '..\src\Model\Connection\Model.Connection.Global.pas',
  Model.DAO.Intf in '..\src\Model\DAO\Model.DAO.Intf.pas',
  Model.Employee.DAO in '..\src\Model\Employee\Model.Employee.DAO.pas',
  Model.Employee in '..\src\Model\Employee\Model.Employee.pas',
  Parser.Sql in '..\src\Model\DB\Parser.Sql.pas',
  Controller.Intf in '..\src\Controller\Controller.Intf.pas',
  Controller in '..\src\Controller\Controller.pas',
  Controller.Entities in '..\src\Controller\Controller.Entities.pas',
  Utils.Global in '..\src\Utils\Utils.Global.pas',
  Model.Dependent in '..\src\Model\Dependent\Model.Dependent.pas',
  Model.Dependent.DAO in '..\src\Model\Dependent\Model.Dependent.DAO.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewMain, ViewMain);
  Application.Run;
end.
