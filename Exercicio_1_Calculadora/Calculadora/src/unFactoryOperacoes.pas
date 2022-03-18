unit unFactoryOperacoes;

interface

uses
  unOperacoes;
type
TFactoryOperacao = class
  public
    class function GetOperacao(const pOperacao: char): IOperacao;
  end;
implementation

{ TFactoryOperacao }

{ TFactoryOperacao }

class function TFactoryOperacao.GetOperacao(const pOperacao: char): IOperacao;
begin
  case pOperacao of
    '+':
      result := TOperacaoAdicao.Create;
    '-':
      result := TOperacaoSubtracao.Create;
    '*':
      result := TOperacaoMultiplicacao.Create;
    '/':
      result := TOperacaoDivisao.Create;
    'A':
      result := TOperacaoImpostoA.Create;
    'B':
      result := TOperacaoImpostoB.Create;
    'C':
      result := TOperacaoImpostoC.Create;
  end;
end;

end.
