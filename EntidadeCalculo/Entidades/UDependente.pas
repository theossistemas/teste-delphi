unit UDependente;

interface

type
  TDependente = class
  private
    FNome: String;
    FIsCalculaIR: Boolean;
    FIsCalculaINSS: Boolean;
    FId: Integer;
    FIdFuncionario: Integer;
    function getNome: String;
    procedure SetNome(const Value: String);
    function getIsCalculaIR: Boolean;
    procedure setIsCalculaIR(const Value: Boolean);
    function getIsCalculaINSS: Boolean;
    procedure setIsCalculaINSS(const Value: Boolean);
    function GetId: Integer;
    procedure setId(const Value: Integer);
    function getIdFuncionario: Integer;
    procedure setIdFuncionario(const Value: Integer);

  public
    constructor Create(Id:Integer; idFuncionario: integer; nome: String; CalculaIR, CalculaINSS: Boolean);
    property Id: Integer read GetId write setId;
    property IdFuncionario: Integer read getIdFuncionario write setIdFuncionario;
    property Nome: String read getNome write SetNome;
    property IsCalculaIR: Boolean read getIsCalculaIR write setIsCalculaIR;
    property isCalculaINSS: Boolean read getIsCalculaINSS
      write setIsCalculaINSS;
  end;

implementation

{ TDependente }

constructor TDependente.Create(id: integer; idFuncionario: integer; nome: String; CalculaIR, CalculaINSS: Boolean);
begin
  Fid := Id;
  fidfuncionario := idFuncionario;
  FNome := nome;
  FIsCalculaIR := CalculaIR;
  FIsCalculaINSS := CalculaINSS;

end;

function TDependente.GetId: Integer;
begin
  result := FId;
end;

function TDependente.getIdFuncionario: Integer;
begin
  result := FIdFuncionario;
end;

function TDependente.getIsCalculaINSS: Boolean;
begin
  result := FIsCalculaINSS;
end;

function TDependente.getIsCalculaIR: Boolean;
begin
  result := FIsCalculaIR;
end;

function TDependente.getNome: String;
begin
  result := FNome;
end;

procedure TDependente.setId(const Value: Integer);
begin
  FId := value;
end;

procedure TDependente.setIdFuncionario(const Value: Integer);
begin
  FIdFuncionario := Value;
end;

procedure TDependente.setIsCalculaINSS(const Value: Boolean);
begin
  FIsCalculaINSS := value;
end;

procedure TDependente.setIsCalculaIR(const Value: Boolean);
begin
  FIsCalculaIR := Value;
end;

procedure TDependente.SetNome(const Value: String);
begin
  FNome := Value;
end;

end.
