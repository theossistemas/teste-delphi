program Calculator;

uses
  Vcl.Forms,
  View.Main in '..\src\View\View.Main.pas' {ViewMain},
  Model.Calculator.Intf in '..\src\Model\Model.Calculator.Intf.pas',
  Model.Calculator.Types in '..\src\Model\Model.Calculator.Types.pas',
  Model.Calculator.Arithmetic in '..\src\Model\Model.Calculator.Arithmetic.pas',
  Global.Utils in '..\src\Utils\Global.Utils.pas',
  Model.Calculator in '..\src\Model\Model.Calculator.pas',
  Model.Calculator.Tax in '..\src\Model\Model.Calculator.Tax.pas',
  Model.Calculator.TaxB in '..\src\Model\Tax\Model.Calculator.TaxB.pas',
  Model.Calculator.TaxA in '..\src\Model\Tax\Model.Calculator.TaxA.pas',
  Model.Calculator.TaxC in '..\src\Model\Tax\Model.Calculator.TaxC.pas',
  Model.Calculator.Tax.Builder in '..\src\Model\Tax\Model.Calculator.Tax.Builder.pas',
  Controller.Calculator.Intf in '..\src\Controller\Controller.Calculator.Intf.pas',
  Controller.Calculator in '..\src\Controller\Controller.Calculator.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewMain, ViewMain);
  Application.Run;
end.
