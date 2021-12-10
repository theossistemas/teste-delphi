unit Model.Calculator.Arithmetic;

interface

uses
  System.SysUtils,
  Model.Calculator.Intf,
  Model.Calculator.Types;

type
  TModelCalculatorArithmetic = class(TInterfacedObject, IModelCalculatorArithmetic)
  strict private
    function IsOperator(const AValue: string): Boolean;
    function LastIsOperator: Boolean;
    procedure AddToHistoric(const AValue: string);
    procedure ShowHistoric(const ASetEqual: Boolean);
    procedure ShowResult(const AValue: string);
  private
    FHistoric: array of string;
    FOnNotifyResult: TProc<string>;
    FOnNotifyHistoric: TProc<string>;
  private
    [weak]
    FParent: IModelCalculator;
  protected
    function NotifyResult(AProc: TProc<string>): IModelCalculatorArithmetic;
    function NotifyHistoric(AProc: TProc<string>): IModelCalculatorArithmetic;
    function Clear: IModelCalculatorArithmetic;
    function AddNumber(const AValue: Currency): IModelCalculatorArithmetic;
    function SetOperation(const AValue: TOperatorKind): IModelCalculatorArithmetic;
    procedure Execute;
    function &End: IModelCalculator;
  public
    constructor Create(AParent: IModelCalculator);
    destructor Destroy; override;
    class function New(AParent: IModelCalculator): IModelCalculatorArithmetic;
  end;

implementation

uses
  Global.Utils;

{ TModelCalculatorArithmetic }

function TModelCalculatorArithmetic.&End: IModelCalculator;
begin
  Result := FParent;
end;

function TModelCalculatorArithmetic.AddNumber(const AValue: Currency): IModelCalculatorArithmetic;
begin
  Result := Self;
  if LastIsOperator or (Length(FHistoric) = 0) then
    AddToHistoric(CurrToStr(AValue))
  else
    FHistoric[High(FHistoric)] := FHistoric[High(FHistoric)] + CurrToStr(AValue);
end;

procedure TModelCalculatorArithmetic.AddToHistoric(const AValue: string);
begin
  SetLength(FHistoric, Length(FHistoric) + 1);
  FHistoric[High(FHistoric)] := AValue;
end;

function TModelCalculatorArithmetic.Clear: IModelCalculatorArithmetic;
begin
  Result := Self;
  SetLength(FHistoric, 0);
  ShowHistoric(False);
  ShowResult('0');
end;

constructor TModelCalculatorArithmetic.Create(AParent: IModelCalculator);
begin
  FParent := AParent;
  Clear;
end;

destructor TModelCalculatorArithmetic.Destroy;
begin

  inherited;
end;

procedure TModelCalculatorArithmetic.Execute;

  function SolverOperation(const ALeftTerm: Currency; const ARightTerm: Currency; AOperatorKind: TOperatorKind): Currency;
  begin
    case AOperatorKind of
      TOperatorKind.Addition:
        Result := ALeftTerm + ARightTerm;
      TOperatorKind.Subtraction:
        Result := ALeftTerm - ARightTerm;
      TOperatorKind.Multiplication:
        Result := ALeftTerm * ARightTerm;
      TOperatorKind.Division:
        begin
          if ARightTerm = 0 then
            raise Exception.Create('Não é possível dividir por zero');
          Result := ALeftTerm / ARightTerm;
        end;
    end;
  end;

var
  lIndex: Integer;
  lResult: Currency;
  lLastOperator: TOperatorKind;
begin
  lResult := 0;

  lLastOperator := TOperatorKind.None;
  lIndex := 0;
  while lIndex <= High(FHistoric) do
  begin
    if TGlobalUtils.IsNumber(FHistoric[lIndex]) then
      if lLastOperator = TOperatorKind.None then
        TryStrToCurr(FHistoric[lIndex], lResult)
      else begin
        lResult := SolverOperation(lResult, StrToCurrDef(FHistoric[lIndex], 0), lLastOperator);
        Inc(lIndex);
      end;

    if (lIndex <= High(FHistoric)) and IsOperator(FHistoric[lIndex]) then
      lLastOperator := StrToOperatorKind(FHistoric[lIndex]);
    Inc(lIndex);
  end;

  ShowHistoric(True);
  ShowResult(CurrToStr(lResult));
  SetLength(FHistoric, 0);
end;

function TModelCalculatorArithmetic.IsOperator(const AValue: string): Boolean;
var
  lKind: TOperatorKind;
begin
  for lKind := TOperatorKind.Addition to TOperatorKind.Division do
    if SameText(AValue, lKind.ToString) then
      Exit(True);
  Result := False;
end;

function TModelCalculatorArithmetic.LastIsOperator: Boolean;
begin
  if Length(FHistoric) = 0 then
    Exit(False);

  Result := IsOperator(FHistoric[High(FHistoric)]);
end;

class function TModelCalculatorArithmetic.New(AParent: IModelCalculator): IModelCalculatorArithmetic;
begin
  Result := Self.Create(AParent);
end;

function TModelCalculatorArithmetic.NotifyHistoric(AProc: TProc<string>): IModelCalculatorArithmetic;
begin
  Result := Self;
  FOnNotifyHistoric := AProc;
end;

function TModelCalculatorArithmetic.NotifyResult(AProc: TProc<string>): IModelCalculatorArithmetic;
begin
  Result := Self;
  FOnNotifyResult := AProc;
end;

function TModelCalculatorArithmetic.SetOperation(const AValue: TOperatorKind): IModelCalculatorArithmetic;
begin
  Result := Self;
  if Length(FHistoric) = 0 then
    Exit;

  if not LastIsOperator then
    AddToHistoric(AValue.ToString)
  else
    FHistoric[High(FHistoric)] := AValue.ToString;

  ShowHistoric(False);
end;

procedure TModelCalculatorArithmetic.ShowHistoric(const ASetEqual: Boolean);
var
  lIndex: Integer;
  lHistoric: string;
begin
  if not Assigned(FOnNotifyHistoric) then
    Exit;

  lHistoric := EmptyStr;
  for lIndex := Low(FHistoric) to High(FHistoric) do
    lHistoric := Format('%s %s', [lHistoric, FHistoric[lIndex]]);

  if ASetEqual then
    lHistoric := Format('%s = ', [lHistoric]);

  FOnNotifyHistoric(lHistoric);
end;

procedure TModelCalculatorArithmetic.ShowResult(const AValue: string);
begin
  if Assigned(FOnNotifyResult) then
    FOnNotifyResult(AValue);
end;

end.
