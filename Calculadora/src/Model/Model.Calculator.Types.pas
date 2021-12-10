unit Model.Calculator.Types;

interface

uses
  System.StrUtils;

type
  {$SCOPEDENUMS ON}
  TOperatorKind  = (None, Addition, Subtraction, Multiplication, Division);
  TOperatorKinds = set of TOperatorKind;
  {$SCOPEDENUMS OFF}

  TOperatorKindHelper = record helper for TOperatorKind
  public
    function ToString: string;
  end;

  function StrToOperatorKind(const AOperatorStr: string): TOperatorKind;

implementation

{ TOperatorKindHelper }

function TOperatorKindHelper.ToString: string;
const
  OPERATOR_KIND: array [TOperatorKind.Addition .. TOperatorKind.Division] of string = ('+', '-', '*', '/');
begin
  Result := OPERATOR_KIND[Self];
end;

function StrToOperatorKind(const AOperatorStr: string): TOperatorKind;
begin
  Result := TOperatorKind.None;
  case AnsiIndexStr(AOperatorStr, ['+', '-', '*', '/']) of
    0:
      Exit(TOperatorKind.Addition);
    1:
      Exit(TOperatorKind.Subtraction);
    2:
      Exit(TOperatorKind.Multiplication);
    3:
      Exit(TOperatorKind.Division);
  end;
end;

end.
