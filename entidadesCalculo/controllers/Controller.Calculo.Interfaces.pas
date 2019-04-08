unit Controller.Calculo.Interfaces;

interface

uses
  Controller.Calculo.Eventos;

type
  iCalculoImpostoController = interface;
  iEventosCalculoImpostoController = interface;

  iCalculoImpostoController = interface
    ['{4123DAAF-DFF3-48D7-9A28-878FF4E67EFD}']

    function CalcularIR() : iCalculoImpostoController;
    function CalcularINSS() : iCalculoImpostoController;

    function SetAliquotaIR(Value : double) : iCalculoImpostoController;
    function SetDeducaoIR(Value : double) : iCalculoImpostoController;
    function SetAliquotaINSS(Value : double) : iCalculoImpostoController;

    function Eventos() : iEventosCalculoImpostoController;
  end;

  iEventosCalculoImpostoController = interface
    ['{E924DF35-455D-4DB9-9293-8576F4EA20F1}']
    function OnCalcIR(Value : TEvtOnCalc) : iEventosCalculoImpostoController;
    function OnCalcINSS(Value : TEvtOnCalc) : iEventosCalculoImpostoController;

    function EndEventos : iCalculoImpostoController;
  end;

implementation

end.
