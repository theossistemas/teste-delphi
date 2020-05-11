unit ConnectionDM;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, FMTBcd, Provider, DBClient, TConnect, Controls, Windows, Forms;

type
  TConnectionDMF = class(TDataModule)
    SQLConn: TSQLConnection;
    Localconnection: TLocalConnection;
    qrAux: TSQLQuery;
    dspAux: TDataSetProvider;
    dsAux: TDataSource;
    sqlMonitor: TSQLMonitor;
    qrFuncionario: TSQLQuery;
    qrFuncionarioID_FUNCIONARIO: TIntegerField;
    qrFuncionarioNOME: TStringField;
    qrFuncionarioCPF: TStringField;
    qrFuncionarioVL_SALARIO: TFloatField;
    dspFuncionario: TDataSetProvider;
    dsFuncionario: TDataSource;
    qrDependente: TSQLQuery;
    qrDependenteID_DEPENDENTE: TIntegerField;
    qrDependenteNOME: TStringField;
    qrDependenteBO_CALCULA_IR: TStringField;
    qrDependenteBO_CALCULA_INSS: TStringField;
    qrDependenteID_FUNCIONARIO: TIntegerField;
    procedure SQLConnBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConnectionDMF: TConnectionDMF;

implementation

uses
  unitFuncoes;

{$R *.dfm}

procedure TConnectionDMF.SQLConnBeforeConnect(Sender: TObject);
var
  vDiretorio, vRaiz, vBanco, vPassword :string;
begin
  inherited;
  vDiretorio := ExtractFilePath(Application.Exename);
  if LeIni('Banco','TipoConexao')= '1' then
    vRaiz := LeIni('Banco','DatabaseRemoto')
  else
    vRaiz := LeIni('Banco','DatabaseLocal');

  if vRaiz = '' then
    vRaiz := 'localhost/3050:'+vDiretorio+'DATABASE.FDB';

  vBanco    := LeIni('Banco', 'User');
  vPassword := DesCriptografa(LeIni('Banco', 'Password'),1);

  if vRaiz <> '' then
  begin
    SQLConn.Params.CommaText :=
      'DriverName=Interbase'
      +',Database='+vRaiz
      +',RoleName=RoleName'
      +',User_Name='+vBanco
      +',Password='+vPassword
      +',ServerCharSet='
      +',SQLDialect=3'
      +',BlobSize=-1'
      +',CommitRetain=False'
      +',WaitOnLocks=True'
      +',ErrorResourceFile='
      +',LocaleCode=0000'
      +',Interbase TransIsolation=ReadCommited'
      +',Trim Char=False';
  end;
end;

end.
