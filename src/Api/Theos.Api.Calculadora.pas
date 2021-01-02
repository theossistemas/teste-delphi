unit Theos.Api.Calculadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,

  Theos.Lib.Nullable;

type
  TConstantes = record
  public
    const
      NENHUMA = '0';
      SOMA = '+';
      SUBTRACAO = '-';
      MULTIPLICACAO = '*';
      DIVISAO = '/';
      IGUAL = '=';
      CARACTERES_OPERADORES = [SOMA, SUBTRACAO, MULTIPLICACAO, DIVISAO, IGUAL];
  end;

  TOperacao = (Nenhum = ord(TConstantes.NENHUMA),
               Soma = ord(TConstantes.SOMA),
               Subtracao = ord(TConstantes.SUBTRACAO),
               Multiplicacao = ord(TConstantes.MULTIPLICACAO),
               Divisao = ord(TConstantes.DIVISAO),
               Igual = ord(TConstantes.IGUAL));

  TCalculadora = class sealed
  strict private
    FResultado: Nullable<Double>;
    FPrimeiraVez: Boolean;

    FOperacao: TOperacao;
    FValor: Nullable<Double>;
    FUltimaOperacao: TOperacao;
    FUltimaOperacaoExecutada: TOperacao;
    FUltimoValor: Nullable<Double>;

    FBaseCalculo: Double;
    function GetImpostoA: Double;
    function GetImpostoB: Double;
    function GetImpostoC: Double;

  public
    property Operacao: TOperacao read FOperacao write FOperacao;
    property Valor: Nullable<Double> read FValor write FValor;
    property Resultado: Nullable<Double> read FResultado;
    property PrimeiraVez: Boolean read FPrimeiraVez;

    property BaseCalculo: Double read FBaseCalculo write FBaseCalculo;
    property ImpostoA: Double read GetImpostoA;
    property ImpostoB: Double read GetImpostoB;
    property ImpostoC: Double read GetImpostoC;

    constructor Create; reintroduce;
    procedure Limpar;
    function Execute: Boolean;
    procedure TrocaUltimaOperacao(const Operacao: TOperacao);
    function RealizarUltimaOperacaoExecutada: boolean;
    procedure RealizaOperacao;

    function VintePorcentoDaBase: Double;
    class function MultiplicativoPercentual(const Percentual: integer): Double;
    class function CalculaPercentual(const ValorInicial: Double; const Percentual: Integer): Double;
  end;

implementation

constructor TCalculadora.Create;
begin
  inherited;
  Limpar;
end;

procedure TCalculadora.Limpar;
begin
  FResultado.Clear;
  FPrimeiraVez := True;
  FValor.Clear;
  FOperacao := TOperacao.Nenhum;
  FUltimaOperacao := TOperacao.Nenhum;
  FUltimaOperacaoExecutada := TOperacao.Nenhum;
  FUltimoValor.Clear;
end;

procedure TCalculadora.TrocaUltimaOperacao(const Operacao: TOperacao);
begin
  FUltimaOperacao := Operacao;
end;

function TCalculadora.RealizarUltimaOperacaoExecutada: boolean;
begin
  if FUltimaOperacao <> TOperacao.Igual then
    Exit(False);

  if FOperacao <> TOperacao.Igual then
    Exit(False);

  if FValor.HasValue then
  begin
    var ValorInformado := FValor.GetValueOrDefault;
    Limpar;
    FValor := ValorInformado;
    Exit(False);
  end;

  FUltimaOperacao := FUltimaOperacaoExecutada;
  FValor := FUltimoValor;
  Execute;
  Result := True;
end;

procedure TCalculadora.RealizaOperacao;
begin
  case FUltimaOperacao of
    TOperacao.Soma:
    begin
      FResultado := FResultado.GetValueOrDefault + Valor.GetValueOrDefault;
    end;
    TOperacao.Subtracao:
    begin
      FResultado := FResultado.GetValueOrDefault - Valor.GetValueOrDefault;
    end;
    TOperacao.Multiplicacao:
    begin
      FResultado := FResultado.GetValueOrDefault * Valor.GetValueOrDefault;
    end;
    TOperacao.Divisao:
    begin
      FResultado := FResultado.GetValueOrDefault / Valor.GetValueOrDefault;
    end;
  end;
end;

function TCalculadora.Execute: Boolean;
begin
  Result := True;

  if RealizarUltimaOperacaoExecutada then
    Exit;

  try
    if FPrimeiraVez then
    begin
      FPrimeiraVez := False;
      FResultado := FValor;
      Exit;
    end;

    RealizaOperacao;

  finally
    FUltimoValor := FValor;
    FValor.Clear;

    if FUltimaOperacao <> TOperacao.Igual then
      FUltimaOperacaoExecutada := FUltimaOperacao;

    FUltimaOperacao := FOperacao;

    FOperacao := TOperacao.Nenhum;
  end;
end;

class function TCalculadora.MultiplicativoPercentual(const Percentual: Integer): Double;
begin
  const DENOMINADOR = 100;
  result := Percentual / DENOMINADOR;
end;

function TCalculadora.VintePorcentoDaBase: Double;
begin
  const PERCENTUAL = 20;
  result := MultiplicativoPercentual(PERCENTUAL);
end;

function TCalculadora.GetImpostoA: Double;
begin
  const VALOR_SUBTRAIR = 500;
  result := BaseCalculo * VintePorcentoDaBase - VALOR_SUBTRAIR;
end;

function TCalculadora.GetImpostoB: Double;
begin
  const VALOR_SUBTRAIR = 15;
  result := ImpostoA - VALOR_SUBTRAIR;
end;

function TCalculadora.GetImpostoC: Double;
begin
  result := ImpostoA + ImpostoB;
end;

class function TCalculadora.CalculaPercentual(const ValorInicial: Double; const Percentual: Integer): Double;
begin
  result := ValorInicial * MultiplicativoPercentual(Percentual);
end;

end.
