unit untDependente;

interface

type
  TDependente = class
  private
    FId_Dependente: Integer;
    FNome: String;
    FIsCalcularIR: Integer;
    FIsCalcularINSS: Integer;

    function GetId_Dependente: Integer;
    function GetNome: String;
    function GetIsCalcularIR: Integer;
    function GetIsCalcularINSS: Integer;

    procedure SetId_Dependente(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetIsCalcularIR(const Value: Integer);
    procedure SetIsCalcularINSS(const Value: Integer);

  public
    property Id_Dependente: Integer read GetId_Dependente write SetId_Dependente;
    property Nome: String read GetNome write SetNome;
    property IsCalcularIR: Integer read GetIsCalcularIR write SetIsCalcularIR;
    property IsCalcularINSS: Integer read GetIsCalcularINSS write SetIsCalcularINSS;
  end;

implementation

{ TDependente }

function TDependente.GetId_Dependente: Integer;
begin
  Result := FId_Dependente;
end;

function TDependente.GetIsCalcularINSS: Integer;
begin
  Result := FIsCalcularINSS;
end;

function TDependente.GetIsCalcularIR: Integer;
begin
  Result := FIsCalcularIR;
end;

function TDependente.GetNome: String;
begin
  Result := FNome;
end;

procedure TDependente.SetId_Dependente(const Value: Integer);
begin
  FId_Dependente := Value;
end;

procedure TDependente.SetIsCalcularINSS(const Value: Integer);
begin
  FIsCalcularINSS := Value;
end;

procedure TDependente.SetIsCalcularIR(const Value: Integer);
begin
  FIsCalcularIR := Value;
end;

procedure TDependente.SetNome(const Value: String);
begin
  FNome := Value;
end;

end.
