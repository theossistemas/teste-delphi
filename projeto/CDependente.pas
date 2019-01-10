unit CDependente;

interface

uses Classes;

type
  TDependente = class
    { Private declarations }
    private
      FIdFuncionario: Integer;
      FNome: String;
      FIsCalculaIR: Boolean;
      FIsCalculaINSS: Boolean;
    { Public declarations }
    public
      procedure setIdFuncionario(const valor: Integer);
      procedure setNome(const valor: String);
      procedure setIsCalculaIR(const valor: Boolean);
      procedure setIsCalculaINSS(const valor: Boolean);

      function getIdFuncionario: Integer;
      function getNome: String;
      function getIsCalculaIR: Boolean;
      function getIsCalculaINSS: Boolean;
  end;

implementation

{ TDependente }

function TDependente.getIdFuncionario: Integer;
begin
  result := self.FIdFuncionario;
end;

function TDependente.getNome: String;
begin
  result := self.FNome;
end;

function TDependente.getIsCalculaIR: Boolean;
begin
  result := self.FIsCalculaIR;
end;

function TDependente.getIsCalculaINSS: Boolean;
begin
  result := self.FIsCalculaINSS;
end;

procedure TDependente.setNome(const valor: String);
begin
  self.FNome := valor;
end;

procedure TDependente.setIsCalculaIR(const valor: Boolean);
begin
  self.FIsCalculaIR := valor;
end;

procedure TDependente.setIsCalculaINSS(const valor: Boolean);
begin
  self.FIsCalculaINSS := valor;
end;

procedure TDependente.setIdFuncionario(const valor: Integer);
begin
  self.FIdFuncionario := valor;
end;

end.
