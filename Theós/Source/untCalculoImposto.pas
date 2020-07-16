unit untCalculoImposto;

interface

uses
  System.Classes, System.SysUtils;

type
  IBaseCalculoImposto = interface
    ['{CE2B1696-3B65-41D1-9869-586F3B511D88}']

    function fcCalcular: Double;
    function GetBaseCalculo: Double;
    procedure SetBaseCalculo(const Value: Double);

    property BaseCalculo: Double read GetBaseCalculo write SetBaseCalculo;
  end;

  TImpostoA = class(TInterfacedObject, IBaseCalculoImposto)
  private
    FBaseCalculo: Double;

    procedure SetBaseCalculo(const Value: Double);
    function GetBaseCalculo: Double;
  public
    function fcCalcular: Double;

    property BaseCalculo: Double read GetBaseCalculo write SetBaseCalculo;
  end;

  TImpostoB = class(TInterfacedObject, IBaseCalculoImposto)
  private
    FImpostoA: TImpostoA;
    FBaseCalculo: Double;

    procedure SetImpostoA(const Value: TImpostoA);
    function GetBaseCalculo: Double;
    procedure SetBaseCalculo(const Value: Double);
  public
    function fcCalcular: Double;

    property ImpostoA: TImpostoA read FImpostoA write SetImpostoA;
    property BaseCalculo: Double read GetBaseCalculo write SetBaseCalculo;
  end;

  TImpostoC = class(TInterfacedObject, IBaseCalculoImposto)
  private
    FImpostoB: TImpostoB;
    FBaseCalculo: Double;

    procedure SetImpostoB(const Value: TImpostoB);
    function GetBaseCalculo: Double;
    procedure SetBaseCalculo(const Value: Double);
  public
    function fcCalcular: Double;

    property ImpostoB: TImpostoB read FImpostoB write SetImpostoB;
    property BaseCalculo: Double read GetBaseCalculo write SetBaseCalculo;
  end;


implementation

{ TImpostoA }

function TImpostoA.fcCalcular: Double;
begin
  Result := (FBaseCalculo * 0.20) - 500;

  if Result < 0 then
    Result := 0;
end;

function TImpostoA.GetBaseCalculo: Double;
begin
  Result := FBaseCalculo;
end;

procedure TImpostoA.SetBaseCalculo(const Value: Double);
begin
  FBaseCalculo := Value;
end;

{ TImpostoB }

function TImpostoB.fcCalcular: Double;
begin
  Result := FImpostoA.fcCalcular - 15;

  if Result < 0 then
    Result := 0;
end;

function TImpostoB.GetBaseCalculo: Double;
begin
  Result := FBaseCalculo;
end;

procedure TImpostoB.SetBaseCalculo(const Value: Double);
begin
  FBaseCalculo := Value;
end;

procedure TImpostoB.SetImpostoA(const Value: TImpostoA);
begin
  FImpostoA := Value;
end;

{ TImpostoC }

function TImpostoC.fcCalcular: Double;
begin
  Result := FImpostoB.ImpostoA.fcCalcular + FImpostoB.fcCalcular;

  if Result < 0 then
    Result := 0;
end;

function TImpostoC.GetBaseCalculo: Double;
begin
  Result := FBaseCalculo;
end;

procedure TImpostoC.SetBaseCalculo(const Value: Double);
begin
  FBaseCalculo := Value;
end;

procedure TImpostoC.SetImpostoB(const Value: TImpostoB);
begin
  FImpostoB := Value;
end;

end.
