unit UDependente;

interface

Uses
  System.SysUtils, System.Classes;

Type
  TDependente = class
  private
    FID : Integer;
    FNome  : String;
    FIsCalculaIR : Boolean;
    FIsCalculaINSS : Boolean;
    FCPF : String;
    procedure SetNome(const Value: String);
    function GetNome: String;
    procedure SetIsCalculaIR(const Value: Boolean);
    function GetIsCalculaIR: Boolean;
    procedure SetIsCalculaINSS(const Value: Boolean);
    function GetIsCalculaINSS: Boolean;
    procedure SetID(const Value: Integer);
    function GetCPF: String;
    procedure SetCPF(const Value: String);
  protected
    constructor Create;
  published
    property ID: Integer read FID write SetID;
    property Nome : String read GetNome write SetNome;
    property IsCalculaIR : Boolean read GetIsCalculaIR write SetIsCalculaIR;
    property IsCalculaINSS : Boolean read GetIsCalculaINSS write SetIsCalculaINSS;
    property CPF : String read GetCPF write SetCPF;
  end;


implementation

{ TDependente }

constructor TDependente.Create;
begin
  inherited Create;
  FID            := 0;
  FNome          := '';
  FIsCalculaIR   := False;
  FIsCalculaINSS := False;
  FCPF           := '';
end;

function TDependente.GetCPF: String;
begin
  Result := FCPF;
end;

function TDependente.GetIsCalculaINSS: Boolean;
begin
  result := FIsCalculaINSS;
end;

function TDependente.GetIsCalculaIR: Boolean;
begin
  result := FIsCalculaIR;
end;

function TDependente.GetNome: String;
begin
  result := FNome;
end;

procedure TDependente.SetCPF(const Value: String);
begin
  FCPF := Value;
end;

procedure TDependente.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TDependente.SetIsCalculaINSS(const Value: Boolean);
begin
  FIsCalculaINSS := Value;
end;

procedure TDependente.SetIsCalculaIR(const Value: Boolean);
begin
  FIsCalculaIR := Value;
end;

procedure TDependente.SetNome(const Value: String);
begin
  if trim(Value) = '' then
    raise Exception.Create('O "Nome do Dependente" deve ser preenchido')
  else FNome := Value;
end;

end.
