unit CFuncionario;

interface

uses Classes, SysUtils, CDependente;

type
  TFuncionario = class
    { Private declarations }
    private
      FNome: String;
      FCpf: String;
      FSalario: Currency;
      FInss: Currency;
      FIr: Currency;
      FListaDependente: TList;
    { Public declarations }
    public
      constructor Create;
      Destructor Destroy; override;
      procedure adicionar(oDependente: TDependente);
      function getLista: TList;

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

procedure TFuncionario.adicionar(oDependente: TDependente);
begin
  self.FListaDependente.Add(oDependente);
end;

constructor TFuncionario.Create;
begin
  self.FListaDependente := TList.Create;
end;

destructor TFuncionario.Destroy;
begin
  FreeAndNil(self.FListaDependente);
  inherited;
end;

function TFuncionario.getLista: TList;
begin
  result := self.FListaDependente;
end;

end.
