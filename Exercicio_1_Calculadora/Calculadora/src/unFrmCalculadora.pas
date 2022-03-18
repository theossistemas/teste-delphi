unit unFrmCalculadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.TypInfo, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, unCalculadora;

type

  TfrmPrincipal = class(TForm)
    b6: TSpeedButton;
    b1: TSpeedButton;
    b0: TSpeedButton;
    b2: TSpeedButton;
    b3: TSpeedButton;
    b4: TSpeedButton;
    b7: TSpeedButton;
    b8: TSpeedButton;
    b9: TSpeedButton;
    bponto: TSpeedButton;
    bigual: TSpeedButton;
    bmais: TSpeedButton;
    bmenos: TSpeedButton;
    bmulti: TSpeedButton;
    bdiv: TSpeedButton;
    bapaga: TSpeedButton;
    bce: TSpeedButton;
    pValor: TPanel;
    b5: TSpeedButton;
    bA: TSpeedButton;
    bB: TSpeedButton;
    bc: TSpeedButton;
    lblOperacaoAtual: TLabel;
    Label1: TLabel;
    procedure btnAdicionaDigitoVisorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOperacaoClick(Sender: TObject);
    procedure btnIgualClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure AtualizaDisplay;
    procedure bapagaClick(Sender: TObject);
  private
    { Private declarations }
    FCalculadora: TCalculadora;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.AtualizaDisplay;
begin
  if not Assigned(FCalculadora) then Exit;
  pValor.Caption := FCalculadora.Visor;
  lblOperacaoAtual.Caption := FCalculadora.Operacao;
end;

procedure TfrmPrincipal.bapagaClick(Sender: TObject);
begin
  FCalculadora.RemoveDigito;

end;

procedure TfrmPrincipal.btnAdicionaDigitoVisorClick(Sender: TObject);
var
  vDigito: string;
begin
  if IsPublishedProp(Sender, 'Caption') then
  begin
    vDigito :=  GetPropValue(Sender, 'Caption', True);
    FCalculadora.adicionaDigito(vDigito[1]);
  end;
end;

procedure TfrmPrincipal.btnIgualClick(Sender: TObject);
begin
  FCalculadora.Operacao := '=';
end;

procedure TfrmPrincipal.btnLimparClick(Sender: TObject);
begin
  FCalculadora.Limpar;
end;

procedure TfrmPrincipal.btnOperacaoClick(Sender: TObject);
var
  vOperacao: string;
begin
  if IsPublishedProp(Sender, 'Caption') then
  begin
    vOperacao :=  GetPropValue(Sender, 'Caption', True);
    FCalculadora.SetOperacao(vOperacao[1]);
  end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FCalculadora) then
    FreeAndNil(FCalculadora);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FCalculadora := TCalculadora.Create(AtualizaDisplay);
  FCalculadora.Limpar;
end;

procedure TfrmPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
Var
  Botao : TSpeedButton ;
begin
  Botao := nil ;

  case Key of
     '1' : Botao := b1 ;
     '2' : Botao := b2 ;
     '3' : Botao := b3 ;
     '4' : Botao := b4 ;
     '5' : Botao := b5 ;
     '6' : Botao := b6 ;
     '7' : Botao := b7 ;
     '8' : Botao := b8 ;
     '9' : Botao := b9 ;
     '0' : Botao := b0 ;
     'A' : Botao := bA ;
     'a' : Botao := bA ;
     'B' : Botao := bB ;
     'b' : Botao := bB ;
     'C' : Botao := bc ;
     'c' : Botao := bc ;
     'E' : Botao := bce ;
     'e' : Botao := bce ;
     '+' : Botao := bmais ;
     '-' : Botao := bmenos ;
     '*' : Botao := bmulti ;
     'x' : Botao := bmulti ;
     '/' : Botao := bdiv ;
     '.' : Botao := bponto ;
     ',' : Botao := bponto ;
     #8  : Botao := bapaga ;
     '=' : Botao := bigual ;
     #13 : Botao := bigual ;
     #27 : Botao := bce;
  end;

  if Botao is TSpeedButton then
  begin
     Botao.Visible := False ;
     Application.ProcessMessages ;
     Sleep(40);
     Botao.Visible := True ;
     Botao.Click
  end ;
end;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
  FCalculadora.CalcularImposto('B');
end;

procedure TfrmPrincipal.SpeedButton2Click(Sender: TObject);
begin
  FCalculadora.CalcularImposto('C');
end;

procedure TfrmPrincipal.SpeedButton6Click(Sender: TObject);
begin
  FCalculadora.CalcularImposto('A')
end;

end.
