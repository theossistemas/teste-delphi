unit Dependente;

interface

type

  TDependente = class
  private
    FId: Integer;
    FIdFuncionario: Integer;
    FNome: string;
    FCalculaIR: Boolean;
    FCalculaINSS: Boolean;
  public
    property Id: Integer read FId write FId;
    property IdFuncionario: Integer read FIdFuncionario write FIdFuncionario;
    property Nome: string read FNome write FNome;
    property CalculaIR: Boolean read FCalculaIR write FCalculaIR;
    property CalculaINSS: Boolean read FCalculaINSS write FCalculaINSS;
  end;

implementation

end.
