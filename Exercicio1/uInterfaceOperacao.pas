unit uInterfaceOperacao;

interface

type
  IOperacao = Interface
    function getResultado: String;
    procedure Calcular(const psPrimeiroNumero,psSegundoNumero: String);
    property resultado: String read getResultado;
  end;

implementation

end.
