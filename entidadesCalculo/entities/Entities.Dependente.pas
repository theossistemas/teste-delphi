unit Entities.Dependente;

interface

uses
  System.Generics.Collections;

type
  TDependente = class
  private
    FIsCalculaINSS: Boolean;
    FNome: string;
    FIsCalculaIR: Boolean;
    FFuncionarioID: Int64;
    FDependenteID: Int64;
    procedure SetIsCalculaINSS(const Value: Boolean);
    procedure SetIsCalculaIR(const Value: Boolean);
    procedure SetNome(const Value: string);
    procedure SetDependenteID(const Value: Int64);
    procedure SetFuncionarioID(const Value: Int64);
  public
    constructor Create();
    destructor Destroy(); override;
  published
    property DependenteID   : Int64 read FDependenteID write SetDependenteID;
    property FuncionarioID  : Int64 read FFuncionarioID write SetFuncionarioID;
    property Nome : string read FNome write SetNome;
    property IsCalculaIR : Boolean read FIsCalculaIR write SetIsCalculaIR;
    property IsCalculaINSS : Boolean read FIsCalculaINSS write SetIsCalculaINSS;
  end;

  TListDependente = class(TObjectList<TDependente>)
    function Add() : TDependente; overload;
    function QtdeIsCalculaIR() : Integer;
    function QtdeIsCalculaINSS() : Integer;
  end;


implementation

{ TDependente }

constructor TDependente.Create;
begin

end;

destructor TDependente.Destroy;
begin

  inherited;
end;

procedure TDependente.SetDependenteID(const Value: Int64);
begin
  FDependenteID := Value;
end;

procedure TDependente.SetFuncionarioID(const Value: Int64);
begin
  FFuncionarioID := Value;
end;

procedure TDependente.SetIsCalculaINSS(const Value: Boolean);
begin
  FIsCalculaINSS := Value;
end;

procedure TDependente.SetIsCalculaIR(const Value: Boolean);
begin
  FIsCalculaIR := Value;
end;

procedure TDependente.SetNome(const Value: string);
begin
  FNome := Value;
end;

{ TListDependente }

function TListDependente.Add: TDependente;
begin
  result := TDependente.Create();
  Self.Add(Result);
end;

function TListDependente.QtdeIsCalculaINSS: Integer;
var
  dep: TDependente;
begin
  Result := 0;
  for dep in Self do
  begin
    if dep.IsCalculaINSS then
      Inc(Result);
  end;
end;

function TListDependente.QtdeIsCalculaIR: Integer;
var
  dep: TDependente;
begin
  Result := 0;
  for dep in Self do
  begin
    if dep.IsCalculaIR then
      Inc(Result);
  end;

end;

end.
