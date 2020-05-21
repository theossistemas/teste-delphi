unit uControle;

interface

uses Vcl.Dialogs,System.SysUtils, uDAO, uFuncionario, uDependente;

type
  TControle = class
    private
      FoDAO: TDAO;
      function ValidarDadosFuncionario(const poFuncionario: TFuncionario): Boolean;
      function ValidarDadosDependente(const pnFuncionario: Integer; const poDependente: TDependente): Boolean;
    public
      constructor Create;
      destructor Destroy; override;
      function GerarIdFuncionario: Integer;
      function GerarIdDependente: Integer;
      procedure SalvarFuncionario(const poFuncionario: TFuncionario);
      procedure SalvarDependente(const pnFuncionario: Integer; const poDependente: TDependente);
      procedure ExcluirFuncionario(const pnFuncionario: Integer);
      procedure ExcluirDependente(const pnDependente: Integer);
  end;

implementation

{ TControle }

constructor TControle.Create;
begin
  FoDAO := TDAO.Create;
end;

destructor TControle.Destroy;
begin
  FreeAndNil(FoDAO);
  inherited;
end;

procedure TControle.ExcluirDependente(const pnDependente: Integer);
begin
  if not FoDAO.ExcluirDependente(pnDependente) then
    ShowMessage('Não foi possível excluir o dependente!');
end;

procedure TControle.ExcluirFuncionario(const pnFuncionario: Integer);
begin
  if not FoDAO.ExcluirFuncionario(pnFuncionario) then
    ShowMessage('Não foi possível excluir o funcionario!');
end;

function TControle.GerarIdDependente: Integer;
begin
  Result := FoDAO.GeraIdDependente;
end;

function TControle.GerarIdFuncionario: Integer;
begin
  Result := FoDAO.GeraIdFuncionario;
end;

procedure TControle.SalvarDependente(const pnFuncionario: Integer; const poDependente: TDependente);
begin
  if not ValidarDadosDependente(pnFuncionario, poDependente) then
    exit;

  if not FoDAO.InserirDependente(pnFuncionario, poDependente) then
    Showmessage('Erro ao salvar dependente!');
end;

procedure TControle.SalvarFuncionario(
  const poFuncionario: TFuncionario);
begin
  if not ValidarDadosFuncionario(poFuncionario) then
    exit;

  if not FoDAO.InserirFuncionario(poFuncionario) then
    Showmessage('Erro ao salvar funcionário!');
end;

function TControle.ValidarDadosDependente(const pnFuncionario: Integer; const poDependente: TDependente): Boolean;
begin
  Result := False;

  if pnFuncionario <= 0 then
  begin
    Showmessage('Código do funcionario não informado!');
    exit;
  end;
  if poDependente.codigo <= 0 then
  begin
    Showmessage('Código do dependente não informado!');
    exit;
  end;
  if poDependente.nome = '' then
  begin
    Showmessage('Nome do dependente não informado!');
    exit;
  end;

  Result := True;
end;

function TControle.ValidarDadosFuncionario(const poFuncionario: TFuncionario): Boolean;
begin
  Result := False;

  if poFuncionario.codigo <= 0 then
  begin
    Showmessage('Código do funcionario não informado!');
    exit;
  end;
  if poFuncionario.nome = '' then
  begin
    Showmessage('Nome do funcionario não informado!');
    exit;
  end;
  if poFuncionario.cpf = '' then
  begin
    Showmessage('CPF do funcionario não informado!');
    exit;
  end;

  Result := True;
end;

end.
