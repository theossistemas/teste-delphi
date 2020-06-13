unit UCalculadora;

interface

uses UIcalculadora, UIObserverCalculos, strutils, math;

type
  TCalculadora = class(TInterfacedObject, ICalculadora)
  protected
    _observers: array of IObserverCalculos;
    TotalizadoAteOMomento: String;
    arrayValor: String;
    operacao: char;
    resultado: string;
    procedure NotificarResultado(msg: string);
    procedure NotificarDetalhe(msg: string);
    procedure EnviarDetalhe();
    function ResultadoOperacao(valor1, Valor2: string; operacao: char): string;
  public
    procedure Comando(value: string); overload;
    procedure Comando(value: TComandosCalculadora); overload;

    procedure AdicionaObserver(observer: IObserverCalculos);

    procedure Totalizar();

    procedure setSubtotal(value: String);
    function getSubtotal: String;
    procedure AtualizarResultado;


  end;

implementation

uses
  System.SysUtils;

{ TCalculadora }

procedure TCalculadora.AdicionaObserver(observer: IObserverCalculos);
begin
  SetLength(_observers, length(_observers) + 1);
  _observers[high(_observers)] := observer;
end;

procedure TCalculadora.Comando(value: string);
begin

  if (value = 'back') and (length(arrayValor) >= 1) then
  begin
    SetLength(arrayValor, length(arrayValor) - 1);
    NotificarResultado(arrayValor);
  end;

  if (value = 'cls') then
  begin
    TotalizadoAteOMomento := '';
    resultado := '';
    operacao := char(' ');
    arrayValor := '';
    NotificarResultado('0,00');
    EnviarDetalhe();
    exit;
  end;

  if (value[1] in ['/', '*', '+', '-']) then
  begin
    if (TotalizadoAteOMomento <> '') and (arrayValor <> '') then
    begin
      resultado := ResultadoOperacao(resultado, arrayValor, operacao);
      TotalizadoAteOMomento := resultado;
    end
    else
    begin
      resultado := TotalizadoAteOMomento + arrayValor;
      TotalizadoAteOMomento := TotalizadoAteOMomento + arrayValor;
    end;
    operacao := value[1];
    arrayValor := '';
    NotificarResultado('0,00');
  end;

  if (value[1] = '=') and (arrayValor <> '') then
  begin
    Totalizar();
    exit;
  end;

  if (TotalizadoAteOMomento <> '') and (operacao = ' ') then
    exit;

  if (value[1] in ['0' .. '9', ',']) then
  begin
    arrayValor := arrayValor + value;
    NotificarResultado(arrayValor);
  end;

  EnviarDetalhe();
end;

procedure TCalculadora.AtualizarResultado;
begin
  NotificarResultado(Format('%s', [ FormatCurr('0.00', strToCurr( getSubtotal() ))]));
  arrayValor := '';
  EnviarDetalhe();
end;

procedure TCalculadora.Comando(value: TComandosCalculadora);
begin
  if value = TComandosCalculadora.backEspace then
    Comando('back');

  if value = TComandosCalculadora.clearMemory then
    Comando('cls');

end;



procedure TCalculadora.EnviarDetalhe;
begin
  NotificarDetalhe(Format('%s %s %s = %s', [TotalizadoAteOMomento, operacao,
    arrayValor, ResultadoOperacao(resultado, arrayValor, operacao)]));
end;

function TCalculadora.getSubtotal: String;
begin
  if TotalizadoAteOMomento = '' then
    result := arrayValor
  else
    result := TotalizadoAteOMomento;
end;

procedure TCalculadora.NotificarDetalhe(msg: string);
var
  obs: IObserverCalculos;
begin
  for obs in _observers do
    obs.NotifyDetalhe(msg);
end;

procedure TCalculadora.NotificarResultado(msg: string);
var
  obs: IObserverCalculos;
begin
  for obs in _observers do
    obs.NotifyResultado(msg);
end;

function TCalculadora.ResultadoOperacao(valor1, Valor2: string;
  operacao: char): string;
begin
  if (valor1 <> '') and (Valor2 <> '') then

    case operacao of
      '+':
        result := CurrToStr(strtocurr(valor1) + strtocurr(Valor2));
      '-':
        result := CurrToStr(strtocurr(valor1) - strtocurr(Valor2));
      '/':
        result := CurrToStr(ifthen((strtocurr(valor1) <> 0) and
          (strtocurr(Valor2) <> 0), strtocurr(valor1) / strtocurr(Valor2), 0));
      '*':
        result := CurrToStr(strtocurr(valor1) * strtocurr(Valor2));
    end;

end;

procedure TCalculadora.setSubtotal(value: String);
begin
  TotalizadoAteOMomento := value;
end;

procedure TCalculadora.Totalizar;
begin
  resultado := ResultadoOperacao(resultado, arrayValor, operacao);
  TotalizadoAteOMomento := resultado;
  NotificarResultado(resultado);
  arrayValor := '';
  operacao := char(' ');
end;

end.
