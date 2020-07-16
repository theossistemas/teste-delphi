unit untFuncionario;

interface

uses
  untDependente, Generics.Collections, System.SysUtils;

type
  TFuncionario = class
  private
    FId_Funcionario: Integer;
    FNome: String;
    FCPF: String;
    FSalario: Double;
    FListaDependentes: TObjectList<TDependente>;

    function GetId_Funcionario: Integer;
    function GetNome: String;
    function GetCPF: String;
    function GetSalario: Double;
    function GetListaDependentes: TObjectList<TDependente>;

    procedure SetId_Funcionario(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetCPF(const Value: String);
    procedure SetSalario(const Value: Double);
    procedure SetListaDependentes(const Value: TObjectList<TDependente>);
  public
    constructor Create;
    destructor Destroy; override;

    property Id_Funcionario: Integer read GetId_Funcionario write SetId_Funcionario;
    property Nome: String read GetNome write SetNome;
    property CPF: String read GetCPF write SetCPF;
    property Salario: Double read GetSalario write SetSalario;
    property ListaDependentes: TObjectList<TDependente> read GetListaDependentes write SetListaDependentes;
  end;

implementation

{ TFuncionario }

constructor TFuncionario.Create;
begin
  FListaDependentes := TObjectList<TDependente>.Create;
end;

destructor TFuncionario.Destroy;
begin
  FreeAndNil(FListaDependentes);
  inherited;
end;

function TFuncionario.GetCPF: String;
begin
  Result := FCPF;
end;

function TFuncionario.GetId_Funcionario: Integer;
begin
  Result := FId_Funcionario;
end;

function TFuncionario.GetListaDependentes: TObjectList<TDependente>;
begin
  Result := FListaDependentes;
end;

function TFuncionario.GetNome: String;
begin
  Result := FNome;
end;

function TFuncionario.GetSalario: Double;
begin
  Result := FSalario;
end;

procedure TFuncionario.SetCPF(const Value: String);
begin
  FCPF := Value;
end;

procedure TFuncionario.SetId_Funcionario(const Value: Integer);
begin
  FId_Funcionario := Value;
end;

procedure TFuncionario.SetListaDependentes(const Value: TObjectList<TDependente>);
begin
  FListaDependentes := Value;
end;

procedure TFuncionario.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TFuncionario.SetSalario(const Value: Double);
begin
  FSalario := Value;
end;

end.
