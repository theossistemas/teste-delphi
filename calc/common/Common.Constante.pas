unit Common.Constante;

interface

type
 TOperacao = (opNenhum, opIgualdade, opAdicao, opSubtracao, opMultiplicao, opDivisao, opImpostoA, opImpostoB, opImpostoC);

const
  _OPERACAO_NENHUM        = '';
  _OPERACAO_IGUALDADE     = '=';
  _OPERACAO_ADICAO        = '+';
  _OPERACAO_SUBTRACAO     = '-';
  _OPERACAO_MULTIPLICACAO = '*';
  _OPERACAO_DIVISAO       = '/';

  _OPERACAO_IMPOSTO_A     = 'A';
  _OPERACAO_IMPOSTO_B     = 'B';
  _OPERACAO_IMPOSTO_C     = 'C';


function StrToEnumerado(var ok: boolean; const s: string; const AString:
  array of string; const AEnumerados: array of variant): variant;
function EnumeradoToStr(const t: variant; const AString: array of string; const AEnumerados: array of variant): variant;

function OperacaoToStr(const T : TOperacao) : string;
function StrToOperacao(const s : string; var OK : boolean) : TOperacao;


implementation

uses
  System.SysUtils;

function OperacaoToStr(const T : TOperacao) : string;
begin
  result := EnumeradoToStr(T,[ _OPERACAO_NENHUM, _OPERACAO_IGUALDADE, _OPERACAO_ADICAO, _OPERACAO_SUBTRACAO, _OPERACAO_MULTIPLICACAO, _OPERACAO_DIVISAO, _OPERACAO_IMPOSTO_A, _OPERACAO_IMPOSTO_B, _OPERACAO_IMPOSTO_C ],
                            [ opNenhum, opIgualdade, opAdicao, opSubtracao, opMultiplicao, opDivisao, opImpostoA, opImpostoB, opImpostoC] );
end;

function StrToOperacao(const s : string; var OK : boolean) : TOperacao;
begin
  result := StrToEnumerado(ok, s,[ _OPERACAO_NENHUM, _OPERACAO_IGUALDADE, _OPERACAO_ADICAO, _OPERACAO_SUBTRACAO, _OPERACAO_MULTIPLICACAO, _OPERACAO_DIVISAO, _OPERACAO_IMPOSTO_A, _OPERACAO_IMPOSTO_B, _OPERACAO_IMPOSTO_C ],
                          [  opNenhum, opIgualdade, opAdicao, opSubtracao, opMultiplicao, opDivisao, opImpostoA, opImpostoB, opImpostoC ] );
end;


function StrToEnumerado(var ok: boolean; const s: string; const AString:
  array of string; const AEnumerados: array of variant): variant;
var
  i: integer;
begin
  result := -1;
  for i := Low(AString) to High(AString) do
    if AnsiSameText(s, AString[i]) then
        result := AEnumerados[i];

  ok := result <> -1;

  if not ok then
    result := AEnumerados[0];
end;

function EnumeradoToStr(const t: variant; const AString:
  array of string; const AEnumerados: array of variant): variant;
var
  i: integer;
begin
  result := '';

  for i := Low(AEnumerados) to High(AEnumerados) do
    if t = AEnumerados[i] then
      result := AString[i];
end;



end.
