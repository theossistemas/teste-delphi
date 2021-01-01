unit Theos.Controller.Calculadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,

  Theos.Api.Calculadora,
  Theos.View.Calculadora;

type
  TControllerCalculadora = class sealed
  strict private
    const
      CARACTERES_NUMERICOS = ['0'..'9'];
      SEPARADOR_DECIMAL = ',';
      TECLA_ESC = Chr(VK_ESCAPE);
      TECLA_BACKSPACE = Chr(VK_BACK);
    var
      FView: TViewCalculadora;
      FCalculadora: TCalculadora;
      FVoltaValorInicial: Boolean;

    procedure Init;
    procedure BindEvents;

    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure BtnImpostoAClick(Sender: TObject);
    procedure BtnImpostoBClick(Sender: TObject);
    procedure BtnImpostoCClick(Sender: TObject);

    function LimpaComEsc(const Key: Char): Boolean;
    function ApagaComBackSpace(const Key: Char): Boolean;
    function NumeroDigitado(const Key: Char): Boolean;
    function SeparadorDecimalDigitado(const Key: Char): Boolean;
    function OperadorDigitado(Key: Char): Boolean;
    function TrocouDeOperador(const Key: Char): Boolean;

    function TeclaCalcularImpostoA(var Key: Word): Boolean;
    function TeclaCalcularImpostoB(var Key: Word): Boolean;
    function TeclaCalcularImpostoC(var Key: Word): Boolean;

    function AtribuirBaseCalculoParaCalculoImposto: boolean;
    procedure CalculaImpostoA;
    procedure CalculaImpostoB;
    procedure CalculaImpostoC;

  public
    constructor Create; reintroduce;
    destructor Destroy; override;
    function ShowModal: Integer;
  end;

implementation

constructor TControllerCalculadora.Create;
begin
  inherited Create;
  Init;
end;

destructor TControllerCalculadora.Destroy;
begin
  FView.Release;
  FView := nil;
  FCalculadora.Free;
  inherited Destroy;
end;

procedure TControllerCalculadora.BindEvents;
begin
  FView.OnKeyPress := FormKeyPress;
  FView.OnKeyDown := FormKeyDown;
  FView.BtnImpostoA.OnClick := BtnImpostoAClick;
  FView.BtnImpostoB.OnClick := BtnImpostoBClick;
  FView.BtnImpostoC.OnClick := BtnImpostoCClick;
end;

procedure TControllerCalculadora.Init;
begin
  FView := TViewCalculadora.Create(nil);
  BindEvents;
  FView.LbVisorResultado.Caption := String.Empty;
  FView.LbValor.Caption := String.Empty;
  FVoltaValorInicial := True;
  FCalculadora := TCalculadora.Create;
end;

function TControllerCalculadora.ShowModal: Integer;
begin
  Result := FView.ShowModal;
end;

function TControllerCalculadora.NumeroDigitado(const Key: Char): Boolean;
begin
  if not CharInSet(key, CARACTERES_NUMERICOS) then
    Exit(False);

  if FVoltaValorInicial then
    FView.LbValor.Caption := String.Empty;

  FVoltaValorInicial := False;

  FView.LbValor.Caption := FView.LbValor.Caption + key;
  Result := True;
end;

function TControllerCalculadora.TrocouDeOperador(const Key: Char): Boolean;
begin
  if not String(FView.LbValor.Caption).IsEmpty then
    Exit(False);

  if FCalculadora.PrimeiraVez then
    Exit(True);

  if TOperacao(ord(Key)) = TOperacao.Igual then
    Exit(False);

  FCalculadora.TrocaUltimaOperacao(TOperacao(ord(Key)));
  FView.LbVisorResultado.Caption := FloatToStr(FCalculadora.Resultado) + ' ' + Key;
  Result := True;
end;

function TControllerCalculadora.OperadorDigitado(Key: Char): Boolean;
begin
  if key = chr(VK_RETURN) then
    key := TConstantes.IGUAL;

  if not CharInSet(key, TConstantes.CARACTERES_OPERADORES) then
    Exit(False);

  if TrocouDeOperador(Key) then
    Exit(True);

  FCalculadora.Operacao := TOperacao(ord(Key));

  FCalculadora.Valor.Clear;
  if not String(FView.LbValor.Caption).IsEmpty then
  begin
    var ValorParaCalcular := StrToFloatDef(FView.LbValor.Caption,0);
    FCalculadora.Valor := ValorParaCalcular;
  end;
  FCalculadora.Execute;

  FVoltaValorInicial := True;
  FView.LbVisorResultado.Caption := String.Empty;
  if FCalculadora.Resultado.HasValue then
    FView.LbVisorResultado.Caption := FloatToStr(FCalculadora.Resultado) + ' ' + Key;
  FView.LbValor.Caption := String.Empty;
  Result := True;

end;

function TControllerCalculadora.SeparadorDecimalDigitado(const Key: Char): Boolean;
begin
  if key <> SEPARADOR_DECIMAL then
    Exit(False);

  if String(FView.LbValor.Caption).IndexOf(SEPARADOR_DECIMAL) > 0 then
    Exit(True);

  if FVoltaValorInicial then
    FView.LbValor.Caption := '0';

  FVoltaValorInicial := False;

  FView.LbValor.Caption := FView.LbValor.Caption + key;
  Result := True;
end;

function TControllerCalculadora.LimpaComEsc(const Key: Char): Boolean;
begin
  if key <> TECLA_ESC then
    Exit(False);

  FView.LbValor.Caption := String.Empty;
  FView.LbVisorResultado.Caption := String.Empty;

  FCalculadora.Limpar;
  FVoltaValorInicial := True;
  Result := True;
end;

function TControllerCalculadora.ApagaComBackSpace(const Key: Char): Boolean;
begin
  if key <> TECLA_BACKSPACE then
    Exit(False);

  var strConteudo: String := FView.LbValor.Caption;
  Delete(strConteudo, String(FView.LbValor.Caption).Length, 1);

  FView.LbValor.Caption := strConteudo;
  Result := True;
end;

procedure TControllerCalculadora.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if TeclaCalcularImpostoA(key) then
    Exit;

  if TeclaCalcularImpostoB(key) then
    Exit;

  if TeclaCalcularImpostoC(key) then
    Exit;
end;

procedure TControllerCalculadora.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if LimpaComEsc(key) then
    Exit;

  if ApagaComBackSpace(Key) then
    Exit;

  if NumeroDigitado(Key) then
    Exit;

  if OperadorDigitado(key) then
    Exit;

  SeparadorDecimalDigitado(Key);
end;

procedure TControllerCalculadora.BtnImpostoAClick(Sender: TObject);
begin
  CalculaImpostoA;
end;

procedure TControllerCalculadora.BtnImpostoBClick(Sender: TObject);
begin
  CalculaImpostoB;
end;

procedure TControllerCalculadora.BtnImpostoCClick(Sender: TObject);
begin
  CalculaImpostoC;
end;

function TControllerCalculadora.TeclaCalcularImpostoA(var Key: Word): Boolean;
begin
  if key <> VK_F1 then
    Exit(False);
  CalculaImpostoA;
  Key := 0;
  Result := True;
end;

function TControllerCalculadora.TeclaCalcularImpostoB(var Key: Word): Boolean;
begin
  if key <> VK_F2 then
    Exit(False);
  CalculaImpostoB;
  Key := 0;
  Result := True;
end;

function TControllerCalculadora.TeclaCalcularImpostoC(var Key: Word): Boolean;
begin
  if key <> VK_F3 then
    Exit(False);
  CalculaImpostoC;
  Key := 0;
  Result := True;
end;

function TControllerCalculadora.AtribuirBaseCalculoParaCalculoImposto: Boolean;
begin
  if String(FView.LbValor.Caption).IsEmpty then
    Exit(False);

  FCalculadora.BaseCalculo := StrToFloatDef(FView.LbValor.Caption,0);
  result := True;
end;

procedure TControllerCalculadora.CalculaImpostoA;
begin
  if not AtribuirBaseCalculoParaCalculoImposto then
    Exit;
  FView.LbVisorResultado.Caption := FloatToStr(FCalculadora.ImpostoA);
end;

procedure TControllerCalculadora.CalculaImpostoB;
begin
  if not AtribuirBaseCalculoParaCalculoImposto then
    Exit;
  FView.LbVisorResultado.Caption := FloatToStr(FCalculadora.ImpostoB);
end;

procedure TControllerCalculadora.CalculaImpostoC;
begin
  if not AtribuirBaseCalculoParaCalculoImposto then
    Exit;
  FView.LbVisorResultado.Caption := FloatToStr(FCalculadora.ImpostoC);
end;

end.
