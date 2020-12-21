unit uFuncionario;

interface

uses System.Classes, System.Sysutils, uDependente;

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

  I        : cardinal;
  lDesconto: extended;
begin

  lDesconto := 0;

  // busca nos dependentes o percentual de redução de IR, e aplica sobre o salario, acumulando
  for I := 0 to FDependentes.Count - 1 do
    lDesconto := lDesconto + (Salario * FDependentes.Items[I].ReducaoIR);

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



end.
