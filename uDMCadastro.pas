unit uDMCadastro;

interface

uses
  SysUtils, Classes, DBXpress, FMTBcd, DB, SqlExpr;

type
  TDMCadastro = class(TDataModule)
    ConexaoBanco: TSQLConnection;
    GeneratorFuncionario: TSQLDataSet;
    GeneratorDependente: TSQLDataSet;
  private
    FTransaction: TTransactionDesc;
  public
    procedure IniciarTransaction;
    procedure RealizarCommit;
  end;

var
  DMCadastro: TDMCadastro;

implementation

{$R *.dfm}

{ TDMCadastro }

procedure TDMCadastro.IniciarTransaction;
begin
  ConexaoBanco.StartTransaction(FTransaction);
end;

procedure TDMCadastro.RealizarCommit;
begin
  try
    ConexaoBanco.Commit(FTransaction);
  except
    ConexaoBanco.Rollback(FTransaction);
  end;
end;

end.
