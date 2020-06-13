unit UCalculadoraImpostos;

interface

uses UICalculadora, UIObserverCalculos;

type
  TCalculadoraImpostos = class(TInterfacedObject, ICalculadora)
  private
    FCalculadora: ICalculadora;
    function calculaImposto1(value: String): String;
    function calculaImposto2(value: String): String;
    function calculaImposto3(value: String): String;
  public
    constructor Create(calculadora: ICalculadora);
    procedure AdicionaObserver(observer: IObserverCalculos);
    procedure Comando(value: string); overload;
    procedure Comando(value: TComandosCalculadora); overload;
    function getSubtotal: string;
    procedure setSubtotal(value: string);
    procedure AtualizarResultado;


  end;

implementation

uses
  System.SysUtils;

{ TCalculadoraImpostos }

procedure TCalculadoraImpostos.AdicionaObserver(observer: IObserverCalculos);
begin
  FCalculadora.AdicionaObserver(observer);
end;

procedure TCalculadoraImpostos.Comando(value: string);
begin
  FCalculadora.Comando(value);
end;

procedure TCalculadoraImpostos.AtualizarResultado;
begin
  FCalculadora.AtualizarResultado();
end;

function TCalculadoraImpostos.calculaImposto1(value: string): String;
begin
  result := currToStr(strToCurr(value) * (20 / 100) - 500)
end;

function TCalculadoraImpostos.calculaImposto2(value: String): String;
begin
  result := currToStr(strToCurr(calculaImposto1(value)) - 15);
end;

function TCalculadoraImpostos.calculaImposto3(value: String): String;
begin
  result := currToStr(strToCurr(calculaImposto1(value)) +
    strToCurr(calculaImposto2(value)));
end;

procedure TCalculadoraImpostos.Comando(value: TComandosCalculadora);
begin
  if value = imposto1 then
  begin
    setSubtotal(calculaImposto1(getSubtotal()));
    AtualizarResultado;
  end;

  if value = imposto2 then
  begin
    setSubtotal(calculaImposto2(getSubtotal));
    AtualizarResultado;
  end;

  if value = imposto3 then
  begin
    setSubtotal(calculaImposto3(getSubtotal));
    AtualizarResultado;
  end;

  FCalculadora.Comando(value);
end;

constructor TCalculadoraImpostos.Create(calculadora: ICalculadora);
begin
  FCalculadora := calculadora;
end;

function TCalculadoraImpostos.getSubtotal: string;
begin
  result := FCalculadora.getSubtotal
end;

procedure TCalculadoraImpostos.setSubtotal(value: string);
begin
  FCalculadora.setSubtotal(value);
end;


end.
