unit Controller.Calculadora.Interfaces;

interface

uses
  Controller.Calculadora.Eventos;

type
  iCalculadoraController = interface;
  iEventosCalculadoraController = interface;

  iCalculadoraController = interface
    ['{A6BFFDAA-3B91-4BBC-9B9A-9E37F35C3857}']
    function Add(Value : Char) : iCalculadoraController;
    function Reset() : iCalculadoraController;

    function Eventos() : iEventosCalculadoraController;
  end;

  iEventosCalculadoraController = interface
    ['{E924DF35-455D-4DB9-9293-8576F4EA20F1}']
    function OnChange(Value : TEvtOnChange) : iEventosCalculadoraController;
    function OnCalc(Value : TEvtOnCalc) : iEventosCalculadoraController;

    function EndEventos : iCalculadoraController;
  end;

implementation

end.
