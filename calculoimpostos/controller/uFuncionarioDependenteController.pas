unit uFuncionarioDependenteController;

interface

uses
  uFuncionarioDependente, uDmFuncionarioDependente;

type
  TFuncionarioDependenteController = class
    public
      function Inserir(oFuncionarioDependente: TFuncionarioDependente;
        out sErro: String): Boolean;
      function Excluir(oFuncionarioDependente: TFuncionarioDependente;
        out sErro: String): Boolean;
      function ExcluirTodos(iIDFuncionario: Integer; out sErro: String): Boolean;
  end;

implementation

{ TFuncionarioDependeteController }

function TFuncionarioDependenteController.Excluir(
  oFuncionarioDependente: TFuncionarioDependente; out sErro: String): Boolean;
begin
  Result := DmFuncionarioDependente.Excluir(oFuncionarioDependente, sErro);
end;

function TFuncionarioDependenteController.ExcluirTodos(iIDFuncionario: Integer;
  out sErro: String): Boolean;
begin
  Result := DmFuncionarioDependente.ExcluirTodos(iIDFuncionario, sErro);
end;

function TFuncionarioDependenteController.Inserir(
  oFuncionarioDependente: TFuncionarioDependente; out sErro: String): Boolean;
begin
  Result := DmFuncionarioDependente.Inserir(oFuncionarioDependente, sErro);
end;

end.
