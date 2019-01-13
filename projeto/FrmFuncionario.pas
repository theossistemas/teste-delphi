unit FrmFuncionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, BFuncionario, CFuncionario, CDependente,
  Math, DB, DBClient;

type
  TFFuncionario = class(TForm)
    edtNome: TEdit;
    Label1: TLabel;
    edtCpf: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtSalario: TEdit;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    edtNomeDependente: TEdit;
    cbCalculaIR: TCheckBox;
    cbCalculaINSS: TCheckBox;
    btnGravar: TButton;
    DBGrid1: TDBGrid;
    btnIncluirDependente: TButton;
    dsDependente: TDataSource;
    cdsDependente: TClientDataSet;
    cdsDependentenome: TStringField;
    cdsDependenteiscalculair: TBooleanField;
    cdsDependenteiscalculainss: TBooleanField;
    procedure btnIncluirDependenteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
    oFuncionario: TFuncionario;
    oDependente: TDependente;
    oBFuncionario: TBFuncionario;
  public
    { Public declarations }
    procedure limpar;
  end;

var
  FFuncionario: TFFuncionario;

implementation

{$R *.dfm}

procedure TFFuncionario.FormCreate(Sender: TObject);
begin
  oFuncionario := TFuncionario.Create;
  oDependente := TDependente.Create;
  oBFuncionario := TBFuncionario.Create;
  cdsDependente.CreateDataSet;
end;

procedure TFFuncionario.btnIncluirDependenteClick(Sender: TObject);
begin
  if not Assigned(oFuncionario) then
    oFuncionario := TFuncionario.Create;

  oDependente := TDependente.Create;
  oDependente.setNome(edtNomeDependente.Text);
  oDependente.setIsCalculaIR(cbCalculaIR.Checked);
  oDependente.setIsCalculaINSS(cbCalculaINSS.Checked);

  oFuncionario.adicionar(oDependente);

  cdsDependente.Insert;
  cdsDependente.FieldByName('nome').AsString := edtNomeDependente.Text;
  cdsDependente.FieldByName('iscalculair').AsBoolean := cbCalculaIR.Checked;
  cdsDependente.FieldByName('iscalculainss').AsBoolean := cbCalculaINSS.Checked;
  cdsDependente.Post;
end;

procedure TFFuncionario.btnGravarClick(Sender: TObject);
begin
  if not Assigned(oFuncionario) then
    oFuncionario := TFuncionario.Create;

  oFuncionario.setNome(edtNome.Text);
  oFuncionario.setCpf(edtCpf.Text);
  oFuncionario.setSalario(StrToFloatDef(edtSalario.Text, ZeroValue));

  oBFuncionario.inserir(oFuncionario);

  limpar;
end;

procedure TFFuncionario.limpar;
begin
  edtNome.Text := EmptyStr;
  edtCpf.Text := EmptyStr;
  edtSalario.Text := EmptyStr;
  edtNomeDependente.Text := EmptyStr;
  cbCalculaIR.Checked := false;
  cbCalculaINSS.Checked := false;

  if Assigned(oFuncionario) then
    FreeAndNil(oFuncionario);
  if Assigned(oDependente) then
    FreeAndNil(oDependente);

  cdsDependente.EmptyDataSet;
end;

procedure TFFuncionario.FormDestroy(Sender: TObject);
begin
  if Assigned(oFuncionario) then
    FreeAndNil(oFuncionario);
  if Assigned(oDependente) then
    FreeAndNil(oDependente);
  FreeAndNil(oBFuncionario);
end;

end.
