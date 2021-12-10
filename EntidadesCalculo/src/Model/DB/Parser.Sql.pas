unit Parser.Sql;

interface

type
  TParserSql = class
  public
    class function FromString(const AValue: string): string;
    class function FromInteger(const AValue: Int32): string;
    class function FromCurrency(const AValue: Currency): string;
    class function FromDateTime(const AValue: TDateTime): string;
    class function FromBoolean(const AValue: Boolean): string;
  end;

implementation

uses
  System.SysUtils,
  System.DateUtils;

var
  GlobalFmt: TFormatSettings;

{ TParserSql }

class function TParserSql.FromDateTime(const AValue: TDateTime): string;
begin
  if AValue = 0 then
    Result := EmptyStr
  else if DateOf(AValue) = AValue then
    Result := QuotedStr(FormatDateTime('yyyy-mm-dd', AValue, GlobalFmt))
  else if TimeOf(AValue) = AValue then
    Result := QuotedStr(FormatDateTime('hh:nn:ss', AValue, GlobalFmt))
  else
    Result := QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss', AValue, GlobalFmt));
end;

class function TParserSql.FromBoolean(const AValue: Boolean): string;
begin
  Result := 'False';
  if AValue then
    Result := 'True';
end;

class function TParserSql.FromCurrency(const AValue: Currency): string;
begin
  Result := CurrToStr(AValue, GlobalFmt);
end;

class function TParserSql.FromInteger(const AValue: Int32): string;
begin
  Result := IntToStr(AValue);
end;

class function TParserSql.FromString(const AValue: string): string;
begin
  Result := QuotedStr(AValue);
end;

initialization
begin
  GlobalFmt.ShortDateFormat  := 'YYYY-mm-dd';
  GlobalFmt.DateSeparator    := '-';
  GlobalFmt.ShortTimeFormat  := 'hh:nn:ss.zzz';
  GlobalFmt.TimeSeparator    := ':';
  GlobalFmt.DecimalSeparator := '.';
  GlobalFmt.TimeAMString     := 'AM';
  GlobalFmt.TimePMString     := 'PM';
end;

end.
