unit uFrmCadastroFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.ComCtrls, Vcl.Mask, uFuncoes, System.ImageList, Vcl.ImgList;

type
  TfrmCadastroFuncionario = class(TForm)
    pgCadastro: TPageControl;
    tbPesquisa: TTabSheet;
    TabSheet2: TTabSheet;
    pnlRodape: TPanel;
    btnNovo: TButton;
    strgridPessoas: TStringGrid;
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
  private
    bFormatando: Boolean;
    oFuncoes: TFuncoes;
    procedure FormatarGridPesquisa;
    procedure FormatarGriDependentes;
  public
    { Public declarations }
  end;

var
  frmCadastroFuncionario: TfrmCadastroFuncionario;

implementation

{$R *.dfm}

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
  strgridPessoas.Cells[0, 0] := 'Código';
  strgridPessoas.Cells[1, 0] := 'Nome';
  strgridPessoas.ColWidths[1] := 400;
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
  FormatarGridPesquisa();
  FormatarGriDependentes();
end;

procedure TfrmCadastroFuncionario.FormDestroy(Sender: TObject);
begin
  FreeAndNil(oFuncoes);
end;

procedure TfrmCadastroFuncionario.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
    key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

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
