unit uDependente;

interface

type
  TStatus = (stNovo, stExcluir, stNone);

  TDependente = class
  private
    FID: Integer;
    FNome: String;
    FIsCalculaIR: Boolean;
    FIsCalculaINSS: Boolean;
    FStatus: TStatus;
    procedure SetNome(const Value: String);
  protected
    { protected declarations }
  public
    { public declarations }
  published
    property ID: Integer read FID write FID;
    property Nome: String read FNome write SetNome;
    property IsCalculaIR: Boolean read FIsCalculaIR write FIsCalculaIR;
    property IsCalculaINSS: Boolean read FIsCalculaINSS write FIsCalculaINSS;
    property Status: TStatus read FStatus write FStatus;
  end;

implementation

uses
  System.SysUtils;

{ TDependente }

procedure TDependente.SetNome(const Value: String);
begin
  if Length(Trim(Value)) > 200 then begin
    raise EArgumentException.Create('O nome do dependente deve ter no máximo 200 caracteres.');
  end;

  FNome := Trim(Value);
end;

end.
