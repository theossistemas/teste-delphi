unit uCalculadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActnList, uObjCalculadora;

type
  TFrm_Calculadora = class(TForm)
    edtVisor: TEdit;
    btSomar: TButton;
    btResultado: TButton;
    btSubtrair: TButton;
    btMultiplicar: TButton;
    btDividir: TButton;
    btUm: TButton;
    btDois: TButton;
    btTres: TButton;
    btZero: TButton;
    btQuatro: TButton;
    btCinco: TButton;
    btSeis: TButton;
    btSete: TButton;
    btOito: TButton;
    btNove: TButton;
    btVirgula: TButton;
    btResetar: TButton;
    btImpostoA: TButton;
    btImpostoB: TButton;
    btImpostoC: TButton;

    procedure btUmClick(Sender: TObject);
    procedure btDoisClick(Sender: TObject);
    procedure btTresClick(Sender: TObject);
    procedure btQuatroClick(Sender: TObject);
    procedure btCincoClick(Sender: TObject);
    procedure btSeisClick(Sender: TObject);
    procedure btSeteClick(Sender: TObject);
    procedure btOitoClick(Sender: TObject);
    procedure btNoveClick(Sender: TObject);
    procedure btZeroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btSomarClick(Sender: TObject);
    procedure btResultadoClick(Sender: TObject);
    procedure btSubtrairClick(Sender: TObject);
    procedure btMultiplicarClick(Sender: TObject);
    procedure btDividirClick(Sender: TObject);
    procedure btResetarClick(Sender: TObject);
    procedure btVirgulaClick(Sender: TObject);
    procedure btImpostoAClick(Sender: TObject);
    procedure btImpostoBClick(Sender: TObject);
    procedure btImpostoCClick(Sender: TObject);
  private
    oObjCalculadora: TCalculadora;
    bResetarVisor: boolean;
    
    procedure InserirValorTela(Sender: TObject);
    procedure AtualizarOperacao(const oTipoOperacao: TOperacao);
  public
    { Public declarations }
  end;

var
  Frm_Calculadora: TFrm_Calculadora;

implementation

const
  LIMITE_MAX_VISOR = 12;

{$R *.dfm}

procedure TFrm_Calculadora.InserirValorTela(Sender: TObject);
begin
  oObjCalculadora.UltimaTeclaOperacao := False;
  if bResetarVisor then
  begin
    edtVisor.Text := '0';
    bResetarVisor := False;
  end;

  if (edtVisor.Text = '0') and (TButton(Sender).Caption <> ',') then
  begin
    edtVisor.Text := TButton(Sender).Caption;
    Exit;
  end;

  //Limitei a quantidade de dígitos para 12.
  if Length(edtVisor.Text) < LIMITE_MAX_VISOR then
    edtVisor.Text := edtVisor.Text + TButton(Sender).Caption;

end;

procedure TFrm_Calculadora.btUmClick(Sender: TObject);
begin
  InserirValorTela(Sender);
end;

procedure TFrm_Calculadora.btDoisClick(Sender: TObject);
begin
  InserirValorTela(Sender);
end;

procedure TFrm_Calculadora.btTresClick(Sender: TObject);
begin
  InserirValorTela(Sender);
end;

procedure TFrm_Calculadora.btQuatroClick(Sender: TObject);
begin
  InserirValorTela(Sender);
end;

procedure TFrm_Calculadora.btCincoClick(Sender: TObject);
begin
  InserirValorTela(Sender);
end;

procedure TFrm_Calculadora.btSeisClick(Sender: TObject);
begin
  InserirValorTela(Sender);
end;

procedure TFrm_Calculadora.btSeteClick(Sender: TObject);
begin
  InserirValorTela(Sender);
end;

procedure TFrm_Calculadora.btOitoClick(Sender: TObject);
begin
  InserirValorTela(Sender);
end;

procedure TFrm_Calculadora.btNoveClick(Sender: TObject);
begin
  InserirValorTela(Sender);
end;

procedure TFrm_Calculadora.btZeroClick(Sender: TObject);
begin
  if edtVisor.Text = '0' then
    Exit;

  InserirValorTela(Sender);
end;

procedure TFrm_Calculadora.FormCreate(Sender: TObject);
begin
  inherited;
  bResetarVisor := False;
  
  try
    oObjCalculadora := TCalculadora.Create;
  except
    on E: Exception do
    begin
      ShowMessage('Erro: Não foi possível criar o objeto da calculadora.');
      Application.Terminate;
    end;
  end;
end;

procedure TFrm_Calculadora.FormDestroy(Sender: TObject);
begin
  FreeAndNil(oObjCalculadora);
  inherited;
end;

procedure TFrm_Calculadora.btSomarClick(Sender: TObject);
begin
  AtualizarOperacao(oSoma);
end;

procedure TFrm_Calculadora.btResultadoClick(Sender: TObject);
begin
  oObjCalculadora.SegundoValor := edtVisor.Text;
  edtVisor.Text := oObjCalculadora.GetResultado(True);
  bResetarVisor := True;
  oObjCalculadora.UltimaTeclaOperacao := False;
end;

procedure TFrm_Calculadora.AtualizarOperacao(
  const oTipoOperacao: TOperacao);
begin
  edtVisor.Text := oObjCalculadora.AtualizarOperacao(oTipoOperacao, edtVisor.Text);
  bResetarVisor := True;
  oObjCalculadora.UltimaTeclaOperacao := True;
end;

procedure TFrm_Calculadora.btSubtrairClick(Sender: TObject);
begin
  AtualizarOperacao(oSubtracao);
end;

procedure TFrm_Calculadora.btMultiplicarClick(Sender: TObject);
begin
  AtualizarOperacao(oMultiplicacao);
end;

procedure TFrm_Calculadora.btDividirClick(Sender: TObject);
begin
  AtualizarOperacao(oDivisao);
end;

procedure TFrm_Calculadora.btResetarClick(Sender: TObject);
begin
  oObjCalculadora.ResetarValores;
  edtVisor.Text := '0';;
end;

procedure TFrm_Calculadora.btVirgulaClick(Sender: TObject);
begin
  if Pos(',', edtVisor.Text) > 0 then
    Exit;

  InserirValorTela(Sender);
end;

procedure TFrm_Calculadora.btImpostoAClick(Sender: TObject);
begin
  edtVisor.Text := oObjCalculadora.CalcularImpostoA(edtVisor.Text);
end;

procedure TFrm_Calculadora.btImpostoBClick(Sender: TObject);
begin
  edtVisor.Text := oObjCalculadora.CalcularImpostoB;
end;

procedure TFrm_Calculadora.btImpostoCClick(Sender: TObject);
begin
  edtVisor.Text := oObjCalculadora.CalcularImpostoC;
end;

end.
