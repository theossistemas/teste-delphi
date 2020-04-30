unit uCalculadoraMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uControllerCalculadora;

type
  TfrmCalculadoraMain = class(TForm)
    edtEntrada: TEdit;
    edtResultado: TEdit;
    lblDigite: TLabel;
    lblResultado: TLabel;
    btnImpostoA: TButton;
    btnImpostoB: TButton;
    btnImpostoC: TButton;
    edtImpostoA: TEdit;
    edtImpostoB: TEdit;
    edtImpostoC: TEdit;
    procedure edtEntradaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnImpostoAClick(Sender: TObject);
    procedure btnImpostoBClick(Sender: TObject);
    procedure btnImpostoCClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FCalculadoraController: TCalculadoraController;
    FUltimaOperacao: TipoOperacao;
    FValorAnterior: string;
    FResultado: double;
    function VerificaOperacaoSeguida(const sCaracterDigitado: Char): boolean;
    function ValidarCaracterTexto(const sCaracterDigitado: char): boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalculadoraMain: TfrmCalculadoraMain;

implementation

{$R *.dfm}

procedure TfrmCalculadoraMain.FormCreate(Sender: TObject);
begin
  FUltimaOperacao := tpVazia;
  FCalculadoraController := TCalculadoraController.Create;
end;

procedure TfrmCalculadoraMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FCalculadoraController);
end;

procedure TfrmCalculadoraMain.btnImpostoAClick(Sender: TObject);
begin
  if edtResultado.Text = EmptyStr then
    raise Exception.Create('Não é possível calcular pois o resultado está vazio.');

  edtImpostoA.Text := FloatToStr(FCalculadoraController.CalcularImpostoA);
end;

procedure TfrmCalculadoraMain.btnImpostoBClick(Sender: TObject);
begin
  if edtResultado.Text = EmptyStr then
    raise Exception.Create('Não é possível calcular pois o resultado está vazio.');

  edtImpostoB.Text := FloatToStr(FCalculadoraController.CalcularImpostoB);
end;

procedure TfrmCalculadoraMain.btnImpostoCClick(Sender: TObject);
begin
  if edtResultado.Text = EmptyStr then
    raise Exception.Create('Não é possível calcular pois o resultado está vazio.');

  edtImpostoC.Text := FloatToStr(FCalculadoraController.CalcularImpostoC);
end;

procedure TfrmCalculadoraMain.edtEntradaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(VK_BACK) then
    Exit;

  if ValidarCaracterTexto(Key) then
    raise Exception.Create('Não é permitido informar texto!');

  if VerificaOperacaoSeguida(Key) then
    raise Exception.Create('Não é permitido informar duas operações seguidas!');

  if CharInSet(Key, ['+','-','*','/','=', Chr(VK_RETURN)]) then
  begin
    if (FUltimaOperacao = tpVazia) then
      FResultado := StrToCurrDef(FValorAnterior, 0)
    else
      FResultado := FCalculadoraController.ExecutaOperacao(FResultado, StrToCurrDef(FValorAnterior, 0), FUltimaOperacao);

    FValorAnterior := '0';
    edtResultado.Text := FloatToStr(FResultado);
  end;

  case Key of
    '+': FUltimaOperacao := tpAdicao;
    '-': FUltimaOperacao := tpSubtracao;
    '*': FUltimaOperacao := tpMultiplicacao;
    '/': FUltimaOperacao := tpDivisao;
    '0'..'9', ',': FValorAnterior := FValorAnterior + Key;
  end;
end;

function TfrmCalculadoraMain.ValidarCaracterTexto(const sCaracterDigitado: char): boolean;
begin
  Result := False;

  if IsCharAlphaNumeric(sCaracterDigitado) then
  begin
    case sCaracterDigitado of
      '0'..'9': Result := False;
      #65..#90: Result := True;
      #97..#122: Result := True
    end;
  end;
end;

function TfrmCalculadoraMain.VerificaOperacaoSeguida(const sCaracterDigitado: char): boolean;
var
  sUltimoCaracterCampo: Char;
  IndexCampo: integer;
begin
  Result := False;

  if Length(edtEntrada.text) = 0 then
    Exit;

  for IndexCampo := 0 to Length(edtEntrada.text) do
    sUltimoCaracterCampo := edtEntrada.text[IndexCampo];

  case sCaracterDigitado of
    '+': Result := True;
    '-': Result := True;
    '*': Result := True;
    '/': Result := True;
    '0'..'9': Result := False;
  end;

  if not Result then
    Exit;

  case sUltimoCaracterCampo of
    '+': Result := Result = True;
    '-': Result := Result = True;
    '*': Result := Result = True;
    '/': Result := Result = True;
    '0'..'9': Result := False;
  end;
end;

end.
