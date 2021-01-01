unit Theos.View.Calculadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TViewCalculadora = class(TForm)
    LbVisorResultado: TLabel;
    LbValor: TLabel;
    BtnImpostoA: TSpeedButton;
    BtnImpostoB: TSpeedButton;
    BtnImpostoC: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
