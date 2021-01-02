unit Theos.View.Funcionario.Ficha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask;

type
  TViewFuncionarioFicha = class(TForm)
    Panel1: TPanel;
    BtnSalvar: TButton;
    BtnCancelar: TButton;
    EdtCodigo: TEdit;
    Label1: TLabel;
    EdtNome: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdtCPF: TMaskEdit;
    EdtSalario: TEdit;
    EdtValorINSS: TEdit;
    Label5: TLabel;
    EdtValorIR: TEdit;
    Label6: TLabel;
    BtnListaDependentes: TButton;
    EdtBaseIR: TEdit;
    Label7: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
