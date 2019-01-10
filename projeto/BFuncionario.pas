unit BFuncionario;

interface

uses Sysutils, CFuncionario, CDependente, CListaDependente, UDM, Math;

type
  TBFuncionario = class
  private
    procedure atualizarImpostos(oFuncionario: TFuncionario; oListaDependente: TListaDependente);
  public
    function inserir(oFuncionario: TFuncionario; oListaDependente: TListaDependente): Boolean;
  end;

implementation

{ TBFuncionario }

procedure TBFuncionario.atualizarImpostos(oFuncionario: TFuncionario; oListaDependente: TListaDependente);
var
  i: SmallInt;
  contador: SmallInt;
  oDependente: TDependente;
begin
  contador := ZeroValue;
  oDependente := TDependente.Create;
  try
    for i:=0 to oListaDependente.getLista.Count-1 do
    begin
      oDependente := oListaDependente.getLista.Items[i];

      if oDependente.getIsCalculaINSS then
        oFuncionario.setInss( oFuncionario.getInss + ( oFuncionario.getSalario * (8/100) ) );

      if oDependente.getIsCalculaIR then
      begin
        inc(contador);
      end;
    end;

    if contador > Zerovalue then
      oFuncionario.setIr( (oFuncionario.getSalario - (contador * 100)) * (15/100) );

    oFuncionario.setSalario( oFuncionario.getSalario - oFuncionario.getInss - oFuncionario.getIr );
  finally
  end;
end;

function TBFuncionario.inserir(oFuncionario: TFuncionario; oListaDependente: TListaDependente): Boolean;
begin
  atualizarImpostos(oFuncionario, oListaDependente);
  result := DM.inserirFuncionario(oFuncionario, oListaDependente);
end;

end.
