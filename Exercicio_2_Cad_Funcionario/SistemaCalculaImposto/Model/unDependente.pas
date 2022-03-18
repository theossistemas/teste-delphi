unit unDependente;

interface
type
  TDependente = class
  private
    FCodigo: Integer;
    FCodigoFuncionario: Integer;
    FNome: string;
    FCalcularIR: boolean;
    FCalcularINSS: boolean;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property CodigoFuncionario: Integer read FCodigoFuncionario write FCodigoFuncionario;
    property Nome: string read FNome write FNome;
    property CalcularIR: boolean read FCalcularIR write FCalcularIR;
    property CalcularINSS: boolean read FCalcularINSS write FCalcularINSS;
  end;

implementation


end.
