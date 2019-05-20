unit uFuncionarioControle;

interface

uses

Windows, SysUtils, Classes, Controls, Forms, ComCtrls, uControle;

type

TFuncionarioControle = class

private



FCpf : String;

FNome : String;

FSalarioBruto: Real;

FSalarioLiquido: Real;


// Classe de Persistencia ...

Fcontrole :TControle;

public



constructor Create(pConexaoControle:TControle);

destructor Destroy; override;

//

function InsereFuncionario : Boolean;

function AlteraFuncionario : Boolean;

function ExcluirFuncionario : Boolean;

function PesquisaFuncionario (pCPF:string):TFuncionarioControle;

//





property Nome : String read FNome write FNome;

property Cpf : String read FCpf write FCpf;

property SalarioBruto : Real read FSalarioBruto write FSalarioBruto;

property SalarioLiquido : Real read FSalarioLiquido write FSalarioLiquido;



end;



implementation

{ TFuncionarioControle }

function TFuncionarioControle.AlteraFuncionario: Boolean;

begin

  FControle.sqqGeral.Close;

  FControle.sqqGeral.SQL.Clear;

  FControle.sqqGeral.SQL.Add(' UPDATE TBL_FUNCIONARIO ');

  FControle.sqqGeral.SQL.Add(' SET FUN_NOME = :vFUN_NOME, ');

  FControle.sqqGeral.SQL.Add(' FUN_CPF = :vFUN_CPF, ');

  FControle.sqqGeral.SQL.Add(' FUN_SALARIOBRUTO = :vFUN_SALARIOBRUTO, ');

  FControle.sqqGeral.SQL.Add(' FUN_SALARIOLIQUIDO = :vFUN_SALARIOLIQUIDO, ');


  FControle.sqqGeral.SQL.Add(' WHERE (FUN_CPF = :vFUN_CPF) ');



  FControle.sqqGeral.ParamByName('vFUN_NOME').AsString := Self.NOME;


  FControle.sqqGeral.ParamByName('vFUN_CPF').AsString := Self.Cpf;

  FControle.sqqGeral.ParamByName('vFUN_SALARIOBRUTO').AsFloat := Self.SalarioBruto;

  FControle.sqqGeral.ParamByName('vFUN_SALARIOLIQUIDO').AsFloat := Self.SalarioLiquido;

  //

  try

  FControle.sqqGeral.ExecSQL;

   Result := True;

  except

   Result := False;

  end;

end;



constructor TFuncionarioControle.Create(pConexaoControle:TControle);

begin

 Fcontrole := pConexaoControle;

end;



destructor TFuncionarioControle.Destroy;

begin



inherited;

end;



function TFuncionarioControle.ExcluirFuncionario: Boolean;

begin

  Fcontrole.SqqGeral.Close;

  FControle.sqqGeral.SQL.Clear;

  FControle.sqqGeral.SQL.Add(' DELETE FROM TBL_FUNCIONARIO C ');

  FControle.sqqGeral.SQL.Add(' WHERE C.FUN_CPF = :vFUN_CPF ');

  FControle.sqqGeral.ParamByName('vFUN_CPF').AsString := Self.CPF;



  try

  FControle.sqqGeral.ExecSQL;

   Result := True;

  except

   Result := False;

  end

end;



function TFuncionarioControle.InsereFuncionario: Boolean;

begin

  FControle.sqqGeral.Close;

  FControle.sqqGeral.SQL.Clear;

  FControle.sqqGeral.SQL.Add(' INSERT INTO TBL_FUNCIONARIO ');

  FControle.sqqGeral.SQL.Add(' (FUN_CPF, ');

  FControle.sqqGeral.SQL.Add(' FUN_NOME, ');

  FControle.sqqGeral.SQL.Add(' FUN_SALARIOBRUTO, ');

  FControle.sqqGeral.SQL.Add(' FUN_SALARIOLIQUIDO, ');


  //

  FControle.sqqGeral.ParamByName('vFUN_CPF').AsString := Self.CPF;

  FControle.sqqGeral.ParamByName('vCLI_NOME').AsString := Self.Nome;

  FControle.sqqGeral.ParamByName('vFUN_SALARIBRUTO').AsFloat := Self.SalarioBruto;

  FControle.sqqGeral.ParamByName('vFUN_SALARIOLIQUIDO').AsFloat := Self.SalarioLiquido;



  //

  try

  FControle.sqqGeral.ExecSQL;

   Result := True;

  except

   Result := False;

  end;

end;



function TFuncionarioControle.PesquisaFuncionario(pCPF: string): TFuncionarioControle;

begin

  FControle.sqqGeral.Close;

  FControle.sqqGeral.SQL.Clear;

  FControle.sqqGeral.SQL.Add(' SELECT FUN_CPF, ');

  FControle.sqqGeral.SQL.Add(' FUN_NOME, ');

  FControle.sqqGeral.SQL.Add(' FUN_SALARIOBRUTO, ');

  FControle.sqqGeral.SQL.Add(' FUN_SALARIOLIQUIDO, ');

  FControle.sqqGeral.SQL.Add(' FROM TBL_FUNCIONARIO ');

  FControle.sqqGeral.SQL.Add(' WHERE FUN_CPF = '+ pCPF );

  FControle.sqqGeral.Open;



  if FControle.sqqGeral.IsEmpty then

  begin

   Self.Cpf := '';

  end

  else

  begin

    Self.CPF := FControle.sqqGeral.ParamByName('vFUN_CPF').AsString ;

    Self.Nome := FControle.sqqGeral.ParamByName('vFUN_NOME').AsString ;

    Self.SalarioBruto := FControle.sqqGeral.ParamByName('vFUN_SALARIOBRUTO').AsFLOAT ;

    Self.SalarioLiquido := FControle.sqqGeral.ParamByName('vFUN_SALARIOLIQUIDO').AsFLOAT ;

  end;

end;

end.
