unit Global.Utils;

interface

uses
  System.SysUtils;

type
  TGlobalUtils = class
  public
    class function IsNumber(const AValue: string): Boolean;
  end;

implementation

{ TGlobalUtils }

class function TGlobalUtils.IsNumber(const AValue: string): Boolean;
var
  lIndex: Integer;
begin
  for lIndex := 1 to Length(AValue) do
    if not CharInSet(AValue[lIndex], ['0' .. '9', ',']) then
      Exit(False);
  Result := True;
end;

end.
