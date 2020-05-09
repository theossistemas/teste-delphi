unit uTela;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, DB, DBClient, Provider;

type
  TFrm_EntidadesCalculo = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit_Codigo: TDBEdit;
    DBEdit_Salario: TDBEdit;
    DBEdit_Nome: TDBEdit;
    DBEdit_CPF: TDBEdit;
    DBNavigator1: TDBNavigator;
    btDependentes: TButton;
    gbImpostos: TGroupBox;
    btCalcular: TButton;
    edtIR: TEdit;
    edtINSS: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    dspDependente: TDataSetProvider;
    cdsCalculo: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    cdsCalculoFUNCIONARIO: TIntegerField;
    cdsCalculoISCALCULAIR: TStringField;
    cdsCalculoISCALCULAINSS: TStringField;
    dspFuncionario: TDataSetProvider;
    cdsFuncionario: TClientDataSet;
    cdsFuncionarioCODIGO: TIntegerField;
    cdsFuncionarioNOME: TStringField;
    cdsFuncionarioCPF: TStringField;
    cdsFuncionarioSALARIO: TFloatField;
    dsFuncioario: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btDependentesClick(Sender: TObject);
    procedure btCalcularClick(Sender: TObject);
    procedure cdsFuncionarioAfterScroll(DataSet: TDataSet);
    procedure cdsFuncionarioAfterPost(DataSet: TDataSet);
    procedure cdsFuncionarioAfterCancel(DataSet: TDataSet);
    procedure cdsFuncionarioAfterEdit(DataSet: TDataSet);
    procedure cdsFuncionarioAfterInsert(DataSet: TDataSet);
    procedure cdsFuncionarioNewRecord(DataSet: TDataSet);
    procedure DBEdit_CPFKeyPress(Sender: TObject; var Key: Char);
  private
    procedure FiltrarDadosDependentes;
    procedure HabilitarBotoes(const bHabilitar: boolean);
  end;

var
  Frm_EntidadesCalculo: TFrm_EntidadesCalculo;

implementation

uses
  uDMCadastro, uTelaDependentes, uobjCalculaImpostos;

{$R *.dfm}

procedure TFrm_EntidadesCalculo.FormShow(Sender: TObject);
begin
  cdsFuncionario.Active := True;

  if cdsFuncionario.RecordCount = 0 then
    HabilitarBotoes(False);
end;

procedure TFrm_EntidadesCalculo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if cdsFuncionario.State in [dsEdit, dsInsert] then
    cdsFuncionario.Cancel;

  cdsFuncionario.Active := False;
end;

procedure TFrm_EntidadesCalculo.btDependentesClick(Sender: TObject);
var
  oFormDependente: TFrm_Dependentes;
begin
  oFormDependente := TFrm_Dependentes.Create(Self);
  try                                              
    oFormDependente.SetCodigoFuncionario(cdsFuncionario.FieldByName('CODIGO').AsInteger);
    oFormDependente.ShowModal;
  finally
    oFormDependente.Free;
  end;
end;

procedure TFrm_EntidadesCalculo.btCalcularClick(Sender: TObject);
var
  oCalculaImpostos: TCalculaImpostos;
begin
  oCalculaImpostos := TCalculaImpostos.Create;
  try
    cdsCalculo.Active := True;
    FiltrarDadosDependentes;
    oCalculaImpostos.SetSalario(cdsFuncionario.FieldByName('SALARIO').AsFloat);
    oCalculaImpostos.SetCdsDependentes(cdsCalculo);
    oCalculaImpostos.Calcular;

    edtIR.Text := FloatToStr(oCalculaImpostos.ImpostoIR);
    edtINSS.Text := FloatToStr(oCalculaImpostos.ImpostoINSS);
  finally
    oCalculaImpostos.Free;
  end;                    
end;

procedure TFrm_EntidadesCalculo.FiltrarDadosDependentes;
begin
  cdsCalculo.Active := True;
  cdsCalculo.Filter := Format('FUNCIONARIO = %d', [cdsFuncionario.FieldByName('CODIGO').AsInteger]);
  cdsCalculo.Filtered := True;
end;

procedure TFrm_EntidadesCalculo.cdsFuncionarioAfterScroll(
  DataSet: TDataSet);
begin
  edtIR.Clear;
  edtINSS.Clear;
end;

procedure TFrm_EntidadesCalculo.HabilitarBotoes(const bHabilitar: boolean);
begin
  btDependentes.Enabled := bHabilitar;
  btCalcular.Enabled := bHabilitar;
end;

procedure TFrm_EntidadesCalculo.cdsFuncionarioAfterPost(DataSet: TDataSet);
begin
  cdsFuncionario.ApplyUpdates(0);
  HabilitarBotoes(True);
end;

procedure TFrm_EntidadesCalculo.cdsFuncionarioAfterCancel(
  DataSet: TDataSet);
begin
  HabilitarBotoes(True);
end;

procedure TFrm_EntidadesCalculo.cdsFuncionarioAfterEdit(DataSet: TDataSet);
begin
  HabilitarBotoes(False);
end;

procedure TFrm_EntidadesCalculo.cdsFuncionarioAfterInsert(
  DataSet: TDataSet);
begin
  HabilitarBotoes(False);
end;

procedure TFrm_EntidadesCalculo.cdsFuncionarioNewRecord(DataSet: TDataSet);
begin
  DMCadastro.GeneratorFuncionario.Open;
  cdsFuncionario.FieldByName('CODIGO').AsInteger := DMCadastro.GeneratorFuncionario.FieldByName('GEN_ID').AsInteger;
  DMCadastro.GeneratorFuncionario.Close;
end;

procedure TFrm_EntidadesCalculo.DBEdit_CPFKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in [#8, '0'..'9']) then begin
    Key := #0;
  end;
end;

end.
