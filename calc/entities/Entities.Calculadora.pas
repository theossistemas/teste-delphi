unit Entities.Calculadora;

interface

uses
  SysUtils, Entities.Calculadora.Interfaces, Generics.Collections,
  Entities.Calculadora.Eventos;

type
  TCalculadora = class(TInterfacedObject, iCalculadora, iCalculadoraDisplay)
    FList : TList<Double>;

    FEvDisplayTotal : TEvDisplayTotal;
  public
    constructor Create();
    destructor Destroy(); override;

    class function New : iCalculadora;

    function Add(Value : Double) : iCalculadora;
    function Reset() : iCalculadora;

    function Somar : iOperacao;
    function Subtrair : iOperacao;
    function Dividir : iOperacao;
    function Multiplicar : iOperacao;

    function ImpostoA() : iOperacao;
    function ImpostoB() : iOperacao;
    function ImpostoC() : iOperacao;

    function Display : iCalculadoraDisplay;

    function Resultado(Value : TEvDisplayTotal) : iCalculadoraDisplay;
    function EndDisplay : iCalculadora;
  end;

implementation

uses
  Entities.Calculadora.Dividir, Entities.Calculadora.Multiplicar, Entities.Calculadora.Somar,
  Entities.Calculadora.Subtrair, Entities.Calculadora.ImpostoA,
  Entities.Calculadora.ImpostoB, Entities.Calculadora.ImpostoC;

{ TCalculadora }

function TCalculadora.Add(Value: Double): iCalculadora;
begin
  result := Self;
  FList.Add( Value );
end;

constructor TCalculadora.Create;
begin
  FList := TList<Double>.Create();
end;

destructor TCalculadora.Destroy;
begin
  FreeAndNil(FList);

  inherited;
end;

function TCalculadora.Display: iCalculadoraDisplay;
begin
  result := Self;
end;

function TCalculadora.Dividir: iOperacao;
begin
  Result :=  TDividir.New(FList)
                .Display
                  .Resultado(FEvDisplayTotal)
                .EndDisplay;
end;

function TCalculadora.EndDisplay: iCalculadora;
begin
  result := Self;
end;

function TCalculadora.ImpostoA: iOperacao;
begin
  Result :=  TImpostoA.New(FList)
                .Display
                  .Resultado(FEvDisplayTotal)
                .EndDisplay;
end;

function TCalculadora.ImpostoB: iOperacao;
begin
  Result :=  TImpostoB.New(FList)
                .Display
                  .Resultado(FEvDisplayTotal)
                .EndDisplay;
end;

function TCalculadora.ImpostoC: iOperacao;
begin
  Result :=  TImpostoC.New(FList)
                .Display
                  .Resultado(FEvDisplayTotal)
                .EndDisplay;
end;

function TCalculadora.Multiplicar: iOperacao;
begin
  Result :=  TMultiplicar.New(FList)
                .Display
                  .Resultado(FEvDisplayTotal)
                .EndDisplay;
end;

class function TCalculadora.New: iCalculadora;
begin
  result := TCalculadora.Create();
end;

function TCalculadora.Reset: iCalculadora;
begin
  result := Self;
  FList.Clear();
end;

function TCalculadora.Resultado(Value: TEvDisplayTotal): iCalculadoraDisplay;
begin
  result := self;
  FEvDisplayTotal := Value;
end;

function TCalculadora.Somar: iOperacao;
begin
  Result :=  TSomar.New(FList)
                .Display
                  .Resultado(FEvDisplayTotal)
                .EndDisplay;
end;

function TCalculadora.Subtrair: iOperacao;
begin
  Result :=  TSubtrair.New(FList)
                .Display
                  .Resultado(FEvDisplayTotal)
                .EndDisplay;
end;

end.
