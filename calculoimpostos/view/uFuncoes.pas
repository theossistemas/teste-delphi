unit uFuncoes;

interface

uses
  System.StrUtils, System.SysUtils, uFuncionario, System.Math;

type
  TFuncoes = class
    function FormatarMoeda(sValor: String): String;
    function CalcularINSS(oFuncionario: TFuncionario; dPercINSS: Double): Double;
    function CalcularIR(oFuncionario: TFuncionario; dPercIR:
      Double; dValorDeducao: Double): Double;
  end;

implementation

{ TFuncoes }

function TFuncoes.CalcularINSS(oFuncionario: TFuncionario;
  dPercINSS: Double): Double;
var
  iIndice: Integer;
  bCalcular: Boolean;
begin
  bCalcular := false;
  for iIndice := 0 to oFuncionario.ListaDependentes.Count - 1 do begin
    if oFuncionario.ListaDependentes[iIndice].IsCalculaINSS then begin
      bCalcular := true;
      break;
    end;
  end;

  if bCalcular then begin
    Result := SimpleRoundTo(oFuncionario.Salario * dPercINSS / 100, -2);
  end else begin
    Result := 0;
  end;
end;

function TFuncoes.CalcularIR(oFuncionario: TFuncionario; dPercIR,
  dValorDeducao: Double): Double;
var
  iIndice, iQtdDependentes: Integer;
begin
  iQtdDependentes := 0;
  for iIndice := 0 to oFuncionario.ListaDependentes.Count - 1 do begin
    if oFuncionario.ListaDependentes[iIndice].IsCalculaIR then begin
      Inc(iQtdDependentes);
    end;
  end;

  Result := oFuncionario.Salario - (dValorDeducao * iQtdDependentes);
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
