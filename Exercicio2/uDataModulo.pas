unit uDataModulo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDataModule1 = class(TDataModule)
    FirebirdconnectionConnection: TFDConnection;
    Tb_funcionarioTable: TFDQuery;
    Tb_dependenteTable: TFDQuery;
    Tb_dependenteTableID: TLargeintField;
    Tb_dependenteTableNOME: TWideStringField;
    Tb_dependenteTableID_FUNCIONARIO: TLargeintField;
    Tb_dependenteTableIS_CALCULA_INSS: TWideStringField;
    Tb_dependenteTableIS_CALCULA_IR: TWideStringField;
    Tb_funcionarioTableID: TLargeintField;
    Tb_funcionarioTableNOME: TWideStringField;
    Tb_funcionarioTableCPF: TWideStringField;
    Tb_funcionarioTableSALARIO: TFMTBCDField;
    dsFuncionario: TDataSource;
    dsDependente: TDataSource;
    FDQuery: TFDQuery;
    procedure PegaFlagFormatada(Sender: TField;
      var Text: string; DisplayText: Boolean);
      procedure AtribuirValorFlag(Sender: TField; const Text: string);
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

procedure TDataModule1.AtribuirValorFlag(Sender: TField; const Text: string);
begin
  if Text = 'SIM' then
    TField(Sender).Value := 'S'
  else
    TField(Sender).Value := 'N';
end;

procedure TDataModule1.PegaFlagFormatada(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.AsString = 'S' then
    Text := 'SIM'
  else
    Text := 'NÃO';
end;

end.
