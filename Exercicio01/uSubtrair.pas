(*
Autor..: Alexandre Pedro
Contato: alexandre.pedro@gmail.com
*)

unit uSubtrair;

interface

uses
  System.Classes,
  uIOperacaoMatematica;

  type TSubtrair = Class(TInterfacedObject,IOperacaoMatematica)
  private
    FValor01 : Double;
    FValor02 : Double;
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

{ TSubtrair }

function TSubtrair.Calcular(const vValor01, vValor02: Double): Double;
begin
  FValor01 := vValor01;
  FValor02 := vValor02;
  Result   := FValor01 - FValor02;
end;

function TSubtrair.Calcular: Double;
begin
  Result := FValor01 - FValor02;
end;

constructor TSubtrair.Create;
begin
  FSinalOperacao := '-';
  FValor01 := 0;
  FValor02 := 0;
  FPrimeiraOperacao := True;
end;

function TSubtrair.GetPrimeiraOperacao: Boolean;
begin
  Result := FPrimeiraOperacao;
end;

function TSubtrair.GetSinalOperacao: Char;
begin
  Result := FSinalOperacao;
end;

function TSubtrair.GetValor01: Double;
begin
  Result := FValor01;
end;

function TSubtrair.GetValor02: Double;
begin
  Result := FValor02;
end;

procedure TSubtrair.SetPrimeiraOperacao(vValor: Boolean);
begin
  FPrimeiraOperacao := vValor;
end;

procedure TSubtrair.SetValor01(vValor: Double);
begin
  FValor01 := vValor;
end;

procedure TSubtrair.SetValor02(vValor: Double);
begin
  FValor02 := vValor;
end;

end.
