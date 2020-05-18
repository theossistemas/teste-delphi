unit uFuncionarioDependenteController;

interface

uses
  uFuncionarioDependente, uDmFuncionarioDependente;

type
  TFuncionarioDependeteController = class
    public
      function Inserir(oFuncionarioDependente: TFuncionarioDependente;
        out sErro: String): Boolean;
      function Excluir(oFuncionarioDependente: TFuncionarioDependente;
        out sErro: String): Boolean;
      function ExcluirTodos(iIDFuncionario: Integer; out sErro: String): Boolean;
  end;

implementation

{ TFuncionarioDependeteController }

function TFuncionarioDependeteController.Excluir(
  oFuncionarioDependente: TFuncionarioDependente; out sErro: String): Boolean;
begin
  Result := DmFuncionarioDependente.Excluir(oFuncionarioDependente, sErro);
end;

function TFuncionarioDependeteController.ExcluirTodos(iIDFuncionario: Integer;
  out sErro: String): Boolean;
begin
  Result := DmFuncionarioDependente.ExcluirTodos(iIDFuncionario);
end;

function TFuncionarioDependeteController.Inserir(
  oFuncionarioDependente: TFuncionarioDependente; out sErro: String): Boolean;
begin
  Result := DmFuncionarioDependente.Inserir(oFuncionarioDependente, sErro);
end;

end.
