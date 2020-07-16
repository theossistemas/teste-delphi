unit untFrmExercicio2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, untDtmExercicio2;

type
  TFrmExercicio2 = class(TFrmBase)
    pnlMestre: TPanel;
    lblFuncionario: TLabel;
    pnlDetalhe: TPanel;
    lblDependentes: TLabel;
    dbgDependentes: TDBGrid;
    dbgFuncionario: TDBGrid;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmExercicio2: TFrmExercicio2;

implementation

{$R *.dfm}

procedure TFrmExercicio2.FormCreate(Sender: TObject);
begin
  inherited;
  dtmExercicio2 := TdtmExercicio2.Create(Self, ExtractFilePath(Application.ExeName));
end;

end.
