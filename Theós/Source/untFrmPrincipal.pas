unit untFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    mmnPrincipal: TMainMenu;
    mnuExercicios: TMenuItem;
    mniExercicio1: TMenuItem;
    mniExercicio2: TMenuItem;
    procedure mniExercicio1Click(Sender: TObject);
    procedure mniExercicio2Click(Sender: TObject);
  private
    { Private declarations }
    procedure prExibirFormulario(var pFormulario: TForm; const pClasseFormulario: TFormClass);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

{ TfrmPrincipal }

uses
  untFrmExercicio1, untFrmExercicio2;

procedure TfrmPrincipal.mniExercicio1Click(Sender: TObject);
begin
  prExibirFormulario(TForm(FrmExercicio1), TFrmExercicio1);
end;

procedure TfrmPrincipal.mniExercicio2Click(Sender: TObject);
begin
  prExibirFormulario(TForm(FrmExercicio2), TFrmExercicio2);
end;

procedure TfrmPrincipal.prExibirFormulario(var pFormulario: TForm; const pClasseFormulario: TFormClass);
var
  vContador: Integer;
begin
  if not Assigned(pClasseFormulario) then
    Exit;

  for vContador := 0 to Application.MainForm.MDIChildCount - 1 do
  begin
    if Application.MainForm.MDIChildren[vContador] = pFormulario then
    begin
      if pFormulario.WindowState = wsMinimized then
        pFormulario.WindowState := wsNormal
      else
        TForm(pFormulario).BringToFront;

      Exit;
    end;
  end;

  Application.CreateForm(pClasseFormulario, pFormulario);
end;

end.
