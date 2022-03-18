unit unCalculadora;

interface

uses
  Vcl.StdCtrls, System.SysUtils, System.Classes;

type
  TProcedure = procedure of object;

  TCalculadora = Class
  private
    FTotal: Double;
    FVisor, FValorVisorAnterior: string;
    FTrocaValorVisor: Boolean;
    FOperacao: char;
    FPrimeiraOperacao: Boolean;
    FDisplay: TProcedure;
    function RemoveZeros(numero: string): string;
    procedure SetVisor(const Value: string);
  public
    constructor Create(pDisplay: TProcedure);
    procedure AdicionaDigito(const pDigito: char);
    procedure RemoveDigito;
    procedure SetOperacao(const pOperacao: char);
    procedure Calcular;
    procedure CalcularImposto(const pOperacao: char);
    procedure Limpar;
    property Visor: string read FVisor write SetVisor;
    property Operacao: char read FOperacao write SetOperacao;
  End;

implementation

uses
  unFactoryOperacoes;

procedure TCalculadora.AdicionaDigito(const pDigito: char);
begin
  if FTrocaValorVisor then
  begin
    if pDigito = ',' then
      FVisor := '0' + pDigito
    else
      FVisor := pDigito;
    if (pDigito = '0') and (FVisor = '0') then
      Exit;
    FTrocaValorVisor := False
  end
  else
  begin
    if (pDigito = ',') and (Pos(',', FVisor) = 0) then
      FVisor := FVisor + ','
    else if pDigito <> ',' then
    begin

      FVisor := FVisor + pDigito;
      FVisor := RemoveZeros(FVisor);
    end;
  end;

  FValorVisorAnterior := FVisor;
  FDisplay;
end;

procedure TCalculadora.Calcular;
begin
  if FPrimeiraOperacao and (FVisor <> '0') then
  begin
    // FTotal := StrToFloat(FVisor);
    if FOperacao = '-' then
    begin
      FVisor := '-' + FVisor;
    end;
    FTotal := StrToFloat(FVisor);
    FVisor := FloatToStr(FTotal);
    FTrocaValorVisor := True;
    FPrimeiraOperacao := False;
    FDisplay;
    Exit;
  end;

  FTotal := TFactoryOperacao.GetOperacao(FOperacao)
    .Calcular([FTotal, StrToFloat(FVisor)]);
  FVisor := FloatToStr(FTotal);
  FTrocaValorVisor := True;

  FDisplay;
end;

procedure TCalculadora.CalcularImposto(const pOperacao: char);
begin
  FTotal := TFactoryOperacao.GetOperacao(pOperacao)
    .Calcular([StrToFloat(FVisor)]);
  FVisor := FloatToStr(FTotal);
  FTrocaValorVisor := True;
  FDisplay;
end;

constructor TCalculadora.Create(pDisplay: TProcedure);
begin
  Limpar;
  FDisplay := pDisplay;
  FDisplay;
end;

procedure TCalculadora.Limpar;
begin
  FTotal := 0;
  FVisor := '0';
  FValorVisorAnterior := '0';
  FTrocaValorVisor := True;
  FOperacao := #0;
  FPrimeiraOperacao := True;
  if Assigned(FDisplay) then
    FDisplay;
end;

procedure TCalculadora.RemoveDigito;
begin
  FVisor := copy(FVisor, 1, length(FVisor) - 1);
  if FVisor = '' then
  begin
    FVisor := '0';
    FTrocaValorVisor := True;
  end;

  FDisplay;
end;

function TCalculadora.RemoveZeros(numero: string): string;
var
  i: integer;
  CharSet: TSysCharSet;
begin
  CharSet := ['1' .. '9', '-', ','];
  for i := 0 to length(numero) do
  begin
    if CharInSet(numero[i], CharSet) then
    begin
      Break
    end;
    result := copy(numero, i, 20);
  end;
end;

procedure TCalculadora.SetOperacao(const pOperacao: char);
begin
  if (FPrimeiraOperacao) and (FVisor = '0') then
  begin
    FOperacao := pOperacao;
    FDisplay;
    Exit;
  end
  else if (FPrimeiraOperacao) and (FVisor <> '0') then
  begin
    Calcular;
    FOperacao := pOperacao;
    FTrocaValorVisor := True;
    FPrimeiraOperacao := False;
    FDisplay;
    Exit;
  end;

  if pOperacao = '=' then
  begin
    if (FOperacao <> #0) and (FOperacao <> '=') then
    begin
      FVisor := FValorVisorAnterior;
      Calcular;
      FTrocaValorVisor := True;
      FDisplay;
    end;
    Exit;
  end;

  if (pOperacao <> '=') and FTrocaValorVisor then
  begin
    FOperacao := pOperacao;
    FDisplay;
    Exit;
  end;

  Calcular;
  FOperacao := pOperacao;
  FTrocaValorVisor := True;
  FDisplay;
end;

procedure TCalculadora.SetVisor(const Value: string);
begin
  FVisor := Value;
end;

end.
