unit untCalcularImpostoExercicio2;

interface

uses
  untFuncionario, untDependente, Generics.Collections;

type
  TCalcularImpostoExercicio2 = class
  private
    function fcTestarExisteDependenteCalculaIR(const pListaDependentes: TObjectList<TDependente>): Boolean;
    function fcRetornarNumeroDependentesCalculaIR(const pListaDependentes: TObjectList<TDependente>): Integer;
    function fcTestarExisteDependenteCalculaINSS(const pListaDependentes: TObjectList<TDependente>): Boolean;
  public
    function fcRetornarValorIR(const pFuncionario: TFuncionario): Double;
    function fcRetornarValorINSS(const pFuncionario: TFuncionario): Double;
  end;

implementation

{ TCalcularImpostoExercicio2 }

function TCalcularImpostoExercicio2.fcRetornarNumeroDependentesCalculaIR(const pListaDependentes: TObjectList<TDependente>): Integer;
var
  vContador: Integer;
begin
  Result := 0;

  if not Assigned(pListaDependentes) then
    Exit;

  if pListaDependentes.Count = 0 then
    Exit;

  for vContador := 0 to pListaDependentes.Count - 1 do
  begin
    if pListaDependentes[vContador].IsCalcularIR > 0 then
      Inc(Result);
  end;
end;

function TCalcularImpostoExercicio2.fcRetornarValorIR(const pFuncionario: TFuncionario): Double;
const
  cFATORIR = 0.15;
  cVALORDEDUCAOPORDEPENDENTE = 100;
var
  vListaDependentes: TObjectList<TDependente>;
  vValorDeducao: Double;
begin
  Result := 0;

  if not Assigned(pFuncionario) then
    Exit;

  if pFuncionario.Salario <= 0 then
    Exit;

  vValorDeducao     := 0;
  vListaDependentes := pFuncionario.ListaDependentes;

  if fcTestarExisteDependenteCalculaIR(vListaDependentes) then
    vValorDeducao := fcRetornarNumeroDependentesCalculaIR(vListaDependentes) * cVALORDEDUCAOPORDEPENDENTE;

  Result := (pFuncionario.Salario - vValorDeducao) * cFATORIR;
end;

function TCalcularImpostoExercicio2.fcTestarExisteDependenteCalculaIR(const pListaDependentes: TObjectList<TDependente>): Boolean;
var
  vContador: Integer;
begin
  Result := False;

  if not Assigned(pListaDependentes) then
    Exit;

  if pListaDependentes.Count = 0 then
    Exit;

  for vContador := 0 to pListaDependentes.Count - 1 do
  begin
    if pListaDependentes[vContador].IsCalcularIR > 0 then
    begin
      Result := True;
      Break;
    end;
  end;
end;

function TCalcularImpostoExercicio2.fcRetornarValorINSS(const pFuncionario: TFuncionario): Double;
const
  cFATORINSS = 0.08;
var
  vListaDependentes: TObjectList<TDependente>;
begin
  Result := 0;

  if not Assigned(pFuncionario) then
    Exit;

  if pFuncionario.Salario <= 0 then
    Exit;

  vListaDependentes := pFuncionario.ListaDependentes;

  if fcTestarExisteDependenteCalculaINSS(vListaDependentes) then
    Result := pFuncionario.Salario * cFatorINSS;
end;

function TCalcularImpostoExercicio2.fcTestarExisteDependenteCalculaINSS(const pListaDependentes: TObjectList<TDependente>): Boolean;
var
  vContador: Integer;
begin
  Result := False;

  if not Assigned(pListaDependentes) then
    Exit;

  if pListaDependentes.Count = 0 then
    Exit;

  for vContador := 0 to pListaDependentes.Count - 1 do
  begin
    if pListaDependentes[vContador].IsCalcularINSS > 0 then
    begin
      Result := True;
      Break;
    end;
  end;
end;

end.
