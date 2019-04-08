unit Entities.Imposto.Interfaces;

interface

type
  iCalculo = interface
    ['{6F258610-6012-4783-A407-2035C99982F3}']
    function Exec() : double;
    function SetSalario(Value : Double) : iCalculo;
    function SetQtdeDependente(Value : integer) : iCalculo;
    function SetAliquota(Value : double) : iCalculo;
    function SetVlrDeducao(Value : double) : iCalculo;
  end;


implementation

end.
