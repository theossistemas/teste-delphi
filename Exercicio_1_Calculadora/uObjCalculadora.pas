unit uObjCalculadora;

interface

uses
  SysUtils;

type
  TOperacao = (oSoma, oSubtracao, oMultiplicacao, oDivisao) ;

  TCalculadora = class
  private
    FPrimeiroValor: String;
    FSegundoValor: String;
    FUltimaTeclaOperacao: boolean;                 
    FOperacaoAtual: TOperacao;
    bRealizouCalculo: boolean;
    FImpostoA: Real;
    FImpostoB: Real;
    FImpostoC: Real;

    procedure SetUltimaTeclaOperacao(const Value: boolean);
    procedure SetSegundoValor(const Value: String);           
    procedure SetPrimeiroValor(const Value: String);
    procedure SetOperacaoAtual(const Value: TOperacao);

    function AtualizarNumeros(const psNumero: String): String;
  public
    Constructor Create;

    function AtualizarOperacao(const poOperacaoAtual: TOperacao;
      const psNumeroVisor: String): String;
    function GetResultado(bClicouIgual: boolean = False): String;
    procedure ResetarValores;

    function CalcularImpostoA(const psNumeroVisor: String): String;
    function CalcularImpostoB: String;
    function CalcularImpostoC: String;

    procedure SetImpostoA(const pnImpostoA: Real);
    procedure SetImpostoB(const pnImpostoB: Real);
    procedure SetImpostoC(const pnImpostoC: Real);
  published
    property UltimaTeclaOperacao: boolean write SetUltimaTeclaOperacao;
    property PrimeiroValor: String write SetPrimeiroValor;
    property SegundoValor: String write SetSegundoValor;
    property OperacaoAtual: TOperacao write SetOperacaoAtual;
  end;

implementation

const
  MASCARA_FLOAT = '0.############';
  STRING_INDEFINIDO = '';

{ TCalculadora }

constructor TCalculadora.Create;
begin
  inherited;
  ResetarValores;
end;

function TCalculadora.GetResultado(bClicouIgual: boolean = False): String;
var
  nResultado: Real;
  nPrimeiroValor: Real;
  nSegundoValor: Real;
begin
  //usuário clicou no "Igual" digitando apenas um número.
  if FPrimeiroValor = STRING_INDEFINIDO then
  begin
    Result := FSegundoValor;
    Exit;
  end;

  if FSegundoValor = STRING_INDEFINIDO then
  begin
    Result := FPrimeiroValor;
    Exit;
  end;

  if (StrToFloat(FSegundoValor) = 0) and (FOperacaoAtual = oDivisao) then
  begin
    ResetarValores;
    raise EDivByZero.Create('Não é possível realizar divisão por zero.');
  end;

  nPrimeiroValor := StrToFloat(FPrimeiroValor);
  nSegundoValor  := StrToFloat(FSegundoValor);

  Case FOperacaoAtual of
    oSoma : nResultado := (nPrimeiroValor + nSegundoValor);
    oSubtracao : nResultado := (nPrimeiroValor - nSegundoValor);
    oMultiplicacao : nResultado := (nPrimeiroValor * nSegundoValor);
    oDivisao : nResultado := (nPrimeiroValor / nSegundoValor);
  else
    begin
      Result := 'ERRO';
      raise Exception.Create('Operação inválida');
    end;
  end;

  bRealizouCalculo := bClicouIgual;
  Result := FormatFloat(MASCARA_FLOAT, nResultado);
  FPrimeiroValor := Result;
end;

procedure TCalculadora.ResetarValores;
begin
  FPrimeiroValor := STRING_INDEFINIDO;
  FSegundoValor := STRING_INDEFINIDO;
  bRealizouCalculo := False;
  FImpostoA := 0;
  FImpostoB := 0;
  FImpostoC := 0;
  FUltimaTeclaOperacao := False;
end;

function TCalculadora.AtualizarOperacao(const poOperacaoAtual: TOperacao;
  const psNumeroVisor: String): String;
begin
  if not FUltimaTeclaOperacao then
    result := AtualizarNumeros(psNumeroVisor)
  else
    result := psNumeroVisor;

  FOperacaoAtual := poOperacaoAtual;
end;

function TCalculadora.AtualizarNumeros(const psNumero: String): String;
begin
  if bRealizouCalculo then
  begin
    ResetarValores;
  end;

  if FPrimeiroValor = STRING_INDEFINIDO then
  begin
    FPrimeiroValor := psNumero;
    result := FPrimeiroValor;
    Exit;
  end;

  FSegundoValor := psNumero;

  FPrimeiroValor := GetResultado;
  FSegundoValor := STRING_INDEFINIDO;
  result := FPrimeiroValor;
end;

procedure TCalculadora.SetUltimaTeclaOperacao(const Value: boolean);
begin
  FUltimaTeclaOperacao := Value;
end;

procedure TCalculadora.SetSegundoValor(const Value: String);
begin
  if FSegundoValor = STRING_INDEFINIDO then
    FSegundoValor := Value;
end;

procedure TCalculadora.SetPrimeiroValor(const Value: String);
begin
  if FPrimeiroValor = STRING_INDEFINIDO then
    FPrimeiroValor := Value;
end;

procedure TCalculadora.SetOperacaoAtual(const Value: TOperacao);
begin
  FOperacaoAtual := Value;
end;

function TCalculadora.CalcularImpostoA(const psNumeroVisor: String): String;
var
  AuxImposto: Real;
begin
  AuxImposto := StrToFloat(psNumeroVisor);
  AuxImposto := (AuxImposto * 0.2) - 500;
  if AuxImposto < 0 then
    AuxImposto := 0;

  FImpostoA := AuxImposto;
  Result := FormatFloat(MASCARA_FLOAT, FImpostoA);
end;

function TCalculadora.CalcularImpostoB: String;
var
  AuxImposto: Real;
begin
  AuxImposto := FImpostoA - 15;
  if AuxImposto < 0 then
    AuxImposto := 0;

  FImpostoB := AuxImposto;
  Result := FormatFloat(MASCARA_FLOAT, FImpostoB);
end;

function TCalculadora.CalcularImpostoC: String;
begin
  FImpostoC := FImpostoA + FImpostoB;
  Result := FormatFloat(MASCARA_FLOAT, FImpostoC);
end;

procedure TCalculadora.SetImpostoA(const pnImpostoA: Real);
begin
  FImpostoA := pnImpostoA;
end;

procedure TCalculadora.SetImpostoB(const pnImpostoB: Real);
begin
  FImpostoB := pnImpostoB;
end;

procedure TCalculadora.SetImpostoC(const pnImpostoC: Real);
begin
  FImpostoC := pnImpostoC;
end;

end.
