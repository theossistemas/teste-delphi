unit Entities.Calculadora.Dividir;

interface

uses
  Entities.Calculadora.Interfaces, Entities.Calculadora.Operacao,
  Generics.Collections;

type
  TDividir = class sealed( TOperacao)
  public
    constructor Create(Value : TList<Double>);
    destructor Destroy(); override;

    class function New(Value : TList<Double>) : iOperacao;

    function Exec() : Double; override;
  end;

implementation

{ TDividir }

constructor TDividir.Create(Value : TList<Double>);
begin
  inherited Create(Value);
end;

destructor TDividir.Destroy;
begin

  inherited;
end;

function TDividir.Exec: Double;
var
  i: Integer;
begin
  result := FList[0];

  for i := 1 to Pred(FList.Count) do
    Result := Result / FList[i];

  DisplayTotal( Result );
  inherited;
end;

class function TDividir.New(Value : TList<Double>) : iOperacao;
begin
  result := TDividir.Create(Value);
end;


end.

