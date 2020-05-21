unit uCalculadora;

interface

uses System.SysUtils, uInterfaceOperacao, uOperacao;

const
  ZERO = '0';
  VAZIO = '';
  IGUAL = '=';
  SOMA = '+';
  SUBTRACAO = '-';
  MULTIPLICACAO = '*';
  DIVISAO = '/';
  DECIMAL = ',';

type
  TOperador = (opSoma,opSubtracao,opMultiplicacao,opDivisao,opNenhuma,opIgual);

  TCalculadora = class
  private
    FsPrimeiroNumero: String;
    FsSegundoNumero: String;
    FeOperador: TOperador;
    FbPressionadoOperacao: Boolean;
    FbExecutouCalculo: Boolean;
    FoOperacao: IOperacao;
    procedure setOperador(const peOperacao: TOperador);
    procedure setPrimeiroNumero(const psPrimeiroNumero: String);
    procedure setSegundoNumero(const psSegundoNumero: String);
    procedure setPressionadoOperacao(const pbPressionadoOperacao: Boolean);
    procedure setExecutouCalculo(const pbExecutouCalculo: Boolean);
    function getOperador: TOperador;
    function getPressionadoOperacao: Boolean;
    function getExecutouCalculo: Boolean;
    function getPrimeiroNumero: String;
    function getSegundoNumero: String;
    function Calcular: String;
    procedure Inicializar;
  public
    constructor Create;
    destructor Destroy; override;
    function SimboloParaOperador(const psOperador: String): TOperador;
    function OperadorParaSimbolo(const peOperador: TOperador): String;
    function CalcularResultado(const psValor: String; const peOperador: TOperador = opNenhuma): String;
    function ImpostoA(const psBaseCalculo: String): String;
    function ImpostoB(const psBaseCalculo: String): String;
    function ImpostoC(const psBaseCalculo: String): String;
    property operador: TOperador read getOperador write setOperador;
    property primeiroNumero: String read getPrimeiroNumero write setPrimeiroNumero;
    property segundoNumero: String read getSegundoNumero write setSegundoNumero;
    property pressionadoOperacao: Boolean read getPressionadoOperacao write setPressionadoOperacao;
    property executouCalculo: Boolean read getExecutouCalculo write setExecutouCalculo;
  end;

implementation

{ TCalculadora }

constructor TCalculadora.Create;
begin
  Inicializar;
end;

function TCalculadora.CalcularResultado(const psValor: String;
  const peOperador: TOperador): String;
begin
  if operador = opNenhuma then
  begin
    FsPrimeiroNumero := psValor;
    Result := psValor;
    if peOperador = opIgual then
      FbExecutouCalculo := True
    else
      operador := peOperador;
    exit;
  end;

  if peOperador = opIgual then
  begin
    if not FbExecutouCalculo then
      FsSegundoNumero := psValor;
    Result := Calcular;
    FbExecutouCalculo := True;
    exit;
  end;

  if pressionadoOperacao then
  begin
    FsPrimeiroNumero := psValor;
    Result := psValor;
    if peOperador <> operador then
      operador := peOperador;
    exit;
  end;

  FsSegundoNumero := psValor;

  Result := Calcular;
  operador := peOperador;
end;

function TCalculadora.Calcular: String;
var
  dResultado : Double;
begin
  FoOperacao.Calcular(FsPrimeiroNumero, FsSegundoNumero);
  Result := FoOperacao.resultado;
  if TryStrToFloat(Result, dResultado) then
    FsPrimeiroNumero := Result;
end;

function TCalculadora.getExecutouCalculo: Boolean;
begin
  Result := FbExecutouCalculo;
end;

function TCalculadora.getOperador: TOperador;
begin
  Result := FeOperador;
end;

function TCalculadora.getPressionadoOperacao: Boolean;
begin
  Result := FbPressionadoOperacao;
end;

function TCalculadora.getPrimeiroNumero: String;
begin
  Result := FsPrimeiroNumero;
end;

function TCalculadora.getSegundoNumero: String;
begin
  Result := FsSegundoNumero;
end;

function TCalculadora.ImpostoA(const psBaseCalculo: String): String;
var
  sResultado: String;
  dResultado: Double;
begin
  Inicializar;
  dResultado := 0;
  sResultado := CalcularResultado(psBaseCalculo,opMultiplicacao);
  sResultado := CalcularResultado('0,2',opSubtracao);
  sResultado := CalcularResultado('500',opIgual);

  TryStrToFloat(sResultado,dResultado);

  if dResultado < 0 then
    sResultado := ZERO;

  Result := sResultado;
end;

function TCalculadora.ImpostoB(const psBaseCalculo: String): String;
var
  sResultado: String;
  dResultado: Double;
begin
  sResultado := ImpostoA(psBaseCalculo);
  Inicializar;
  sResultado := CalcularResultado(sResultado,opSubtracao);
  sResultado := CalcularResultado('15',opIgual);

  TryStrToFloat(sResultado,dResultado);

  if dResultado < 0 then
    sResultado := ZERO;

  Result := sResultado;
end;

function TCalculadora.ImpostoC(const psBaseCalculo: String): String;
var
  sImpostoA: String;
  sImpostoB: String;
  dImpostoA: Double;
  dImpostoB: Double;
  dResultado: Double;
begin
  sImpostoA := ImpostoA(psBaseCalculo);
  sImpostoB := ImpostoB(psBaseCalculo);
  TryStrToFloat(sImpostoA,dImpostoA);
  TryStrToFloat(sImpostoB,dImpostoB);
  dResultado := dImpostoA + dImpostoB;
  Result := FloatToStr(dResultado);
end;

procedure TCalculadora.Inicializar;
begin
  operador := opNenhuma;
  pressionadoOperacao := False;
  executouCalculo := False;
  primeiroNumero := VAZIO;
  segundoNumero := VAZIO;
  FoOperacao := nil;
end;

procedure TCalculadora.setExecutouCalculo(const pbExecutouCalculo: Boolean);
begin
  FbExecutouCalculo := pbExecutouCalculo;
end;

procedure TCalculadora.setOperador(const peOperacao: TOperador);
begin
  FeOperador := peOperacao;

  if Assigned(FoOperacao) then
    FoOperacao := nil;

  case peOperacao of
    opSoma: FoOperacao := TSoma.Create;
    opSubtracao: FoOperacao := TSubtracao.Create;
    opMultiplicacao: FoOperacao := TMultiplicacao.Create;
    opDivisao: FoOperacao := TDivisao.Create;
  end;
end;

procedure TCalculadora.setPressionadoOperacao(
  const pbPressionadoOperacao: Boolean);
begin
  FbPressionadoOperacao := pbPressionadoOperacao;
end;

procedure TCalculadora.setPrimeiroNumero(const psPrimeiroNumero: String);
begin
  FsPrimeiroNumero := psPrimeiroNumero;
end;

procedure TCalculadora.setSegundoNumero(const psSegundoNumero: String);
begin
  FsSegundoNumero := psSegundoNumero;
end;

function TCalculadora.SimboloParaOperador(const psOperador: String): TOperador;
begin
  if psOperador = SOMA then
    Result := opSoma
  else if psOperador = SUBTRACAO then
    Result := opSubtracao
  else if psOperador = DIVISAO then
    Result := opDivisao
  else if psOperador = MULTIPLICACAO then
    Result := opMultiplicacao
  else
    Result := opNenhuma;
end;

function TCalculadora.OperadorParaSimbolo(const peOperador: TOperador): String;
begin
  case peOperador of
    opSoma: Result := SOMA;
    opSubtracao: Result := SUBTRACAO;
    opMultiplicacao: Result := MULTIPLICACAO;
    opDivisao: Result := DIVISAO;
  else
    Result := VAZIO;
  end;
end;

destructor TCalculadora.Destroy;
begin
  if Assigned(FoOperacao) then
    FoOperacao := nil;

  inherited;
end;

end.
