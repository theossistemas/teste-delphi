(*
Autor..: Alexandre Pedro
Contato: alexandre.pedro@gmail.com
*)


unit uSomar;

interface

uses
  System.Classes,
  uIOperacaoMatematica;

  type TSomar = Class(TInterfacedObject,IOperacaoMatematica)
  private
    FValor01 : Double;
    FValor02 : Double;
    //FResultado : Double;
    FPrimeiraOperacao:Boolean;
    FSinalOperacao : Char;
    function GetPrimeiraOperacao:Boolean;
    procedure SetPrimeiraOperacao(vValor:Boolean);
    function GetValor01:Double;
    procedure SetValor01(vValor:Double);
    function GetValor02:Double;
    procedure SetValor02(vValor:Double);
    function GetSinalOperacao:Char;
  public
    property SinalOperacao:Char read GetSinalOperacao;
    function Calcular(const vValor01, vValor02 : Double):Double; overload;
    function Calcular:Double; overload;
    constructor Create;overload;

  End;



implementation

{ TSomar }

function TSomar.Calcular(const vValor01, vValor02: Double): Double;
begin
  FValor01 := vValor01;
  FValor02 := vValor02;
  Result   := FValor01 + FValor02;
end;

function TSomar.Calcular: Double;
begin
  Result := FValor01 + FValor02;
end;

constructor TSomar.Create;
begin
  FSinalOperacao := '+';
  FValor01 := 0;
  FValor02 := 0;
  FPrimeiraOperacao := True;
end;

function TSomar.GetPrimeiraOperacao: Boolean;
begin
  Result := FPrimeiraOperacao;
end;

function TSomar.GetSinalOperacao: Char;
begin
  Result := FSinalOperacao;
end;

function TSomar.GetValor01: Double;
begin
  Result := FValor01;
end;

function TSomar.GetValor02: Double;
begin
  Result := FValor02;
end;

procedure TSomar.SetPrimeiraOperacao(vValor: Boolean);
begin
  FPrimeiraOperacao := vValor;
end;

procedure TSomar.SetValor01(vValor: Double);
begin
  FValor01 := vValor;
end;

procedure TSomar.SetValor02(vValor: Double);
begin
  FValor02 := vValor;
end;

end.
