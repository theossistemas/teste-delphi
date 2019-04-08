unit Common.Util;

interface

function GetAppVersionStr(const AFileName: string): string;


implementation

uses
  System.SysUtils;

function GetAppVersionStr(const AFileName: string): string;
var
  Rec: LongRec;
begin
  Rec := LongRec(GetFileVersion(AFileName));
  Result := Format('%d.%d', [Rec.Hi, Rec.Lo])
end;

end.
