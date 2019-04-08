unit Entities.Funcionario;

interface

uses
  System.SysUtils, Entities.Dependente;

type
  TFuncionario = class
  private
    FCPF: string;
    FSalario: Double;
    FNome: string;
    FDependentes: TListDependente;
    FFuncionarioID: Int64;
    procedure SetCPF(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetSalario(const Value: Double);
    procedure SetDependentes(const Value: TListDependente);
    procedure SetFuncionarioID(const Value: Int64);
  public
    constructor Create();
    destructor Destroy(); override;
  published
    property FuncionarioID : Int64 read FFuncionarioID write SetFuncionarioID;
    property Nome : string read FNome write SetNome;
    property CPF  : string read FCPF write SetCPF;
    property Salario : Double read FSalario write SetSalario;

    property Dependentes : TListDependente read FDependentes;
  end;

implementation

{ TFuncionario }

constructor TFuncionario.Create;
begin
  FDependentes := TListDependente.Create();
end;

destructor TFuncionario.Destroy;
begin
  if Assigned(FDependentes) then
    FreeAndNil(FDependentes);

  inherited;
end;

procedure TFuncionario.SetCPF(const Value: string);
begin
  FCPF := Value;
end;

procedure TFuncionario.SetDependentes(const Value: TListDependente);
begin
  FDependentes := Value;
end;

procedure TFuncionario.SetFuncionarioID(const Value: Int64);
var
  dep : TDependente;
begin
  FFuncionarioID := Value;

  for dep in FDependentes do
    dep.FuncionarioID := FFuncionarioID;
end;

procedure TFuncionario.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TFuncionario.SetSalario(const Value: Double);
begin
  FSalario := Value;
end;

end.
