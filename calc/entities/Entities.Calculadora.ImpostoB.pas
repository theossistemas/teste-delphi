unit Entities.Calculadora.ImpostoB;

interface

uses
  Entities.Calculadora.Interfaces, Entities.Calculadora.Operacao,
  Generics.Collections, Entities.Calculadora.ImpostoA, System.Generics.Collections;

type
  TImpostoB = class sealed( TOperacao)
  private
    function CalcImpB(Value : Double) : Double;
  public
    constructor Create(Value : TList<Double>);
    destructor Destroy(); override;

    class function New( Value : TList<Double>) : iOperacao;

    function Exec() : Double; override;
  end;

implementation

{ TImpostoB }

function TImpostoB.CalcImpB(Value: Double): Double;
var
  dImpA : Double;
begin
  dImpA := TImpostoA.New(nil)
              .Add(Value)
              .Exec();

  result := dImpA - 15;
end;

constructor TImpostoB.Create(Value : TList<Double>);
begin
  inherited Create(Value);
end;

destructor TImpostoB.Destroy;
begin

  inherited;
end;

function TImpostoB.Exec: Double;
var
  i: Integer;
begin
  result := CalcImpB( FList[0] ) ;

  for i := 1 to Pred(FList.Count) do
    Result := Result + CalcImpB(FList[i]);

  DisplayTotal( Result );
  inherited;
end;

class function TImpostoB.New( Value : TList<Double>) : iOperacao;
begin
  result := TImpostoB.Create(Value);
end;


end.

