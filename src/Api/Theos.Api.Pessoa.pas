unit Theos.Api.Pessoa;

interface

uses
  System.SysUtils, System.Math,

  Theos.Api.Calculadora;

type
  TPessoa = class abstract
  strict private
    type
      TImposto = record
      public
        function CalcularINSS(const Salario: Double; const PossuiDependente: Boolean): Double;
        function CalcularBaseIR(const Salario: Double; const QuantosDependentes: Integer): Double;
        function CalcularIR(const Base: Double): Double;
      end;
    class var FImposto: TImposto;
  public
    class property Imposto: TImposto read FImposto;
    class function ValidarCPF(const Valor: string): Boolean;
  end;

implementation

class function TPessoa.ValidarCPF(const Valor: string): Boolean;
const
  TAMANHO_CPF = 11;
var
  Digito: array [0 .. 1] of Word;
  Cpf: array [0 .. 10] of Byte;

  function ValidarSeTodosOsDigitosSaoIguais: Boolean;
  begin
    for var I := 0 to 9 do
    begin
      if Valor = StringOfChar(i.ToString[1], TAMANHO_CPF) then
        Exit(True);
      Result := False;
    end;
  end;

  function VerificarQuentidadeDeCaracteresValido: Boolean;
  begin
    if Length(Valor) <> TAMANHO_CPF then
      Exit(False);
    Result := True;
  end;

begin
  if not VerificarQuentidadeDeCaracteresValido then
    Exit(False);

  if ValidarSeTodosOsDigitosSaoIguais then
    Exit(False);

  try
    for var I := 1 to TAMANHO_CPF do
      Cpf[I - 1] := StrToInt(Valor[I]);

    Digito[0] := 10 * Cpf[0] + 9 * Cpf[1] + 8 * Cpf[2];
    Digito[0] := Digito[0] + 7 * Cpf[3] + 6 * Cpf[4] + 5 * Cpf[5];
    Digito[0] := Digito[0] + 4 * Cpf[6] + 3 * Cpf[7] + 2 * Cpf[8];
    Digito[0] := TAMANHO_CPF - Digito[0] mod TAMANHO_CPF;
    Digito[0] := IfThen(Digito[0] >= 10, 0, Digito[0]);

    Digito[1] := TAMANHO_CPF * Cpf[0] + 10 * Cpf[1] + 9 * Cpf[2];
    Digito[1] := Digito[1] + 8 * Cpf[3] + 7 * Cpf[4] + 6 * Cpf[5];
    Digito[1] := Digito[1] + 5 * Cpf[6] + 4 * Cpf[7] + 3 * Cpf[8];
    Digito[1] := Digito[1] + 2 * Digito[0];
    Digito[1] := TAMANHO_CPF - Digito[1] mod TAMANHO_CPF;
    Digito[1] := IfThen(Digito[1] >= 10, 0, Digito[1]);

    Result := ((Digito[0] = Cpf[9]) and (Digito[1] = Cpf[10]));
  except
    on E: Exception do
      Result := False;
  end;
end;

function TPessoa.TImposto.CalcularINSS(const Salario: Double; const PossuiDependente: Boolean): Double;
begin
  const PERCENTUAL = 8;
  Result := TCalculadora.CalculaPercentual(Salario, PERCENTUAL);
end;

function TPessoa.TImposto.CalcularBaseIR(const Salario: Double; const QuantosDependentes: Integer): Double;
begin
  var VALOR_POR_DEPENDENTE: Double := 100;
  result := Salario - (QuantosDependentes * VALOR_POR_DEPENDENTE);
end;

function TPessoa.TImposto.CalcularIR(const Base: Double): Double;
begin
  const PERCENTUAL = 15;
  Result := TCalculadora.CalculaPercentual(Base, PERCENTUAL);
end;

end.
