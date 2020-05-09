unit uImpostosTestes;

interface

uses
  TestFramework, SysUtils, DBClient, DB, uobjCalculaImpostos;

type
  TImpostosTestes = class(TTestCase)
  private
    ocdsDependentes: TClientDataSet;
    FCalculaImpostos: TCalculaImpostos;

    procedure CriarEstruturaDataSet;
    procedure InserirRegistroDataSet(const nCodigo: integer;
      const sCalculaIR: string; const sCalculaINSS: string);
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

procedure TImpostosTestes.CriarEstruturaDataSet;
begin
   ocdsDependentes := TClientDataSet.Create(nil);
   ocdsDependentes.Close;
   ocdsDependentes.FieldDefs.Clear;
   ocdsDependentes.FieldDefs.add('CODIGO',ftInteger);
   ocdsDependentes.FieldDefs.add('ISCALCULAIR',ftString,1);
   ocdsDependentes.FieldDefs.add('ISCALCULAINSS',ftString,1);
   ocdsDependentes.CreateDataSet;
end;

procedure TImpostosTestes.InserirRegistroDataSet(const nCodigo: integer;
  const sCalculaIR, sCalculaINSS: string);
begin
  ocdsDependentes.Append;
  ocdsDependentes.FieldByName('CODIGO').AsInteger := nCodigo;
  ocdsDependentes.FieldByName('ISCALCULAINSS').AsString := sCalculaINSS;
  ocdsDependentes.FieldByName('ISCALCULAIR').AsString := sCalculaIR;
  ocdsDependentes.Post;
end;

procedure TImpostosTestes.SetUp;
begin
  inherited;
  FCalculaImpostos := TCalculaImpostos.Create;
  CriarEstruturaDataSet;
end;

procedure TImpostosTestes.TearDown;
begin
  inherited;
  FCalculaImpostos.Free;
  ocdsDependentes.Free;
end;

procedure TImpostosTestes.TestCalcularComDoisIR_ComINSS;
begin
  InserirRegistroDataSet(1,'S','S');
  InserirRegistroDataSet(2,'S','S');
  FCalculaImpostos.SetSalario(1000);
  FCalculaImpostos.SetCdsDependentes(ocdsDependentes);
  FCalculaImpostos.Calcular;

  CheckEquals(120,FCalculaImpostos.ImpostoIR,'Cálculo do IR está incorreto.');
  CheckEquals(80,FCalculaImpostos.ImpostoINSS,'Cálculo do INSS está incorreto.');
end;

procedure TImpostosTestes.TestCalcularComUmIR_SemINSS;
begin
  InserirRegistroDataSet(1,'S','N');
  FCalculaImpostos.SetSalario(1000);
  FCalculaImpostos.SetCdsDependentes(ocdsDependentes);
  FCalculaImpostos.Calcular;

  CheckEquals(135,FCalculaImpostos.ImpostoIR,'Cálculo do IR está incorreto.');
  CheckEquals(0,FCalculaImpostos.ImpostoINSS,'Cálculo do INSS está incorreto.');
end;

procedure TImpostosTestes.TestCalcularSemDependente;
begin
  FCalculaImpostos.SetSalario(3000);
  FCalculaImpostos.SetCdsDependentes(ocdsDependentes);
  FCalculaImpostos.Calcular;

  CheckEquals(450,FCalculaImpostos.ImpostoIR,'Cálculo do IR está incorreto.');
  CheckEquals(0,FCalculaImpostos.ImpostoINSS,'Cálculo do INSS está incorreto.');
end;

procedure TImpostosTestes.TestCalcularSemDependenteIR_ComINSS;
begin
  InserirRegistroDataSet(1,'N','S');
  InserirRegistroDataSet(2,'N','N');
  FCalculaImpostos.SetSalario(2000);
  FCalculaImpostos.SetCdsDependentes(ocdsDependentes);
  FCalculaImpostos.Calcular;

  CheckEquals(300,FCalculaImpostos.ImpostoIR,'Cálculo do IR está incorreto.');
  CheckEquals(160,FCalculaImpostos.ImpostoINSS,'Cálculo do INSS está incorreto.');
end;

procedure TImpostosTestes.TestCalcularSemSalario;
begin
  InserirRegistroDataSet(1,'S','S');
  InserirRegistroDataSet(2,'N','N');
  FCalculaImpostos.SetCdsDependentes(ocdsDependentes);
  FCalculaImpostos.Calcular;

  CheckEquals(0,FCalculaImpostos.ImpostoIR,'Cálculo do IR está incorreto.');
  CheckEquals(0,FCalculaImpostos.ImpostoINSS,'Cálculo do INSS está incorreto.');
end;

initialization
  TestFramework.RegisterTest('Tests Impostos Suite', TImpostosTestes.Suite);

end.
 