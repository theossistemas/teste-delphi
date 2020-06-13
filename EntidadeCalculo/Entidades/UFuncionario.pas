unit UFuncionario;

interface

  uses UDependente, System.Generics.Collections;

type TProcForInDependente = reference to procedure (dep: TDependente);

type TFuncionario = class
  private
    FNome: String;
    FCPF: String;
    FSalario: Currency;
    FDependentes : TList<TDependente>;
    FId: Integer;
  private
    function getNome: String;
    procedure SetNome(const Value: String);
    function getCPF: String;
    procedure setCPF(const Value: String);
    function getSalario: Currency;
    procedure SetSalario(const Value: Currency);
    function getId: Integer;
    procedure SetId(const Value: Integer);

  public
    constructor Create(id: integer; Nome: String; CPF: String; Salario: Currency);
    destructor Destroy();override;
    function ValorINSS(): Currency;
    function ValorIR(): Currency;

    function AddDependente(dep: TDependente): TFuncionario;
    procedure ForInDependentes(proc: TProcForInDependente);

    property Id: Integer read getId write SetId;
    property Nome: String read getNome write SetNome;
    property CPF: String read getCPF write setCPF;
    property Salario: Currency read getSalario write SetSalario;

end;


implementation

uses
  System.SysUtils;

{ TFuncionario }


function TFuncionario.AddDependente(dep: TDependente): TFuncionario;
begin
  FDependentes.Add(dep);
  result :=self;
end;

constructor TFuncionario.Create(id: integer; Nome: String; CPF: String; Salario: Currency);
begin
  self.FId := id;
  self.FNome := Nome;
  self.CPF := CPF;
  self.Salario := Salario;
  FDependentes := TList<TDependente>.Create();
end;

destructor TFuncionario.Destroy;

begin
  ForInDependentes(procedure(dep: Tdependente) begin dep.free; end );
  FDependentes.Free;
  inherited;
end;

procedure TFuncionario.ForInDependentes(proc: TProcForInDependente);
  var
    dep: TDependente;
begin
  for dep in FDependentes do
  begin
    proc(dep);
  end;
end;

function TFuncionario.getCPF: String;
begin
  result := FCPF;
end;

function TFuncionario.getId: Integer;
begin
  result := FId;
end;

function TFuncionario.getNome: String;
begin
  result := FNome;
end;

function TFuncionario.getSalario: Currency;
begin
  result:=FSalario;
end;

procedure TFuncionario.setCPF(const Value: String);
begin
  FCPF := value;
end;

procedure TFuncionario.SetId(const Value: Integer);
begin
  FId := value;
end;

procedure TFuncionario.SetNome(const Value: String);
begin
  Fnome:=value;
end;

procedure TFuncionario.SetSalario(const Value: Currency);
begin
  FSalario := value;
end;

function TFuncionario.ValorINSS: Currency;
var
  dep: TDependente;
  calculaINSS: boolean;
  countCalculoIR : integer;
begin
  calculaINSS := false;
  countCalculoIR := 0;
  for dep in fdependentes do
  begin
    if dep.isCalculaINSS then
      calculaINSS := true;
  end;

  if calculaINSS then
    result := Salario * 0.08
  else
    result := 0;

end;

function TFuncionario.ValorIR: Currency;
var
  dep: TDependente;
  countCalculoIR : integer;
begin

  countCalculoIR := 0;
  for dep in fdependentes do
  begin
    if dep.IsCalculaIR then
      Inc(countCalculoIR);
  end;

  if countCalculoIR > 0 then
    result := (Salario - (countCalculoIR * 100)) * 0.15
  else
    result := 0;
end;

end.
