unit uICalculadora;

interface
uses Types, Vcl.STdCtrls;
type
  ICalculadora = interface(IInterface)

    procedure GerenciamentoOperacao(Operacao: EnumOperacao; out Visor: TEdit;ValorVisor:Double =0; ValorMemoria: Double = 0);

  end;

implementation

end.
