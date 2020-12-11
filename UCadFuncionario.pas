unit UCadFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, UConexaoBanco, UControle,
  UFuncionarioControle, Vcl.Buttons;

type
  TFrmFuncionario = class(TForm)
    lbledtnomefunc: TLabeledEdit;
    lblcpf: TLabeledEdit;
    lbledtsalario: TLabeledEdit;
    btnincluir: TButton;
    Label1: TLabel;
    Label2: TLabel;
    lbledtnomedependente: TLabeledEdit;
    chkboxiscalculair: TCheckBox;
    chkboxiscalculainss: TCheckBox;
    DBGrid1: TDBGrid;
    btnincluirdependente: TButton;
    DBGrid2: TDBGrid;
    Button1: TButton;
    CDSFuncionario: TClientDataSet;
    DSFuncionario: TDataSource;
    CDSDependente: TClientDataSet;
    DSDependente: TDataSource;
    CDSFuncionariocpf: TStringField;
    CDSFuncionarionome: TStringField;
    CDSFuncionariosalario: TFloatField;
    CDSDependentecpf: TStringField;
    CDSDependentenome: TStringField;
    CDSDependenteiscalculoir: TBooleanField;
    CDSDependenteiscalculoinss: TBooleanField;
    BtnEncerrar: TButton;
    SpeedButton1: TSpeedButton;
    procedure btnincluirClick(Sender: TObject);
    procedure btnincluirdependenteClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BtnEncerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    percentualinss   : double;
    vlrdescinss      : double;
    vlrpordependente : double;
    percdescir       : double;
    vlrir            : double;
    qtdedependente   : integer;

    procedure ativar_classes;


  public
    { Public declarations }
    Conexao      : TConexaoBanco;
    Controle     : TControle;
    Funcionario  : TFuncionarioControle;
    Dependente   : TDependenteControle;

  end;

var
  FrmFuncionario: TFrmFuncionario;

implementation

{$R *.dfm}

procedure TFrmFuncionario.ativar_classes;
begin

  Conexao     := TConexaoBanco.Create;
  Controle    := TControle.Create;
  Funcionario := TFuncionarioControle.Create(controle);
  Dependente  := TDependenteControle.Create;

end;

procedure TFrmFuncionario.BtnEncerrarClick(Sender: TObject);
begin

  try
    begin
      Conexao.Destroy;
      Controle.Destroy;
      Funcionario.Destroy;
      dependente.Destroy;
    end;
  except
  end;

  close;

end;

procedure TFrmFuncionario.btnincluirClick(Sender: TObject);
begin

  if Trim(lblcpf.Text) = '' then begin
    showmessage('Informe o Número do Cpf');
    lblcpf.SetFocus;
    exit;
  end;

  CDSFuncionario.Insert;
  CDSFuncionario.FieldByName('cpf').AsString    := lblcpf.Text;
  CDSFuncionario.FieldByName('nome').AsString   := lbledtnomefunc.Text;
  CDSFuncionario.FieldByName('salario').AsFloat := StrToFloat(lbledtsalario.Text);
  CDSFuncionario.Post;

end;

procedure TFrmFuncionario.btnincluirdependenteClick(Sender: TObject);
begin

  if Trim(lbledtnomedependente.Text) = '' then begin
    showmessage('Informe o Nome do Dependente');
    lbledtnomedependente.SetFocus;
    exit;
  end;

  CDSDependente.Insert;
  CDSDependente.FieldByName('cpf').AsString            := lblcpf.Text;
  CDSDependente.FieldByName('nome').AsString           := lbledtnomedependente.Text;
  CDSDependente.FieldByName('iscalculoir').AsBoolean   := chkboxiscalculair.Checked;
  CDSDependente.FieldByName('iscalculoinss').AsBoolean := chkboxiscalculainss.Checked;
  CDSDependente.Post;

end;

procedure TFrmFuncionario.Button1Click(Sender: TObject);
begin

  if Conexao.ConexaoBanco.Connected = False then begin
    Showmessage('Banco de Dados NÃO CONECTADO');
    exit;
  end;

  CDSFuncionario.First;

  while CDSFuncionario.Eof = false do begin

    vlrdescinss    := 0;
    qtdedependente := 0;
    vlrir          := 0;

    // Calculo do INSS com base no dependente
    CDSDependente.Filtered := False;
    CDSDependente.Filter := 'cpf = ' + QuotedStr(CDSFuncionario.FieldByName('cpf').asstring);
    CDSDependente.Filtered := True;
    while CDSDependente.Eof = False do begin

      if CDSDependente.FieldByName('iscalculoir').AsBoolean = True then begin
        qtdedependente := qtdedependente + 1;
      end;

      if CDSDependente.FieldByName('iscalculoinss').AsBoolean = True then begin
        vlrdescinss := vlrdescinss + funcionario.CalculaInss(CDSFuncionario.FieldByName('salario').asfloat, percentualinss);
      end;

    // persitencia do dependente
      dependente.Cpf           :=  CDSFuncionario.FieldByName('cpf').AsString;
      dependente.Nome          :=  CDSDependente.FieldByName('nome').AsString;
      dependente.IsCalculoInss :=  CDSFuncionario.FieldByName('iscalculoinss').AsBoolean;
      dependente.IsCalculoir   :=  CDSFuncionario.FieldByName('iscalculoir').AsBoolean;

      if dependente.InsereDependente = False then begin
        showmessage('Persistência do Cadastro do Dependente do Funcionario com Problema');
        exit;
      end;

      CDSDependente.Next;
    end;

    // calculo do ir
    vlrir := funcionario.CalculaIR(CDSFuncionario.FieldByName('salario').asfloat, qtdedependente, vlrpordependente, percdescir );

    funcionario.Cpf       := CDSFuncionario.FieldByName('cpf').AsString;
    funcionario.Nome      := CDSFuncionario.FieldByName('nome').AsString;
    funcionario.Salario   := CDSFuncionario.FieldByName('salario').AsFloat;
    funcionario.ValorInss := vlrdescinss;
    funcionario.ValorIr   := vlrir;

    if funcionario.Inserefuncionario = False then begin
      showmessage('Persistência do Cadastro do Funcionario com Problema');
      exit;
    end;

    CDSFuncionario.Next;
  end;



end;

procedure TFrmFuncionario.FormCreate(Sender: TObject);
begin
  percentualinss   := 8;
  vlrpordependente := 100;
  percdescir       := 15;

  ativar_classes;

end;

procedure TFrmFuncionario.SpeedButton1Click(Sender: TObject);
begin

  if Trim(lblcpf.Text) = '' then begin
    showmessage('Informe o Número do Cpf');
    lblcpf.SetFocus;
    exit;
  end;

  if funcionario.PesquisaFuncionario(lblcpf.text) = True then begin
    showmessage('Cpf já cadastrado na base de dados');
    exit;
  end;

  if funcionario.PesquisaFuncionario(lblcpf.text) = False then begin
    showmessage('Cpf Não cadastrado na base de dados');
    exit;
  end;

end;

end.
