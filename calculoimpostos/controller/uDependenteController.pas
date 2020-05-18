unit uDependenteController;

interface

uses
  uDependente, uDmDependente;

type
  TDependenteController = class
    public
      function GetIDNovoDependente: Integer;
      function Inserir(oDependente: TDependente; out sErro: String): Boolean;
      function Excluir(iID: Integer; sErro: String): Boolean;
  end;

implementation

{ TDependenteController }

function TDependenteController.Excluir(iID: Integer; sErro: String): Boolean;
begin
  Result := DmDependente.Excluir(iID, sErro);
end;

function TDependenteController.GetIDNovoDependente: Integer;
begin
  Result := DmDependente.GetIDNovoDependente();
end;

function TDependenteController.Inserir(oDependente: TDependente;
  out sErro: String): Boolean;
begin
  Result := DmDependente.Inserir(oDependente, sErro);
end;

end.
