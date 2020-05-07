unit uClasses;

interface

uses
  System.Generics.Collections;

type
  // classe de modelagem dos dependentes
  TDependente = class
  private
    FNome: string;
    FIsCalculaIR: boolean;
    FIsCalculaINSS: boolean;
  public
    property Nome: string read FNome write FNome;
    property IsCalculaIR: boolean read FIsCalculaIR write FIsCalculaIR;
    property IsCalculaINSS: boolean read FIsCalculaINSS write FIsCalculaINSS;
  end;

  // classe de modelagem dos funcionários
  TFuncionario = class
  private
    FNome: string;
    FCPF: string;
    FSalario: double;
    FDependentes: TObjectList<TDependente>;
  public
    constructor Create;
    destructor Destroy; override;

    property Nome: string read FNome write FNome;
    property CPF: string read FCPF write FCPF;
    property Salario: double read FSalario write FSalario;
    property Dependentes: TObjectList<TDependente> read FDependentes write FDependentes;
  end;

  // classe que irá salvar no banco de dados (DAO = Data Access Layer)
  TFuncionarioDAO = class
  public
    procedure SalvarFuncionario(const pFuncionario: TFuncionario);
  end;

implementation

uses
  Data.SqlExpr;

{ TFuncionarioDAO }

procedure TFuncionarioDAO.SalvarFuncionario(const pFuncionario: TFuncionario);
var
  SQLQuery: TSQLQuery;
  Dependente: TDependente;
begin
  // salva primeiro o funcionário
  SQLQuery.SQL.Add('...');
  SQLQuery.Params[0].AsString := pFuncionario.CPF;
  SQLQuery.Params[1].AsString := pFuncionario.Nome;
  SQLQuery.Params[2].AsFloat := pFuncionario.Salario;
  SQLQuery.ExecSQL();

  // em seguida salva todos os dependentes
  for Dependente in pFuncionario.Dependentes do
  begin
    SQLQuery.SQL.Add('...');
    SQLQuery.Params[0].AsString := Dependente.Nome;
    SQLQuery.Params[1].AsBoolean := Dependente.IsCalculaIR;
    SQLQuery.Params[2].AsBoolean := Dependente.IsCalculaINSS;
    SQLQuery.ExecSQL();
  end;
end;

{ TFuncionario }

constructor TFuncionario.Create;
begin
  FDependentes := TObjectList<TDependente>.Create(True);
end;

destructor TFuncionario.Destroy;
begin
  FDependentes.Free;
  inherited;
end;

end.
