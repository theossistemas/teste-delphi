unit UCalculadora;

interface

type
  TCalculadora = class
    { Private declarations }
    private
      FValor: Currency;
      FValorAnterior: Currency;
      FTotal: Currency;
      FOperacao: String;
      FIsOpIgual: Boolean;
      FImpostoA: Currency;
      FImpostoB: Currency;
      FImpostoC: Currency;
    { Public declarations }
    public
      procedure setValor(const valor: Currency);
      procedure setValorAnterior(const valor: Currency);
      procedure setTotal(const valor: Currency);
      procedure setOperacao(const valor: String);
      procedure setIsOpIgual(const valor: Boolean);
      procedure setImpostoA(const valor: Currency);
      procedure setImpostoB(const valor: Currency);
      procedure setImpostoC(const valor: Currency);

      function getValor: Currency;
      function getValorAnterior: Currency;
      function getTotal: Currency;
      function getOperacao: String;
      function getIsOpIgual: Boolean;
      function getImpostoA: Currency;
      function getImpostoB: Currency;
      function getImpostoC: Currency;
  end;

implementation

{ TCalculadora }

function TCalculadora.getImpostoA: Currency;
begin
  result := self.FImpostoA;
end;

function TCalculadora.getImpostoB: Currency;
begin
  result := self.FImpostoB;
end;

function TCalculadora.getImpostoC: Currency;
begin
  result := self.FImpostoC;
end;

function TCalculadora.getIsOpIgual: Boolean;
begin
  result := self.FIsOpIgual;
end;

function TCalculadora.getOperacao: String;
begin
  result := self.FOperacao;
end;

function TCalculadora.getTotal: Currency;
begin
  result := self.FTotal;
end;

function TCalculadora.getValor: Currency;
begin
  result := self.FValor;
end;

function TCalculadora.getValorAnterior: Currency;
begin
  result := self.FValorAnterior;
end;

procedure TCalculadora.setImpostoA(const valor: Currency);
begin
  self.FImpostoA := valor;
end;

procedure TCalculadora.setImpostoB(const valor: Currency);
begin
  self.FImpostoB := valor;
end;

procedure TCalculadora.setImpostoC(const valor: Currency);
begin
  self.FImpostoC := valor;
end;

procedure TCalculadora.setIsOpIgual(const valor: Boolean);
begin
  self.FIsOpIgual := valor;
end;

procedure TCalculadora.setOperacao(const valor: String);
begin
  self.FOperacao := valor;
end;

procedure TCalculadora.setTotal(const valor: Currency);
begin
  self.FTotal := valor;
end;

procedure TCalculadora.setValor(const valor: Currency);
begin
  self.FValor := valor;
end;

procedure TCalculadora.setValorAnterior(const valor: Currency);
begin
  self.FValorAnterior := valor;
end;

end.
