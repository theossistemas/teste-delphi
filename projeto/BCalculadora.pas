unit BCalculadora;

interface

uses CCalculadora, Math, SysUtils;

type
  TBCalculadora = class
    public
      oCalculadora: TCalculadora;
      constructor Create;
      function getCalculo: Currency; overload;
      function getCalculo(const tipo: String): Currency; overload;
  end;

implementation

{ TBCalculadora }

constructor TBCalculadora.Create;
begin
  oCalculadora := TCalculadora.Create;
end;

function TBCalculadora.getCalculo: Currency;
begin
  if (oCalculadora.getOperacao = '+') then
    oCalculadora.setTotal( oCalculadora.getTotal + oCalculadora.getValor )
  else if (oCalculadora.getOperacao = '-') then
    oCalculadora.setTotal( oCalculadora.getTotal - oCalculadora.getValor )
  else if (oCalculadora.getOperacao = '*') then
    oCalculadora.setTotal( oCalculadora.getTotal * oCalculadora.getValor )
  else if (oCalculadora.getOperacao = '/') then
    oCalculadora.setTotal( oCalculadora.getTotal / oCalculadora.getValor ) ;

  if not oCalculadora.getIsOpIgual then
    oCalculadora.setValorAnterior(ZeroValue);

  result := oCalculadora.getTotal;
end;

function TBCalculadora.getCalculo(const tipo: String): Currency;
begin
  if (tipo = 'Imposto A') then
  begin
    oCalculadora.setImpostoA( (oCalculadora.getValor * (0.01 * 20) ) - 500 );
    result := oCalculadora.getImpostoA;
  end
  else if (tipo = 'Imposto B') then
  begin
    oCalculadora.setImpostoB( oCalculadora.getImpostoA - 15 );
    result := oCalculadora.getImpostoB;
  end
  else if (tipo = 'Imposto C') then
    result := oCalculadora.getImpostoA + oCalculadora.getImpostoB
  else
    result := ZeroValue;
end;

end.
