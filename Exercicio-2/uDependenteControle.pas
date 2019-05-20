unit uDependenteControle;

interface

uses

Windows, SysUtils, Classes, Controls, Forms, ComCtrls, uControle;

type

TDependenteControle = class

private



FCpf : String;

FFunCpf : String;

FNome : String;

FCalcularIR: String;

FCalcularINSS: String;


// Classe de Persistencia ...

Fcontrole :TControle;

public



constructor Create(pConexaoControle:TControle);

destructor Destroy; override;

//

function InsereDependente : Boolean;

function AlteraDependente : Boolean;

function ExcluirDependente : Boolean;

function PesquisaDependente (pCPF:string):TDependenteControle;

function PesquisaAllDependente (sFunCPF:string):TStringList;

//





property Nome : String read FNome write FNome;

property Cpf : String read FCpf write FCpf;

property FunCpf : String read FFunCpf write FFunCpf;

property CalcularIR : String read FCalcularIR write FCalcularIR;

property CalcularINSS : String read FCalcularINSS write FCalcularINSS;



end;



implementation

{ TDependenteControle }

function TDependenteControle.AlteraDependente: Boolean;

begin

  FControle.sqqGeral.Close;

  FControle.sqqGeral.SQL.Clear;

  FControle.sqqGeral.SQL.Add(' UPDATE TBL_DEPENDENTE ');

  FControle.sqqGeral.SQL.Add(' SET DEP_NOME = :vDEP_NOME, ');

  FControle.sqqGeral.SQL.Add(' DEP_CPF = :vDEP_CPF, ');

  FControle.sqqGeral.SQL.Add(' DEP_FUNCPF = :vDEP_FUNCPF, ');

  FControle.sqqGeral.SQL.Add(' DEP_CALCULARIR = :vDEP_CALCULARIR, ');

  FControle.sqqGeral.SQL.Add(' DEP_CALCULARINSS = :vFUN_CALCULARINSS, ');


  FControle.sqqGeral.SQL.Add(' WHERE (DEP_CPF = :vDEP_CPF) ');



  FControle.sqqGeral.ParamByName('vDEP_NOME').AsString := Self.NOME;


  FControle.sqqGeral.ParamByName('vDEP_CPF').AsString := Self.Cpf;

  FControle.sqqGeral.ParamByName('vDEP_FUNCPF').AsString := Self.FunCpf;

  FControle.sqqGeral.ParamByName('vDEP_CALCULARIR').AsString := Self.CalcularIR;

  FControle.sqqGeral.ParamByName('vDEP_CALCULARINSS').AsString := Self.CalcularINSS;

  //

  try

    FControle.sqqGeral.ExecSQL;

    Result := True;

  except

    Result := False;

  end;

end;



constructor TDependenteControle.Create(pConexaoControle:TControle);

begin

 Fcontrole := pConexaoControle;

end;



destructor TDependenteControle.Destroy;

begin



inherited;

end;



function TDependenteControle.ExcluirDependente: Boolean;

begin

  Fcontrole.SqqGeral.Close;

  FControle.sqqGeral.SQL.Clear;

  FControle.sqqGeral.SQL.Add(' DELETE FROM TBL_DEPENDENTE C ');

  FControle.sqqGeral.SQL.Add(' WHERE C.DEP_CPF = :vDEP_CPF ');

  FControle.sqqGeral.ParamByName('vDEP_CPF').AsString := Self.CPF;



  try

  FControle.sqqGeral.ExecSQL;

   Result := True;

  except

   Result := False;

  end

end;



function TDependenteControle.InsereDependente: Boolean;

begin

  FControle.sqqGeral.Close;

  FControle.sqqGeral.SQL.Clear;

  FControle.sqqGeral.SQL.Add(' INSERT INTO TBL_DEPENDENTE ');

  FControle.sqqGeral.SQL.Add(' (DEP_CPF, ');

  FControle.sqqGeral.SQL.Add(' (DEP_FUNCPF, ');

  FControle.sqqGeral.SQL.Add(' DEP_NOME, ');

  FControle.sqqGeral.SQL.Add(' DEP_CALCULARIR, ');

  FControle.sqqGeral.SQL.Add(' DEP_CALCULARINSS, ');


  //

  FControle.sqqGeral.ParamByName('vDEP_CPF').AsString := Self.CPF;

  FControle.sqqGeral.ParamByName('vDEP_FUNCPF').AsString := Self.CPF;

  FControle.sqqGeral.ParamByName('vDEP_NOME').AsString := Self.Nome;

  FControle.sqqGeral.ParamByName('vDEP_CALCULARIR').AsString:= Self.CalcularIR;

  FControle.sqqGeral.ParamByName('vDEP_CALCULARINSS').AsString := Self.CalcularINSS;



  //

  try

  FControle.sqqGeral.ExecSQL;

    Result := True;

  except

    Result := False;

  end;

end;



function TDependenteControle.PesquisaDependente(pCPF: string): TDependenteControle;

begin

  FControle.sqqGeral.Close;

  FControle.sqqGeral.SQL.Clear;

  FControle.sqqGeral.SQL.Add(' SELECT DEP_CPF, ');

  FControle.sqqGeral.SQL.Add(' DEP_FUNCPF, ');

  FControle.sqqGeral.SQL.Add(' DEP_NOME, ');

  FControle.sqqGeral.SQL.Add(' DEP_CALCULARIR, ');

  FControle.sqqGeral.SQL.Add(' DEP_CALCULARINSS, ');

  FControle.sqqGeral.SQL.Add(' FROM TBL_DEPENDENTE ');

  FControle.sqqGeral.SQL.Add(' WHERE DEP_CPF = '+ pCPF );

  FControle.sqqGeral.Open;



  if FControle.sqqGeral.IsEmpty then

  begin



  end

  else

  begin

    Self.CPF := FControle.sqqGeral.ParamByName('vDEP_CPF').AsString ;

    Self.CPF := FControle.sqqGeral.ParamByName('vDEP_FUNCPF').AsString ;

    Self.Nome := FControle.sqqGeral.ParamByName('vDEP_NOME').AsString ;

    Self.CalcularIR := FControle.sqqGeral.ParamByName('vDEP_CALCULARIR').AsString ;

    Self.CalcularINSS := FControle.sqqGeral.ParamByName('vFUN_CALCULARINSS').AsString ;

  end;

end;

function TDependenteControle.PesquisaALLDependente(sFunCPF:string): TStringList;
Var
 sListaDep: TStringList;

begin
  sListaDep := TStringList.Create;

  FControle.sqqGeral.Close;

  FControle.sqqGeral.SQL.Clear;

  FControle.sqqGeral.SQL.Add(' SELECT DEP_CPF, ');

  FControle.sqqGeral.SQL.Add(' DEP_FUNCPF, ');

  FControle.sqqGeral.SQL.Add(' DEP_NOME, ');

  FControle.sqqGeral.SQL.Add(' DEP_CALCULARIR, ');

  FControle.sqqGeral.SQL.Add(' DEP_CALCULARINSS, ');

  FControle.sqqGeral.SQL.Add(' FROM TBL_DEPENDENTE ');

  FControle.sqqGeral.SQL.Add(' WHERE DEP_FUNCPF = '+ sFunCPF );

  FControle.sqqGeral.Open;

  while not (FControle.sqqGeral.Eof) do
  begin
    sListaDep.Append(FControle.sqqGeral.FieldByName('DEP_NOME').AsString);
    FControle.sqqGeral.Next;
  end;

  Result:= sListaDep;

end;

end.
