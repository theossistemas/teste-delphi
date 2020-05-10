unit CalculadoraU;

interface

  uses StrUtils;

type
  TOperacao = (opIsNull, opAdicao, opSubtracao, opMultiplicacao, opDivisao, opIgual);
  TCalculadora = class
    
  private
    vnumeroA: Real;
    vtemNumeroA:Boolean;

    vtemNumeroB:Boolean;
    vnumeroB: Real;

    vResultado: Real;
    
    vVlImpostoA :Real;
    vtemImpostoA :Boolean;

    vVlImpostoB :Real;
    vtemImpostoB :Boolean;

    vVlImpostoC :Real;
    vtemImpostoC :Boolean;

    voperacao: TOperacao;
    vUltimaOperacao :TOperacao;
    vHistoricoCalculo: String;

    vEhPrimeiraVez: Boolean;

    procedure setnumeroA(pnumeroA:String);
    procedure setnumeroB(pnumeroB:String);
    procedure setEhPrimeiraVez(pEhPrimeiraVez:Boolean);    

    function somar(pnumeroA: Real; pnumeroB: Real):Boolean;
    function subtrair(pnumeroA: Real; pnumeroB: Real):Boolean;
    function dividir(pnumeroA: Real; pnumeroB: Real):Boolean;
    function multiplicar(pnumeroA: Real; pnumeroB: Real):Boolean;

    procedure setResultado(pvalor:Real);
    procedure setHistoricoCalculo(pvalor: String);
    procedure setUltimaOperacao(poperacao:TOperacao);

    procedure setImpostoA(pvalor:Real);
    function getImpostoA:Real;
    function getImpostoAtoString:String;
    procedure setTemImpostoA(pvalor:Boolean);
    function temImpostoA:Boolean;

    procedure setImpostoB(pvalor:Real);
    function getImpostoB:Real;
    function getImpostoBtoString:String;
    procedure setTemImpostoB(pvalor:Boolean);
    function temImpostoB:Boolean;

    procedure setImpostoC(pvalor:Real);
    function getImpostoC:Real;
    procedure setTemImpostoC(pvalor:Boolean);
    function temImpostoC:Boolean;
    { Private declarations }
    
  public
    function calcularOperacao(pNumeroVisor:String; pOperacaoAtual :TOperacao; var pHistoricoCalculo:String):Real;

    function calcularImpostoA(pVlBaseCalculo:String; var pHistoricoCalculo:String):Real;
    function calcularImpostoB(var pHistoricoCalculo:String):Real;
    function calcularImpostoC(var pHistoricoCalculo:String):Real;        


    function temNumeroA():Boolean;
    function getnumeroA:Real;
    function getnumeroAtoString:String;


    function temNumeroB():Boolean;
    function getnumeroB:Real;
    function getnumeroBtoString:String;


    function getResultado():Real;
    function getResultadotoString():String;

    procedure setOperacao(poperacao:TOperacao);
    function getOperacao:TOperacao;

    function getUltimaOperacao:TOperacao;
    class function getOperacaoToString(poperacao:TOperacao):String;
    class function getOperacaoToConvert(poperacao:String):TOperacao;

    function getHistoricoCalculo:string;
    function ehPrimeiraVez():Boolean;
    constructor create();
    { Public declarations }
  end;


implementation

uses Variants, SysUtils;

{ TCalculadora }

constructor TCalculadora.create;
begin
  vtemNumeroA    := False;
  vtemNumeroB    := False;
  vEhPrimeiraVez := true;
  vtemImpostoA   := False;
  vtemImpostoB   := False;
  vtemImpostoC   := False;
end;

function TCalculadora.getHistoricoCalculo: string;
begin
  result := vHistoricoCalculo;
end;

function TCalculadora.getnumeroAtoString: String;
begin
  result := FloatToStr(vnumeroA);
end;

function TCalculadora.getnumeroBtoString: String;
begin
  result := FloatToStr(vnumeroB);
end;

function TCalculadora.getOperacao: TOperacao;
begin
  Result := voperacao;
end;

procedure TCalculadora.setnumeroA(pnumeroA: String);
begin
  if pnumeroA <> '' then
  begin
    vnumeroA := StrToFloat(pnumeroA);
    vtemNumeroA := True;
  end;
end;

procedure TCalculadora.setnumeroB(pnumeroB: String);
begin
  if pnumeroB <> '' then
  begin
    vnumeroB := StrToFloat(pnumeroB);
    vtemNumeroB := True;
  end;
end;

procedure TCalculadora.setOperacao(poperacao: TOperacao);
begin
  voperacao := poperacao;
end;

function TCalculadora.somar(pnumeroA: Real; pnumeroB: Real): Boolean;
begin
  if temNumeroA() and temNumeroB() then
  begin
    //SOMAR
    setResultado(pnumeroA + pnumeroB);
    setHistoricoCalculo(FloatToStr(pnumeroA)
                        +getOperacaoToString(getOperacao)
                        +FloatToStr(pnumeroB)
                        +getOperacaoToString(getUltimaOperacao));
    Result := True;
  end else
  begin
    setResultado(pnumeroA);
    setHistoricoCalculo(FloatToStr(pnumeroA)
                        +getOperacaoToString(getOperacao));
    Result := false;
  end;
end;

function TCalculadora.subtrair(pnumeroA: Real; pnumeroB: Real): Boolean;
begin
  if temNumeroA() and temNumeroB() then
  begin
    //SUBTRAIR
    setResultado(pnumeroA - pnumeroB);
    setHistoricoCalculo(FloatToStr(pnumeroA)
                        +getOperacaoToString(getOperacao)
                        +FloatToStr(pnumeroB)
                        +getOperacaoToString(getUltimaOperacao));
    Result := True;
  end else
  begin
    setResultado(pnumeroA);
    setHistoricoCalculo(FloatToStr(pnumeroA)
                        +getOperacaoToString(getOperacao));
    Result := false;
  end;
end;

function TCalculadora.dividir(pnumeroA: Real; pnumeroB: Real): Boolean;
begin
  if temNumeroA() and temNumeroB() then
  begin
    if pnumeroB = 0 then
    begin
      Result := false;
      setResultado(pnumeroB);
      setHistoricoCalculo('ERRO: Impossível dividir por zero!');
      vtemNumeroA := False;
      vtemNumeroB := False;
      Exit;
    end;
      
    //DIVIDIR
    setResultado(pnumeroA / pnumeroB);
    setHistoricoCalculo(FloatToStr(pnumeroA)
                        +getOperacaoToString(getOperacao)
                        +FloatToStr(pnumeroB)
                        +getOperacaoToString(getUltimaOperacao));
    Result := True;
  end else
  begin
    setResultado(pnumeroA);
    setHistoricoCalculo(FloatToStr(pnumeroA)
                        +getOperacaoToString(getOperacao));
    Result := false;
  end;
end;

function TCalculadora.multiplicar(pnumeroA: Real; pnumeroB: Real): Boolean;
begin
  if temNumeroA() and temNumeroB() then
  begin
    //MULTIPLICAR
    setResultado(pnumeroA * pnumeroB);
    setHistoricoCalculo(FloatToStr(pnumeroA)
                        +getOperacaoToString(getOperacao)
                        +FloatToStr(pnumeroB)
                        +getOperacaoToString(getUltimaOperacao));
    Result := True;
  end else
  begin
    setResultado(pnumeroA);
    setHistoricoCalculo(FloatToStr(pnumeroA)
                        +getOperacaoToString(getOperacao));
    Result := false;
  end;
end;

function TCalculadora.temNumeroA: Boolean;
begin
  Result := vtemNumeroA;
end;

function TCalculadora.temNumeroB: Boolean;
begin
  Result := vtemNumeroB;
end;

function TCalculadora.ehPrimeiraVez: Boolean;
begin
  Result := vEhPrimeiraVez;
end;

procedure TCalculadora.setEhPrimeiraVez(pEhPrimeiraVez: Boolean);
begin
  vEhPrimeiraVez := pEhPrimeiraVez;
end;

function TCalculadora.getUltimaOperacao: TOperacao;
begin
  result := vUltimaOperacao;
end;

procedure TCalculadora.setUltimaOperacao(poperacao: TOperacao);
begin
  vUltimaOperacao := poperacao;
end;

class function TCalculadora.getOperacaoToString(
  poperacao: TOperacao): String;
begin
  case poperacao of
    opIsNull:        result := 'IsNull';  
    opAdicao:        result := '+';
    opSubtracao:     result := '-';
    opMultiplicacao: result := 'x';
    opDivisao:       result := '/';
    opIgual:         result := '=';
  end;
end;

function TCalculadora.getnumeroA: Real;
begin
  result := vnumeroA;
end;

function TCalculadora.getnumeroB: Real;
begin
  Result := vnumeroB;
end;

function TCalculadora.getResultado: Real;
begin
  result := vResultado;
end;

function TCalculadora.getResultadotoString: String;
begin
  result := FloatToStr(vResultado);
end;

procedure TCalculadora.setResultado(pvalor: Real);
begin
  vResultado := pvalor;
end;

procedure TCalculadora.setHistoricoCalculo(pvalor: String);
begin
  vHistoricoCalculo := pvalor;
end;

function TCalculadora.calcularOperacao(pNumeroVisor:String; pOperacaoAtual :TOperacao; var pHistoricoCalculo:String): Real;
var vlcalculou:Boolean;
    vlNumeroA, vlNumeroB :Real;
begin
  //wlad: Elaborar algorítimo para calculadora padrão de mesa e de computador.

//* Quando digitarmos um número e escolhermos uma operação, a calculadora checa se é a primeira vez.
//	* Se for, o resultado é o número do visor.

//* Conforme trocamos, as operações são executadas, o valor é armazenado e a operação é atualizada.

//* Ao clicar em igual, checamos se é a primeira vez.
//	* Se for, executamos a última operação com o número do visor.

//	* Caso não seja, a operação será executada, mas usamos o que guardamos do visor no primeiro clique de igual.
//    Isso permite que façamos 5 / 5 * 2 (igual, igual).

//

  //gravar as operações, exceto a operação "=", para saber qual foi a ultima operação calculada
  //ou seja, getOperacao nunca terá a operação opIgual
  if (pOperacaoAtual <> opIgual)then
    setOperacao(pOperacaoAtual);

  if (ehPrimeiraVez) then
  begin
    if not temNumeroA then
    begin
      setnumeroA(pNumeroVisor);
    end else
    begin
      setnumeroB(pNumeroVisor);
    end;
  end;


  //se digitou a operacao "=" duas vezes seguidas, pega o ultimo resultado e o atual e recalcula com a ultima operação
    if (pOperacaoAtual = OpIgual) and (pOperacaoAtual = getUltimaOperacao) then
     setnumeroA(getResultadotoString);

  //se digitou a operação "=" e a ultima operação foi outra, pega o ultimo resultado e joga em A e o do visor em B
  if (pOperacaoAtual = OpIgual) and (getUltimaOperacao <> OpIgual) and (pNumeroVisor <> '')then
  begin
    setnumeroA(getResultadotoString);
    setnumeroB(pNumeroVisor);
  end;

  //se digitou a operacao "=" ou outra operação e depois outra operacao,
  //pega o resultado atual como numeroA e aguarde o numeroB (limpe-o) e
  //comece as contas novamente com o resultado e o proximo numero do visor.
  if ((getUltimaOperacao = OpIgual)and (getUltimaOperacao <> pOperacaoAtual))
      and (pOperacaoAtual <> opIgual)
      and (getUltimaOperacao <> opIsNull) then
  begin
    setnumeroA(getResultadotoString);
    vtemNumeroB := False;
    setEhPrimeiraVez(true);    
  end;

  //se digitou a operação diferente de "=" e a ultima operação foi outra diferente e diferente de "=",
  //calcula com a ultima operação
  //ex: 760-100+ resultado 660
  if (pOperacaoAtual <> OpIgual)
  and ((getUltimaOperacao <> OpIgual)and (getUltimaOperacao <> pOperacaoAtual))
  and (getUltimaOperacao <> opIsNull)then
  begin
    setOperacao(getUltimaOperacao);
  end;

  vlNumeroA := getnumeroA;
  vlNumeroB := getnumeroB;

  setUltimaOperacao(pOperacaoAtual);
  case getOperacao of
    opAdicao:
      begin
        vlcalculou := somar(vlNumeroA, vlNumeroB);
      end;

    opSubtracao:
      begin
        vlcalculou := subtrair(vlNumeroA, vlNumeroB);
      end;

    opMultiplicacao:
      begin
        vlcalculou := multiplicar(vlNumeroA, vlNumeroB);
      end;

    opDivisao:
      begin
        vlcalculou := dividir(vlNumeroA, vlNumeroB);
      end;
  end;

  result := getResultado;

  if vlcalculou then
    setEhPrimeiraVez(False);

  pHistoricoCalculo := getHistoricoCalculo;
end;

class function TCalculadora.getOperacaoToConvert(poperacao: String): TOperacao;
begin
  case AnsiIndexStr(UpperCase(poperacao), ['', '+', '-', '/', '*', 'X', '=']) of
    0 : Result := opIsNull;
    1 : result := opAdicao;
    2 : result := opSubtracao;
    3 : result := opDivisao;
    4 : result := opMultiplicacao;
    5 : result := opMultiplicacao;
    6 : result := opIgual;
  end;
end;

function TCalculadora.getImpostoA: Real;
begin
  Result := vVlImpostoA;
end;

function TCalculadora.getImpostoB: Real;
begin
  Result := vVlImpostoB;
end;

function TCalculadora.getImpostoC: Real;
begin
  Result := vVlImpostoC;
end;

procedure TCalculadora.setImpostoA(pvalor: Real);
begin
  vVlImpostoA := pvalor;
end;

procedure TCalculadora.setImpostoB(pvalor: Real);
begin
  vVlImpostoB := pvalor;
end;

procedure TCalculadora.setImpostoC(pvalor: Real);
begin
  vVlImpostoC := pvalor;
end;

procedure TCalculadora.setTemImpostoA(pvalor: Boolean);
begin
  vtemImpostoA := pvalor;
end;

procedure TCalculadora.setTemImpostoB(pvalor: Boolean);
begin
  vtemImpostoB := pvalor;
end;

procedure TCalculadora.setTemImpostoC(pvalor: Boolean);
begin
  vtemImpostoC := pvalor;
end;

function TCalculadora.temImpostoA: Boolean;
begin
  result := vtemImpostoA;
end;

function TCalculadora.temImpostoB: Boolean;
begin
  result := vtemImpostoB;
end;

function TCalculadora.temImpostoC: Boolean;
begin
  result := vtemImpostoC;
end;

//* Utilizando a calculadora acima aumente as funcionalidades criando botões com cálculos específicos e
//com os seguintes impostos abaixo em cada botão:

//1º Parêntesis;
//2º Expoentes;
//3º Multiplicações e Divisões; (da esquerda para a direita)
//4º Somas e Subtrações. (da esquerda para a direita)

//Na ausência de parênteses, as operações realizam-se pela ordem seguinte:
//
//Factoriais
//Cálculo de funções
//Potências e raízes
//Multiplicações e divisões
//Adições e subtracções

function TCalculadora.calcularImpostoA(pVlBaseCalculo:String;
  var pHistoricoCalculo: String): Real;
var vlVlBaseCaculo: Real;
begin
  if pVlBaseCalculo = '' then
  begin
    pHistoricoCalculo := 'ERRO: 1º Informe a Base de Calculo!';
    setHistoricoCalculo(pHistoricoCalculo);
    result := 0;
    Exit;
  end else
    vlVlBaseCaculo := StrToFloat(pVlBaseCalculo);

  //	* Imposto A = Base de Cálculo (Valor imposto na calculadora) * 20 % - 500.
  result := vlVlBaseCaculo * 20/100 - 500;
  pHistoricoCalculo := 'Imposto A: '
                      +pVlBaseCalculo
                      +' * 20% - 500 '
                      +getOperacaoToString(opIgual);
                      
  setImpostoA(result);
  setTemImpostoA(True);

  setResultado(result);
  setHistoricoCalculo(pHistoricoCalculo);
end;

function TCalculadora.calcularImpostoB(var pHistoricoCalculo: String): Real;
begin

  if not temImpostoA then
  begin
    pHistoricoCalculo := 'ERRO: 1º Calcule o Imposto A!';
    setHistoricoCalculo(pHistoricoCalculo);
    result := 0;
    Exit;
  end;

  //	* Imposto B = Imposto A – 15.
  result := getImpostoA - 15;
  pHistoricoCalculo := 'Imposto B: '
                      +getImpostoAtoString()
                      +' - 15 '
                      +getOperacaoToString(opIgual);

  setImpostoB(Result);
  setTemImpostoB(True);

  setResultado(result);
  setHistoricoCalculo(pHistoricoCalculo);
end;

function TCalculadora.calcularImpostoC(var pHistoricoCalculo: String): Real;
begin
  if not temImpostoA then
  begin
    pHistoricoCalculo := 'ERRO: 1º Calcule o Imposto A!';
    setHistoricoCalculo(pHistoricoCalculo);
    result := 0;
    Exit;
  end;

  if not temImpostoB then
  begin
    pHistoricoCalculo := 'ERRO: 1º Calcule o Imposto B!';
    setHistoricoCalculo(pHistoricoCalculo);
    result := 0;
    Exit;
  end;  

  //	* Imposto C = Imposto A + imposto B.
  result := getImpostoA + getImpostoB;
  pHistoricoCalculo := 'Imposto C: '
                      +getImpostoAtoString()
                      +getOperacaoToString(opAdicao)
                      +getImpostoBtoString()
                      +getOperacaoToString(opIgual);

  setImpostoC(Result);
  setTemImpostoC(True);

  setResultado(result);
  setHistoricoCalculo(pHistoricoCalculo);
end;

function TCalculadora.getImpostoAtoString: String;
begin
  result := FloatToStr(vVlImpostoA);
end;

function TCalculadora.getImpostoBtoString: String;
begin
  result := FloatToStr(vVlImpostoB);
end;

end.
