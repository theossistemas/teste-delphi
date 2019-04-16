unit untConexao;

interface

uses
  SysUtils, Classes, DBXpress, FMTBcd, DB, SqlExpr, DBClient, SimpleDS;

type
  TudtConexao = class(TDataModule)
    Conexao: TSQLConnection;
    dtsFuncionario: TDataSource;
    dtsDependentes: TDataSource;
    sdtFuncionario: TSimpleDataSet;
    sdtFuncionarioFUNCOD: TIntegerField;
    sdtFuncionarioNOME: TStringField;
    sdtFuncionarioCPF: TStringField;
    sdtFuncionarioSALARIO: TFMTBCDField;
    sdtDependentes: TSimpleDataSet;
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  udtConexao: TudtConexao;

implementation

{$R *.dfm}

end.
