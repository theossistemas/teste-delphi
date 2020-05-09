unit uDMCadastro;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, FMTBcd, DBClient, Provider;

type
  TDMCadastro = class(TDataModule)
    Connection: TSQLConnection;
    SQLFuncionario: TSQLDataSet;
    SQLFuncionarioCODIGO: TIntegerField;
    SQLFuncionarioNOME: TStringField;
    SQLFuncionarioCPF: TStringField;
    SQLDependente: TSQLDataSet;
    IntegerField3: TIntegerField;
    StringField3: TStringField;
    SQLFuncionarioSALARIO: TFloatField;
    SQLDependenteFUNCIONARIO: TIntegerField;
    SQLDependenteISCALCULAIR: TStringField;
    SQLDependenteISCALCULAINSS: TStringField;
    GeneratorFuncionario: TSQLDataSet;
    GeneratorDependente: TSQLDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCadastro: TDMCadastro;

implementation

{$R *.dfm}

end.

