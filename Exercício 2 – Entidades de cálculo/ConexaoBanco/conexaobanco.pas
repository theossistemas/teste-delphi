unit conexaobanco;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.Comp.Client, Data.DB, FireDAC.Phys.IBBase,
  Datasnap.DBClient, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDataModule1 = class(TDataModule)
    con1: TFDConnection;
    fdcmnd1: TFDCommand;
    fdphysfbdrvrlnk1: TFDPhysFBDriverLink;
    fdtrnsctn1: TFDTransaction;
    fdtbl1: TFDTable;
    fdqrySQL: TFDQuery;
    intgrfldfdtbl1FUN_ID: TIntegerField;
    strngfldfdtbl1FUN_NOME: TStringField;
    fltfldfdtbl1FUM_SALARIO: TFloatField;
    strngfldfdtbl1FUN_CPF: TStringField;
    fltfldfdtbl1FUN_INSS: TFloatField;
    fltfldfdtbl1FUN_IR: TFloatField;
    intgrfldfdtbl1max: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
