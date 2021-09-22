unit uInicio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.Menus,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  Tfrm_Inicio = class(TForm)
    MainMenu1: TMainMenu;
    Exerccios1: TMenuItem;
    Exerccio1Calculadora1: TMenuItem;
    Exerccio2Entidadesdeclculo1: TMenuItem;
    imgTheos: TImage;
    procedure Exerccio1Calculadora1Click(Sender: TObject);
    procedure Exerccio2Entidadesdeclculo1Click(Sender: TObject);
  end;

var
  frm_Inicio: Tfrm_Inicio;

implementation

{$R *.dfm}

uses uCadastroFuncionario, uCalculadora;

procedure Tfrm_Inicio.Exerccio1Calculadora1Click(Sender: TObject);
begin
  uCalculadora.ChamarTela;
end;

procedure Tfrm_Inicio.Exerccio2Entidadesdeclculo1Click(Sender: TObject);
begin
  uCadastroFuncionario.ChamarTela;
end;

end.
