unit UCalculos;

interface

Uses System.Generics.Collections, SysUtils;

type classCalculo = class
      private
             FPrimeiroNumero: extended;
             FNumero: string;
             FOperacaoAtual: integer;
      public
            property PrimeiroNumero: extended read FPrimeiroNumero write FPrimeiroNumero;
            property Numero: string  read FNumero  write FNumero;
            property OperacaoAtual: integer  read FOperacaoAtual  write FOperacaoAtual;

            procedure Reiniciar;
            function ValidaValor(v_valor : string) : Extended;
            function CalculaValores() : Extended;
            function RetornaOperacao( v_tipo : string): string;
            function CalculaImpostoA(v_Valor: extended): extended;
            function CalculaImpostoB(v_Valor: extended): extended;
            function CalculaImpostoC(v_Valor: extended): extended;
            constructor Create;
end;

implementation

{ classCalculo }

function classCalculo.CalculaImpostoA(v_Valor: extended): extended;
var
   v_porcentagem,
   v_valorfixo : Extended;
begin
     v_porcentagem := 20;
     v_valorfixo   := 500;

     //descobre 20% do valor
     Result := (v_porcentagem / 100) * v_valor;

     // valor * (20% do valor) - 500
     Result := (v_Valor * result) - 500;
end;

function classCalculo.CalculaImpostoB(v_Valor: extended): extended;
begin
     Result := CalculaImpostoA(v_Valor) - 15;
end;

function classCalculo.CalculaImpostoC(v_Valor: extended): extended;
begin
     Result := CalculaImpostoA(v_valor) + CalculaImpostoB(v_valor);
end;

function classCalculo.RetornaOperacao(v_tipo: string): string;
var
   v_Operacao    : String;
   v_primeiraVez : Boolean;
begin
     v_Operacao := UpperCase(Copy(v_tipo, Pos('_',v_tipo) + 1,Length(v_tipo)));

     //verifica se é a primeira vez que entra aqui
     v_primeiraVez := FOperacaoAtual = -1 ;

     if v_Operacao = 'MULTIPLICACAO' then
        begin
             FOperacaoAtual := 0;
             Result := '*';
        end;

     if v_Operacao = 'DIVISAO' then
        begin
             FOperacaoAtual := 1;
             Result := '/';
        end;

     if v_Operacao = 'SOMA' then
        begin
             FOperacaoAtual := 2;
             Result := '+';
        end;

     if v_Operacao = 'SUBTRACAO' then
        begin
             FOperacaoAtual := 3;
             Result := '-';
        end;

     if v_primeiraVez then
        Result := '=';
end;

function classCalculo.ValidaValor(v_valor: string): Extended;
begin
     try
        Result := StrToFloat(v_valor);
     except
        Result := 0;
     end;
end;

function classCalculo.CalculaValores: Extended;
begin
     case OperacaoAtual of
          0 : result := FPrimeiroNumero * ValidaValor(FNumero);
          1 : result := FPrimeiroNumero / ValidaValor(FNumero);
          2 : result := FPrimeiroNumero + ValidaValor(FNumero);
          3 : result := FPrimeiroNumero - ValidaValor(FNumero);
     end;

end;

constructor classCalculo.Create;
begin
     Reiniciar;
end;

procedure classCalculo.Reiniciar;
begin
     FPrimeiroNumero      := 0;
     FNumero              := '';
     FOperacaoAtual       := -1;
end;

end.
