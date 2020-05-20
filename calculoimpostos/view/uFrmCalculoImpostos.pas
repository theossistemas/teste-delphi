unit uFrmCalculoImpostos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmCalculoImpostos = class(TForm)
    pnlPrincipal: TPanel;
    pnlRodape: TPanel;
    cbxFunacionario: TComboBox;
    edtSalario: TEdit;
    edtPercentualIR: TEdit;
    edtPercentualINSS: TEdit;
    edtDctINSS: TEdit;
    edtValorIR: TEdit;
    edtValorINSS: TEdit;
    lblFuncionario: TLabel;
    lblSalario: TLabel;
    lblPercIR: TLabel;
    lblPercINSS: TLabel;
    lblDescINSS: TLabel;
    lblVlrIR: TLabel;
    lblVlrINSS: TLabel;
    btnCalcular: TButton;
    btnLimpar: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalculoImpostos: TfrmCalculoImpostos;

implementation

{$R *.dfm}

end.
