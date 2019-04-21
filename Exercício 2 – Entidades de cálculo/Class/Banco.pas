unit Banco;

interface
uses
conexaobanco;
type
  TSQL = class
  private
  public
  procedure insertbanco(Nome, CPF: string; Salario,INSS,IR: Double);
  function Getsalario(Nome: string): Double;
  function getUltimoid: Integer;


  end;

implementation

{ TSQL }

function TSQL.Getsalario(Nome: string):Double;
begin
DataModule1.fdqrySQL.close;
DataModule1.fdqrySQL.sql.clear;
DataModule1.fdqrySQL.sql.add('SELECT FUM_SALARIO FROM FUNCIONARIO');
DataModule1.fdqrySQL.open;
Result:=DataModule1.fdqrySQL.FieldByName('FUM_SALARIO').value;
end;

function TSQL.getUltimoid: Integer;
var
resultadoSQL : Integer;
begin
DataModule1.fdqrySQL.close;
DataModule1.fdqrySQL.sql.clear;
DataModule1.fdqrySQL.sql.add('select max(FUN_ID) from funcionario');
DataModule1.fdqrySQL.open;
resultadoSQL:= DataModule1.fdqrySQL.FieldByName('max').value;
Result := resultadoSQL +1;
end;

procedure TSQL.insertbanco(Nome, CPF: string; Salario,INSS,IR: Double);
var
SQL: string;
id : Integer;
begin
id :=getUltimoid;
DataModule1.fdqrySQL.sql.clear;
DataModule1.fdqrySQL.SQL.Text :=  'INSERT INTO Funcionario '+
      'VALUES( :fun_id , :fun_nome , :fun_cpf , :fum_salario , :fun_inss , :fun_ir)';
DataModule1.fdqrySQL.ParamByName('fun_id').AsInteger := id ;
DataModule1.fdqrySQL.ParamByName('fun_nome').AsString := Nome;
DataModule1.fdqrySQL.ParamByName('fun_cpf').AsString := CPF;
DataModule1.fdqrySQL.ParamByName('fum_salario').AsFloat := Salario;
DataModule1.fdqrySQL.ParamByName('fun_inss').AsFloat := INSS;
DataModule1.fdqrySQL.ParamByName('fun_ir').AsFloat := IR;
DataModule1.fdqrySQL.ExecSQL();
end;

end.
