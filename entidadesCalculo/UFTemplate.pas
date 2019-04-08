unit UFTemplate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient;

type
  TfrmTemplate = class(TForm)
    panHeader: TPanel;
    panBody: TPanel;
    lblTitle: TLabel;
    panBottom: TPanel;
    actionList: TActionList;
    lblBack: TLabel;
    actBack: TAction;
    procedure lblBackClick(Sender: TObject);
    procedure actBackExecute(Sender: TObject);
  private
    { Private declarations }
  protected

  public
    { Public declarations }
  end;

var
  frmTemplate: TfrmTemplate;

implementation

{$R *.dfm}

procedure TfrmTemplate.actBackExecute(Sender: TObject);
begin
  self.Close();
end;

procedure TfrmTemplate.lblBackClick(Sender: TObject);
begin
  actBack.Execute();
end;



end.
