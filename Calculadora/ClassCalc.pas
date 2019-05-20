unit ClassCalc;

interface
  Type

  TCalc = class
  private

  protected

  public

   function Somar(iValor1,iValor2:Real):Real;
   function Subtrair(iValor1,iValor2:Real):Real;
   function Dividir(iValor1,iValor2:Real):Real;
   function Multiplicar(iValor1,iValor2:Real):Real;

  published

  end;


implementation

 {* Equações da Calculadora *}

 function TCalc.Somar(iValor1,iValor2:Real):Real;
 begin
   Result := iValor1 + iValor2;
 end;

 function TCalc.Subtrair(iValor1,iValor2:Real):Real;
 begin
   Result := iValor1 - iValor2;
 end;

 function TCalc.Dividir(iValor1,iValor2:Real):Real;
 begin
     Result := iValor1 / iValor2;
 end;

 function TCalc.Multiplicar(iValor1,iValor2:Real):Real;
 begin
     Result := iValor1 * iValor2;
 end;

end.
