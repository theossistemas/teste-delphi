unit UDMView;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, UDMServer;

type
  TdmView = class(TDataModule)
    qryListFuncionarios: TFDQuery;
    qryListDependentes: TFDQuery;
    qryListFuncionariosFUNCIONARIO_ID: TLargeintField;
    qryListFuncionariosCPF: TStringField;
    qryListFuncionariosNOME: TStringField;
    qryListFuncionariosSALARIO: TBCDField;
    qryListDependentesDEPENDENTE_ID: TLargeintField;
    qryListDependentesFUNCIONARIO_ID: TLargeintField;
    qryListDependentesNOME: TStringField;
    qryListDependentesIS_CALCULA_IR: TSmallintField;
    qryListDependentesIS_CALCULA_INSS: TSmallintField;
    dsListFuncionarios: TDataSource;
    procedure qryListFuncionariosAfterOpen(DataSet: TDataSet);
    procedure qryListFuncionariosAfterClose(DataSet: TDataSet);
    procedure qryListDependentesIS_CALCULA_IRGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }

    function SetListFuncionarios() : Boolean;
  end;

var
  dmView: TdmView;

implementation

uses Common.Constantes;


{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmView }

procedure TdmView.qryListDependentesIS_CALCULA_IRGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.AsInteger= _INT_TRUE then
    Text := 'Sim'
  else
    Text := 'Não';
end;

procedure TdmView.qryListFuncionariosAfterClose(DataSet: TDataSet);
begin
  qryListDependentes.Close();
end;

procedure TdmView.qryListFuncionariosAfterOpen(DataSet: TDataSet);
begin
  qryListDependentes.Open();
end;

function TdmView.SetListFuncionarios: Boolean;
begin
  qryListFuncionarios.Close();
  qryListFuncionarios.Open();

  result := qryListFuncionarios.Active and
           (not qryListFuncionarios.IsEmpty)
end;

end.
