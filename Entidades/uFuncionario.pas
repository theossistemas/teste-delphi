unit uFuncionario;

interface

uses
  SysUtils, Contnrs, uDependente;

type
  TFuncionario = class
  private
    FCPF: string;
    FNome: string;
    FSalario: real;
    FDependentes: TObjectList;

    function GetCPF: string;
    function GetNome: string;
    function GetSalario: real;
    procedure SetCPF(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetSalario(const Value: real);
    function GetDependentes: TObjectList;
    procedure SetDependentes(const Value: TObjectList);
  public
    constructor Create;
    destructor Destroy; override;

    property Nome: string read GetNome write SetNome;
    property CPF: string read GetCPF write SetCPF;
    property Salario: real read GetSalario write SetSalario;
    property Dependentes: TObjectList read GetDependentes write SetDependentes;
  end;

implementation

{ TFuncionario }

constructor TFuncionario.Create;
begin
  FDependentes := TObjectList.Create;
end;

destructor TFuncionario.Destroy;
begin
  FreeAndNil(FDependentes);

  inherited;
end;

function TFuncionario.GetCPF: string;
begin
  result := FCPF;
end;

function TFuncionario.GetDependentes: TObjectList;
begin
  result := FDependentes;
end;

function TFuncionario.GetNome: string;
begin
  result := FNome;
end;

function TFuncionario.GetSalario: real;
begin
  result := FSalario;
end;

procedure TFuncionario.SetCPF(const Value: string);
begin
  FCPF := Value;
end;

procedure TFuncionario.SetDependentes(const Value: TObjectList);
begin
  FDependentes := Value; 
end;

procedure TFuncionario.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TFuncionario.SetSalario(const Value: real);
begin
  FSalario := Value;
end;

end.
