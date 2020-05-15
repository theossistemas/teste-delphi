unit uDependente;

interface

type
  TDependente = class
  private
    FNome: string;
    FIsCalcularIR: boolean;
    FIsCalcularINSS: boolean;

    function GetIsCalcularINSS: boolean;
    function GetIsCalcularIR: boolean;
    function GetNome: string;
    procedure SetCalcularINSS(const Value: boolean);
    procedure SetCalcularIR(const Value: boolean);
    procedure SetNome(const Value: string);

  public
    property Nome: string read GetNome write SetNome;
    property IsCalcularIR: boolean read GetIsCalcularIR write SetCalcularIR;
    property IsCalcularINSS: boolean read GetIsCalcularINSS write SetCalcularINSS;
  end;

implementation

{ TDependente }

function TDependente.GetIsCalcularINSS: boolean;
begin
  result := FIsCalcularINSS;
end;

function TDependente.GetIsCalcularIR: boolean;
begin
  result := FIsCalcularIR;
end;

function TDependente.GetNome: string;
begin
  result := FNome;
end;

procedure TDependente.SetCalcularINSS(const Value: boolean);
begin
  FIsCalcularINSS := Value;
end;

procedure TDependente.SetCalcularIR(const Value: boolean);
begin
  FIsCalcularIR := Value;
end;

procedure TDependente.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
