unit Entities.Calculadora.ImpostoC;

interface

uses
  System.Generics.Collections, Entities.Calculadora.Interfaces, Entities.Calculadora.Operacao,
  Generics.Collections, Entities.Calculadora.ImpostoA, Entities.Calculadora.ImpostoB;

type
  TImpostoC = class sealed( TOperacao)
  private
    function CalcImpC(Value : Double) : Double;
  public
    constructor Create(Value : TList<Double>);
    destructor Destroy(); override;

    class function New( Value : TList<Double>) : iOperacao;

    function Exec() : Double; override;
  end;

implementation

{ TImpostoC }

function TImpostoC.CalcImpC(Value: Double): Double;
var
  dImpA, dImpB : Double;
begin
  dImpA := TImpostoA.New(nil)
              .Add(Value)
              .Exec();

  dImpB := TImpostoB.New(nil)
              .Add(Value)
              .Exec();

  result := dImpA + dImpB;
end;

constructor TImpostoC.Create(Value : TList<Double>);
begin
  inherited Create(Value);
end;

destructor TImpostoC.Destroy;
begin

  inherited;
end;

function TImpostoC.Exec: Double;
var
  i: Integer;
begin
  result := CalcImpC( FList[0] ) ;

  for i := 1 to Pred(FList.Count) do
    Result := Result + CalcImpC(FList[i]);

  DisplayTotal( Result );
  inherited;
end;

class function TImpostoC.New( Value : TList<Double>) : iOperacao;
begin
  result := TImpostoC.Create(Value);
end;


end.

