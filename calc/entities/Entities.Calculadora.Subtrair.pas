unit Entities.Calculadora.Subtrair;

interface

uses
  Entities.Calculadora.Interfaces, Entities.Calculadora.Operacao,
  Generics.Collections;

type
  TSubtrair = class sealed( TOperacao)
  public
    constructor Create(Value : TList<Double>);
    destructor Destroy(); override;

    class function New(Value : TList<Double>) : iOperacao;

    function Exec() : Double; override;
  end;

implementation

{ TSubtrair }

constructor TSubtrair.Create(Value : TList<Double>);
begin
  inherited Create(Value);
end;

destructor TSubtrair.Destroy;
begin

  inherited;
end;

function TSubtrair.Exec: Double;
var
  i: Integer;
begin
  result := FList[0];

  for i := 1 to Pred(FList.Count) do
    Result := Result - FList[i];

  DisplayTotal( Result );
  inherited;
end;

class function TSubtrair.New(Value : TList<Double>) : iOperacao;
begin
  result := TSubtrair.Create(Value);
end;


end.

