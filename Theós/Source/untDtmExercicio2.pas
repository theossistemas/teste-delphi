unit untDtmExercicio2;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.IBBase, FireDAC.Comp.UI;

type
  TdtmExercicio2 = class(TDataModule)
    fdCnx: TFDConnection;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qryCADFUNCIONARIO: TFDQuery;
    dtsCADFUNCIONARIO: TDataSource;
    qryCADFUNCIONARIOID_FUNCIONARIO: TIntegerField;
    qryCADFUNCIONARIONOME: TStringField;
    qryCADFUNCIONARIOCPF: TStringField;
    qryCADFUNCIONARIOSALARIO: TFMTBCDField;
    qryCADDEPENDENTE: TFDQuery;
    qryCADDEPENDENTEID_DEPENDENTE: TIntegerField;
    qryCADDEPENDENTENOME: TStringField;
    qryCADDEPENDENTEISCALCULAIR: TSmallintField;
    qryCADDEPENDENTEISCALCULAINSS: TSmallintField;
    qryCADDEPENDENTEID_FUNCIONARIO: TIntegerField;
    dtsCADDEPENDENTE: TDataSource;
    qryAuxiliar: TFDQuery;
    procedure DataModuleDestroy(Sender: TObject);
    procedure GetFlag(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure SetFlag(Sender: TField; const Text: String);
  private
    { Private declarations }
    procedure prPrepararConexao(const pDiretorioSistema: String);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; const pDiretorioSistema: String); reintroduce;
  end;

var
  dtmExercicio2: TdtmExercicio2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdtmExercicio2 }

constructor TdtmExercicio2.Create(AOwner: TComponent; const pDiretorioSistema: String);
begin
  inherited Create(AOwner);

  prPrepararConexao(pDiretorioSistema);

  qryCADFUNCIONARIO.Active := True;
  qryCADDEPENDENTE.Active := True;
end;

procedure TdtmExercicio2.DataModuleDestroy(Sender: TObject);
begin
  fdCnx.Close;
end;

procedure TdtmExercicio2.prPrepararConexao(const pDiretorioSistema: String);
const
  cNOMEBANCODADOS = 'EXERCICIO2_ENTIDADES_CALCULO.FDB';
var
  vCaminhoBanco: String;
begin
  vCaminhoBanco := StringReplace(pDiretorioSistema, 'Output', 'Database', [rfReplaceAll]) + cNOMEBANCODADOS;

  fdCnx.Close;
  fdCnx.Params.Add('Database=' + vCaminhoBanco);

  fdCnx.Connected := True;
end;

procedure TdtmExercicio2.GetFlag(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  Text := 'NÃO';

  if Sender.AsInteger = 1 then
    Text := 'SIM';
end;

procedure TdtmExercicio2.SetFlag(Sender: TField; const Text: String);
begin
  TField(Sender).Value := 0;

  if Text = 'SIM' then
    TField(Sender).Value := 1;
end;

end.
