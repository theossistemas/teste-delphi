unit Common.Constantes;

interface

const
  _INT_TRUE = 1;
  _INT_FALSE = 0;

function BoolToInt(Value : Boolean) : Integer;
function IntToBool(Value : integer) : boolean;

implementation

function BoolToInt(Value : Boolean) : Integer;
begin
  Result := 0;
  if Value then
    result := 1;
end;

function IntToBool(Value : integer) : boolean;
begin
  result := Value = _INT_TRUE;
end;

end.
