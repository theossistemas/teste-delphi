unit uDependente;

interface

type
  TDependente = class
    private
      FnCodigo: Integer;
      FsNome: String;
      FsCalculaINSS: String;
      FsCalculaIR: String;
      function getCodigo: Integer;
      function getNome: String;
      function getCalculaINSS: String;
      function getCalculaIR: String;
      procedure setCodigo(Value : Integer);
      procedure setNome(Value: String);
      procedure setCalculaINSS(Value: String);
      procedure setCalculaIR(Value: String);
    public
      property codigo: Integer read getCodigo write setCodigo;
      property nome: String read getNome write setNome;
      property calculaINSS: String read getCalculaINSS write setCalculaINSS;
      property calculaIR: String read getCalculaIR write setCalculaIR;
  end;

implementation

{ TDependente }

function TDependente.getCalculaINSS: String;
begin
  Result := FsCalculaINSS;
end;

function TDependente.getCalculaIR: String;
begin
  Result := FsCalculaIR;
end;

function TDependente.getCodigo: Integer;
begin
  Result := FnCodigo;
end;

function TDependente.getNome: String;
begin
  Result := FsNome;
end;

procedure TDependente.setCalculaINSS(Value: String);
begin
  FsCalculaINSS := Value;
end;

procedure TDependente.setCalculaIR(Value: String);
begin
  FsCalculaIR := Value;
end;

procedure TDependente.setCodigo(Value: Integer);
begin
  FnCodigo := Value;
end;

procedure TDependente.setNome(Value: String);
begin
  FsNome := Value;
end;

end.
