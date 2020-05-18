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
    function Excluir(iID: Integer; out sErro: String): Boolean;
    function CPFJaCadastrado(sCPF: String): Boolean;
    function GetIDNovoFuncionario: Integer;
    function CarregarFuncionariosFiltroNome(sNome: String; out oListaFuncionarios: TObjectList<TFuncionario>): Integer;
    function ValidarDados(oFuncionario: TFuncionario; out sMsg: String): Boolean;
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

function TFuncionarioController.CarregarFuncionariosFiltroNome(sNome: String;
  out oListaFuncionarios: TObjectList<TFuncionario>): Integer;
begin
  Result := DmFuncionario.CarregarFuncionariosFiltroNome(sNome, oListaFuncionarios);
end;

function TFuncionarioController.CPFJaCadastrado(sCPF: String): Boolean;
begin
  Result := DmFuncionario.CPFJaCadastrado(sCPF);
end;

function TFuncionarioController.Excluir(iID: Integer;
  out sErro: String): Boolean;
begin
  Result := DmFuncionario.Excluir(iID, sErro);
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

  Result := True;
end;

end.
