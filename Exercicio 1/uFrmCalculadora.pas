unit uFrmCalculadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components, Types,
  uICalculadora, uCalculadora;

type
  TFrmCalculadora = class(TForm)
    pTeclado: TPanel;
    pVisor: TPanel;
    EdtVisor: TEdit;
    BtnLimpar: TSpeedButton;
    BtnOito: TSpeedButton;
    BtnQuatro: TSpeedButton;
    BtnUm: TSpeedButton;
    BtnZero: TSpeedButton;
    BtnDois: TSpeedButton;
    BtnCinco: TSpeedButton;
    BtnSete: TSpeedButton;
    BtnNove: TSpeedButton;
    BtnSeis: TSpeedButton;
    BtnTres: TSpeedButton;
    BtnVirgula: TSpeedButton;
    BtnSomar: TSpeedButton;
    BtnIgual: TSpeedButton;
    BtnDividir: TSpeedButton;
    BtnMultiplicar: TSpeedButton;
    BtnSubtrair: TSpeedButton;
    BtnImpostoA: TSpeedButton;
    BtnImpostoB: TSpeedButton;
    BtnImpostoC: TSpeedButton;
    procedure BtnUmClick(Sender: TObject);
    procedure BtnDoisClick(Sender: TObject);
    procedure BtnTresClick(Sender: TObject);
    procedure BtnQuatroClick(Sender: TObject);
    procedure BtnCincoClick(Sender: TObject);
    procedure BtnSeisClick(Sender: TObject);
    procedure BtnSeteClick(Sender: TObject);
    procedure BtnOitoClick(Sender: TObject);
    procedure BtnNoveClick(Sender: TObject);
    procedure BtnZeroClick(Sender: TObject);
    procedure BtnDividirClick(Sender: TObject);
    procedure BtnMultiplicarClick(Sender: TObject);
    procedure BtnSubtrairClick(Sender: TObject);
    procedure BtnSomarClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnIgualClick(Sender: TObject);
    procedure BtnVirgulaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnImpostoAClick(Sender: TObject);
    procedure BtnImpostoBClick(Sender: TObject);
    procedure BtnImpostoCClick(Sender: TObject);
  private
    Valor: Double;
    ValorSecundario: Double;
    Operacao: EnumOperacao;
    ControlallerCalculadora: ICalculadora;
    PrimeiroCalculo: Boolean;
    FeitoOperacao: Boolean;
    CalculoImposto: Boolean;
    { Private declarations }
    Procedure Clear;
    procedure ComportamentoNumeros(Sender: TObject);
    procedure ComportamentoOperacao(Operacao: EnumOperacao);
  public
    { Public declarations }

  end;

var
  FrmCalculadora: TFrmCalculadora;

implementation

{$R *.dfm}
// Tambem era possivel Fazer Tudo em um evento s�, porem para entendimento , escolhi fazer um evento pra cada numero.

{$REGION   ' Bot�es Numeros  }

procedure TFrmCalculadora.BtnCincoClick(Sender: TObject);
begin
  Self.ComportamentoNumeros(Sender);
end;

procedure TFrmCalculadora.BtnDoisClick(Sender: TObject);
begin
  Self.ComportamentoNumeros(Sender);
end;

procedure TFrmCalculadora.BtnNoveClick(Sender: TObject);
begin
  Self.ComportamentoNumeros(Sender);
end;

procedure TFrmCalculadora.BtnOitoClick(Sender: TObject);
begin
  Self.ComportamentoNumeros(Sender);
end;

procedure TFrmCalculadora.BtnQuatroClick(Sender: TObject);
begin
  Self.ComportamentoNumeros(Sender);
end;

procedure TFrmCalculadora.BtnSeisClick(Sender: TObject);
begin
  Self.ComportamentoNumeros(Sender);
end;

procedure TFrmCalculadora.BtnSeteClick(Sender: TObject);
begin
  Self.ComportamentoNumeros(Sender);
end;

procedure TFrmCalculadora.BtnTresClick(Sender: TObject);
begin
  Self.ComportamentoNumeros(Sender);
end;

procedure TFrmCalculadora.BtnUmClick(Sender: TObject);
begin
  Self.ComportamentoNumeros(Sender);
end;

procedure TFrmCalculadora.BtnZeroClick(Sender: TObject);
begin
  Self.ComportamentoNumeros(Sender);
end;

{$ENDREGION}
{$REGION  ' Bot�es Operacionais  '}

procedure TFrmCalculadora.BtnSomarClick(Sender: TObject);
begin
  Self.ComportamentoOperacao(Somar);
end;

procedure TFrmCalculadora.BtnMultiplicarClick(Sender: TObject);
begin
  Self.ComportamentoOperacao(Multiplicar);
end;

procedure TFrmCalculadora.BtnSubtrairClick(Sender: TObject);
begin
  Self.ComportamentoOperacao(Subtrair);
end;

procedure TFrmCalculadora.BtnDividirClick(Sender: TObject);
begin
  Self.ComportamentoOperacao(Dividir);
end;

procedure TFrmCalculadora.BtnImpostoAClick(Sender: TObject);
begin
  Self.ComportamentoOperacao(EImpostoA);
  Self.CalculoImposto := True;
  Self.BtnIgual.Click;
end;

procedure TFrmCalculadora.BtnImpostoBClick(Sender: TObject);
begin
  Self.ComportamentoOperacao(EImpostoB);
  Self.CalculoImposto := True;
  Self.BtnIgual.Click;
end;

procedure TFrmCalculadora.BtnImpostoCClick(Sender: TObject);
begin
  Self.ComportamentoOperacao(EImpostoC);
  Self.CalculoImposto := True;
  Self.BtnIgual.Click;
end;

{$ENDREGION}

procedure TFrmCalculadora.ComportamentoNumeros(Sender: TObject);
begin
  Self.EdtVisor.Text := EdtVisor.Text + (Sender as TSpeedButton).Caption;
end;

procedure TFrmCalculadora.ComportamentoOperacao(Operacao: EnumOperacao);
begin
  Self.Valor := StrToFloat(Self.EdtVisor.Text);
  Self.EdtVisor.Clear;
  Self.Operacao := EnumOperacao(Operacao);
  Self.FeitoOperacao := True;
end;

procedure TFrmCalculadora.BtnVirgulaClick(Sender: TObject);
begin
  Self.EdtVisor.Text := Self.EdtVisor.Text + ',';
end;

procedure TFrmCalculadora.BtnIgualClick(Sender: TObject);
begin
  if Self.CalculoImposto then
  begin
    Self.ControlallerCalculadora.GerenciamentoOperacao(Self.Operacao,
      Self.EdtVisor, Valor);
  end
  else
  begin

    if Self.FeitoOperacao then
      Self.ValorSecundario := StrToFloat(Self.EdtVisor.Text)
    else if Valor <> StrToFloat(Self.EdtVisor.Text) then
    Valor := StrToFloat(Self.EdtVisor.Text);

    if Self.PrimeiroCalculo then
    begin
      Self.ControlallerCalculadora.GerenciamentoOperacao(Self.Operacao,
        Self.EdtVisor, StrToFloat(Self.EdtVisor.Text), Valor);
      Self.PrimeiroCalculo := False;

    end
    else
    begin
      Self.ControlallerCalculadora.GerenciamentoOperacao(Self.Operacao,
        Self.EdtVisor, Self.ValorSecundario, Self.Valor);

    end;
  end;
  Valor := StrToFloat(Self.EdtVisor.Text);
  Self.FeitoOperacao := False;
  Self.CalculoImposto := False;
end;

procedure TFrmCalculadora.FormCreate(Sender: TObject);
begin
  Self.ControlallerCalculadora := TCalculadora.Create;
  Self.Clear;
end;

procedure TFrmCalculadora.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_NUMPAD1:
      BtnUm.Click;
    VK_NUMPAD2:
      BtnDois.Click;
    VK_NUMPAD3:
      BtnTres.Click;
    VK_NUMPAD4:
      BtnQuatro.Click;
    VK_NUMPAD5:
      BtnCinco.Click;
    VK_NUMPAD6:
      BtnSeis.Click;
    VK_NUMPAD7:
      BtnSete.Click;
    VK_NUMPAD8:
      BtnOito.Click;
    VK_NUMPAD9:
      BtnNove.Click;
    VK_NUMPAD0:
      BtnZero.Click;
    VK_ADD:
      Self.BtnSomar.Click;
    VK_SUBTRACT:
      Self.BtnSubtrair.Click;
    VK_MULTIPLY:
      Self.BtnMultiplicar.Click;
    VK_DIVIDE:
      Self.BtnDividir.Click;
    VK_RETURN:
      Self.BtnIgual.Click;
    VK_DECIMAL:
      Self.BtnVirgula.Click;
    VK_DELETE:
      Self.BtnLimpar.Click;
  End;
end;

procedure TFrmCalculadora.BtnLimparClick(Sender: TObject);
begin
  Self.Clear
end;

procedure TFrmCalculadora.Clear;
begin
  Self.EdtVisor.Clear;
  Self.Valor := 0;
  Self.ValorSecundario := 0;
  Self.PrimeiroCalculo := True;
  Self.FeitoOperacao := False;
  Self.CalculoImposto := False;
end;

end.
