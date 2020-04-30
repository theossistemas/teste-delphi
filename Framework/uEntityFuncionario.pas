unit uEntityFuncionario;

interface

uses
  System.Generics.Collections, System.SysUtils, uEntity, uEntityAtributo;

type
  [TableName('Cad_Funcionario')]
  TEntityFuncionario = class(TGenericEntity)
  private
    FID: integer;
    FNome: string;
    FCPF: string;
    FSalario: double;
    procedure SetCPF(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetSalario(const Value: double);
    procedure SetID(const Value: integer);
  public
    function ToString: string; override;
    [KeyField('ID')]
    [FieldName('ID')]
    property ID: integer read FID write SetID;
    [FieldName('CPF')]
    property CPF: string read FCPF write SetCPF;
    [FieldName('Nome')]
    property Nome: string read FNome write SetNome;
    [FieldName('Salario')]
    property Salario: double read FSalario write SetSalario;
  end;

  [TableName('Cad_Dependente')]
  TEntityDependente = class(TGenericEntity)
  private
    FID: integer;
    FIDFuncionario: integer;
    FNome: string;
    FCalcularINSS: boolean;
    FCalcularIR: boolean;
    procedure SetNome(const Value: string);
    procedure SetCalcularINSS(const Value: boolean);
    procedure SetCalcularIR(const Value: boolean);
    procedure SetID(const Value: integer);
    procedure SetIDFuncionario(const Value: integer);
  public
    function ToString: string; override;
    [KeyField('ID')]
    [FieldName('ID')]
    property ID: integer read FID write SetID;
    [FieldName('IDFuncionario')]
    property IDFuncionario: integer read FIDFuncionario write SetIDFuncionario;
    [FieldName('Nome')]
    property Nome: string read FNome write SetNome;
    [FieldName('CalcularIR')]
    property CalcularIR: boolean read FCalcularIR write SetCalcularIR;
    [FieldName('CalcularINSS')]
    property CalcularINSS: boolean read FCalcularINSS write SetCalcularINSS;
  end;

implementation

{ TFuncionario }

procedure TEntityFuncionario.SetCPF(const Value: string);
begin
  FCPF := Value;
end;

procedure TEntityFuncionario.SetID(const Value: integer);
begin
  FID := Value;
end;

procedure TEntityFuncionario.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TEntityFuncionario.SetSalario(const Value: double);
begin
  FSalario := Value;
end;

function TEntityFuncionario.ToString: string;
begin
  result := 'Nome: ' + FNome + ', CPF: ' + FCPF + ', Salário: ' + FloatToStr(FSalario);
end;
{ TEntityDependente }

procedure TEntityDependente.SetCalcularINSS(const Value: boolean);
begin
  FCalcularINSS := Value;
end;

procedure TEntityDependente.SetCalcularIR(const Value: boolean);
begin
  FCalcularIR := Value;
end;

procedure TEntityDependente.SetID(const Value: integer);
begin
  FID := Value;
end;

procedure TEntityDependente.SetIDFuncionario(const Value: integer);
begin
  FIDFuncionario := Value;
end;

procedure TEntityDependente.SetNome(const Value: string);
begin
  FNome := Value;
end;

function TEntityDependente.ToString: string;
begin
  result := 'Nome: ' + FNome + ', Calcular IR: ' + BoolToStr(FCalcularIR) + ', Calcular INSS: ' + BoolToStr(FCalcularINSS);
end;

end.
