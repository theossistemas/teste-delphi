unit Entities.Calculadora.Interfaces;

interface

uses Entities.Calculadora.Eventos, Generics.Collections;

type
  iOperacao = interface;
  iOperacaoDisplay = interface;
  iCalculadora = interface;
  iCalculadoraDisplay = interface;

  iOperacao = interface
    ['{6F258610-6012-4783-A407-2035C99982F3}']
    function Add(Value : Double) : iOperacao;
    function Exec() : double;
    function Display() : iOperacaoDisplay;
  end;

  iOperacaoDisplay = interface
    ['{E924DF35-455D-4DB9-9293-8576F4EA20F1}']
    function Resultado(Value : TEvDisplayTotal) : iOperacaoDisplay;
    function EndDisplay : iOperacao;
  end;

  iCalculadora = interface
    ['{CFA51328-83AD-49D3-9F59-66EA2689430A}']
    function Add(Value : Double) : iCalculadora;

    function Somar() : iOperacao;
    function Subtrair() : iOperacao;
    function Dividir() : iOperacao;
    function Multiplicar() : iOperacao;

    function ImpostoA() : iOperacao;
    function ImpostoB() : iOperacao;
    function ImpostoC() : iOperacao;

    function Display : iCalculadoraDisplay;

    function Reset() : iCalculadora;
  end;

  iCalculadoraDisplay = interface
    ['{7576A764-BEAC-46E5-9E69-2F2E96135405}']
    function Resultado(Value : TEvDisplayTotal) : iCalculadoraDisplay;
    function EndDisplay : iCalculadora;
  end;

implementation

end.
