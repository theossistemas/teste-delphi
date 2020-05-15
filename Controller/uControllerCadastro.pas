unit uControllerCadastro;

interface

uses
  SysUtils, Contnrs, uFuncionario, uDependente, uFuncionarioDAO, Dialogs;

type
  TControllerCadastro = class
  private
    FFuncionario: TFuncionario;
    FDependente: TDependente;
    FFuncionarioDAO: TFuncionarioDAO;

    function GetDependente: TDependente;
    function GetFuncionario: TFuncionario;
    procedure SetDependente(const Value: TDependente);
    procedure SetFuncionario(const Value: TFuncionario);
  public
    constructor Create;
    destructor Destroy; override;
    function Salvar: boolean;
    procedure AdicionarDependente;
    procedure CriarDependente;
    function ValidarCamposFuncionarioPreenchidos: boolean;

    property Funcionario: TFuncionario read GetFuncionario write SetFuncionario;
    property Dependente: TDependente read GetDependente write SetDependente;
  end;

implementation

{ TControllerCadastro }

procedure TControllerCadastro.AdicionarDependente;
begin
  FFuncionario.Dependentes.Add(FDependente);
end;

constructor TControllerCadastro.Create;
begin
  FFuncionario := TFuncionario.Create;
  FFuncionarioDAO := TFuncionarioDAO.Create;
end;

procedure TControllerCadastro.CriarDependente;
begin
  FDependente := TDependente.Create;
end;

destructor TControllerCadastro.Destroy;
begin
  FreeAndNil(FFuncionario);
  FreeAndNil(FFuncionarioDAO);

  inherited;
end;

function TControllerCadastro.GetDependente: TDependente;
begin
  result := FDependente;
end;

function TControllerCadastro.GetFuncionario: TFuncionario;
begin
  result := FFuncionario;
end;

function TControllerCadastro.Salvar: boolean;
begin
  result := false;
  if not ValidarCamposFuncionarioPreenchidos then
  begin
    ShowMessage('É necessário preencher os dados do funcionário antes de ' +
                'salvar os dados.');
    Exit;
  end;

  result := FFuncionarioDAO.Salvar(FFuncionario); 
end;

procedure TControllerCadastro.SetDependente(const Value: TDependente);
begin
  FDependente := Value;
end;

procedure TControllerCadastro.SetFuncionario(const Value: TFuncionario);
begin
  FFuncionario := Value;
end;

function TControllerCadastro.ValidarCamposFuncionarioPreenchidos: boolean;
begin
  result := False;

  if Trim(FFuncionario.Nome) = '' then
    Exit;

  if Trim(FFuncionario.CPF) = '' then
    Exit;

  if FFuncionario.Salario <= 0 then
    Exit;
  
  result := True;
end;

end.
 