unit Theos.View.Dependente.Ficha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TViewDependenteFicha = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    BtnSalvar: TButton;
    BtnCancelar: TButton;
    EdtCodigo: TEdit;
    EdtNome: TEdit;
    CbCalculaIR: TCheckBox;
    CbCalculaINSS: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
