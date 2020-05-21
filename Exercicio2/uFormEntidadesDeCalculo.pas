unit uFormEntidadesDeCalculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDataModulo, Data.DB, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, uCalculo, uFuncionario, uDependente,
  FireDAC.Comp.Client, Generics.Collections, uControle;

type
  TfrmEntidadesDeCalculo = class(TForm)
    dbgFuncionario: TDBGrid;
    dbgDependente: TDBGrid;
    btnNovoFuncionario: TButton;
    btnExcluirFuncionario: TButton;
    btnCancelarFuncionario: TButton;
    btnSalvarFuncionario: TButton;
    btnNovoDependente: TButton;
    btnExcluirDependente: TButton;
    btnCancelarDependente: TButton;
    btnSalvarDependente: TButton;
    lblCodigoFuncionario: TLabel;
    lblNomeFuncionario: TLabel;
    lblCpfFuncionario: TLabel;
    lblSalarioFuncionario: TLabel;
    lblCodigoDependente: TLabel;
    lblNomeDependente: TLabel;
    lblINSS: TLabel;
    lblIR: TLabel;
    dbeCodigoFuncionario: TDBEdit;
    dbeNomeFuncionario: TDBEdit;
    dbeCPF: TDBEdit;
    dbeSalario: TDBEdit;
    dbeCodigoDependente: TDBEdit;
    dbeNomeDependente: TDBEdit;
    dbcCalculaINSS: TDBComboBox;
    dbcCalculaIR: TDBComboBox;
    btnINSS: TButton;
    btnIR: TButton;
    procedure btnINSSClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnIRClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbeSalarioKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarFuncionarioClick(Sender: TObject);
    procedure btnCancelarDependenteClick(Sender: TObject);
    procedure btnNovoFuncionarioClick(Sender: TObject);
    procedure btnNovoDependenteClick(Sender: TObject);
    procedure btnExcluirFuncionarioClick(Sender: TObject);
    procedure btnExcluirDependenteClick(Sender: TObject);
    procedure btnSalvarDependenteClick(Sender: TObject);
    procedure btnSalvarFuncionarioClick(Sender: TObject);
  private
    { Private declarations }
    FoControle: TControle;
    FoCalculo: TCalculo;
    FtbFuncionario: TFDQuery;
    FtbDependente: TFDQuery;
    procedure AlimentarDadosFuncionario(const poFuncionario: TFuncionario);
    procedure AlimentarDadosDependentes(const poFuncionario: TFuncionario);
  public
    { Public declarations }
  end;

var
  frmEntidadesDeCalculo: TfrmEntidadesDeCalculo;

const
  REAL = 'R$ %.2f';

implementation

{$R *.dfm}

procedure TfrmEntidadesDeCalculo.AlimentarDadosDependentes(
  const poFuncionario: TFuncionario);
var
  lsDependentes: TObjectList<TDependente>;
  oDependente: TDependente;
begin
  lsDependentes := TObjectList<TDependente>.Create;
  FtbDependente.First;
  while not FtbDependente.Eof do
  begin
    oDependente := TDependente.Create;
    oDependente.codigo := FtbDependente.FieldByName('ID').AsInteger;
    oDependente.nome := FtbDependente.FieldByName('NOME').AsString;
    oDependente.calculaINSS := FtbDependente.FieldByName('IS_CALCULA_INSS').AsString;
    oDependente.calculaIR := FtbDependente.FieldByName('IS_CALCULA_IR').AsString;
    lsDependentes.Add(oDependente);
    FtbDependente.Next;
  end;
  FtbDependente.First;

  poFuncionario.dependentes := lsDependentes;
end;

procedure TfrmEntidadesDeCalculo.AlimentarDadosFuncionario(
  const poFuncionario: TFuncionario);
begin
  poFuncionario.codigo := FtbFuncionario.FieldByName('ID').AsInteger;
  poFuncionario.nome := FtbFuncionario.FieldByName('NOME').AsString;
  poFuncionario.cpf := FtbFuncionario.FieldByName('CPF').AsString;
  poFuncionario.salario := FtbFuncionario.FieldByName('SALARIO').AsFloat;
  AlimentarDadosDependentes(poFuncionario);
end;

procedure TfrmEntidadesDeCalculo.btnCancelarDependenteClick(Sender: TObject);
begin
  FtbDependente.Cancel;
end;

procedure TfrmEntidadesDeCalculo.btnCancelarFuncionarioClick(Sender: TObject);
begin
  FtbFuncionario.Cancel;
end;

procedure TfrmEntidadesDeCalculo.btnExcluirDependenteClick(Sender: TObject);
begin
  if FtbDependente.RecordCount = 0 then
    exit;
  FoControle.ExcluirDependente(FtbDependente.FieldByName('ID').AsInteger);
  FtbDependente.Refresh;
end;

procedure TfrmEntidadesDeCalculo.btnExcluirFuncionarioClick(Sender: TObject);
begin
  if FtbFuncionario.RecordCount = 0 then
    exit;
  FoControle.ExcluirFuncionario(FtbFuncionario.FieldByName('ID').AsInteger);
  FtbFuncionario.Refresh;
end;

procedure TfrmEntidadesDeCalculo.btnINSSClick(Sender: TObject);
var
  dResultado: Double;
  oFuncionario: TFuncionario;
  oDependente: TDependente;
begin
  oFuncionario := TFuncionario.Create;
  if FtbFuncionario.RecordCount = 0 then
  begin
    Showmessage('Não existe funcionário cadastrado!');
    exit;
  end;

  AlimentarDadosFuncionario(oFuncionario);

  dResultado := FoCalculo.CalcularINSS(oFuncionario);
  Showmessage(Format('INSS =  '+REAL,[dResultado]));
end;

procedure TfrmEntidadesDeCalculo.btnIRClick(Sender: TObject);
var
  dResultado: Double;
  oFuncionario: TFuncionario;
  oDependente: TDependente;
begin
  oFuncionario := TFuncionario.Create;
  if FtbFuncionario.RecordCount = 0 then
  begin
    Showmessage('Não existe funcionário cadastrado!');
    exit;
  end;

  AlimentarDadosFuncionario(oFuncionario);

  dResultado := FoCalculo.CalcularIR(oFuncionario);
  Showmessage(Format('IR =  '+REAL,[dResultado]));
end;

procedure TfrmEntidadesDeCalculo.btnNovoDependenteClick(Sender: TObject);
begin
  FtbDependente.Insert;
  FtbDependente.FieldByName('ID').AsInteger := FoControle.GerarIdDependente;
end;

procedure TfrmEntidadesDeCalculo.btnNovoFuncionarioClick(Sender: TObject);
begin
  FtbFuncionario.Insert;
  FtbFuncionario.FieldByName('ID').AsInteger := FoControle.GerarIdFuncionario;
end;

procedure TfrmEntidadesDeCalculo.btnSalvarDependenteClick(Sender: TObject);
var
  oDependente: TDependente;
begin
  oDependente := TDependente.Create;
  oDependente.codigo := FtbDependente.FieldByName('ID').AsInteger;
  oDependente.nome := FtbDependente.FieldByName('NOME').AsString;
  oDependente.calculaINSS := FtbDependente.FieldByName('IS_CALCULA_INSS').AsString;
  oDependente.calculaIR := FtbDependente.FieldByName('IS_CALCULA_IR').AsString;
  FtbDependente.Cancel;
  FoControle.SalvarDependente(FtbFuncionario.FieldByName('ID').AsInteger, oDependente);
  FtbDependente.Refresh;
end;

procedure TfrmEntidadesDeCalculo.btnSalvarFuncionarioClick(Sender: TObject);
var
  oFuncionario: TFuncionario;
begin
  oFuncionario := TFuncionario.Create;
  oFuncionario.codigo := FtbFuncionario.FieldByName('ID').AsInteger;
  oFuncionario.nome := FtbFuncionario.FieldByName('NOME').AsString;
  oFuncionario.cpf := FtbFuncionario.FieldByName('CPF').AsString;
  oFuncionario.salario := FtbFuncionario.FieldByName('SALARIO').AsFloat;
  FtbFuncionario.Cancel;
  FoControle.SalvarFuncionario(oFuncionario);
  FtbFuncionario.Refresh;
end;

procedure TfrmEntidadesDeCalculo.dbeSalarioKeyPress(Sender: TObject;
  var Key: Char);
var
  bPossuiVirgula: boolean;
begin
  bPossuiVirgula := Pos(',',dbeSalario.Text) > 0;
  if not (Key in [#8, '0'..'9', ',']) then
    Key := #0;
  if (Key = ',') and bPossuiVirgula then
    Key := #0;
end;

procedure TfrmEntidadesDeCalculo.FormCreate(Sender: TObject);
begin
  FoCalculo := TCalculo.Create;
  FoControle := TControle.Create;
end;

procedure TfrmEntidadesDeCalculo.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FoCalculo);
  FreeAndNil(FoControle);
end;

procedure TfrmEntidadesDeCalculo.FormShow(Sender: TObject);
begin
  FtbFuncionario := DataModule1.Tb_funcionarioTable;
  FtbDependente := DataModule1.Tb_dependenteTable;
end;

end.
