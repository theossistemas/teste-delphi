unit uCalc;

interface

uses System.SysUtils, System.Classes,Vcl.StdCtrls;

type

  TOperationType = (otAdd, otSub, otMult, otDiv, otUndef);
  TTaxType = (ttA, ttB, ttC, ttUndef);

  TCalc = class
  private

    FIsFirstTime : boolean;
    FIsFirstEqual: boolean;
    FBalance     : extended;
    FNumber      : extended;
    FOperation   : TOperationType;
    FOperationStr: string;
    FError       : string;
    FHistory     : string;
    FLastNumber  : extended;
    FLbDisplay   : TLabel;
    FLbHistory   : TLabel;
    FLastOp      : TOperationType;
    FTaxType     : TTaxType;

    procedure SetOperation(const aValue: TOperationType);
    procedure SetOperationStr(const aValue: string);
    procedure UpdateLabel(aCaption: string; aLabel: TLabel); overload;
    procedure UpdateLabel; overload;

    function GetBalance: extended;
    function DoOperation: extended;
  public

    constructor Create;

    procedure Reset;

    function Equal: extended;

    property Number      : extended       read FNumber        write FNumber;
    property Balance     : extended       read GetBalance;
    property Error       : string         read FError;
    property History     : string         read FHistory;
    property Operation   : TOperationType                     write SetOperation;
    property OperationStr: string                             write SetOperationStr;
    property LbDisplay   : TLabel         read FLbDisplay     write FLbDisplay;
    property LbHistory   : TLabel         read FLbHistory     write FLbHistory;
  end;

  // para criar novas funcionalidades na calculadora, herdamos dela e implementamos
  TCalculator = class(TCalc)
  public

    function TaxA : extended;
    function TaxB : extended;
    function TaxC : extended;
  end;

var
  FCalculator: TCalculator;

function Calc: TCalculator;

implementation

uses System.Math, System.StrUtils;

const
  C_OK       : string = 'OK';
  C_ERROR    : string = 'Operação inválida: %s';
  C_TAX_A1   : extended = 0.2;
  C_TAX_A2   : cardinal = 500;
  C_TAX_B    : cardinal = 15;
  C_OPERATION: array [otAdd .. otUndef] of string = (' + ', ' - ', ' * ', ' / ', '');

procedure TCalc.SetOperation(const aValue: TOperationType);
begin

  FLastOp       := FOperation;
  FOperation    := aValue;
  FOperationStr := C_OPERATION[FOperation];
  FIsFirstEqual := TRUE;
end;

procedure TCalc.SetOperationStr(const aValue: string);
var

  I  : TOperationType;
  lOK: boolean;
begin

  lOK := FALSE;

  for I := Low(C_OPERATION) to High(C_OPERATION) do
    if trim(aValue) = trim(C_OPERATION[I]) then
    begin

      lOK := TRUE;
      break;
    end;

  if lOK then
    Operation := I;
end;

procedure TCalc.UpdateLabel(aCaption: string; aLabel: TLabel);
begin

  if Assigned(aLabel) then
  begin

    aLabel.Caption := aCaption;
    aLabel.Refresh;
  end;
end;

procedure TCalc.UpdateLabel;
begin

  UpdateLabel(FloatToStr(FBalance), FLbDisplay);
  UpdateLabel(FHistory, FLbHistory);
end;

function TCalc.GetBalance: extended;
begin

  result := DoOperation;

  // se não houve erro de operação adicionamos no histórico
  if FError = C_OK then
    FHistory := FHistory + ifthen(FIsFirstTime, '', C_OPERATION[FLastOp]) + FloatToStr(FNumber);
  // depois que buscou o primeiro resultado, nunca mais é a primeira vez, a não ser que haja um reset...
  FIsFirstTime := FALSE;
  // atualizamos o balanço e retornamos o valor
  FBalance     := result;
  UpdateLabel;
end;

function TCalc.DoOperation: extended;
begin

  // assume que é sempre a primeira vez, atribui o result como o número
  result := FNumber;
  FError := C_OK;

  // se não for a primeira vez... Executa as operações
  if NOT FIsFirstTime then
    case FLastOp of

      otAdd : result := FBalance + FNumber;
      otSub : result := FBalance - FNumber;
      otMult: result := FBalance * FNumber;
      otDiv :
      begin

        // Divisão por ZERO não é uma operação aceitável, devemos ignorá-la e informar
        result := ifthen(FNumber > 0, FBalance / FNumber, FBalance);
        FError := ifthen(FNumber > 0, C_OK, Format(C_ERROR, ['Divisão por ZERO']));
      end;
    end;
end;

constructor TCalc.Create;
begin

  // inicializamos as variáveis
  Reset;
end;

procedure TCalc.Reset;
begin

  FIsFirstTime   := TRUE;
  FNumber        := 0;
  FHistory       := EmptyStr;
  FTaxType       := ttUndef;
  Operation      := otUndef;
end;

function TCalc.Equal: extended;
begin

  // O número que será utilizado para a operação é o último no display, se for o primeiro igual,
  // se não é o que estava no display antes da operação do igual atual;
  // o exemplo dado não me pareceu claro sobre a operação a ser executada
  FNumber     := ifthen(FIsFirstEqual, FNumber, FLastNumber);

  // Guardamos o último número antes da execução do igual
  FLastNumber := FNumber;

  // estabelece a operação de igual... passando ao lastop
  FLastOp     := FOperation;

  // retorna o cálculo com o número - na primeira execução o número que está na tela,
  // nas demais sobre o valor que estava na atualização anterior;
  result      := Balance;

  UpdateLabel(FloatToStr(result), FLbDisplay);
  UpdateLabel(FHistory + ifthen(FIsFirstEqual, ' = ', ' == '), FLbHistory);

  if NOT FIsFirstEqual then
    Reset;

  FIsFirstEqual := NOT FIsFirstEqual;
end;

function TCalculator.TaxA: extended;
begin

  if FTaxType = ttUndef then
    FTaxType := ttA;

  // resulta o cálculo aplicada a regra do imposto A - Imposto A = Base de Cálculo (Valor imposto na calculadora) * 20 % - 500
  result   := FNumber * C_TAX_A1 - C_TAX_A2;
  FHistory := 'Imposto A - Base: ' + FloatToStr(FNumber);

  UpdateLabel(FloatToStr(result), FLbDisplay);
  UpdateLabel(FHistory, FLbHistory);

  if FTaxType = ttA then
    reset;
end;

function TCalculator.TaxB: extended;
begin

  if FTaxType = ttUndef then
    FTaxType := ttB;

  // resulta o cálculo aplicada a regra do imposto B - Imposto B = Imposto A – 15
  result   := TaxA - C_TAX_B;
  FHistory := 'Imposto B - Base: ' + FloatToStr(FNumber);

  UpdateLabel(FloatToStr(result), FLbDisplay);
  UpdateLabel(FHistory, FLbHistory);

  if FTaxType = ttB then
    reset;
end;

function TCalculator.TaxC: extended;
begin

  if FTaxType = ttUndef then
    FTaxType := ttC;

  // resulta o cálculo aplicada a regra do imposto C - Imposto C = Imposto A + imposto B
  result   := TaxA + TaxB;
  FHistory := 'Imposto C - Base: ' + FloatToStr(FNumber);

  UpdateLabel(FloatToStr(result), FLbDisplay);
  UpdateLabel(FHistory, FLbHIstory);

  if FTaxType = ttC then
    reset;
end;

function Calc: TCalculator;
begin

  if NOT Assigned(FCalculator) then
    FCalculator := TCalculator.Create;

  result := FCalculator;
end;


end.
