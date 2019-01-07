(*
Autor..: Alexandre Pedro
Contato: alexandre.pedro@gmail.com
*)

unit uDividir;

interface

uses
  System.Classes,
  uIOperacaoMatematica;

  type TDividir = Class(TInterfacedObject,IOperacaoMatematica)
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

{ TDividir }

function TDividir.Calcular(const vValor01, vValor02: Double): Double;
begin
  FValor01 := vValor01;
  FValor02 := vValor02;
  if vValor02 > 0
  then
    Result := FValor01 / FValor02
  else
    Result := 0;
end;

function TDividir.Calcular: Double;
begin
  if FValor02 > 0
  then
    Result := FValor01 / FValor02
  else
    Result := 0;
end;

constructor TDividir.Create;
begin
  FSinalOperacao := '/';
  FValor01 := 0;
  FValor02 := 0;
  FPrimeiraOperacao := True;
end;

function TDividir.GetPrimeiraOperacao: Boolean;
begin
  Result := FPrimeiraOperacao;
end;

function TDividir.GetSinalOperacao: Char;
begin
  Result := FSinalOperacao;
end;

function TDividir.GetValor01: Double;
begin
  Result := FValor01;
end;

function TDividir.GetValor02: Double;
begin
  Result := FValor02;
end;

procedure TDividir.SetPrimeiraOperacao(vValor: Boolean);
begin
  FPrimeiraOperacao := vValor;
end;

procedure TDividir.SetValor01(vValor: Double);
begin
  FValor01 := vValor;
end;

procedure TDividir.SetValor02(vValor: Double);
begin
  FValor02 := vValor;
end;

end.
