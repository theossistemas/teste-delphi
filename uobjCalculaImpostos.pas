unit uobjCalculaImpostos;

interface

uses
  Contnrs, uFuncionario;

type
  TCalculaImpostos = class
  private
    FImpostoIR: Real;
    FImpostoINSS: Real;
    FFuncionario: TFuncionario;
    FDependentes: TObjectList;

    function GetImpostoINSS: Real;
    function GetImpostoIR: Real;

    procedure CalcularIR;
    procedure CalcularINSS;
    function GetFuncionario: TFuncionario;
    procedure SetFuncionario(const Value: TFuncionario);
  public
    procedure Calcular;
  published
    property Funcionario: TFuncionario read GetFuncionario write SetFuncionario;
    property ImpostoIR: Real read GetImpostoIR;
    property ImpostoINSS: Real read GetImpostoINSS;
  end;

implementation

uses
  uDependente;

{ TCalculaImpostos }

procedure TCalculaImpostos.Calcular;
begin
  CalcularIR;
  CalcularINSS;
end;

procedure TCalculaImpostos.CalcularINSS;
var
  bCalculaINSS: boolean;
  nContador: integer;
begin
  FImpostoINSS := 0;
  bCalculaINSS := False;

  for nContador := 0 to FDependentes.Count - 1 do
  begin
    if (FDependentes[nContador] as TDependente).IsCalcularINSS then
      bCalculaINSS := True;
  end;

  if bCalculaINSS then
    FImpostoINSS := FFuncionario.Salario * 0.08;
end;

procedure TCalculaImpostos.CalcularIR;
var
  qtdCalcIR: integer;
  AuxSalario: Real;
  nContador: integer;
begin
  FImpostoIR := 0;
  qtdCalcIR := 0;

  for nContador := 0 to FDependentes.Count - 1 do
  begin
    if (FDependentes[nContador] as TDependente).IsCalcularIR then
      qtdCalcIR := qtdCalcIR + 1;
  end;

  AuxSalario := FFuncionario.Salario - (qtdCalcIR * 100);
  if AuxSalario < 0 then
    AuxSalario := 0;
    
  FImpostoIR := AuxSalario * 0.15;
end;

function TCalculaImpostos.GetFuncionario: TFuncionario;
begin
  result := FFuncionario;
end;

function TCalculaImpostos.GetImpostoINSS: Real;
begin
  Result := FImpostoINSS;
end;

function TCalculaImpostos.GetImpostoIR: Real;
begin
  Result := FImpostoIR;
end;

procedure TCalculaImpostos.SetFuncionario(const Value: TFuncionario);
begin
  FFuncionario := Value;
  FDependentes := FFuncionario.Dependentes;
end;

end.
