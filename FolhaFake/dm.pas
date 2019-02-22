unit dm;

interface

uses
  System.SysUtils, System.Classes, IBX.IBConnectionBroker, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDm1 = class(TDataModule)
    FDConexao: TFDConnection;
    FDQ_Cad_Fun: TFDQuery;
    FDQ_Cad_FunID: TIntegerField;
    FDQ_Cad_FunNOME: TStringField;
    FDQ_Cad_FunCPF: TStringField;
    FDQ_Cad_FunSALARIO: TBCDField;
    FDQ_Cad_FunIR: TBCDField;
    FDQ_Cad_FunINSS: TBCDField;
    FDUp_Cad_Fun: TFDUpdateSQL;
    FDTran_Fun: TFDTransaction;
    FDQ_Cad_Dep: TFDQuery;
    FDTran_Dep: TFDTransaction;
    FDUp_Cad_Dep: TFDUpdateSQL;
    FDQ_Cad_DepID: TFDAutoIncField;
    FDQ_Cad_DepID_FUN: TIntegerField;
    FDQ_Cad_DepNOME: TStringField;
    FDQ_Cad_DepISCALCULAINSS: TBooleanField;
    FDQ_Cad_DepISCALCULAIR: TBooleanField;
    DSFun: TDataSource;
    DSDep: TDataSource;
    FDQuery: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dm1: TDm1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
