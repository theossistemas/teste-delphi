unit BFuncionario;

interface

uses Sysutils, CFuncionario, CDependente, UDM, Math;

type
  TBFuncionario = class
  private
    procedure atualizarImpostos(oFuncionario: TFuncionario);
  public
    function inserir(oFuncionario: TFuncionario): Boolean;
  end;

implementation

{ TBFuncionario }

procedure TBFuncionario.atualizarImpostos(oFuncionario: TFuncionario);
var
  i: SmallInt;
  contador: SmallInt;
  oDependente: TDependente;
begin
  contador := ZeroValue;
  oDependente := TDependente.Create;
  try
    for i:=0 to oFuncionario.getLista.Count-1 do
    begin
      oDependente := oFuncionario.getLista.Items[i];

      if oDependente.getIsCalculaINSS then
        oFuncionario.setInss( oFuncionario.getInss + ( oFuncionario.getSalario * (8/100) ) );

      if oDependente.getIsCalculaIR then
        inc(contador);
    end;

    if contador > Zerovalue then
      oFuncionario.setIr( (oFuncionario.getSalario - (contador * 100)) * (15/100) );

    oFuncionario.setSalario( oFuncionario.getSalario - oFuncionario.getInss - oFuncionario.getIr );
  finally
  end;
end;

function TBFuncionario.inserir(oFuncionario: TFuncionario): Boolean;
begin
  atualizarImpostos(oFuncionario);
  result := DM.inserirFuncionario(oFuncionario);
end;

end.
