unit untFrmExercicio1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.StdCtrls, System.StrUtils, System.Generics.Collections;

type
  TOperacao = (eOperacaoInvalida, eSoma, eSubtracao, eDivisao, eMultiplicacao);

  TFrmExercicio1 = class(TFrmBase)
    pnlVisor: TPanel;
    pnlOperacoes: TPanel;
    pnlNumeros: TPanel;
    btn1: TSpeedButton;
    btn2: TSpeedButton;
    btn3: TSpeedButton;
    btn4: TSpeedButton;
    btn5: TSpeedButton;
    btn6: TSpeedButton;
    btn7: TSpeedButton;
    btn8: TSpeedButton;
    btn9: TSpeedButton;
    btn0: TSpeedButton;
    btnOpDivisao: TSpeedButton;
    btnOpMultiplicacao: TSpeedButton;
    btnSubtração: TSpeedButton;
    btnSoma: TSpeedButton;
    btnIgual: TSpeedButton;
    edtVisor: TEdit;
    btnCE: TSpeedButton;
    btnBackspace: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FValorAuxiliar: Real;
    FOperacaoAuxiliar: TOperacao;
    FResultado: Real;
    FValorTextoVisor: String;
    FUltimoCaracterInformado: String;

    procedure prLimparVisor;
    procedure prAtualizarValorTexto(const pCaracter: String);
    procedure prAtualizarTextoVisor;
    procedure prExecutarOperacao(const pCaracter: String);
    procedure prExecutarIgual;

    function fcRetornarCaracterBotao(pBotao: TObject): String;
    function fcRemoverUltimoCaracter(const pTexto: String): String;
  public
    { Public declarations }
  end;

var
  FrmExercicio1: TFrmExercicio1;

implementation

{$R *.dfm}

const
  cTEXTOBOTOES: TArray<String> = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '/', '*', '-', '+', '=', 'CE', '<-'];
  cOPERACOES: TArray<String> = ['/', '*', '-', '+'];

procedure TFrmExercicio1.btnClick(Sender: TObject);
var
  vCaracter: String;
begin
  inherited;

  vCaracter := fcRetornarCaracterBotao(Sender);

  case AnsiIndexStr(vCaracter, cTEXTOBOTOES) of
    0..10: prAtualizarValorTexto(vCaracter);
    11..14: prExecutarOperacao(vCaracter);
    15: prExecutarIgual;
    16: prLimparVisor;
    17: FValorTextoVisor := fcRemoverUltimoCaracter(FValorTextoVisor);
  end;

  FUltimoCaracterInformado := vCaracter;
  prAtualizarTextoVisor;
end;

function TFrmExercicio1.fcRetornarCaracterBotao(pBotao: TObject): String;
begin
  Result := '';

  if not Assigned(pBotao) then
    Exit;

  if not (pBotao is TSpeedButton) then
    Exit;

  Result := TSpeedButton(pBotao).Caption;
end;

function TFrmExercicio1.fcRemoverUltimoCaracter(const pTexto: String): String;
var
  vQtdCaracteres: Integer;
begin
  vQtdCaracteres := Length(pTexto);

  if vQtdCaracteres = 1 then
    Result := '0'
  else
    Result := Copy(pTexto, 1, vQtdCaracteres - 1);
end;

procedure TFrmExercicio1.FormCreate(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := True;
  prLimparVisor;
end;

procedure TFrmExercicio1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #8 then
    btnBackspace.Click;
end;

procedure TFrmExercicio1.prAtualizarTextoVisor;
begin
  edtVisor.ReadOnly := False;
  edtVisor.Text := FValorTextoVisor;
  edtVisor.ReadOnly := True;
  edtVisor.SelStart := Length(FValorTextoVisor);
end;

procedure TFrmExercicio1.prAtualizarValorTexto(const pCaracter: String);
begin
  if AnsiIndexStr(FUltimoCaracterInformado, cOPERACOES) <> -1 then
    FValorTextoVisor := '0';

  if FValorTextoVisor = '0' then
    FValorTextoVisor := pCaracter
  else
    FValorTextoVisor := FValorTextoVisor + pCaracter;
end;

procedure TFrmExercicio1.prLimparVisor;
begin
  FValorTextoVisor         := '0';
  FUltimoCaracterInformado := '';

  prAtualizarTextoVisor;
end;

procedure TFrmExercicio1.prExecutarIgual;
var
  vValorAux: Real;
begin
  vValorAux := StrToInt(FValorTextoVisor);

  case FOperacaoAuxiliar of
    eSoma:          FResultado := FValorAuxiliar + vValorAux;
    eSubtracao:     FResultado := FValorAuxiliar - vValorAux;
    eMultiplicacao: FResultado := FValorAuxiliar * vValorAux;
    eDivisao:
      begin
        if vValorAux <> 0 then
          FResultado := FValorAuxiliar / vValorAux
        else
          raise Exception.Create('Não é possível efetuar divisão por zero.');
      end;
  end;

  FValorTextoVisor := FloatToStr(FResultado);
  FOperacaoAuxiliar := eOperacaoInvalida;
end;

procedure TFrmExercicio1.prExecutarOperacao(const pCaracter: String);
var
  vValorAux: Real;
begin
  vValorAux := StrToInt(FValorTextoVisor);

  if FOperacaoAuxiliar <> eOperacaoInvalida then
  begin
    case FOperacaoAuxiliar of
      eSoma:          FResultado := FValorAuxiliar + vValorAux;
      eSubtracao:     FResultado := FValorAuxiliar - vValorAux;
      eMultiplicacao: FResultado := FValorAuxiliar * vValorAux;
      eDivisao:
        begin
          if vValorAux <> 0 then
            FResultado := FValorAuxiliar / vValorAux
          else
            raise Exception.Create('Não é possível efetuar divisão por zero.');
        end;
    end;

    vValorAux := FResultado;
    FValorTextoVisor := FloatToStr(vValorAux);
  end;

  FValorAuxiliar := vValorAux;

  case AnsiIndexStr(pCaracter, cOPERACOES) of
    0: FOperacaoAuxiliar := eDivisao;
    1: FOperacaoAuxiliar := eMultiplicacao;
    2: FOperacaoAuxiliar := eSubtracao;
    3: FOperacaoAuxiliar := eSoma;
    else
      FOperacaoAuxiliar := eOperacaoInvalida;
  end;
end;

end.
