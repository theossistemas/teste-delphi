unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Controller.Calculadora, Common.Constante, Controller.Calculadora.Interfaces;

type
  TfrmCalc = class(TForm)
    btn0: TButton;
    btnDivide: TButton;
    btnVirgula: TButton;
    btnMultiplica: TButton;
    btn3: TButton;
    btn2: TButton;
    btn1: TButton;
    btnSubtrai: TButton;
    btn6: TButton;
    btn5: TButton;
    btn4: TButton;
    btnSoma: TButton;
    btn9: TButton;
    btn8: TButton;
    btn7: TButton;
    edtDisplay: TEdit;
    btnZerar: TButton;
    memoHistory: TMemo;
    btnIgual: TButton;
    btnImpostoA: TButton;
    btnImpostoB: TButton;
    btnImpostoC: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btnZerarClick(Sender: TObject);
    procedure btnImpostoAClick(Sender: TObject);
    procedure btnImpostoBClick(Sender: TObject);
    procedure btnImpostoCClick(Sender: TObject);
  private
    { Private declarations }
    FCalc : iCalculadoraController;

    procedure OnCalc(const AVlrMemoria : Double; const AOperacao :  TOperacao  );
    procedure OnChange(const AVlrMemoria, AVlrAtual : Double; const AVlrEntrada : string; const AOperacao, AUltimaOperacao : TOperacao  );

    procedure TrataEntrada(AValue : string);
  public
    { Public declarations }
  end;

var
  frmCalc: TfrmCalc;

implementation

{$R *.dfm}

procedure TfrmCalc.btn7Click(Sender: TObject);
begin
  TrataEntrada(TButton(Sender).Caption);
end;

procedure TfrmCalc.btnImpostoAClick(Sender: TObject);
begin
  FCalc.Add(_OPERACAO_IMPOSTO_A);
end;

procedure TfrmCalc.btnImpostoBClick(Sender: TObject);
begin
  FCalc.Add(_OPERACAO_IMPOSTO_B);
end;

procedure TfrmCalc.btnImpostoCClick(Sender: TObject);
begin
  FCalc.Add(_OPERACAO_IMPOSTO_C);
end;

procedure TfrmCalc.btnZerarClick(Sender: TObject);
begin
  memoHistory.Clear();
  FCalc.Reset();
end;

procedure TfrmCalc.FormCreate(Sender: TObject);
begin
  FCalc := TCalculadoraController.New()
              .Eventos()
                .OnChange(OnChange)
                .OnCalc(OnCalc)
              .EndEventos();
  ;
end;


procedure TfrmCalc.OnCalc(const AVlrMemoria: Double; const AOperacao: TOperacao);
begin
  edtDisplay.Text := FloatToStr(AVlrMemoria);
end;

procedure TfrmCalc.OnChange(const AVlrMemoria, AVlrAtual: Double; const AVlrEntrada: string; const AOperacao, AUltimaOperacao: TOperacao);
begin
  edtDisplay.Text := AVlrEntrada;

  memoHistory.Lines.Add( Format('Entrada          : %S', [AVlrEntrada]) );
  memoHistory.Lines.Add( Format('VlrAtual         : %F', [AVlrAtual]) );
  memoHistory.Lines.Add( Format('VlrMemoria       : %F', [AVlrMemoria]) );
  memoHistory.Lines.Add( Format('Operacao         : %S', [ OperacaoToStr( AOperacao ) ]) );
  memoHistory.Lines.Add( '---------------------' );
end;

procedure TfrmCalc.TrataEntrada(AValue : string);
begin
  FCalc.Add( AValue[ High(AValue)] );
end;

end.
