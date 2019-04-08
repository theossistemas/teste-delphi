unit Entities.Calculadora.Somar;

interface

uses
  Entities.Calculadora.Interfaces, Entities.Calculadora.Operacao,
  Generics.Collections;

type
  TSomar = class sealed( TOperacao)
  public
    constructor Create(Value : TList<Double>);
    destructor Destroy(); override;

    class function New(Value : TList<Double>) : iOperacao;

    function Exec() : Double; override;
  end;

implementation

{ TSomar }

constructor TSomar.Create(Value : TList<Double>);
begin
  inherited Create(Value);
end;

destructor TSomar.Destroy;
begin

  inherited;
end;

function TSomar.Exec: Double;
var
  i: Integer;
begin
  result := FList[0];

  for i := 1 to Pred(FList.Count) do
    Result := Result + FList[i];

  DisplayTotal( Result );

  inherited;
end;

class function TSomar.New(Value : TList<Double>) : iOperacao;
begin
  result := TSomar.Create(Value);
end;


end.

