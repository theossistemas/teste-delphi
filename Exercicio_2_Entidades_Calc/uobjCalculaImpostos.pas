unit uobjCalculaImpostos;

interface

uses
  DBClient;

type
  TCalculaImpostos = class
  private
    nSalario: Real;
    ocdsDependentes: TClientDataSet;
    FImpostoIR: Real;
    FImpostoINSS: Real;
    
    function GetFnImpostoINSS: Real;
    function GetImpostoIR: Real;

    procedure CalcularIR;
    procedure CalcularINSS;
  public
    procedure SetSalario(const pnSalario: Real);
    procedure SetCdsDependentes(poCdsDependentes: TClientDataSet);

    procedure Calcular;
  published
    property ImpostoIR: Real read GetImpostoIR;
    property ImpostoINSS: Real read GetFnImpostoINSS;
  end;

implementation

{ TCalculaImpostos }

procedure TCalculaImpostos.Calcular;
begin
  CalcularIR;
  CalcularINSS;
end;

procedure TCalculaImpostos.CalcularINSS;
var
  bCalculaINSS: boolean;
begin
  FImpostoINSS := 0;
  bCalculaINSS := False;

  ocdsDependentes.First;  
  while not ocdsDependentes.eof do
  begin
    if ocdsDependentes.FieldByName('ISCALCULAINSS').AsString = 'S' then
      bCalculaINSS := True;

    ocdsDependentes.Next;
  end;

  if bCalculaINSS then
    FImpostoINSS := nSalario * 0.08;
end;

procedure TCalculaImpostos.CalcularIR;
var
  qtdCalcIR: integer;
  AuxSalario: Real;
begin
  FImpostoIR := 0;
  qtdCalcIR := 0;
  
  ocdsDependentes.First;
  while not ocdsDependentes.eof do
  begin
    if ocdsDependentes.FieldByName('ISCALCULAIR').AsString = 'S' then
      qtdCalcIR := qtdCalcIR + 1;

    ocdsDependentes.Next;
  end;

  AuxSalario := nSalario - (qtdCalcIR * 100);
  if AuxSalario < 0 then
    AuxSalario := 0;
    
  FImpostoIR := AuxSalario * 0.15;
end;

function TCalculaImpostos.GetFnImpostoINSS: Real;
begin
  Result := FImpostoINSS;
end;

function TCalculaImpostos.GetImpostoIR: Real;
begin
  Result := FImpostoIR;
end;

procedure TCalculaImpostos.SetCdsDependentes(
  poCdsDependentes: TClientDataSet);
begin
  ocdsDependentes := poCdsDependentes;
end;

procedure TCalculaImpostos.SetSalario(const pnSalario: Real);
begin
  nSalario := pnSalario;
end;

end.
