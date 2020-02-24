unit uIniciar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons;

type
  Tfrm_Iniciar = class(TForm)
    btnExercicio1: TSpeedButton;
    btnExercicio2: TSpeedButton;
    procedure btnExercicio2Click(Sender: TObject);
    procedure btnExercicio1Click(Sender: TObject);
  end;

var
  frm_Iniciar: Tfrm_Iniciar;

implementation

{$R *.dfm}

uses uCadastroFuncionario, uCalculadora;

procedure Tfrm_Iniciar.btnExercicio1Click(Sender: TObject);
begin
  uCalculadora.AbrirTela;
end;

procedure Tfrm_Iniciar.btnExercicio2Click(Sender: TObject);
begin
  uCadastroFuncionario.AbrirTela;
end;

end.
