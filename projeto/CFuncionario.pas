unit CFuncionario;

interface

uses Classes;

type
  TFuncionario = class
    { Private declarations }
    private
      FNome: String;
      FCpf: String;
      FSalario: Currency;
      FInss: Currency;
      FIr: Currency;
    { Public declarations }
    public
      procedure setNome(const valor: String);
      procedure setCpf(const valor: String);
      procedure setSalario(const valor: Currency);
      procedure setInss(const valor: Currency);
      procedure setIr(const valor: Currency);

      function getNome: String;
      function getCpf: String;
      function getSalario: Currency;
      function getInss: Currency;
      function getIr: Currency;
  end;

implementation

{ TFuncionario }

function TFuncionario.getNome: String;
begin
  result := self.FNome;
end;

function TFuncionario.getCpf: String;
begin
  result := self.FCpf;
end;

function TFuncionario.getSalario: Currency;
begin
  result := self.FSalario;
end;

function TFuncionario.getInss: Currency;
begin
  result := self.FInss;
end;

function TFuncionario.getIr: Currency;
begin
  result := self.FIr;
end;

procedure TFuncionario.setNome(const valor: String);
begin
  self.FNome := valor;
end;

procedure TFuncionario.setCpf(const valor: String);
begin
  self.FCpf := valor;
end;

procedure TFuncionario.setSalario(const valor: Currency);
begin
  self.FSalario := valor;
end;

procedure TFuncionario.setInss(const valor: Currency);
begin
  self.FInss := valor;
end;

procedure TFuncionario.setIr(const valor: Currency);
begin
  self.FIr := valor;
end;

end.
