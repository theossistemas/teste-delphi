unit CalculadoraU;

interface

  uses StrUtils;

type
  TOperacao = (opIsNull, opAdicao, opSubtracao, opMultiplicacao, opDivisao, opIgual);
  TCalculadora = class
    //procedure teste(Sender: TObject);
  private
    vnumeroA: Real;
    vtemNumeroA:Boolean;

    vtemNumeroB:Boolean;
    vnumeroB: Real;

    vResultado: Real;

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
    { Private declarations }
    
  public
    function calcular(pNumeroVisor:String; pOperacaoAtual :TOperacao; var pHistoricoCalculo:String):Real;

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
    function getOperacaoToString(poperacao:TOperacao):String;
    function getOperacaoToConvert(poperacao:String):TOperacao;

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
  vtemNumeroA := False;
  vtemNumeroB := False;
  vEhPrimeiraVez := true;
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

function TCalculadora.getOperacaoToString(
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

function TCalculadora.calcular(pNumeroVisor:String; pOperacaoAtual :TOperacao; var pHistoricoCalculo:String): Real;
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

//  //se a operacao e a ultima operacao forem as mesmas e diferentes de "=", não faz nada, continua mesmo historico e mesmo resultado
//  //ex: 110+50- resultado 160
//  if (pOperacaoAtual <> opIgual) and (pOperacaoAtual = getUltimaOperacao)then
//  begin
//    pHistoricoCalculo := getHistoricoCalculo;
//    result := getResultado;
//    Exit;
//  end;

  vlNumeroA := getnumeroA;
  vlNumeroB := getnumeroB;

//    //se digitou outra operacao e depois "=", pega o ultimo resultado e o atual e recalcula com a nova operação
//    if (getOperacao <> pOperacaoAtual) and (pOperacaoAtual = OpIgual) then
//    begin
//      vlNumeroA := getResultado;
//      vlNumeroB := getResultado;
//    end;

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

function TCalculadora.getOperacaoToConvert(poperacao: String): TOperacao;
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

end.
