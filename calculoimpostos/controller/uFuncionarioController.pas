unit uFuncionarioController;

interface

uses
  uFuncionario, uDmFuncionario, System.Generics.Collections, uDependente;

type
  TFuncionarioController = class
  private
    { private declarations }
  protected
    { protected declarations }
  public
    function Inserir(oFuncionario: TFuncionario; out sErro: String): Boolean;
    function Atualizar(oFuncionario: TFuncionario; out sErro: String): Boolean;
    function Excluir(oFuncionario: TFuncionario; out sErro: String): Boolean;
    function CPFJaCadastrado(sCPF: String; iIDFuncionario: Integer): Boolean;
    function GetIDNovoFuncionario: Integer;
    function CarregarFuncionariosFiltroNome(sNome: String; out oListaFuncionarios: TObjectList<TFuncionario>): Integer;
    function ValidarDados(oFuncionario: TFuncionario; out sMsg: String): Boolean;
    function CarregarFuncionario(iIDFuncionario: Integer;
      out oFuncionario: TFuncionario): Boolean;
    function CarregarDependentes(oFuncionario: TFuncionario): Integer;
  published
    { published declarations }
  end;

implementation

{ TFuncionarioController }

function TFuncionarioController.Atualizar(oFuncionario: TFuncionario;
  out sErro: String): Boolean;
begin
  Result := DmFuncionario.Atualizar(oFuncionario, sErro);
end;

function TFuncionarioController.CarregarDependentes(
  oFuncionario: TFuncionario): Integer;
begin
  Result := DmFuncionario.CarregarDependentes(oFuncionario);
end;

function TFuncionarioController.CarregarFuncionario(iIDFuncionario: Integer;
  out oFuncionario: TFuncionario): Boolean;
begin
  Result := DmFuncionario.CarregarFuncionario(iIDFuncionario, oFuncionario);
end;

function TFuncionarioController.CarregarFuncionariosFiltroNome(sNome: String;
  out oListaFuncionarios: TObjectList<TFuncionario>): Integer;
begin
  Result := DmFuncionario.CarregarFuncionariosFiltroNome(sNome, oListaFuncionarios);
end;

function TFuncionarioController.CPFJaCadastrado(sCPF: String; iIDFuncionario: Integer): Boolean;
begin
  Result := DmFuncionario.CPFJaCadastrado(sCPF, iIDFuncionario);
end;

function TFuncionarioController.Excluir(oFuncionario: TFuncionario;
  out sErro: String): Boolean;
begin
  Result := DmFuncionario.Excluir(oFuncionario, sErro);
end;

function TFuncionarioController.GetIDNovoFuncionario: Integer;
begin
  Result := DmFuncionario.GetIDNovoFuncionario();
end;

function TFuncionarioController.Inserir(oFuncionario: TFuncionario;
  out sErro: String): Boolean;
begin
  Result := DmFuncionario.Inserir(oFuncionario, sErro);
end;

function TFuncionarioController.ValidarDados(oFuncionario: TFuncionario;
  out sMsg: String): Boolean;
begin
  if (Length(oFuncionario.Nome) < 5) or (Length(oFuncionario.Nome) > 200) then begin
    sMsg := 'O nome do funcionário deve ter no mínimo 5 e no máximo 200 caracteres!';
    Result := False;
    Exit;
  end;

  if Length(oFuncionario.CPF) <> 11 then begin
    sMsg := 'O CPF do funcionário deve conter 11 caracteres!';
    Result := False;
    Exit;
  end;

  if oFuncionario.Salario <= 0 then begin
    sMsg := 'O salário do funcionário deve ser maior que zero!';
    Result := False;
    Exit;
  end;

  if CPFJaCadastrado(oFuncionario.CPF, oFuncionario.ID) then begin
  sMsg := 'O CPF '+oFuncionario.CPF+' já está cadastrado para outro funcionário!';
    Result := False;
    Exit;
  end;

  Result := True;
end;

end.
