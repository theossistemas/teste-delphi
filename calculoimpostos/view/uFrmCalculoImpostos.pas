unit uFrmCalculoImpostos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, System.Generics.Collections, uFuncionario,
  uFuncionarioController;

type
  TfrmCalculoImpostos = class(TForm)
    pnlPrincipal: TPanel;
    pnlRodape: TPanel;
    cbxFuncionario: TComboBox;
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
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbxFuncionarioChange(Sender: TObject);
  private
    { Private declarations }
    oListaFuncionarios: TObjectList<TFuncionario>;
    procedure CarregarFuncionariosCadastrados;
    procedure CarregarSalario;
  public
    { Public declarations }
  end;

var
  frmCalculoImpostos: TfrmCalculoImpostos;

implementation

{$R *.dfm}

{ TfrmCalculoImpostos }

procedure TfrmCalculoImpostos.CarregarFuncionariosCadastrados;
var
  oFuncionarioController: TFuncionarioController;
  iIndice: Integer;
begin
  oFuncionarioController := TFuncionarioController.Create;
  try
    oFuncionarioController.CarregarFuncionariosFiltroNome('', oListaFuncionarios);
    cbxFuncionario.Items.Clear;
    cbxFuncionario.Items.Add('<Nenhum>');
    for iIndice := 0 to oListaFuncionarios.Count - 1 do begin
      cbxFuncionario.Items.Add(oListaFuncionarios[iIndice].Nome);
    end;
    cbxFuncionario.ItemIndex := 0;
  finally
    FreeAndNil(oFuncionarioController);
  end;
end;

procedure TfrmCalculoImpostos.CarregarSalario;
var
  iIndice: Integer;
begin
 if cbxFuncionario.ItemIndex = 0 then begin
     edtSalario.Text := '0,00';
 end else begin
  iIndice := cbxFuncionario.ItemIndex - 1;
  edtSalario.Text := FloatToStrF(oListaFuncionarios[iIndice].Salario,
    ffNumber, 11, 2);
 end;
end;

procedure TfrmCalculoImpostos.cbxFuncionarioChange(Sender: TObject);
begin
  CarregarSalario();
end;

procedure TfrmCalculoImpostos.FormCreate(Sender: TObject);
begin
  oListaFuncionarios := TObjectList<TFuncionario>.Create;
  CarregarFuncionariosCadastrados();
end;

procedure TfrmCalculoImpostos.FormDestroy(Sender: TObject);
begin
  FreeAndNil(oListaFuncionarios);
end;

end.
