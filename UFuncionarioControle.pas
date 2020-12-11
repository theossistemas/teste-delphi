unit UFuncionarioControle;

interface

uses uControle, classes, SysUtils, Dialogs;

type

TFuncionarioControle = class
private
  { private declarations }
  FNome      : String;
  FCpf       : String;
  FSalario   : Double;
  FValorInss : Double;
  FValorIr   : Double;
// classe de persistencia
  FControle : TControle;
protected
  { protected declarations }
public
  { public declarations }
  Auxsql : String;
  ListaCliente: TStrings;

  constructor Create(pConexaoControle : TControle);
  destructor destroy; override;
//
  property Cpf       : String read FCpf        write FCpf;
  property Nome      : String read FNome       write FNome;
  property Salario   : Double read FSalario    write FSalario;
  property ValorInss : Double read FValorInss  write FValorInss;
  property ValorIr   : Double read FValorIr    write FValorIr;

  function InsereFuncionario   : Boolean;
  function PesquisaFuncionario(const cpf: string) : Boolean;
  function CalculaInss(const salario, percentual :double) : double;
  function CalculaIR(const salario, qtddependente, vlrpordependente, percentual: double) : double;

published
  { published declarations }
end;

TDependenteControle = class
private
  { private declarations }
  FCpf           : String;
  FNome          : String;
  FIsCalculoInss : Boolean;
  FIsCalculoIr   : Boolean;
// classe de persistencia
  FControle : TControle;
protected
  { protected declarations }

public
  { private declarations }
  Auxsql : String;

  constructor Create;
  destructor destroy; override;

  property Cpf           : String  read FCpf           write FCpf;
  property Nome          : String  read FNome          write FNome;
  property IsCalculoInss : Boolean read FIsCalculoInss write FIsCalculoInss;
  property IsCalculoIr   : Boolean read FIsCalculoIr   write FIsCalculoIr;

  function InsereDependente : Boolean;

end;

implementation

function TFuncionarioControle.CalculaInss(const salario, percentual : double): double;
begin
// a base é o salario do funcionário
 result := ( salario * (percentual / 100) ) ;
end;


function TFuncionarioControle.CalculaIR(const salario, qtddependente, vlrpordependente,
  percentual: double): double;
begin
  Result := (salario - ( vlrpordependente * qtddependente )) * (percentual / 100);
end;

constructor TFuncionarioControle.Create(pConexaoControle : TControle);
begin
  FControle := pConexaoControle;
end;

destructor TFuncionarioControle.destroy;
begin
  inherited;
end;

function TFuncionarioControle.InsereFuncionario: Boolean;
begin

  if Trim(self.Cpf) = '' then begin
    Result := False;
    exit;
  end;

  if Trim(self.Nome) = '' then begin
    Result := False;
    exit;
  end;

  auxsql := ' insert into tblfuncionario ';
  auxsql := auxsql + ' ( cpf, nome, salario, valorinss, valorir ) ';
  auxsql := auxsql + ' values ';
  auxsql := auxsql + ' ( :cpf, :nome, :salario, :baseinss, :valorir ) ';

  FControle.SqqGeral.Close;
  FControle.SqqGeral.CommandText := auxsql;
  FControle.SqqGeral.Params[0].AsString := Self.Cpf;
  FControle.SqqGeral.Params[1].AsString := Self.Nome;
  FControle.SqqGeral.Params[2].AsFloat  := Self.Salario;
  FControle.SqqGeral.Params[3].AsFloat  := Self.ValorInss;
  FControle.SqqGeral.Params[4].AsFloat  := Self.ValorIr;

  try
    FControle.SqqGeral.ExecSQL();
    Result := True;
  except
    Result := False;
  end;

end;

function TFuncionarioControle.PesquisaFuncionario(const cpf: string) : Boolean;
begin

  auxsql := ' select * from tblfuncionario where cpf = :cpf ';
  FControle.SqqGeral.Close;
  FControle.SqqGeral.CommandText := auxsql;
  FControle.SqqGeral.Params[0].AsString := Cpf;
  try
    FControle.SqqGeral.Open;
    Result := True;
  except
    Result := False;
  end;

end;

constructor TDependenteControle.Create();
begin
end;

destructor TDependenteControle.destroy;
begin
  inherited;
end;


function TDependenteControle.InsereDependente: Boolean;
begin

  if Trim(self.Cpf) = '' then begin
    Result := False;
    exit;
  end;

  if Trim(self.Nome) = '' then begin
    Result := False;
    exit;
  end;

  auxsql := ' insert into tbldependente ';
  auxsql := auxsql + ' ( cpf, nome, iscalculoinss, iscalculoir ) ';
  auxsql := auxsql + ' values ';
  auxsql := auxsql + ' ( :cpf, :nome, :salario, :valorinss, :valorir ) ';

  FControle.SqqGeral.Close;
  FControle.SqqGeral.CommandText := auxsql;
  FControle.SqqGeral.Params[0].AsString  := Self.Cpf;
  FControle.SqqGeral.Params[1].AsString  := Self.Nome;
  FControle.SqqGeral.Params[2].AsBoolean := Self.IsCalculoInss;
  FControle.SqqGeral.Params[3].AsBoolean := Self.IsCalculoIr;

  try
    FControle.SqqGeral.ExecSQL();
    Result := True;
  except
    Result := False;
  end;


end;

end.
