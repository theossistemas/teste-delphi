unit uImpostosTestes;

interface

uses
  TestFramework, SysUtils, DBClient, DB, uobjCalculaImpostos, uFuncionario,
  uDependente;

type
  TImpostosTestes = class(TTestCase)
  private
    FFuncionario: TFuncionario;
    FDependente: TDependente;
    FCalculaImpostos: TCalculaImpostos;

    procedure InserirRegistroFuncionario(pNome, pCPF: string; pSalario: Real);
    procedure InserirRegistroDependente(pNome: string;
      pCalculaIR, pCalculaINSS: boolean);
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestCalcularComUmIR_SemINSS;
    procedure TestCalcularSemDependenteIR_ComINSS;
    procedure TestCalcularComDoisIR_ComINSS;
    procedure TestCalcularSemDependente;
    procedure TestCalcularSemSalario;
  end;

implementation

{ TImpostosTestes }

procedure TImpostosTestes.InserirRegistroDependente(pNome: string;
  pCalculaIR, pCalculaINSS: boolean);
begin
  FDependente := TDependente.Create;
  FDependente.Nome := pNome;
  FDependente.IsCalcularIR := pCalculaIR;
  FDependente.IsCalcularINSS := pCalculaINSS;
  FFuncionario.Dependentes.Add(FDependente);
end;

procedure TImpostosTestes.InserirRegistroFuncionario(pNome, pCPF: string;
  pSalario: Real);
begin
  FFuncionario.Nome := pNome;
  FFuncionario.CPF := pCPF;
  FFuncionario.Salario := pSalario;
end;

procedure TImpostosTestes.SetUp;
begin
  inherited;
  FCalculaImpostos := TCalculaImpostos.Create;
  FFuncionario := TFuncionario.Create;
end;

procedure TImpostosTestes.TearDown;
begin
  inherited;
  FreeAndNil(FCalculaImpostos);
  FreeAndNil(FFuncionario);
end;

procedure TImpostosTestes.TestCalcularComDoisIR_ComINSS;
begin
  InserirRegistroFuncionario('Antonio','13187787002',1000);
  InserirRegistroDependente('Bruna',True,True);
  InserirRegistroDependente('Pedro',True,True);
  FCalculaImpostos.Funcionario := FFuncionario;
  FCalculaImpostos.Calcular;

  CheckEquals(120,FCalculaImpostos.ImpostoIR,'Cálculo do IR está incorreto.');
  CheckEquals(80,FCalculaImpostos.ImpostoINSS,'Cálculo do INSS está incorreto.');
end;

procedure TImpostosTestes.TestCalcularComUmIR_SemINSS;
begin
  InserirRegistroFuncionario('João','19957180096',1000);
  InserirRegistroDependente('Miguel',True,False);
  FCalculaImpostos.Funcionario := FFuncionario;
  FCalculaImpostos.Calcular;

  CheckEquals(135,FCalculaImpostos.ImpostoIR,'Cálculo do IR está incorreto.');
  CheckEquals(0,FCalculaImpostos.ImpostoINSS,'Cálculo do INSS está incorreto.');
end;

procedure TImpostosTestes.TestCalcularSemDependente;
begin
  InserirRegistroFuncionario('Marcelo','59269573036',3000);
  FCalculaImpostos.Funcionario := FFuncionario;
  FCalculaImpostos.Calcular;

  CheckEquals(450,FCalculaImpostos.ImpostoIR,'Cálculo do IR está incorreto.');
  CheckEquals(0,FCalculaImpostos.ImpostoINSS,'Cálculo do INSS está incorreto.');
end;

procedure TImpostosTestes.TestCalcularSemDependenteIR_ComINSS;
begin
  InserirRegistroFuncionario('Eduarda','82175951006',2000);
  InserirRegistroDependente('Jorge',False,True);
  InserirRegistroDependente('Debora',False,False);
  FCalculaImpostos.Funcionario := FFuncionario;
  FCalculaImpostos.Calcular;

  CheckEquals(300,FCalculaImpostos.ImpostoIR,'Cálculo do IR está incorreto.');
  CheckEquals(160,FCalculaImpostos.ImpostoINSS,'Cálculo do INSS está incorreto.');
end;

procedure TImpostosTestes.TestCalcularSemSalario;
begin
  InserirRegistroFuncionario('Catia','70771261020',0);
  InserirRegistroDependente('Nelson',True,True);
  InserirRegistroDependente('Bernardo',False,False);
  FCalculaImpostos.Funcionario := FFuncionario;
  FCalculaImpostos.Calcular;

  CheckEquals(0,FCalculaImpostos.ImpostoIR,'Cálculo do IR está incorreto.');
  CheckEquals(0,FCalculaImpostos.ImpostoINSS,'Cálculo do INSS está incorreto.');
end;

initialization
  TestFramework.RegisterTest('Tests Impostos Suite', TImpostosTestes.Suite);

end.
 