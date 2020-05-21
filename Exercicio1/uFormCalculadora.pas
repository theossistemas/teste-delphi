unit uFormCalculadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uCalculadora;

type
  TfrmCalculadora = class(TForm)
    edtVisor: TEdit;
    edtHistorico: TEdit;
    btnLimpar: TButton;
    btnSete: TButton;
    btnOito: TButton;
    btnNove: TButton;
    btnQuatro: TButton;
    btnCinco: TButton;
    btnSeis: TButton;
    btnUm: TButton;
    btnDois: TButton;
    btnTres: TButton;
    btnDivisao: TButton;
    btnMultiplicacao: TButton;
    btnSubtracao: TButton;
    btnAdicao: TButton;
    btnIgual: TButton;
    btnZero: TButton;
    btnVirgula: TButton;
    edtFoco: TEdit;
    btnImpostoA: TButton;
    btnImpostoB: TButton;
    btnImpostoC: TButton;
    edtImpostoA: TEdit;
    edtImpostoB: TEdit;
    edtImpostoC: TEdit;
    procedure btnZeroClick(Sender: TObject);
    procedure btnVirgulaClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnIgualClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnImpostoAClick(Sender: TObject);
    procedure btnImpostoBClick(Sender: TObject);
    procedure btnImpostoCClick(Sender: TObject);
  private
    { Private declarations }
    FoCalculadora: TCalculadora;
    procedure Inicializar;
    procedure AtualizarHistorico(const psValor, psOperador: String);
  public
    { Public declarations }
  published
    procedure BtnNumberClick(Sender: TObject);
    procedure BtnOperationClick(Sender: TObject);
  end;

var
  frmCalculadora: TfrmCalculadora;

implementation

{$R *.dfm}

{ TfrmCalculadora }

procedure TfrmCalculadora.FormCreate(Sender: TObject);
begin
  Inicializar;
end;

procedure TfrmCalculadora.Inicializar;
begin
  edtVisor.Text := ZERO;
  edtHistorico.Text := VAZIO;
  edtImpostoA.Text := ZERO;
  edtImpostoB.Text := ZERO;
  edtImpostoC.Text := ZERO;
  FoCalculadora := TCalculadora.Create;
end;

procedure TfrmCalculadora.btnIgualClick(Sender: TObject);
var
  sValorVisor: String;
begin
  sValorVisor := edtVisor.Text;
  FoCalculadora.pressionadoOperacao := False;
  AtualizarHistorico(sValorVisor, IGUAL);
  edtVisor.Text := FoCalculadora.CalcularResultado(sValorVisor, opIgual);
  if edtFoco.CanFocus then
    edtFoco.SetFocus;
end;

procedure TfrmCalculadora.btnImpostoAClick(Sender: TObject);
begin
  edtImpostoA.Text := FoCalculadora.ImpostoA(edtVisor.Text);
  if edtFoco.CanFocus then
    edtFoco.SetFocus;
end;

procedure TfrmCalculadora.btnImpostoBClick(Sender: TObject);
begin
  edtImpostoB.Text := FoCalculadora.ImpostoB(edtVisor.Text);
  if edtFoco.CanFocus then
    edtFoco.SetFocus;
end;

procedure TfrmCalculadora.btnImpostoCClick(Sender: TObject);
begin
  edtImpostoC.Text := FoCalculadora.ImpostoC(edtVisor.Text);
  if edtFoco.CanFocus then
    edtFoco.SetFocus;
end;

procedure TfrmCalculadora.btnLimparClick(Sender: TObject);
begin
  Inicializar;
  if edtFoco.CanFocus then
    edtFoco.SetFocus;
end;

procedure TfrmCalculadora.BtnNumberClick(Sender: TObject);
begin
  if (edtVisor.Text = ZERO) or FoCalculadora.executouCalculo or FoCalculadora.pressionadoOperacao then
  begin
    edtVisor.Text :=  TButton(Sender).Caption;
    FoCalculadora.executouCalculo := False;
  end
  else
    edtVisor.Text := edtVisor.Text + TButton(Sender).Caption;
  FoCalculadora.pressionadoOperacao := False;
  if edtFoco.CanFocus then
    edtFoco.SetFocus;
end;

procedure TfrmCalculadora.BtnOperationClick(Sender: TObject);
var
  sOperador: String;
  sValorVisor: String;
  eOperador: TOperador;
begin
  sOperador := TButton(Sender).Caption;
  sValorVisor := edtVisor.Text;
  eOperador := FoCalculadora.SimboloParaOperador(sOperador);
  AtualizarHistorico(sValorVisor, sOperador);
  if FoCalculadora.executouCalculo then
  begin
    FoCalculadora.operador := opNenhuma;
    FoCalculadora.segundoNumero := VAZIO;
    FoCalculadora.executouCalculo := False;
  end;
  edtVisor.Text := FoCalculadora.CalcularResultado(sValorVisor, eOperador);
  FoCalculadora.pressionadoOperacao := True;
  if edtFoco.CanFocus then
    edtFoco.SetFocus;
end;

procedure TfrmCalculadora.btnVirgulaClick(Sender: TObject);
begin
  if FoCalculadora.pressionadoOperacao then
    edtVisor.Text := VAZIO;
  if Pos(DECIMAL,edtVisor.Text) = 0 then
    BtnNumberClick(Sender);
  FoCalculadora.executouCalculo := False;
  FoCalculadora.pressionadoOperacao := False;
  if edtFoco.CanFocus then
    edtFoco.SetFocus;
end;

procedure TfrmCalculadora.btnZeroClick(Sender: TObject);
begin
  if edtVisor.Text = ZERO then
    Exit;
  BtnNumberClick(Sender);
  FoCalculadora.pressionadoOperacao := False;
end;

procedure TfrmCalculadora.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_NUMPAD0: btnZero.Click;
    VK_NUMPAD1: btnUm.Click;
    VK_NUMPAD2: btnDois.Click;
    VK_NUMPAD3: btnTres.Click;
    VK_NUMPAD4: btnQuatro.Click;
    VK_NUMPAD5: btnCinco.Click;
    VK_NUMPAD6: btnSeis.Click;
    VK_NUMPAD7: btnSete.Click;
    VK_NUMPAD8: btnOito.Click;
    VK_NUMPAD9: btnNove.Click;
    VK_ADD: btnAdicao.Click;
    VK_SUBTRACT: btnSubtracao.Click;
    VK_MULTIPLY: btnMultiplicacao.Click;
    VK_DIVIDE: btnDivisao.Click;
    VK_RETURN: btnIgual.Click;
    VK_DECIMAL: btnVirgula.Click;
    VK_DELETE: btnLimpar.Click;
  end;
end;

procedure TfrmCalculadora.AtualizarHistorico(const psValor, psOperador: String);
var
  sAdicional: String;
  dValor: Double;
  sOperador: String;
  nTamanho: integer;
begin
  dValor := StrToFloat(psValor);
  sOperador := FoCalculadora.OperadorParaSimbolo(FoCalculadora.operador);

  if psOperador = IGUAL then
  begin

    if (FoCalculadora.primeiroNumero = VAZIO) or (sOperador = VAZIO) then
      sAdicional := FloatToStr(dValor) + psOperador
    else if (FoCalculadora.segundoNumero = VAZIO) or (not FoCalculadora.executouCalculo) then
      sAdicional := FoCalculadora.primeiroNumero + sOperador + FloatToStr(dValor) + psOperador
    else
      sAdicional := FoCalculadora.primeiroNumero + sOperador + FoCalculadora.segundoNumero + psOperador;

    edtHistorico.Text := sAdicional;
    exit;
  end;

  if FoCalculadora.pressionadoOperacao then
  begin
    nTamanho := length(edtHistorico.Text);
    edtHistorico.Text := copy(edtHistorico.Text,1,nTamanho-1) + psOperador;
    exit;
  end;

  if FoCalculadora.executouCalculo or (FoCalculadora.primeiroNumero = VAZIO) then
    sAdicional := FloatToStr(dValor) + psOperador
  else
    sAdicional := edtHistorico.Text + FloatToStr(dValor) + psOperador;

  edtHistorico.Text := sAdicional;
end;

procedure TfrmCalculadora.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FoCalculadora);
end;

end.
