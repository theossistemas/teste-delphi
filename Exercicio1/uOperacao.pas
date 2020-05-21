unit uOperacao;

interface

uses System.SysUtils, uInterfaceOperacao;

type
  TSoma = class ( TInterfacedObject, IOperacao )
  private
    FsResultado: String;
  public
    function getResultado: String;
    procedure Calcular(const psPrimeiroNumero,psSegundoNumero: String);
    property resultado: String read getResultado;
  end;

  TSubtracao = class ( TInterfacedObject, IOperacao )
  private
    FsResultado: String;
  public
    function getResultado: String;
    procedure Calcular(const psPrimeiroNumero,psSegundoNumero: String);
    property resultado: String read getResultado;
  end;

  TDivisao = class ( TInterfacedObject, IOperacao )
  private
    FsResultado: String;
  public
    function getResultado: String;
    procedure Calcular(const psPrimeiroNumero,psSegundoNumero: String);
    property resultado: String read getResultado;
  end;

  TMultiplicacao = class ( TInterfacedObject, IOperacao )
  private
    FsResultado: String;
  public
    function getResultado: String;
    procedure Calcular(const psPrimeiroNumero,psSegundoNumero: String);
    property resultado: String read getResultado;
  end;

implementation

{ TSoma }

procedure TSoma.Calcular(const psPrimeiroNumero, psSegundoNumero: String);
var
  dPrimeiroNumero: Double;
  dSegundoNumero: Double;
  dResultado: Double;
begin
  dPrimeiroNumero := StrToFloat(psPrimeiroNumero);
  dSegundoNumero := StrToFloat(psSegundoNumero);
  dResultado := dPrimeiroNumero + dSegundoNumero;
  FsResultado := FloatToStr(dResultado);
end;

function TSoma.getResultado: String;
begin
  Result := FsResultado;
end;

{ TSubtracao }

procedure TSubtracao.Calcular(const psPrimeiroNumero, psSegundoNumero: String);
var
  dPrimeiroNumero: Double;
  dSegundoNumero: Double;
  dResultado: Double;
begin
  dPrimeiroNumero := StrToFloat(psPrimeiroNumero);
  dSegundoNumero := StrToFloat(psSegundoNumero);
  dResultado := dPrimeiroNumero - dSegundoNumero;
  FsResultado := FloatToStr(dResultado);
end;

function TSubtracao.getResultado: String;
begin
  Result := FsResultado;
end;

{ TMultiplicacao }

procedure TMultiplicacao.Calcular(const psPrimeiroNumero,
  psSegundoNumero: String);
var
  dPrimeiroNumero: Double;
  dSegundoNumero: Double;
  dResultado: Double;
begin
  dPrimeiroNumero := StrToFloat(psPrimeiroNumero);
  dSegundoNumero := StrToFloat(psSegundoNumero);
  dResultado := dPrimeiroNumero * dSegundoNumero;
  FsResultado := FloatToStr(dResultado);
end;

function TMultiplicacao.getResultado: String;
begin
  Result := FsResultado;
end;

{ TDivisao }

procedure TDivisao.Calcular(const psPrimeiroNumero, psSegundoNumero: String);
var
  dPrimeiroNumero: Double;
  dSegundoNumero: Double;
  dResultado: Double;
begin
  dPrimeiroNumero := StrToFloat(psPrimeiroNumero);
  dSegundoNumero := StrToFloat(psSegundoNumero);
  if dSegundoNumero = 0 then
  begin
    if dPrimeiroNumero = 0 then
      FsResultado := 'Resultado infinito'
    else
      FsResultado := 'Não é possível dividir por zero';
    exit;
  end;
  dResultado := dPrimeiroNumero / dSegundoNumero;
  FsResultado := FloatToStr(dResultado);
end;

function TDivisao.getResultado: String;
begin
  Result := FsResultado;
end;

end.
