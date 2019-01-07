(*
Autor..: Alexandre Pedro
Contato: alexandre.pedro@gmail.com
*)


unit uCalculadora;

interface

uses
   System.Classes,
   uIOperacaoMatematica,
   uSomar,
   uSubtrair,
   uDividir,
   uMultiplicar;



type TCalculadora = Class
   FBaseCalculo:Double;
   FImpostoA : Double;
   FImpostoB : Double;
   FImpostoC : Double;
   FPrimeiraOperacao : Boolean;
   FResultado:Double;
   FUltimaOperacao : IOperacaoMatematica;
  private
    function GetBaseCalculo: Double;
    procedure SetBaseCalculo(const Value: Double);
    function GetImpostoA: Double;
    function GetImpostoB: Double;
    function GetImpostoC: Double;
  public
    Somar       : IOperacaoMatematica;
    Subtrair    : IOperacaoMatematica;
    Dividir     : IOperacaoMatematica;
    Multiplicar : IOperacaoMatematica;
    property BaseCalculo:Double read GetBaseCalculo write SetBaseCalculo;
    property ImpostoA:Double read GetImpostoA;
    property ImpostoB:Double read GetImpostoB;
    property ImpostoC:Double read GetImpostoC;
    property Resultado:Double read FResultado write FResultado;
    property PrimeiraOperacao:Boolean read FPrimeiraOperacao write FPrimeiraOperacao;
    property UltimaOperacao:IOperacaoMatematica read FUltimaOperacao write FUltimaOperacao;
    procedure CalcularImpostoA;
    procedure CalcularImpostoB;
    procedure CalcularImpostoC;
    procedure CalcularImpostos;
    constructor Create; overload;
    //destructor Destroy;

End;

implementation

{ TCalculadora }

procedure TCalculadora.CalcularImpostoA;
begin
  FImpostoA := FBaseCalculo * 1.2 - 500;
end;

procedure TCalculadora.CalcularImpostoB;
begin
  FImpostoB := FImpostoA - 15;
end;

procedure TCalculadora.CalcularImpostoC;
begin
  FImpostoC := FImpostoA + FImpostoB;
end;

procedure TCalculadora.CalcularImpostos;
begin
  CalcularImpostoA;
  CalcularImpostoB;
  CalcularImpostoC;
end;

constructor TCalculadora.Create;
begin
  FPrimeiraOperacao := True;
  FBaseCalculo := 0;
  FImpostoA    := 0;
  FImpostoB    := 0;
  FImpostoC    := 0;
  FResultado   := 0;
  Somar        := TSomar.Create;
  Subtrair     := TSubtrair.Create;
  Dividir      := TDividir.Create;
  Multiplicar  := TMultiplicar.Create;
end;



function TCalculadora.GetBaseCalculo: Double;
begin
  result := FBaseCalculo;
end;

function TCalculadora.GetImpostoA: Double;
begin
  Result := FImpostoA;
end;

function TCalculadora.GetImpostoB: Double;
begin
  Result := FImpostoB;
end;

function TCalculadora.GetImpostoC: Double;
begin
  Result := FImpostoC;
end;

procedure TCalculadora.SetBaseCalculo(const Value: Double);
begin
  FBaseCalculo := Value;
end;

end.
