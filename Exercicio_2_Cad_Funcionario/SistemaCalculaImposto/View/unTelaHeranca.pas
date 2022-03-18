unit unTelaHeranca;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, unEnum, Datasnap.DBClient,
  System.ImageList, Vcl.ImgList, Math, unDmGeral, Winapi.Windows,
  unFormBasePadrao;

type
  TfrmTelaHeranca = class(TfrmFormBasePadrao)
    pgcPrincipal: TPageControl;
    pnlRodape: TPanel;
    tabListagem: TTabSheet;
    tabManutencao: TTabSheet;
    pnlListagemTopo: TPanel;
    mskPequisar: TMaskEdit;
    btnPesquisar: TBitBtn;
    grdListagem: TDBGrid;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnApagar: TBitBtn;
    btnFechar: TBitBtn;
    dtsListagem: TDataSource;
    lblIndice: TLabel;
    cdsListagem: TClientDataSet;
    pnlManutencao: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdListagemTitleClick(Column: TColumn);
    procedure mskPequisarChange(Sender: TObject);
    procedure grdListagemDblClick(Sender: TObject);
    procedure grdListagemDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    procedure ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
      btnApagar: TBitBtn; pgcPrincipal: TPageControl; Flag: Boolean);
    procedure ControlarIndiceTab(pgcPrincipal: TPageControl; indice: Integer);
    function RetornarCampoTraduzido(Campo: String): string;
    procedure ExibirLabelIndice(Campo: string; aLabel: TLabel);

  protected
    EstadoDoCadastro: TEstadoDoCadastro;
    procedure GravaRegistro; Virtual; Abstract;
  public
    { Public declarations }
    IndiceAtual: String;
  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}

procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
    pgcPrincipal, False);
  EstadoDoCadastro := ecInserir;
  cdsListagem.Insert;
end;

procedure TfrmTelaHeranca.ControlarBotoes(btnNovo, btnAlterar, btnCancelar,
  btnGravar, btnApagar: TBitBtn; pgcPrincipal: TPageControl; Flag: Boolean);
begin
  btnNovo.Enabled := Flag;
  btnAlterar.Enabled := Flag;
  btnApagar.Enabled := Flag;

  pgcPrincipal.Pages[0].TabVisible := Flag;
  pgcPrincipal.Pages[1].TabVisible := not Flag;

  btnCancelar.Enabled := not Flag;
  btnGravar.Enabled := not Flag;
end;

procedure TfrmTelaHeranca.ControlarIndiceTab(pgcPrincipal: TPageControl;
  indice: Integer);
begin
  if pgcPrincipal.Pages[indice].TabVisible then
    pgcPrincipal.TabIndex := indice;

end;

procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar, pgcPrincipal, False);
  ControlarIndiceTab(pgcPrincipal, 1);
  EstadoDoCadastro := ecAlterar;
end;

procedure TfrmTelaHeranca.btnApagarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
    pgcPrincipal, True);

  ControlarIndiceTab(pgcPrincipal, 0);

  EstadoDoCadastro := ecNenhum;
end;

procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
    pgcPrincipal, True);

  ControlarIndiceTab(pgcPrincipal, 0);

  EstadoDoCadastro := ecNenhum;
end;

procedure TfrmTelaHeranca.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
begin

  try
    ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
      pgcPrincipal, True);
    ControlarIndiceTab(pgcPrincipal, 0);
    GravaRegistro;
  finally
    EstadoDoCadastro := ecNenhum;
  end;

end;

procedure TfrmTelaHeranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cdsListagem.Close;
   inherited;
end;

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
var
  nI: Integer;
begin
  inherited;
  EstadoDoCadastro := ecNenhum;
  dtsListagem.DataSet := cdsListagem;
  grdListagem.DataSource := dtsListagem;

  grdListagem.Options := [dgTitles, dgIndicator, dgColumnResize, dgColLines,
    dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit,
    dgTitleClick, dgTitleHotTrack];

  ControlarIndiceTab(pgcPrincipal, 0);
end;

procedure TfrmTelaHeranca.FormShow(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
    pgcPrincipal, True);
end;

procedure TfrmTelaHeranca.grdListagemDblClick(Sender: TObject);
begin
  if not cdsListagem.IsEmpty then
    btnAlterar.Click;
end;

procedure TfrmTelaHeranca.grdListagemDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if ((Sender as TDBGrid).DataSource.DataSet.IsEmpty) then
    Exit;

  // Desenha um checkbox no dbgrid
  if Column.FieldName = 'SELECAO' then
  begin
    TDBGrid(Sender).Canvas.FillRect(Rect);

    if ((Sender as TDBGrid).DataSource.DataSet.FieldByName('SELECAO')
      .AsInteger = 1) then
      Check := DFCS_CHECKED
    else
      Check := 0;

    R := Rect;
    InflateRect(R, -2, -2); { Diminue o tamanho do CheckBox }
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON,
      DFCS_BUTTONCHECK or Check);
  end;

end;

procedure TfrmTelaHeranca.grdListagemTitleClick(Column: TColumn);
begin
  IndiceAtual := Column.FieldName;
  cdsListagem.IndexFieldNames := IndiceAtual;
  ExibirLabelIndice(IndiceAtual, lblIndice);
end;

procedure TfrmTelaHeranca.mskPequisarChange(Sender: TObject);
begin
  cdsListagem.Locate(IndiceAtual, TMaskEdit(Sender).Text,
    [loPartialKey, loCaseInsensitive]);
end;

function TfrmTelaHeranca.RetornarCampoTraduzido(Campo: String): string;
var
  I: Integer;
begin
  for I := 0 to Pred(cdsListagem.Fields.Count) do
  begin
    if UpperCase(cdsListagem.Fields[I].FieldName) = UpperCase(Campo) then
    begin
      Result := cdsListagem.Fields[I].DisplayLabel;
      Break;
    end;
  end;
end;

procedure TfrmTelaHeranca.ExibirLabelIndice(Campo: string; aLabel: TLabel);
begin
  aLabel.Caption := RetornarCampoTraduzido(Campo);
end;

end.
