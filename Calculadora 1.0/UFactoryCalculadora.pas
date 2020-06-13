unit UFactoryCalculadora;



interface

uses UfrmCalculadora, Forms;

type TFactoryCalculadora = class

  class procedure CriarCalculadora();

end;

implementation

uses
  UCalculadora, UcalculadoraImpostos, UIcalculadora;

{ TFactoryCalculadora }

class procedure TFactoryCalculadora.CriarCalculadora;
  var
  calculadora: ICalculadora;
begin
  calculadora :=  TcalculadoraImpostos.Create( TCalculadora.Create );
  Application.CreateForm(TFrmCalculadora, frmcalculadora);
  FrmCalculadora.setCalculos( calculadora );
  calculadora.AdicionaObserver(FrmCalculadora);
end;

end.
