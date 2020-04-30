unit uClasseFuncionario;

interface

uses
  System.Generics.Collections, System.SysUtils, uGenericDAO, uEntityFuncionario;

type
  TDependente = class
  private
    FID: integer;
    FNome: string;
    FCalcularINSS: boolean;
    FCalcularIR: boolean;
    procedure SetNome(const Value: string);
    procedure SetCalcularINSS(const Value: boolean);
    procedure SetCalcularIR(const Value: boolean);
  public
    property Nome: string read FNome write SetNome;
    property CalcularIR: boolean read FCalcularIR write SetCalcularIR;
    property CalcularINSS: boolean read FCalcularINSS write SetCalcularINSS;
  end;

  TFuncionario = class
  private
    FID: integer;
    FNome: string;
    FCPF: string;
    FSalario: double;
    FDependentes: TObjectList<TDependente>;
    FGenericDAO: TGenericDAO;
    procedure SetNome(const Value: string);
    procedure SetCPF(const Value: string);
    procedure SetDependentes(const Value: TObjectList<TDependente>);
    procedure SetSalario(const Value: double);
  public
    constructor Create;
    destructor Destroy;
    function CalcularINSS: double;
    function CalcularIR: double;
    procedure InserirFuncionario;
    procedure InserirDependentes;
    property Nome: string read FNome write SetNome;
    property CPF: string read FCPF write SetCPF;
    property Salario: double read FSalario write SetSalario;
    property Dependentes: TObjectList<TDependente> read FDependentes write SetDependentes;
  end;

implementation

{ TFuncionario }

constructor TFuncionario.Create;
begin
  FDependentes := TObjectList<TDependente>.Create;
  FGenericDAO := TGenericDAO.Create;
end;

function TFuncionario.CalcularINSS: double;
var
  indexDependentes: integer;
  bCalcular: boolean;
begin
  Result := 0;
  bCalcular := False;
  FDependentes.First;

  for indexDependentes := 0 to FDependentes.Count - 1 do
    if FDependentes[indexDependentes].CalcularINSS then
      bCalcular := True;

  if bCalcular then
    Result := FSalario * 0.8;
end;

function TFuncionario.CalcularIR: double;
var
  indexDependentes: integer;
  nQuantidadeDependente: integer;
begin
  Result := 0;
  nQuantidadeDependente := 0;

  FDependentes.First;

  for indexDependentes := 0 to FDependentes.Count - 1 do
    if FDependentes[indexDependentes].CalcularIR then
      Inc(nQuantidadeDependente);

  if nQuantidadeDependente > 0 then
    Result := (FSalario - (nQuantidadeDependente * 100)) * 0.15;
end;

destructor TFuncionario.Destroy;
begin
  FreeAndNil(FDependentes);
  FreeAndNil(FGenericDAO);
end;

procedure TFuncionario.InserirDependentes;
var
  oDependente: TEntityDependente;
  indexDependente: integer;
begin
  try
    for indexDependente := 0 to Self.Dependentes.Count -1 do
    begin
      oDependente := TEntityDependente.Create;
      oDependente.ID := FGenericDAO.GetID(oDependente);
      oDependente.IDFuncionario := Self.FID;
      oDependente.Nome := Self.Dependentes.Items[indexDependente].Nome;
      oDependente.CalcularIR := Self.Dependentes.Items[indexDependente].CalcularIR;
      oDependente.CalcularINSS := Self.Dependentes.Items[indexDependente].CalcularINSS;
      if FGenericDAO.Insert(oDependente) then
        FreeAndNil(oDependente);
    end;
  finally
    FreeAndNil(oDependente);
  end;
end;

procedure TFuncionario.InserirFuncionario;
var
  FFuncionarioAux: TEntityFuncionario;
begin
  FFuncionarioAux := TEntityFuncionario.Create;
  try
    FID := FGenericDAO.GetID(FFuncionarioAux);
    FFuncionarioAux.ID := Self.FID;
    FFuncionarioAux.Nome := Self.Nome;
    FFuncionarioAux.CPF := Self.CPF;
    FFuncionarioAux.Salario := Self.Salario;
    FGenericDAO.Insert(FFuncionarioAux);
  finally
    FreeAndNil(FFuncionarioAux);
  end;
end;

procedure TFuncionario.SetCPF(const Value: string);
begin
  FCPF := Value;
end;

procedure TFuncionario.SetDependentes(
  const Value: TObjectList<TDependente>);
begin
  FDependentes := Value;
end;

procedure TFuncionario.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TFuncionario.SetSalario(const Value: double);
begin
  FSalario := Value;
end;

{ TDependente }

procedure TDependente.SetCalcularINSS(const Value: boolean);
begin
  FCalcularINSS := Value;
end;

procedure TDependente.SetCalcularIR(const Value: boolean);
begin
  FCalcularIR := Value;
end;

procedure TDependente.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
