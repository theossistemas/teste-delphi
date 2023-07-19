unit unClasseCalculadora;

interface

uses
  System.SysUtils;

type

  EExceptionDivisao = class(Exception);

  TTipoOperacao = (tpoNada, tpoSoma, tpoSubtracao, tpoMultiplicacao, tpoDivisao);


  TOperacao = class(TObject)
    function Calculo(): Double; virtual; abstract;
  end;


  TCalculadora = class(TOperacao)
  private
    FprimeiraVez: Boolean;
    function Calculo(): Double; override;
  protected
    procedure CalcularPrimeiraVez();
    procedure CalcularDemaisVezes();
  public
    class var operacaoAtiva: TTipoOperacao;
    class var nNumeroAnterior: Double;
    class var nNumeroAtual: Double;
    class var nResultado: Double;
    class var zerar: Boolean;
    class var agurdandoResultado: Boolean;

    property primeiraVez: Boolean read FprimeiraVez write FprimeiraVez;
  end;


  TOperacaoSoma = class(TCalculadora)
  public
    function Calculo(): Double; override;
  end;


  TOperacaoSubtracao = class(TCalculadora)
  public
    function Calculo(): Double; override;
  end;


  TOperacaoMultiplicacao = class(TCalculadora)
  public
    function Calculo(): Double; override;
  end;


  TOperacaoDivisao = class(TCalculadora)
  public
    function Calculo(): Double; override;
  end;


const
  MENSAGEM_DIVISAO_POR_ZERO: string = ('N�o � poss�vel dividir por zero');
  MENSAGEM_RESULTADO_INDEFINIDO: string = ('Resultado indefinido');

implementation

{ TOperacaoSoma }

function TOperacaoSoma.Calculo: Double;
begin
  Result := inherited;
end;

{ TOperacaoSubtracao }

function TOperacaoSubtracao.Calculo: Double;
begin
  Result := inherited;
end;

{ TOperacaoMultiplicacao }

function TOperacaoMultiplicacao.Calculo: Double;
begin
  Result := inherited;
end;

{ TOperacaoDivisao }

function TOperacaoDivisao.Calculo: Double;
begin
  Result := inherited;
end;

{ TCalculadora }

procedure TCalculadora.CalcularDemaisVezes;
begin
  case operacaoAtiva of
    tpoNada:
      nResultado := 0;
    tpoSoma:
      nResultado := nResultado + nNumeroAtual;
    tpoSubtracao:
      nResultado := nResultado - nNumeroAtual;
    tpoMultiplicacao:
      nResultado := nResultado * nNumeroAtual;
    tpoDivisao:
      begin
        if nNumeroAtual = 0 then
        begin
          //nResultado := 0
          if nResultado = 0 then
            raise EExceptionDivisao.Create(MENSAGEM_RESULTADO_INDEFINIDO)
          else
            raise EExceptionDivisao.Create(MENSAGEM_DIVISAO_POR_ZERO);
        end
        else
          nResultado := nResultado / nNumeroAtual;
      end;
  end;
  nNumeroAnterior := nNumeroAtual;
end;

procedure TCalculadora.CalcularPrimeiraVez;
begin
  primeiraVez := False;
  case operacaoAtiva of
    tpoNada:
      nResultado := 0;
    tpoSoma:
      nResultado := nNumeroAnterior + nNumeroAtual;
    tpoSubtracao:
      nResultado := nNumeroAnterior - nNumeroAtual;
    tpoMultiplicacao:
      nResultado := nNumeroAnterior * nNumeroAtual;
    tpoDivisao:
      begin
        if nNumeroAtual = 0 then 
        begin
          //nResultado := 0
          if nNumeroAnterior = 0 then
            raise EExceptionDivisao.Create(MENSAGEM_RESULTADO_INDEFINIDO)
          else
            raise EExceptionDivisao.Create(MENSAGEM_DIVISAO_POR_ZERO);
        end
        else
          nResultado := nNumeroAnterior / nNumeroAtual;
      end;
  end;
end;

function TCalculadora.Calculo: Double;
begin
  if (primeiraVez) then
     CalcularPrimeiraVez()
  else
    CalcularDemaisVezes();

  Result := nResultado;
end;

end.
