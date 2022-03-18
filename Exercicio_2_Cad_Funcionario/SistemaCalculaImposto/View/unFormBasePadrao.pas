unit unFormBasePadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unFormBase;

type
  TfrmFormBasePadrao = class(TFormBase)
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure PintaEditOnEnter(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmFormBasePadrao: TfrmFormBasePadrao;

implementation

uses
  Vcl.StdCtrls;

{$R *.dfm}

procedure TfrmFormBasePadrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmFormBasePadrao.FormCreate(Sender: TObject);
var
  nI: Integer;
begin
  For nI := 0 to ComponentCount - 1 do
    if (Components[nI] is TEdit) then
      (Components[nI] as TEdit).OnEnter := PintaEditOnEnter;

end;

procedure TfrmFormBasePadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmFormBasePadrao.PintaEditOnEnter(Sender: TObject);
var
  nI: Integer;
begin
  For nI := 0 to ComponentCount - 1 do
  begin
    if (Components[nI] is TEdit) then
    begin
      if TEdit(Components[nI]).Focused then
        TEdit(Components[nI]).Color := clYellow
      else
        TEdit(Components[nI]).Color := clWhite;
    end;
  end;
end;

end.
