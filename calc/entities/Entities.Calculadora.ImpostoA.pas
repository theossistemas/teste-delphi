unit Entities.Calculadora.ImpostoA;

interface

uses
  Entities.Calculadora.Interfaces, Entities.Calculadora.Operacao,
  Generics.Collections;

type
  TImpostoA = class sealed( TOperacao)
  private
    function CalcImpA(Value : Double) : Double;
  public
    constructor Create( Value : TList<Double>);
    destructor Destroy(); override;

    class function New(Value : TList<Double>) : iOperacao;

    function Exec() : Double; override;
  end;

implementation

{ TImpostoA }

function TImpostoA.CalcImpA(Value: Double): Double;
begin
  result := (Value * 20 /100) - 500;
end;

constructor TImpostoA.Create( Value : TList<Double>);
begin
  inherited Create(Value);
end;

destructor TImpostoA.Destroy;
begin

  inherited;
end;

function TImpostoA.Exec: Double;
var
  i: Integer;
begin
  result := CalcImpA( FList[0] ) ;

  for i := 1 to Pred(FList.Count) do
    Result := Result + CalcImpA(FList[i]);

  DisplayTotal( Result );
  inherited;
end;

class function TImpostoA.New(Value : TList<Double>) : iOperacao;
begin
  result := TImpostoA.Create(Value);
end;


end.

