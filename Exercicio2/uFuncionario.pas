unit uFuncionario;

interface

uses uDependente, Generics.Collections, System.SysUtils;

type
  TFuncionario = class
    private
      FnCodigo: Integer;
      FsNome: String;
      FsCPF: String;
      FdSalario: Double;
      FlsDependentes: TObjectList<TDependente>;
      function getCodigo: Integer;
      function getNome: String;
      function getCPF: String;
      function getSalario: Double;
      function getDependentes: TObjectList<TDependente>;
      procedure setCodigo(Value : Integer);
      procedure setNome(Value: String);
      procedure setCPF(Value: String);
      procedure setSalario(Value: Double);
      procedure setDependentes(Value: TObjectList<TDependente>);
    public
      constructor Create;
      destructor Destroy; override;
      property codigo: Integer read getCodigo write setCodigo;
      property nome: String read getNome write setNome;
      property cpf: String read getCPF write setCPF;
      property salario: Double read getSalario write setSalario;
      property dependentes: TObjectList<TDependente> read getDependentes write setDependentes;
  end;

implementation

{ TFuncionario }

constructor TFuncionario.Create;
begin
  FlsDependentes := TObjectList<TDependente>.Create;
end;

function TFuncionario.getCodigo: Integer;
begin
  Result := FnCodigo;
end;

function TFuncionario.getCPF: String;
begin
  Result := FsCPF;
end;

function TFuncionario.getDependentes: TObjectList<TDependente>;
begin
  Result := FlsDependentes;
end;

function TFuncionario.getNome: String;
begin
  Result := FsNome;
end;

function TFuncionario.getSalario: Double;
begin
  Result := FdSalario;
end;

procedure TFuncionario.setCodigo(Value: Integer);
begin
  FnCodigo := Value;
end;

procedure TFuncionario.setCPF(Value: String);
begin
  FsCPF := Value;
end;

procedure TFuncionario.setDependentes(Value: TObjectList<TDependente>);
begin
  FlsDependentes := Value;
end;

procedure TFuncionario.setNome(Value: String);
begin
  FsNome := Value;
end;

procedure TFuncionario.setSalario(Value: Double);
begin
  FdSalario := Value;
end;

destructor TFuncionario.Destroy;
begin
  FreeAndNil(FlsDependentes);
  inherited;
end;

end.
