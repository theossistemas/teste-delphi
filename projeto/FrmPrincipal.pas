unit FrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TFPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Exerccios1: TMenuItem;
    Exerccio11: TMenuItem;
    Exerccio21: TMenuItem;
    procedure Exerccio11Click(Sender: TObject);
    procedure Exerccio21Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

uses FrmCalculadora, FrmFuncionario;

{$R *.dfm}

procedure TFPrincipal.Exerccio11Click(Sender: TObject);
begin                                                      
  FCalculadora := TFCalculadora.Create(Self);
  FCalculadora.ShowModal;
  FreeAndNil(FCalculadora);
end;

procedure TFPrincipal.Exerccio21Click(Sender: TObject);
begin
  FFuncionario := TFFuncionario.Create(Self);
  FFuncionario.ShowModal;
  FreeAndNil(FFuncionario);
end;

end.
