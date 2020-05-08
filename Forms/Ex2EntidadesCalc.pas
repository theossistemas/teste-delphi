unit Ex2EntidadesCalc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TEx2EntidadesCalcF = class(TForm)
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ex2EntidadesCalcF: TEx2EntidadesCalcF;

implementation

uses MenuPrincipal;

{$R *.dfm}

//Exercício 2 – Entidades de cálculo.

//* Criar uma classe Funcionário com as seguintes propriedades
//	* (Nome, CPF, Salário)
//* Criar uma classe Dependente com as seguintes propriedades
//	* (Nome, IsCalculaIR, IsCalculaINSS)
//* A classe de Funcionario terá uma lista de dependentes
//* Cálculo de INSS e IR aplicado ao funcionário usando o valor do salário como base.
//	* Regras de negócio
//		* INSS - O cálculo de INSS será descontado 8% do valor do funcionário caso
// o dependente calcula INSS
//		* IR – O cálculo de IR será deduzido da base, salário 100 reais para cada
//dependente que possuir calcula IR e por fim desconta 15% do salário do funcionário.
//		* Ex. Funcionário que ganha 1000,00 e que tenha dois dependentes onde o IsCalculaIR e IsCalculaINSS estejam marcados.
//		* INSS = 1000,00 – 8% = 80,00
//		* IR = 1000,00 - (2 * 100) = 800,00 – 15% = 120,00.
//* Criar a mesma estrutura em um banco de dados e gravar as informações usando uma camada de banco de dados para o acesso

procedure TEx2EntidadesCalcF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  MenuPrincipalF.fecharForm(self, key);
end;

end.
