unit uFuncionarioDAO;

interface

uses
  SysUtils, Contnrs, SqlExpr, uDMCadastro, uFuncionario, uDependente;

type
  TFuncionarioDAO = class
  private
    FSQLQuery: TSQLQuery;

    function GerarNovoCodigoFuncionario: integer;
    function GerarNovoCodigoDependente: integer;
    procedure SalvarDependentes(pListaDependentes: TObjectList;
      pCodigoFuncionario: integer);
  public
    constructor Create;
    destructor Destroy; override;

    function Salvar(pFuncionario: TFuncionario): boolean;
  end;

implementation

{ TFuncionarioDAO }

constructor TFuncionarioDAO.Create;
begin
  FSQLQuery := TSQLQuery.Create(nil);
  FSQLQuery.SQLConnection := DMCadastro.ConexaoBanco;
end;

destructor TFuncionarioDAO.Destroy;
begin
  FreeAndNil(FSQLQuery);

  inherited;
end;

function TFuncionarioDAO.GerarNovoCodigoDependente: integer;
begin
  DMCadastro.GeneratorDependente.Open;
  result := DMCadastro.GeneratorDependente.FieldByName('GEN_ID').AsInteger;
  DMCadastro.GeneratorDependente.Close;
end;

function TFuncionarioDAO.GerarNovoCodigoFuncionario: integer;
begin
  DMCadastro.GeneratorFuncionario.Open;
  result := DMCadastro.GeneratorFuncionario.FieldByName('GEN_ID').AsInteger;
  DMCadastro.GeneratorFuncionario.Close;
end;

function TFuncionarioDAO.Salvar(pFuncionario: TFuncionario): boolean;
var
  nNovoCodigoFuncionario: integer;
begin
  DMCadastro.IniciarTransaction;
  nNovoCodigoFuncionario := GerarNovoCodigoFuncionario;

  FSQLQuery.Close;
  FSQLQuery.SQL.Clear;
  FSQLQuery.SQL.Add('insert into FUNCIONARIO (codigo, nome, cpf, salario) ');
  FSQLQuery.SQL.Add('values(:codigo, :nome, :cpf, :salario)');
  FSQLQuery.ParamByName('codigo').AsInteger := nNovoCodigoFuncionario;
  FSQLQuery.ParamByName('nome').AsString := pFuncionario.Nome;
  FSQLQuery.ParamByName('cpf').AsString := pFuncionario.CPF;
  FSQLQuery.ParamByName('salario').AsFloat := pFuncionario.Salario; 
  try
    FSQLQuery.ExecSQL;
    SalvarDependentes(pFuncionario.Dependentes, nNovoCodigoFuncionario);
    DMCadastro.RealizarCommit;
    result := true;
  except
    result := false;
  end;
end;

procedure TFuncionarioDAO.SalvarDependentes(pListaDependentes: TObjectList;
  pCodigoFuncionario: integer);
var
  nContador: integer;
  sCalculaIR: string;
  sCalculaINSS: string;
begin
  if pListaDependentes.Count = 0 then
    Exit;

  for nContador := 0 to pListaDependentes.Count - 1 do
  begin
    sCalculaIR := 'N';
    sCalculaINSS := 'N';

    if (pListaDependentes[nContador] as TDependente).IsCalcularIR then
      sCalculaIR := 'S';

    if (pListaDependentes[nContador] as TDependente).IsCalcularINSS then
      sCalculaINSS := 'S';

    FSQLQuery.Close;
    FSQLQuery.SQL.Clear;
    FSQLQuery.SQL.Add('insert into DEPENDENTE (codigo, funcionario, nome, iscalculair, iscalculainss) ');
    FSQLQuery.SQL.Add('values(:codigo, :funcionario, :nome, :iscalculair, :iscalculainss)');
    FSQLQuery.ParamByName('codigo').AsInteger := GerarNovoCodigoDependente;
    FSQLQuery.ParamByName('funcionario').AsInteger := pCodigoFuncionario;
    FSQLQuery.ParamByName('nome').AsString := (pListaDependentes[nContador] as TDependente).Nome;
    FSQLQuery.ParamByName('iscalculair').AsString := sCalculaIR;
    FSQLQuery.ParamByName('iscalculainss').AsString := sCalculaINSS;
    FSQLQuery.ExecSQL;
  end;
end;

end.
 