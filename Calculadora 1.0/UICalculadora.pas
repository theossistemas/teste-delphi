unit UICalculadora;

interface
  uses UIObserverCalculos;

type TComandosCalculadora = (backEspace, clearMemory, imposto1, imposto2, imposto3);

type ICalculadora = interface
  ['{69A9C39F-C233-4DD8-AC43-8F0E0595D4B2}']
  procedure Comando(value: String); overload;
  procedure Comando(value: TComandosCalculadora); overload;
  procedure AdicionaObserver(observer: IObserverCalculos);
  procedure AtualizarResultado();

  procedure setSubtotal(value: String);
  function getSubtotal(): string;

end;
implementation

end.
