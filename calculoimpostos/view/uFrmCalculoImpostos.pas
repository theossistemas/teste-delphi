unit uFrmCalculoImpostos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, System.Generics.Collections, uFuncionario,
  uFuncionarioController, uFuncoes, System.StrUtils;

type
  TfrmCalculoImpostos = class(TForm)
    pnlPrincipal: TPanel;
    pnlRodape: TPanel;
    cbxFuncionario: TComboBox;
    edtSalario: TEdit;
    edtPercentualIR: TEdit;
    edtPercentualINSS: TEdit;
    edtDctIR: TEdit;
    edtValorIR: TEdit;
    edtValorINSS: TEdit;
    lblFuncionario: TLabel;
    lblSalario: TLabel;
    lblPercIR: TLabel;
    lblPercINSS: TLabel;
    lblDescIR: TLabel;
    lblVlrIR: TLabel;
    lblVlrINSS: TLabel;
    btnCalcular: TButton;
    btnLimpar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbxFuncionarioChange(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure edtPercentualIRChange(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    oListaFuncionarios: TObjectList<TFuncionario>;
    oFuncoes: TFuncoes;
    bFormatando: Boolean;
    procedure CarregarFuncionariosCadastrados;
    procedure CarregarSalario;
    procedure LimparTela;
    procedure CalcularImpostos;
  public
    { Public declarations }
  end;

var
  frmCalculoImpostos: TfrmCalculoImpostos;

implementation

{$R *.dfm}

{ TfrmCalculoImpostos }

procedure TfrmCalculoImpostos.btnCalcularClick(Sender: TObject);
begin
  CalcularImpostos();
end;

procedure TfrmCalculoImpostos.btnLimparClick(Sender: TObject);
begin
  LimparTela();
end;

procedure TfrmCalculoImpostos.CalcularImpostos;
var
  oFuncionario: TFuncionario;
  oFuncionarioController: TFuncionarioController;
  iIndice: Integer;
  dPercIR, dDctIR, dPercINSS: Double;
begin
  oFuncionario := TFuncionario.Create;
  oFuncionarioController := TFuncionarioController.Create;
  iIndice := cbxFuncionario.ItemIndex - 1;
  dPercIR := StrToFloat(ReplaceStr(edtPercentualIR.Text, '.', ''));
  dPercINSS := StrToFloat(ReplaceStr(edtPercentualINSS.Text, '.', ''));
  dDctIR := StrToFloat(ReplaceStr(edtDctIR.Text, '.', ''));
  try
    if oFuncionarioController.CarregarFuncionario(
      oListaFuncionarios[iIndice].ID, oFuncionario) then begin
      edtValorIR.Text := FloatToStrF(oFuncoes.CalcularIR(oFuncionario,
        dPercIR, dDctIR), ffNumber, 11, 2);
      edtValorINSS.Text := FloatToStrF(oFuncoes.CalcularINSS(oFuncionario,
        dPercINSS), ffNumber, 11, 2);
    end else begin
    end;
  finally
    FreeAndNil(oFuncionario);
    FreeAndNil(oFuncionarioController);
  end;
end;

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

procedure TfrmCalculoImpostos.edtPercentualIRChange(Sender: TObject);
begin
  if not bFormatando then begin
    bFormatando := True;
    TEdit(Sender).Text := oFuncoes.FormatarMoeda(TEdit(Sender).Text);
    TEdit(Sender).SelStart := Length(TEdit(Sender).Text);
    bFormatando := False;
  end;
end;

procedure TfrmCalculoImpostos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmCalculoImpostos := nil;
end;

procedure TfrmCalculoImpostos.FormCreate(Sender: TObject);
begin
  oListaFuncionarios := TObjectList<TFuncionario>.Create;
  CarregarFuncionariosCadastrados();
  bFormatando := False;
  oFuncoes := TFuncoes.Create;
end;

procedure TfrmCalculoImpostos.FormDestroy(Sender: TObject);
begin
  FreeAndNil(oListaFuncionarios);
  FreeAndNil(oFuncoes);
end;

procedure TfrmCalculoImpostos.LimparTela;
begin
  cbxFuncionario.ItemIndex := 0;
  edtSalario.Text := '0,00';
  edtPercentualIR.Text := '15,00';
  edtPercentualINSS.Text := '8,00';
  edtDctIR.Text := '100,00';
  edtValorIR.Text := '0,00';
  edtValorINSS.Text := '0,00';
end;

end.
