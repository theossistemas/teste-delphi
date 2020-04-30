unit uControllerCalculadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uClasseCalculadora;

type
  TipoOperacao = (tpAdicao, tpSubtracao, tpMultiplicacao, tpDivisao, tpVazia);

  TCalculadoraController = class
  private
    FCalculadora : TCalculadora;
  public
    constructor Create;
    destructor Destroy; override;
    function ExecutaOperacao(const nPrimeiroValor, nSegundoValor: double; const aOperacao: TipoOperacao): double;
    function CalcularImpostoA: double;
    function CalcularImpostoB: double;
    function CalcularImpostoC: double;
  end;

implementation

{ TCalculadoraController }

constructor TCalculadoraController.Create;
begin
  FCalculadora := TCalculadora.Create;
end;

destructor TCalculadoraController.Destroy;
begin
  inherited;
  FreeAndNil(FCalculadora);
end;

function TCalculadoraController.ExecutaOperacao(const nPrimeiroValor, nSegundoValor: double; const aOperacao: TipoOperacao): double;
begin
  FCalculadora.PrimeiroValor := nPrimeiroValor;
  FCalculadora.SegundoValor := nSegundoValor;

  case aOperacao of
    tpAdicao: FCalculadora.Somar;
    tpSubtracao: FCalculadora.Subtrair;
    tpMultiplicacao: FCalculadora.Multiplicar;
    tpDivisao: FCalculadora.Dividir;
  end;

  Result := FCalculadora.Resultado;
end;

function TCalculadoraController.CalcularImpostoA: double;
begin
  Result := FCalculadora.CalcularImpostoA;
end;

function TCalculadoraController.CalcularImpostoB: double;
begin
  Result := FCalculadora.CalcularImpostoB;
end;

function TCalculadoraController.CalcularImpostoC: double;
begin
  Result := FCalculadora.CalcularImpostoC;
end;

end.
