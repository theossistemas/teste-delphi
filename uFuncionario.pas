unit uFuncionario;

interface

uses System.Classes, System.Sysutils, uDependente, uDataBase;

type

  TFuncionario = class
  private

    FNome       : string;
    FCPF        : string;
    FSalario    : extended;
    FDependentes: TDependentes;

    function GetIR   : extended;
    function GetINSS : extended;
  public

    constructor Create;
    destructor Destroy; override;

    procedure UpdateRecord(aDelete: boolean = FALSE);
    procedure GetRecord;

    property Nome       : string       read FNome        write FNome;
    property CPF        : string       read FCPF         write FCPF;
    property Salario    : extended     read FSalario     write FSalario;
    property Dependentes: TDependentes read FDependentes write FDependentes;
    property IR         : extended     read GetIR;
    property INSS       : extended     read GetINSS;
  end;

implementation

uses System.Math;

const
  C_IR  : extended = 0.15;
  C_INSS: extended = 0.08;

function TFuncionario.GetIR: extended;
var

  I        : integer;
  lDesconto: extended;
begin

  lDesconto := 0;

  // busca nos dependentes o percentual de redução de IR, e aplica sobre o salario, acumulando
  for I := 0 to FDependentes.Count - 1 do
    lDesconto := lDesconto + FDependentes.Items[I].ReducaoIR;

  result := (Salario - lDesconto) * C_IR;
end;

function TFuncionario.GetINSS: extended;
var

  I        : integer;
  lDesconto: boolean;
begin

  I := 0;

  // verifica se algum dos dependentes proporciona redução de INSS, e se encontrar algum, aplica uma vez sobre a base
  // há um erro no exemplo do código do teste: "INSS = 1000,00 - 8% = 80,00"
  // desenvolvido, tomando por base a instrução escrita, "INSS - O cálculo do INSS será descontado 8% do funcionário caso o dependente calcula INSS"
  // fica INSS = 1000,00 * 8% = 80,00 - e essa foi a fórmula aplicada
  repeat

    lDesconto := FDependentes.Items[I].IsCalculaINSS;
    inc(I);
  until (lDesconto) OR (I = FDependentes.Count);

  result := Salario * ifthen(lDesconto, C_INSS, 0);
end;

constructor TFuncionario.Create;
begin

  FDependentes := TDependentes.Create;
end;

destructor TFuncionario.Destroy;
begin

  FreeAndNIL(FDependentes);

  inherited Destroy;
end;

procedure TFuncionario.UpdateRecord(aDelete: boolean = FALSE);
var

  lDBCFuncionario: TDBCFuncionario;
  lRow           : TParameter;
  I              : integer;
begin

  lRow := TParameter.Create;

  lRow.Add('nome', Nome);
  lRow.Add('cpf', CPF);
  lRow.Add('salario', Salario);

  for I := 0 to FDependentes.Count - 1 do
    FDependentes.Items[I].UpdateRecord(aDelete);

  lDBCFuncionario        := TDBCFuncionario.Create;
  lDBCFuncionario.Delete := aDelete;
  lDBCFuncionario.Row    := lRow;
end;

procedure TFuncionario.GetRecord;
var

  lDBCFuncionario: TDBCFuncionario;
begin

  lDBCFuncionario     := TDBCFuncionario.Create;
  lDBCFuncionario.CPF := CPF;

  if lDBCFuncionario.Loaded then
  begin

    Nome    := lDBCFuncionario.Row.Items['nome'];
    Salario := lDBCFuncionario.Row.Items['salario'];
  end;

  TDependente.GetDependentes(CPF, FDependentes);
end;




end.
