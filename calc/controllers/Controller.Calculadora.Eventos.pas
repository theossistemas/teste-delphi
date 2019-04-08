unit Controller.Calculadora.Eventos;

interface

uses
  Common.Constante;

type
  TEvtOnChange   = procedure (const AVlrMemoria, AVlrAtual : Double; const AVlrEntrada : string; const AOperacao, AUltimaOperacao : TOperacao  ) of object;
  TEvtOnCalc     = procedure (const AVlrMemoria : Double; const AOperacao :  TOperacao  ) of object;

implementation

end.
