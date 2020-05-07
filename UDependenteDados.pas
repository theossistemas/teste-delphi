unit UDependenteDados;

interface

uses
  System.Generics.Collections, System.SysUtils, UFuncionario, UDm, Vcl.Dialogs;


Type
  TDependenteDados = class
  private
    FLista: TObjectList<TFuncionario>;
    protected
      Destructor Destroy; override;
  public
    constructor create;
    function salvarDependente(var aList:TFuncionario): boolean;
  end;

implementation


{ TDependenteDados }

destructor TDependenteDados.Destroy;
begin
  FLista.Free;
  inherited;
end;

function TDependenteDados.salvarDependente(var aList: TFuncionario): boolean;
var
  i : integer;
begin
  if aList.ListaDependente.Count > 0 then
  begin
    for i := Pred(aList.ListaDependente.Count) downto 0 do
    begin
      showmessage(aList.ListaDependente[i].ID.ToString);
    end;
  end;

end;

{ TDependenteDados }

constructor TDependenteDados.create;
begin
  FLista := TObjectList<TFuncionario>.Create;
end;


end.
