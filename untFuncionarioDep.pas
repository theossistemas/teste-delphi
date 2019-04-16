unit untFuncionarioDep;

interface
uses classes;
type
  TFuncionario = class
  private
      FNome  : String;
      FCPF   : String;
      FSalario : Real;
      FQtdeDep: Integer;
    function GetQtdeDep: Integer;
    procedure SetQtdeDep(const Value: Integer);
  public
      property Nome: String read FNome write FNome;
      property CPF: string read FCPF write FCPF;
      property salario: Real read FSalario write FSalario;
      property QtdeDep: Integer read GetQtdeDep write SetQtdeDep;
  end;

  TDependentes = class(TFuncionario)
  private
    FIsCalculaIR : Real;
    FIsCalculaINSS : Real;
  protected
    function GetIsCalculaINSS: Real;
    function GetIsCalculaIR: Real;
    procedure SetIsCalculaINSS(const Value: Real);
    procedure SetIsCalculaIR(const Value: Real);
  public
    property IsCalculaIR: Real read GetIsCalculaIR write SetIsCalculaIR;
    property IsCalculaINSS: Real read GetIsCalculaINSS write SetIsCalculaINSS;

    constructor create;
  end;

implementation

{ TDependentes }

constructor TDependentes.create;
begin
  inherited create;
end;

function TDependentes.GetIsCalculaINSS: Real;
var
  INSS : Real;
begin
  INSS := 8;
  Result := (salario * INSS)/100;
end;

function TDependentes.GetIsCalculaIR: Real;
var
  IR : Real;
begin
  IR := 15;
  Result := ((salario -(QtdeDep * 100)) * IR)/100 ;
end;

procedure TDependentes.SetIsCalculaINSS(const Value: Real);
begin
  FIsCalculaINSS := Value;
end;

procedure TDependentes.SetIsCalculaIR(const Value: Real);
begin
  FIsCalculaIR := Value;
end;

{ TFuncionario }

function TFuncionario.GetQtdeDep: Integer;
begin
  Result := FQtdeDep;
end;

procedure TFuncionario.SetQtdeDep(const Value: Integer);
begin
  FQtdeDep := Value;
end;

end.
