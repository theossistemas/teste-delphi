unit uDependente;

interface

uses System.SysUtils, System.Classes, System.Generics.Collections, uDataBase;

type

  TDependente = class
  private

    FId              : cardinal;
    FFuncionario_CPF : string;
    FNome            : string;
    FIsCalculaIR     : boolean;
    FIsCalculaINSS   : boolean;

    function GetReducaoIR: extended;
  public

    procedure UpdateRecord(aDelete: boolean = FALSE);
    procedure GetRecord;

    class procedure GetDependentes(aCPF: string; var aReference);

    property Id              : cardinal read FId              write FId;
    property Funcionario_CPF : string   read FFuncionario_CPF write FFuncionario_CPF;
    property Nome            : string   read FNome            write FNome;
    property IsCalculaIR     : boolean  read FIsCalculaIR     write FIsCalculaIR;
    property IsCalculaINSS   : boolean  read FIsCalculaINSS   write FIsCalculaINSS;
    property ReducaoIR       : extended read GetReducaoIR;
  end;

  TDependentes = TDictionary<integer, TDependente>;

implementation

uses System.Math;

const
  C_IR  : extended = 100;

function TDependente.GetReducaoIR: extended;
begin

  result := ifthen(IsCalculaIR, C_IR, 0);
end;

procedure TDependente.UpdateRecord(aDelete: boolean = FALSE);
var

  lDBCDependente : TDBCDependente;
  lRow           : TParameter;
begin

  lRow := TParameter.Create;

  lRow.Add('id', Id);
  lRow.Add('funcionario_cpf', Funcionario_CPF);
  lRow.Add('nome', Nome);
  lRow.Add('iscalculair', ifthen(IsCalculaIR, 1, 0));
  lRow.Add('iscalculainss', ifthen(IsCalculaINSS, 1, 0));

  lDBCDependente        := TDBCDependente.Create;
  lDBCDependente.Delete := aDelete;
  lDBCDependente.Row    := lRow;
end;

procedure TDependente.GetRecord;
var

  lDBCDependente: TDBCDependente;
begin

  lDBCDependente    := TDBCDependente.Create;
  lDBCDependente.Id := Id;

  if lDBCDependente.Loaded then
  begin

    Funcionario_CPF := lDBCDependente.Row.Items['funcionario_cpf'];
    Nome            := lDBCDependente.Row.Items['nome'];
    IsCalculaIR     := lDBCDependente.Row.Items['iscalculair'] = 1;
    IsCalculaINSS   := lDBCDependente.Row.Items['iscalculainss'] = 1;
  end;
end;

class procedure TDependente.GetDependentes(aCPF: string; var aReference);
var

  lDBCDependente: TDBCDependente;
  lDependente   : TDependente;
  I             : integer;
begin

  TDependentes(aReference).Clear;
  lDBCDependente                 := TDBCDependente.Create;
  lDBCDependente.Funcionario_CPF := aCPF;
  lDependente                    := TDependente.Create;

  if lDBCDependente.Loaded then
    for I := 0 to lDBCDependente.RowSet.Count - 1 do
    begin

      lDependente.Id              := lDBCDependente.RowSet.Items[I].Items['id'];
      lDependente.Funcionario_CPF := lDBCDependente.RowSet.Items[I].Items['funcionario_cpf'];
      lDependente.Nome            := lDBCDependente.RowSet.Items[I].Items['nome'];
      lDependente.IsCalculaIR     := lDBCDependente.RowSet.Items[I].Items['iscalculair'] = 1;
      lDependente.IsCalculaINSS   := lDBCDependente.RowSet.Items[I].Items['iscalculainss'] = 1;

      TDependentes(aReference).Add(I, lDependente);
    end;
end;


end.
