unit Theos.Lib.Nullable;

interface

uses
  Generics.Defaults, SysUtils;

type
  Nullable<T> = record
  strict private
    type
      ENullableTypeHasNoValue = class(Exception);

    var
      FValue: T;
      FHasValue: IInterface;

    function GetValue: T;
    function GetHasValue: Boolean;
  public
    constructor Create(AValue: T);
    function GetValueOrDefault: T; overload;
    function GetValueOrDefault(Default: T): T; overload;
    procedure Clear;

    property HasValue: Boolean read GetHasValue;
    property Value: T read GetValue;

    class operator NotEqual(ALeft, ARight: Nullable<T>): Boolean;
    class operator Equal(ALeft, ARight: Nullable<T>): Boolean;

    class operator Implicit(Value: Nullable<T>): T;
    class operator Implicit(Value: T): Nullable<T>;
    class operator Explicit(Value: Nullable<T>): T;
  end;

  procedure SetFlagInterface(var Intf: IInterface);

implementation

function NopAddref(inst: Pointer): Integer; stdcall;
begin
  Result := -1;
end;

function NopRelease(inst: Pointer): Integer; stdcall;
begin
  Result := -1;
end;

function NopQueryInterface(inst: Pointer; const IID: TGUID; out Obj): HResult; stdcall;
begin
  Result := E_NOINTERFACE;
end;

const
  FlagInterfaceVTable: array[0..2] of Pointer =
  (
    @NopQueryInterface,
    @NopAddref,
    @NopRelease
  );

  FlagInterfaceInstance: Pointer = @FlagInterfaceVTable;

procedure SetFlagInterface(var Intf: IInterface);
begin
  Intf := IInterface(@FlagInterfaceInstance);
end;

procedure Nullable<T>.Clear;
begin
  FHasValue := nil;
  FValue := Default(T);
end;

constructor Nullable<T>.Create(AValue: T);
begin
  FValue := AValue;
  SetFlagInterface(FHasValue);
end;

class operator Nullable<T>.Equal(ALeft, ARight: Nullable<T>): Boolean;
begin
  if ALeft.HasValue and ARight.HasValue then
  begin
    var Comparer: IEqualityComparer<T> := TEqualityComparer<T>.Default;
    Exit(Comparer.Equals(ALeft.Value, ARight.Value));
  end;
  Result := ALeft.HasValue = ARight.HasValue;
end;

class operator Nullable<T>.Explicit(Value: Nullable<T>): T;
begin
  Result := Value.Value;
end;

function Nullable<T>.GetHasValue: Boolean;
begin
  Result := FHasValue <> nil;
end;

function Nullable<T>.GetValue: T;
const
  MENSAGEM_ERRO = 'Operação inválida operation, Nullable não possuí valor';
begin
  if not HasValue then
    raise ENullableTypeHasNoValue.Create(MENSAGEM_ERRO);
  Result := FValue;
end;

function Nullable<T>.GetValueOrDefault: T;
begin
  if HasValue then
    Exit(FValue);
  Result := Default(T);
end;

function Nullable<T>.GetValueOrDefault(Default: T): T;
begin
  if not HasValue then
    Exit(Default);
  Result := FValue;
end;

class operator Nullable<T>.Implicit(Value: Nullable<T>): T;
begin
  Result := Value.Value;
end;

class operator Nullable<T>.Implicit(Value: T): Nullable<T>;
begin
  Result := Nullable<T>.Create(Value);
end;

class operator Nullable<T>.NotEqual(ALeft, ARight: Nullable<T>): Boolean;
begin
  if ALeft.HasValue and ARight.HasValue then
  begin
    var Comparer: IEqualityComparer<T> := TEqualityComparer<T>.Default;
    Exit(not Comparer.Equals(ALeft.Value, ARight.Value));
  end;
  Result := ALeft.HasValue <> ARight.HasValue;
end;

end.
