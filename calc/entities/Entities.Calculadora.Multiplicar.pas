unit Entities.Calculadora.Multiplicar;

interface

uses
  Entities.Calculadora.Interfaces, Entities.Calculadora.Operacao,
  Generics.Collections;

type
  TMultiplicar = class sealed( TOperacao)
  public
    constructor Create( Value : TList<Double>);
    destructor Destroy(); override;

    class function New( Value : TList<Double>) : iOperacao;

    function Exec() : Double; override;
  end;

implementation

{ TMultiplicar }

constructor TMultiplicar.Create( Value : TList<Double>);
begin
  inherited Create(Value);
end;

destructor TMultiplicar.Destroy;
begin

  inherited;
end;

function TMultiplicar.Exec: Double;
var
  i: Integer;
begin
  result := FList[0];

  for i := 1 to Pred(FList.Count) do
    Result := Result * FList[i];

  DisplayTotal( Result );
  inherited;
end;

class function TMultiplicar.New( Value : TList<Double>) : iOperacao;
begin
  result := TMultiplicar.Create(Value);
end;


end.

