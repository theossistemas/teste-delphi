unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  UModCalculadora, UCalculadora, Vcl.ExtCtrls, UCadFuncionario,
  UFuncionarioControle, UConexaoBanco, UControle;

type
  TFrmPrincipal = class(TForm)
    bitbtncalculadora: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    lbledtvalorbase: TLabeledEdit;
    Label2: TLabel;
    lbledtvaloresperado: TLabeledEdit;
    BtnTestarImpostoA: TButton;
    bitbtnfucionario: TBitBtn;
    lbledtvalorbaseB: TLabeledEdit;
    Label4: TLabel;
    lbledtvaloresperadoB: TLabeledEdit;
    BtnTestarImpostoB: TButton;
    Label3: TLabel;
    Label5: TLabel;
    LabeledEdit1: TLabeledEdit;
    Label6: TLabel;
    LabeledEdit2: TLabeledEdit;
    BtnTestarImpostoC: TButton;
    Panel2: TPanel;
    Label7: TLabel;
    lbledtsalariobase: TLabeledEdit;
    lbledtpercinss: TLabeledEdit;
    lbledtqtddependente: TLabeledEdit;
    lbledtvalorpordependenteir: TLabeledEdit;
    lbledtpercdescir: TLabeledEdit;
    BtnCalcularInss: TButton;
    lbledtvaloresperadofuncionario: TLabeledEdit;
    BtnCalcularIr: TButton;
    procedure bitbtncalculadoraClick(Sender: TObject);
    procedure BtnTestarImpostoAClick(Sender: TObject);
    procedure bitbtnfucionarioClick(Sender: TObject);
    procedure BtnTestarImpostoBClick(Sender: TObject);
    procedure BtnTestarImpostoCClick(Sender: TObject);
    procedure BtnCalcularInssClick(Sender: TObject);
    procedure BtnCalcularIrClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Conexao      : TConexaoBanco;
    Controle     : TControle;
    FCalculadora : TCalculadora;
    FFuncionario : TFuncionarioControle;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.bitbtncalculadoraClick(Sender: TObject);
begin

  FrmCalculadora.ShowModal;

end;

procedure TFrmPrincipal.bitbtnfucionarioClick(Sender: TObject);
begin
  FrmFuncionario.ShowModal;
end;

procedure TFrmPrincipal.BtnTestarImpostoAClick(Sender: TObject);
begin

  FCalculadora := TCalculadora.Create;
  Assert(FCalculadora.FuncaoA(StrToFloat(lbledtvalorbase.Text)) = StrToFloat(lbledtvaloresperado.Text),'Erro do Retorno do Imposto A');
  FCalculadora.Destroy;

end;

procedure TFrmPrincipal.BtnTestarImpostoBClick(Sender: TObject);
begin

  FCalculadora := TCalculadora.Create;
  Assert(FCalculadora.FuncaoB(StrToFloat(lbledtvalorbase.Text)) = StrToFloat(lbledtvaloresperado.Text),'Erro do Retorno do Imposto B');
  FCalculadora.Destroy;

end;

procedure TFrmPrincipal.BtnTestarImpostoCClick(Sender: TObject);
begin
  FCalculadora := TCalculadora.Create;
  Assert(FCalculadora.FuncaoC(StrToFloat(lbledtvalorbase.Text)) = StrToFloat(lbledtvaloresperado.Text),'Erro do Retorno do Imposto C');
  FCalculadora.Destroy;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  Conexao     := TConexaoBanco.Create;
  Controle    := TControle.Create;
end;

procedure TFrmPrincipal.BtnCalcularInssClick(Sender: TObject);
var
  salariobase, percentualinss : double;

begin

  salariobase    := StrToFloatDef(lbledtsalariobase.Text,0);
  percentualinss := StrToFloatDef(lbledtpercinss.Text,0);

  FFuncionario := TFuncionarioControle.Create(Controle);
  Assert(FFuncionario.CalculaInss(salariobase, percentualinss) = StrToFloat(lbledtvaloresperadofuncionario.Text),'Erro do Retorno do Cálculo do Inss');
  FCalculadora.Destroy;


end;

procedure TFrmPrincipal.BtnCalcularIrClick(Sender: TObject);
var
  salariobase, valorpordependente, percdescontoir, qtdedependente : double;

begin

  salariobase        := StrToFloatDef(lbledtsalariobase.Text,0);
  percdescontoir     := StrToFloatDef(lbledtpercdescir.Text,0);
  qtdedependente     := StrToFloatDef(lbledtqtddependente.Text,0);
  valorpordependente := StrToFloatDef(lbledtvalorpordependenteir.Text,0);

  FFuncionario := TFuncionarioControle.Create(Controle);
  Assert(FFuncionario.CalculaIR(salariobase, qtdedependente, valorpordependente, percdescontoir) = StrToFloat(lbledtvaloresperadofuncionario.Text),'Erro do Retorno do Cálculo do IR');
  FFuncionario.Destroy;

end;

end.
