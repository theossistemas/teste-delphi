unit uFuncoes;

interface

uses
  System.StrUtils, System.SysUtils, uFuncionario, System.Math;

type
  TFuncoes = class
    function FormatarMoeda(sValor: String): String;
    function CalcularINSS(dSalario: Double; dPercINSS: Double): Double;
    function CalcularIR(iQtdDependentesIR: Integer; dSalario, dPercIR:
      Double; dValorDeducao: Double): Double;
  end;

implementation

{ TFuncoes }

function TFuncoes.CalcularINSS(dSalario: Double; dPercINSS: Double): Double;
begin
  Result := SimpleRoundTo(dSalario * dPercINSS / 100, -2);
end;

function TFuncoes.CalcularIR(iQtdDependentesIR: Integer; dSalario, dPercIR,
  dValorDeducao: Double): Double;
begin
  Result := dSalario - (dValorDeducao * iQtdDependentesIR);
  Result := SimpleRoundTo(Result * dPercIR / 100, -2);
end;

function TFuncoes.FormatarMoeda(sValor: String): String;
var
  iPosicao: Integer;
  sDecimal, sCentena, sMilhar, sMilhao: String;
begin
  //Removendo caracteres especiais
  for iPosicao := 1 to Length(sValor) do
    if not (sValor[iPosicao] in ['0'..'9']) then
      Delete(sValor, iPosicao, 1);

  //Removendo zeros a esquerda
  while (Copy(sValor, 1, 1) = '0') and (Length(sValor) > 0) do begin
    sValor := RightStr(sValor, Length(sValor) - 1);
  end;

  if Length(sValor) = 0 then begin
    sValor := '0,00';
  end else if Length(sValor) = 1 then begin
    sValor := '0,0'+sValor;
  end else if Length(sValor) = 2 then begin
    sValor := '0,'+sValor;
  end else begin
    sValor := DupeString(' ', 11 - Length(sValor))+sValor;
    sMilhao := IfThen(Copy(sValor, 1, 3) <> '   ', Trim(Copy(sValor, 1, 3))+'.');
    sMilhar := IfThen(Copy(sValor, 4, 3) <> '   ', Trim(Copy(sValor, 4, 3))+'.');
    sCentena := IfThen(Copy(sValor, 7, 3) <> '   ', Trim(Copy(sValor, 7, 3))+',');
    sDecimal := Copy(sValor, 10, 2);
    sValor := sMilhao+sMilhar+sCentena+sDecimal
  end;

  Result := sValor;
end;

end.
