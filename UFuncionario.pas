unit UFuncionario;

interface

Uses
  System.SysUtils, System.Classes, UDependente, System.Generics.Collections, UDm, Datasnap.DBClient;

Type

  TFuncionario = class
  private
    FNome  : String;
    FCPF   : String;
    FSalario : Double;
    FListaDependente: TObjectList<TDependente>;
    procedure SetNome(const Value: String);
    function GetNome: String;
    procedure SetCPF(const Value: String);
    function GetCPF: String;
    procedure SetSalario(const Value: Double);
    function GetSalario: Double;
  protected
    Destructor Destroy; override;
  published
    property Nome : String read GetNome write SetNome;
    property CPF : String read GetCPF write SetCPF;
    property Salario : Double read GetSalario write SetSalario;
    property ListaDependente: TObjectList<TDependente> read FListaDependente write FListaDependente;
  public
    constructor Create;
  end;


implementation

constructor TFuncionario.Create;
begin
  FListaDependente := TObjectList<TDependente>.Create;
  ListaDependente.Clear;
end;

destructor TFuncionario.Destroy;
begin
  inherited;
  FListaDependente.Free;
end;

function TFuncionario.GetCPF: String;
begin
  result := FCPF;
end;

function TFuncionario.GetNome: String;
begin
  result := FNome;
end;

function TFuncionario.GetSalario: Double;
begin
  result := FSalario;
end;

procedure TFuncionario.SetCPF(const Value: String);
begin
  if (trim(Value) = '') then
    raise Exception.Create('O "CPF" deve ser preenchido')
  else if (length(Value) <> 11 ) then
    raise Exception.Create('"CPF" informado não é válido')
  else FCPF := Value;
end;

procedure TFuncionario.SetNome(const Value: String);
begin
  if trim(Value) = '' then
    raise Exception.Create('O "Nome" deve ser preenchido')
  else FNome := Value;
end;

procedure TFuncionario.SetSalario(const Value: Double);
begin
  if (Value = 0) or (Value < 0) then
    raise Exception.Create('O valor do "Salario" não pode ser 0 e/ou menor que 0')
  else FSalario := Value;
end;

end.
