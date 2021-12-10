unit Utils.Global;

interface

uses
  System.SysUtils,
  System.Hash;

type
  TGlobalUtils = class
  public
    class function CreateObjectId: string;
    class function OnlyNumber(const AValue: string): string;
    class function CPFIsValid(const AValue: string): Boolean;
  end;

implementation

{ TGlobalUtils }

class function TGlobalUtils.CPFIsValid(const AValue: string): Boolean;
var
  lIndex: Integer;
  lValid: Boolean;
  lDigit1, lDigit2: Integer;
begin
  lValid := False;
  lDigit1 := 0;
  lDigit2 := 0;

  for lIndex := 1 to Length(AValue) do
  begin
    if AValue[lIndex] <> AValue[1] then
    begin
      lValid := True;
      Break
    end;
  end;

  if not lValid then
    Exit(False);

  for lIndex := 1 to 9 do
    lDigit1 := lDigit1 + (StrToInt(AValue[10 - lIndex]) * (lIndex + 1));
  lDigit1 := ((11 - (lDigit1 mod 11)) mod 11) mod 10;

  if IntToStr(lDigit1) <> AValue[10] then
    Exit(False);

  for lIndex := 1 to 10 do
    lDigit2 := lDigit2 + (StrToInt(AValue[11 - lIndex]) * (lIndex + 1));
  lDigit2 := ((11 - (lDigit2 mod 11)) mod 11) mod 10;

  if IntToStr(lDigit2) <> AValue[11] then
    Exit(False);

  Result := True;
end;

class function TGlobalUtils.CreateObjectId: string;
begin
  Result := THashMD5.GetHashString(TGUID.NewGuid.ToString);
end;

class function TGlobalUtils.OnlyNumber(const AValue: string): string;
var
  lIndex: Integer;
begin
  Result := EmptyStr;
  for lIndex := 1 to Length(AValue) do
  begin
    case Char(AValue[lIndex]) of
      '0'..'9':
        Result := Result + AValue[lIndex];
    end;
  end;
end;

end.
