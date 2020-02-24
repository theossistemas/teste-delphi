unit DataModulo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Tdm = class(TDataModule)
    FDConnection: TFDConnection;
    dsFuncionario: TDataSource;
    qryFuncionario: TFDQuery;
    dsDependente: TDataSource;
    qryDependente: TFDQuery;
    qryFuncionarioCPF: TWideStringField;
    qryFuncionarioID: TIntegerField;
    qryDependenteNOME: TWideStringField;
    qryDependenteCPF: TWideStringField;
    qryDependenteCALCULA_IR: TWideStringField;
    qryDependenteCALCULA_INSS: TWideStringField;
    qryFuncionarioNOME: TWideStringField;
    qryDependenteID: TIntegerField;
    qryDependenteID_FUNCIONARIO: TIntegerField;
    qryFuncionarioSALARIO: TFloatField;
    procedure qryDependenteNewRecord(DataSet: TDataSet);
    procedure qryFuncionarioAfterScroll(DataSet: TDataSet);
    procedure qryFuncionarioAfterRefresh(DataSet: TDataSet);
    procedure qryFuncionarioAfterDelete(DataSet: TDataSet);
    procedure qryFuncionarioNewRecord(DataSet: TDataSet);
    procedure qryFuncionarioAfterEdit(DataSet: TDataSet);
    procedure qryDependenteAfterEdit(DataSet: TDataSet);
  end;

var
  dm: Tdm;

implementation

uses
  uCadastroFuncionario, uCadastroDependente, Vcl.Dialogs;

{$R *.dfm}

procedure Tdm.qryDependenteAfterEdit(DataSet: TDataSet);
begin
  //Não deixar atualizar o CPF, pois o mesmo é único por pessoa
  frm_CadastroDependente.edtCPF.ReadOnly := dsDependente.State in [dsEdit];
end;

procedure Tdm.qryDependenteNewRecord(DataSet: TDataSet);
begin
  qryDependenteCALCULA_IR.AsString   := 'N';
  qryDependenteCALCULA_INSS.AsString := 'N';

  frm_CadastroDependente.edtCPF.ReadOnly := not (dsDependente.State in [dsInsert]);
end;

procedure Tdm.qryFuncionarioAfterDelete(DataSet: TDataSet);
begin
  frm_CadastroFuncionario.ListarDependentes;
  frm_CadastroFuncionario.CalcularImpostos;
end;

procedure Tdm.qryFuncionarioAfterEdit(DataSet: TDataSet);
begin
  //Não deixar atualizar o CPF, pois o mesmo é único por pessoa
  frm_CadastroFuncionario.edtCPF.ReadOnly := dsFuncionario.State in [dsEdit];
end;

procedure Tdm.qryFuncionarioAfterRefresh(DataSet: TDataSet);
begin
  frm_CadastroFuncionario.ListarDependentes;
  frm_CadastroFuncionario.CalcularImpostos;
end;

procedure Tdm.qryFuncionarioAfterScroll(DataSet: TDataSet);
begin
  if dsFuncionario.State in [dsBrowse] then
  begin
    frm_CadastroFuncionario.ListarDependentes;
    frm_CadastroFuncionario.CalcularImpostos;
  end;
end;

procedure Tdm.qryFuncionarioNewRecord(DataSet: TDataSet);
begin
  frm_CadastroFuncionario.mmo.Clear;
  frm_CadastroFuncionario.edtCalculoIR.Clear;
  frm_CadastroFuncionario.edtCalculoINSS.Clear;

  frm_CadastroFuncionario.edtCPF.ReadOnly := not (dsFuncionario.State in [dsInsert]);
end;

end.
