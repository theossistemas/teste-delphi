unit uFrmCadastroFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.ComCtrls, Vcl.Mask, uFuncoes,
  System.ImageList, Vcl.ImgList, uFuncionario, uFuncionarioController,
  uDmFuncionario, System.StrUtils, System.Generics.Collections;

type
  TAcao = (actNovo, actAtualizar);

  TfrmCadastroFuncionario = class(TForm)
    pgCadastro: TPageControl;
    tbPesquisa: TTabSheet;
    tbCadastro: TTabSheet;
    pnlRodape: TPanel;
    btnNovo: TButton;
    strgridFuncionarios: TStringGrid;
    pnlPesquisa: TPanel;
    edtPesquisar: TLabeledEdit;
    btnAlterar: TButton;
    btnExcluir: TButton;
    pnlCadastro: TPanel;
    pnlRodapeCadastro: TPanel;
    strgridDependentes: TStringGrid;
    edtCPF: TMaskEdit;
    pnlCadastroDependente: TPanel;
    edtNome: TLabeledEdit;
    lblCPF: TLabel;
    edtSalario: TEdit;
    Label1: TLabel;
    btnPesquisar: TButton;
    chkINSS: TCheckBox;
    chkIR: TCheckBox;
    edtNomeDependente: TLabeledEdit;
    btnIncluirDependente: TButton;
    imgList: TImageList;
    btnCancelar: TButton;
    btnGravar: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtSalarioChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure strgridDependentesDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    bFormatando: Boolean;
    oFuncoes: TFuncoes;
    oFuncionario: TFuncionario;
    oAcao: TAcao;
    procedure FormatarGridPesquisa;
    procedure FormatarGriDependentes;
    procedure InicializarTela;
    procedure CadastrarNovoFuncionario;
    procedure CancelarCadastro;
    procedure LimparPainelCadastro;
    procedure LimparPainelCadastroDependente;
    procedure InserirNovoFuncionario;
    procedure PesquisarFuncionarios(sNome: String);
  public
    { Public declarations }
  end;

var
  frmCadastroFuncionario: TfrmCadastroFuncionario;

implementation

uses
  Vcl.Dialogs;

{$R *.dfm}

procedure TfrmCadastroFuncionario.btnCancelarClick(Sender: TObject);
begin
  CancelarCadastro();
end;

procedure TfrmCadastroFuncionario.btnGravarClick(Sender: TObject);
begin
  if oAcao = actNovo then begin
    InserirNovoFuncionario();
  end else begin
    //
  end;
end;

procedure TfrmCadastroFuncionario.btnNovoClick(Sender: TObject);
begin
  CadastrarNovoFuncionario();
end;

procedure TfrmCadastroFuncionario.btnPesquisarClick(Sender: TObject);
begin
  PesquisarFuncionarios(edtPesquisar.Text);
end;

procedure TfrmCadastroFuncionario.CancelarCadastro;
begin
  if MessageDlg('Deseja realmente cancelar o cadastro e perder os dados não'+
    ' salvos?', mtWarning, [mbyes,mbno], 0) = mrYes then begin
    pgCadastro.ActivePage := tbPesquisa;
    FreeAndNil(oFuncionario);
  end;
end;

procedure TfrmCadastroFuncionario.PesquisarFuncionarios(sNome: String);
var
  listaFuncionarios: TObjectList<TFuncionario>;
  oFuncionarioController: TFuncionarioController;
  oFunc: TFuncionario;
  iLinha: Integer;
begin
  oFuncionarioController := TFuncionarioController.Create;
  listaFuncionarios := TObjectList<TFuncionario>.Create;
  oFunc := TFuncionario.Create;
  try
    if oFuncionarioController.CarregarFuncionariosFiltroNome(sNome,
      listaFuncionarios) > 0 then begin
      strgridFuncionarios.RowCount := 1;
      for oFunc in listaFuncionarios do begin
        iLinha := strgridFuncionarios.RowCount;
        strgridFuncionarios.RowCount := iLinha + 1;
        strgridFuncionarios.Cells[0, iLinha] := IntToStr(oFunc.ID);
        strgridFuncionarios.Cells[1, iLinha] := oFunc.Nome;
      end;
    end;
  finally
    FreeAndNil(oFuncionarioController);
    FreeAndNil(oFunc);
  end;
end;

procedure TfrmCadastroFuncionario.edtSalarioChange(Sender: TObject);
begin
  if not bFormatando then begin
    bFormatando := True;
    edtSalario.Text := oFuncoes.FormatarMoeda(edtSalario.Text);
    edtSalario.SelStart := Length(edtSalario.Text);
    bFormatando := False;
  end;
end;

procedure TfrmCadastroFuncionario.FormatarGriDependentes;
begin
  strgridDependentes.Cells[0, 0] := 'Nome dependente';
  strgridDependentes.Cells[1, 0] := 'Calcula INSS';
  strgridDependentes.Cells[2, 0] := 'Calcula IR';
  strgridDependentes.ColWidths[0] := 300;
  strgridDependentes.ColWidths[3] := 25;
end;

procedure TfrmCadastroFuncionario.FormatarGridPesquisa;
begin
  strgridFuncionarios.Cells[0, 0] := 'Código';
  strgridFuncionarios.Cells[1, 0] := 'Nome';
  strgridFuncionarios.ColWidths[1] := 400;
end;

procedure TfrmCadastroFuncionario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmCadastroFuncionario := nil;
end;

procedure TfrmCadastroFuncionario.FormCreate(Sender: TObject);
begin
  oFuncoes := TFuncoes.Create;
  bFormatando := False;
  DmFuncionario := TDmFuncionario.Create(nil);
  FormatarGridPesquisa();
  FormatarGriDependentes();
  InicializarTela();
end;

procedure TfrmCadastroFuncionario.FormDestroy(Sender: TObject);
begin
  FreeAndNil(oFuncoes);
  FreeAndNil(DmFuncionario);
end;

procedure TfrmCadastroFuncionario.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
    key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

end;

procedure TfrmCadastroFuncionario.InicializarTela;
begin
  tbPesquisa.TabVisible := False;
  tbCadastro.TabVisible := False;
  pgCadastro.ActivePage := tbPesquisa;
  PesquisarFuncionarios('');
end;

procedure TfrmCadastroFuncionario.InserirNovoFuncionario;
var
  oFuncionarioController: TFuncionarioController;
  sMsg: String;
begin
  oFuncionarioController := TFuncionarioController.Create;
  try
    oFuncionario.Nome := edtNome.Text;
    oFuncionario.CPF := edtCPF.Text;
    oFuncionario.Salario := StrToFloat(ReplaceStr(edtSalario.Text, '.', ''));

    if not oFuncionarioController.ValidarDados(oFuncionario, sMsg) then begin
      MessageDlg(sMsg, mtWarning, [mbok], 0);
      Exit;
    end;

    if oFuncionarioController.Inserir(oFuncionario, sMsg) then begin
      MessageDlg('Funcionário salvo com sucesso!', mtInformation, [mbok], 0);
      pgCadastro.ActivePage := tbPesquisa;
      edtPesquisar.Text := '';
      PesquisarFuncionarios('');
      FreeAndNil(oFuncionario);
    end else begin
      MessageDlg(sMsg, mtError, [mbok], 0);
    end;
  finally
    FreeAndNil(oFuncionarioController);
  end;
end;

procedure TfrmCadastroFuncionario.LimparPainelCadastro;
begin
  edtNome.Text := '';
  edtSalario.Text := '0,00';
  edtCPF.Text := '';
end;

procedure TfrmCadastroFuncionario.LimparPainelCadastroDependente;
begin
  edtNomeDependente.Text := '';
  chkINSS.Checked := False;
  chkIR.Checked := False;
  strgridDependentes.RowCount := 1;
end;

procedure TfrmCadastroFuncionario.CadastrarNovoFuncionario;
var
  oFuncionarioController: TFuncionarioController;
begin
  if Assigned(oFuncionario) then begin
    FreeAndNil(oFuncionario);
  end;
  oFuncionario := TFuncionario.Create;

  oFuncionarioController := TFuncionarioController.Create;
  try
    oFuncionario.ID := oFuncionarioController.GetIDNovoFuncionario;
  finally
    FreeAndNil(oFuncionarioController);
  end;

  LimparPainelCadastro;
  LimparPainelCadastroDependente;

  pgCadastro.ActivePage := tbCadastro;
  edtNome.SetFocus;

  oAcao := actNovo;
end;

procedure TfrmCadastroFuncionario.strgridDependentesDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  oBMP: TBitmap;
  iEixoX, iEixoY: Integer;
begin
  //Incluindo imagens nas colunas que servirão como botões
  if (ARow <> 0) And (ACol in [3]) then begin
    oBMP := TBitmap.Create;
    try
      if ACol = 3 then begin
        imgList.GetBitmap(0, oBMP);
      end;
      iEixoX := Rect.Left + ((Rect.Right - Rect.Left) - oBMP.Width) div 2;
      iEixoY := Rect.Top + ((Rect.Bottom - Rect.Top) - oBMP.Height) div 2;
      strgridDependentes.Canvas.Draw(iEixoX,iEixoY, oBMP);
    finally
      FreeAndNil(oBMP);
    end;
  end;
end;

end.
