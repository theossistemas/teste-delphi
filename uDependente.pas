unit uDependente;

interface

uses System.SysUtils, System.Classes, System.Generics.Collections;

type

  TDependente = class
  private

    FNome         : string;
    FIsCalculaIR  : boolean;
    FIsCalculaINSS: boolean;

    function GetReducaoIR: extended;
  public

    property Nome         : string   read FNome          write FNome;
    property IsCalculaIR  : boolean  read FIsCalculaIR   write FIsCalculaIR;
    property IsCalculaINSS: boolean  read FIsCalculaINSS write FIsCalculaINSS;
    property ReducaoIR    : extended read GetReducaoIR;
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

end.
