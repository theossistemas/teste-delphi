unit uDependenteController;

interface

uses
  uDependente, uDmDependente, System.Generics.Collections;

type
  TDependenteController = class
    public
      function GetIDNovoDependente: Integer;
      function Inserir(oDependente: TDependente; out sErro: String): Boolean;
      function Excluir(iID: Integer; sErro: String): Boolean;
      function CarregarDependentesDoFuncionario(iIDFuncionario: Integer;
        out oListaDependentes: TObjectList<TDependente>): Integer;
      function ValidarDados(oDependente: TDependente; out sMsg: String): Boolean;
  end;

implementation

uses
  System.SysUtils;

{ TDependenteController }

function TDependenteController.CarregarDependentesDoFuncionario(
  iIDFuncionario: Integer;
  out oListaDependentes: TObjectList<TDependente>): Integer;
begin
  Result := DmDependente.CarregarDependentesDoFuncionario(iIDFuncionario,
    oListaDependentes);
end;

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

function TDependenteController.ValidarDados(oDependente: TDependente;
  out sMsg: String): Boolean;
begin
  if Length(Trim(oDependente.Nome)) = 0 then begin
    sMsg := 'Informe o nome do dependente!';
    Result := False;
    Exit;
  end;

  Result := True;
end;

end.
