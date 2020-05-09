unit uTelaDependentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, DB, DBClient, Provider;

type
  TFrm_Dependentes = class(TForm)
    DBEdit_Codigo: TDBEdit;
    Label1: TLabel;
    DBEdit_Funcionario: TDBEdit;
    Label2: TLabel;
    DBEdit_Nome: TDBEdit;
    Label3: TLabel;
    DBcbx_IsCalculaIR: TDBCheckBox;
    DBcbx_IsCalculaINSS: TDBCheckBox;
    DBNavigator1: TDBNavigator;
    cdsDependente: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    cdsDependenteFUNCIONARIO: TIntegerField;
    cdsDependenteISCALCULAIR: TStringField;
    cdsDependenteISCALCULAINSS: TStringField;
    dsDependente: TDataSource;
    dspDependente: TDataSetProvider;
    procedure cdsDependenteAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure cdsDependenteAfterPost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure cdsDependenteNewRecord(DataSet: TDataSet);
  private
    nCodigoFuncionario: Integer;
  public
    procedure SetCodigoFuncionario(const pnCodigoFuncionario: integer);
  end;

var
  Frm_Dependentes: TFrm_Dependentes;

implementation

uses
  uDMCadastro;

{$R *.dfm}

{ TFrm_Dependentes }              


procedure TFrm_Dependentes.cdsDependenteAfterInsert(DataSet: TDataSet);
begin
  cdsDependente.FieldByName('FUNCIONARIO').AsInteger := nCodigoFuncionario;
  cdsDependente.FieldByName('ISCALCULAIR').AsString := 'N';
  cdsDependente.FieldByName('ISCALCULAINSS').AsString := 'N';
end;

procedure TFrm_Dependentes.FormCreate(Sender: TObject);
begin
  cdsDependente.Active := True;
end;

procedure TFrm_Dependentes.SetCodigoFuncionario(const pnCodigoFuncionario: integer);
begin
  nCodigoFuncionario := pnCodigoFuncionario;
end;

procedure TFrm_Dependentes.cdsDependenteAfterPost(DataSet: TDataSet);
begin
  cdsDependente.ApplyUpdates(0);
end;

procedure TFrm_Dependentes.FormShow(Sender: TObject);
begin
  cdsDependente.Filter := Format('FUNCIONARIO = %d', [nCodigoFuncionario]);
  cdsDependente.Filtered := true;
end;

procedure TFrm_Dependentes.cdsDependenteNewRecord(DataSet: TDataSet);
begin
  DMCadastro.GeneratorDependente.Open;
  cdsDependente.FieldByName('CODIGO').AsInteger := DMCadastro.GeneratorDependente.FieldByName('GEN_ID').AsInteger;
  DMCadastro.GeneratorDependente.Close;
end;

end.
