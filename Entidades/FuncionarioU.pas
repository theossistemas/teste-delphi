unit FuncionarioU;

//* Criar uma classe Funcionário com as seguintes propriedades
//	* (Nome, CPF, Salário)
//* Criar uma classe Dependente com as seguintes propriedades
//	* (Nome, IsCalculaIR, IsCalculaINSS)
//* A classe de Funcionario terá uma lista de dependentes

//* Cálculo de INSS e IR aplicado ao funcionário usando o valor do salário como base.
// * Regras de negócio
// 	* INSS - O cálculo de INSS será descontado 8% do valor do funcionário caso o dependente calcula INSS
// 	* IR – O cálculo de IR será deduzido da base, salário 100 reais para cada dependente que possuir calcula IR
//         e por fim desconta 15% do salário do funcionário.
// 	* Ex. Funcionário que ganha 1000,00 e que tenha dois dependentes onde o IsCalculaIR e IsCalculaINSS estejam marcados.
// 	* INSS = 1000,00 – 8% = 80,00
// 	* IR = 1000,00 - (2 * 100) = 800,00 – 15% = 120,00.
//* Criar a mesma estrutura em um banco de dados e gravar as informações usando uma camada de banco de dados para o acesso

interface

uses Classes;


type

  TDependente = class (TList) 
  private
    fIdDependente  :Integer;
    fNome          :String;
    fIsCalculaIR   :Boolean;
    fIsCalculaINSS :Boolean;
    fIdFuncionario :Integer;
  public
    property IdDependente: Integer read fIdDependente write fIdDependente;
    property Nome: String read fNome write fNome;
    property IsCalculaIR: Boolean read fIsCalculaIR write fIsCalculaIR;
    property IsCalculaINSS: Boolean read fIsCalculaINSS write fIsCalculaINSS;
    property IdFuncionario: Integer read fIdFuncionario write fIdFuncionario;    
    constructor create(pIdDependente:Integer; pnome: String; pisCalculaIR, pisCalculaINSS: Boolean; pIdFuncionario:Integer);
  end;

  TFuncionario = class  
  private
    fIdFuncionario : Integer;  
    fnome    :String;
    fcpf     :Real;
    fsalario :Real;
    fdependentes :TList;
  public
    property IdFuncionario: Integer read fIdFuncionario write fIdFuncionario;  
    property Nome: String read fNome write fNome;
    property CPF: Real read fcpf write fcpf;
    property Salario: Real read fsalario write fsalario;
    property Dependentes: TList read fdependentes write fdependentes;
    constructor create(pIdFuncionario:Integer);
  end;

implementation

{ TFuncionario }

constructor TFuncionario.create(pIdFuncionario:Integer);
begin
  IdFuncionario := pIdFuncionario;
  fdependentes := TList.Create;
end;

{ TDependente }

constructor TDependente.create(pIdDependente:Integer;
                               pnome: String;
                               pisCalculaIR,
                               pisCalculaINSS: Boolean;
                               pIdFuncionario:Integer);
begin
  IdDependente  := pIdDependente;
  Nome          := pnome;
  IsCalculaIR   := pisCalculaIR;
  IsCalculaINSS := pisCalculaINSS;
  IdFuncionario := pIdFuncionario;
end;

end.
