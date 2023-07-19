unit unCadFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.UITypes, Funcionario, unControllerFuncionario,
  Vcl.ExtCtrls, Data.DB, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, unCadDependente,
  Datasnap.DBClient, Dependente, unControllerDependente, System.Generics.Collections,
  Vcl.Mask, unMaskEditHelper, unUtils, unPesquisa, unCalculaImpostos;

type

  TfrmCadFuncionario = class(TForm)
    pnlDados: TPanel;
    lblId: TLabel;
    edtId: TEdit;
    lblNome: TLabel;
    edtNome: TEdit;
    lblCPF: TLabel;
    lblSalario: TLabel;
    edtSalario: TEdit;
    lblValorINSS: TLabel;
    edtINSS: TEdit;
    lblValorIR: TLabel;
    edtIR: TEdit;
    pnlButton: TPanel;
    grbDependentes: TGroupBox;
    grdDependentes: TDBGrid;
    btnInserirDependente: TBitBtn;
    btnAtualizarDependente: TBitBtn;
    btnRemoverDependente: TBitBtn;
    grbBotoes: TGroupBox;
    btnNovo: TButton;
    btnPesquisar: TButton;
    btnEditar: TButton;
    btnCancelar: TButton;
    btnExcluir: TButton;
    btnSalvar: TButton;
    cdsDependentes: TClientDataSet;
    cdsDependentesID: TIntegerField;
    cdsDependentesNOME: TStringField;
    cdsDependentesCALCULA_IR: TBooleanField;
    cdsDependentesCALCULA_INSS: TBooleanField;
    dscDependentes: TDataSource;
    cdsDependentesID_FUNCIONARIO: TIntegerField;
    edtCPF: TMaskEdit;
    cdsDependentesCALCULA_IR_SIMNAO: TStringField;
    cdsDependentesCALCULA_INSS_SIMNAO: TStringField;
    procedure btnNovoClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirDependenteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAtualizarDependenteClick(Sender: TObject);
    procedure btnRemoverDependenteClick(Sender: TObject);
    procedure edtSalarioExit(Sender: TObject);
    procedure edtSalarioKeyPress(Sender: TObject; var Key: Char);
    procedure cdsDependentesCalcFields(DataSet: TDataSet);
    procedure edtINSSExit(Sender: TObject);
    procedure edtIRExit(Sender: TObject);
  private
    FTipoAcao: TTipoAcao;
    procedure SetTipoAcao(const Value: TTipoAcao);
    procedure ChecarCamposObrigatorios();
    procedure LimparCampos();
    procedure HabilitaCampos(lAtivar: Boolean);
    procedure ControlaGridDependentes(lAtivar: Boolean);
    procedure ChamarTelaDependentes(Dependente: TDependente);
    procedure EntidadeDependenteToDataSet(Dependente: TDependente; cds: TClientDataSet);
    function DataSetToEntidadeDependente(): TDependente;
    function ObterListaDependentesDoDataSet(): TObjectList<TDependente>;
    procedure SalvarDependentes(objFuncionario: TFuncionario; IdFuncionario: Integer);
    procedure ChamarTelaPesquisa();
    procedure CalcularImpostos();
    procedure CalcularImposto_INSS(PossuiDependenteINSS: Boolean);
    procedure CalcularImposto_IR(QtdeDependentesIR: Integer);

    { Private declarations }
  protected
    property TipoAcao: TTipoAcao read FTipoAcao write SetTipoAcao;

    { Protected declarations }
  public

    { Public declarations }
  end;

var
  frmCadFuncionario: TfrmCadFuncionario;

implementation

{$R *.dfm}

procedure TfrmCadFuncionario.btnAtualizarDependenteClick(Sender: TObject);
begin
  if cdsDependentes.IsEmpty then
    Exit;

  ChamarTelaDependentes(DataSetToEntidadeDependente());
end;

procedure TfrmCadFuncionario.btnCancelarClick(Sender: TObject);
begin
  LimparCampos();
  TipoAcao := taNavegar;
end;

procedure TfrmCadFuncionario.btnEditarClick(Sender: TObject);
begin
  TipoAcao := taEditar;
  if edtNome.CanFocus then
    edtNome.SetFocus;
end;

procedure TfrmCadFuncionario.btnExcluirClick(Sender: TObject);
begin
  if Trim(edtId.Text) = EmptyStr then
    Exit;

  if (MessageDlg('Deseja excluir o Funcion�rio?', mtConfirmation, [mbYes, mbNo], 1) = mrYes) then
  begin
    var ControllerFunc := TControllerFuncionario.Create;
    var ControllerDep := TControllerDependente.Create;
    try
      var objFuncionario := ControllerFunc.ObterFuncionario(StrToInt(Trim(edtId.Text)));
      var Dependentes := ObterListaDependentesDoDataSet();

      ControllerDep.Remover(Dependentes);
      ControllerFunc.Remover(objFuncionario);
    finally
      ControllerDep.DisposeOf;
      ControllerFunc.DisposeOf;
    end;

  end;
  TipoAcao := taNavegar;
end;

procedure TfrmCadFuncionario.btnInserirDependenteClick(Sender: TObject);
begin
  if Trim(edtNome.Text) = EmptyStr then
    Exit;
  ChamarTelaDependentes(nil);
end;

procedure TfrmCadFuncionario.btnNovoClick(Sender: TObject);
begin
  TipoAcao := taInserir;
  if edtNome.CanFocus then
    edtNome.SetFocus;
end;

procedure TfrmCadFuncionario.btnPesquisarClick(Sender: TObject);
begin
  ChamarTelaPesquisa();
end;

procedure TfrmCadFuncionario.btnRemoverDependenteClick(Sender: TObject);
begin
  if cdsDependentes.IsEmpty then
    Exit;

  if (MessageDlg('Deseja remover o Dependente?', mtConfirmation, [mbYes, mbNo], 1) = mrYes) then
  begin
    var ControllerDep := TControllerDependente.Create;
    var Dependente := DataSetToEntidadeDependente;
    try
      ControllerDep.Remover(Dependente);
      cdsDependentes.Delete;
      CalcularImpostos();
    finally
      ControllerDep.DisposeOf;
      Dependente.DisposeOf;
    end;
  end;

end;

procedure TfrmCadFuncionario.btnSalvarClick(Sender: TObject);
begin
  ChecarCamposObrigatorios();

  var controllerFuncionario := TControllerFuncionario.Create;
  var objFuncionario := TFuncionario.Create;
  try
    if TipoAcao = taInserir then
      objFuncionario.Id := 0
    else
      objFuncionario.Id := StrToInt(edtId.Text);

    objFuncionario.Nome := Trim(edtNome.Text);
    objFuncionario.CPF := Trim(edtCPF.EditValue);
    objFuncionario.Salario := TUtils.TransformaValorStringParaFloat(edtSalario.Text);
    objFuncionario.Dependnetes.Clear;
    objFuncionario.Dependnetes := ObterListaDependentesDoDataSet();

    var IdFuncionario := controllerFuncionario.Salvar(objFuncionario);
    SalvarDependentes(objFuncionario, IdFuncionario);

  finally
    objFuncionario.DisposeOf;
    controllerFuncionario.DisposeOf;
    TipoAcao := taNavegar;
    LimparCampos();
  end;
end;

procedure TfrmCadFuncionario.CalcularImpostos;
begin
  if ((Trim(edtSalario.Text) = EmptyStr) or (Trim(edtSalario.Text) = VALOR_ZERO)) then
  begin
    edtINSS.Text := VALOR_ZERO;
    edtIR.Text := VALOR_ZERO;
    Exit;
  end;

  var possuiDependenteINSS := False;
  var QtdeDependentesIR := 0;
  var Dependentes := ObterListaDependentesDoDataSet();
  try
    for var Dependente in Dependentes do
    begin
      if Dependente.CalculaINSS then
        possuiDependenteINSS := True;

      if Dependente.CalculaIR then
        Inc(QtdeDependentesIR);
    end;
  finally
    Dependentes.DisposeOf;
  end;

  CalcularImposto_INSS(PossuiDependenteINSS);

  CalcularImposto_IR(QtdeDependentesIR);
end;

procedure TfrmCadFuncionario.CalcularImposto_INSS(PossuiDependenteINSS: Boolean);
var
  ImpostoINSS: TImposto;
begin
  ImpostoINSS := TCalculoINSS.Create;
  try
    ImpostoINSS.ValorBase := TUtils.TransformaValorStringParaFloat(edtSalario.Text);
    ImpostoINSS.PossuiDependenteINSS := possuiDependenteINSS;
    edtINSS.Text := FormatFloat(FORMATO_VALOR, ImpostoINSS.CalculaImposto());
  finally
    ImpostoINSS.DisposeOf;
  end;
end;

procedure TfrmCadFuncionario.CalcularImposto_IR(QtdeDependentesIR: Integer);
var
  ImpostoIR: TImposto;
begin
  ImpostoIR := TCalculoIR.Create;
  try
    ImpostoIR.ValorBase := TUtils.TransformaValorStringParaFloat(edtSalario.Text);
    ImpostoIR.NumeroDependentes := QtdeDependentesIR;
    edtIR.Text := FormatFloat(FORMATO_VALOR, ImpostoIR.CalculaImposto());
  finally
    ImpostoIR.DisposeOf;
  end;
end;

procedure TfrmCadFuncionario.cdsDependentesCalcFields(DataSet: TDataSet);
begin
  if cdsDependentesCALCULA_IR.AsBoolean then
    cdsDependentesCALCULA_IR_SIMNAO.AsString := TSimNao[tpSim]
  else
    cdsDependentesCALCULA_IR_SIMNAO.AsString := TSimNao[tpNao];

  if cdsDependentesCALCULA_INSS.AsBoolean then
    cdsDependentesCALCULA_INSS_SIMNAO.AsString := TSimNao[tpSim]
  else
    cdsDependentesCALCULA_INSS_SIMNAO.AsString := TSimNao[tpNao];
end;

procedure TfrmCadFuncionario.ChamarTelaDependentes(Dependente: TDependente);
begin
  if not Assigned(frmCadDependente) then
    Application.CreateForm(TfrmCadDependente, frmCadDependente);
  try
    if Assigned(Dependente) then
      frmCadDependente.Dependente := Dependente;

    frmCadDependente.IdFuncionario := StrToIntDef(edtId.Text, 0);
    frmCadDependente.ShowModal;
    if frmCadDependente.ModalResult = mrOk then
    begin
      EntidadeDependenteToDataSet(frmCadDependente.Dependente, cdsDependentes);
      CalcularImpostos();
    end;
  finally
    FreeAndNil(frmCadDependente);
  end;
end;

procedure TfrmCadFuncionario.ChamarTelaPesquisa;
begin
  if not Assigned(frmPesquisa) then
    Application.CreateForm(TfrmPesquisa, frmPesquisa);
  try
    frmPesquisa.ShowModal;
    if frmPesquisa.ModalResult = mrOk then
    begin
      var ControllerFunc := TControllerFuncionario.Create;
      var ControllerDep := TControllerDependente.Create;
      var Funcionario := ControllerFunc.ObterFuncionario(frmPesquisa.IdPesquisado);
      try
         edtId.Text := Funcionario.Id.ToString;
         edtNome.Text := Funcionario.Nome;
         edtCPF.SelectAll;
         edtCPF.SetEditValue(Funcionario.CPF);
         edtSalario.Text := FormatFloat(FORMATO_VALOR, Funcionario.Salario);

         var ListaDependentes := ControllerDep.ObterListaDeDependentes(Funcionario);
         for var Dependente in ListaDependentes do
            EntidadeDependenteToDataSet(Dependente, cdsDependentes);
         cdsDependentes.First;

         CalcularImpostos();
      finally
        Funcionario.DisposeOf;
        ControllerDep.DisposeOf;
        ControllerFunc.DisposeOf;

        TipoAcao := taConsultar;
      end;
    end
    else
      TipoAcao := taNavegar;
  finally
    FreeAndNil(frmPesquisa);
  end;
end;

procedure TfrmCadFuncionario.ChecarCamposObrigatorios;
begin
  if (Trim(edtNome.Text) = EmptyStr) then
  begin
    ShowMessage('Campo "Nome" n�o preenchido.' + sLineBreak +
      'Por favor, verifique.');
    if edtNome.CanFocus then
      edtNome.SetFocus;
    Abort;
  end;

  if (Trim(edtCPF.EditValue) = EmptyStr) then
  begin
    ShowMessage('Campo "CPF" n�o preenchido.' + sLineBreak +
      'Por favor, verifique.');
    if edtCPF.CanFocus then
      edtCPF.SetFocus;
    Abort;
  end
  else if (Length(Trim(edtCPF.EditValue)) < 11) then
  begin
    ShowMessage('Campo "CPF" incorreto.' + sLineBreak +
      'Por favor, verifique.');
    if edtCPF.CanFocus then
      edtCPF.SetFocus;
    Abort;
  end;

  if ((Trim(edtSalario.Text) = EmptyStr) or (Trim(edtSalario.Text) = VALOR_ZERO)) then
  begin
    ShowMessage('Campo "Sal�rio" n�o preenchido.' + sLineBreak +
      'Por favor, verifique.');
    if edtSalario.CanFocus then
      edtSalario.SetFocus;
    Abort;
  end;
end;

procedure TfrmCadFuncionario.ControlaGridDependentes(lAtivar: Boolean);
begin
  btnInserirDependente.Enabled := lAtivar;
  btnAtualizarDependente.Enabled := lAtivar;
  btnRemoverDependente.Enabled := lAtivar;

  grbDependentes.Enabled := lAtivar;
end;

function TfrmCadFuncionario.DataSetToEntidadeDependente: TDependente;
begin
  var Dependente := TDependente.Create;
  try
    Dependente.IdFuncionario := StrToIntDef(Trim(edtId.Text), 0);

    Dependente.Id := cdsDependentes.FieldByName('ID').AsInteger;
    Dependente.Nome := cdsDependentes.FieldByName('NOME').AsString;
    Dependente.CalculaIR := cdsDependentes.FieldByName('CALCULA_IR').AsBoolean;
    Dependente.CalculaINSS := cdsDependentes.FieldByName('CALCULA_INSS').AsBoolean;
  finally
    Result := Dependente;
  end;
end;

procedure TfrmCadFuncionario.edtINSSExit(Sender: TObject);
begin
  TEdit(Sender).Text := FormatFloat(FORMATO_VALOR, TUtils.TransformaValorStringParaFloat(TEdit(Sender).Text));
end;

procedure TfrmCadFuncionario.edtIRExit(Sender: TObject);
begin
  TEdit(Sender).Text := FormatFloat(FORMATO_VALOR, TUtils.TransformaValorStringParaFloat(TEdit(Sender).Text));
end;

procedure TfrmCadFuncionario.edtSalarioExit(Sender: TObject);
begin
  TEdit(Sender).Text := FormatFloat(FORMATO_VALOR, TUtils.TransformaValorStringParaFloat(TEdit(Sender).Text));
  CalcularImpostos();
end;

procedure TfrmCadFuncionario.edtSalarioKeyPress(Sender: TObject; var Key: Char);
begin
  var strEdit: string := TEdit(Sender).Text;
  if not (CharInSet(Key, [#8, #13, '0'..'9', ','])) or ((CharInSet(key, [','])) and (strEdit.CountChar(',') = 1) ) then
    Key := #0;
end;

procedure TfrmCadFuncionario.EntidadeDependenteToDataSet(Dependente: TDependente;
  cds: TClientDataSet);
begin
  if not Assigned(Dependente) then
    Exit;

  if not(cds.FindKey([Dependente.IdFuncionario, Dependente.Id, Dependente.Nome])) then
    cds.Append
  else
    cds.Edit;
  cds.FieldByName('ID_FUNCIONARIO').AsInteger := Dependente.IdFuncionario;
  cds.FieldByName('ID').AsInteger := Dependente.Id;
  cds.FieldByName('NOME').AsString := Dependente.Nome;
  cds.FieldByName('CALCULA_IR').AsBoolean := Dependente.CalculaIR;
  cds.FieldByName('CALCULA_INSS').AsBoolean := Dependente.CalculaINSS;
  cds.Post;
end;

procedure TfrmCadFuncionario.FormCreate(Sender: TObject);
begin
  cdsDependentes.CreateDataSet;
end;

procedure TfrmCadFuncionario.FormShow(Sender: TObject);
begin
  TipoAcao := taNavegar;
  if btnNovo.CanFocus then
    btnNovo.SetFocus;
end;

procedure TfrmCadFuncionario.HabilitaCampos(lAtivar: Boolean);
var
  CorFundo: TColor;
begin
  CorFundo := clWhite;
  if not lAtivar then
    CorFundo := clBtnFace;

  edtNome.Color := CorFundo;
  edtCPF.Color := CorFundo;
  edtSalario.Color := CorFundo;

  edtNome.ReadOnly := not lAtivar;
  edtCPF.ReadOnly := not lAtivar;
  edtSalario.ReadOnly := not lAtivar;
end;

procedure TfrmCadFuncionario.LimparCampos;
begin
  edtId.Clear;
  edtNome.Clear;
  edtCPF.Clear;
  edtSalario.Clear;
  edtIR.Clear;
  edtINSS.Clear;

  cdsDependentes.EmptyDataSet;
end;

function TfrmCadFuncionario.ObterListaDependentesDoDataSet: TObjectList<TDependente>;
begin
  Result := TObjectList<TDependente>.Create;

  cdsDependentes.First;
  while not cdsDependentes.Eof do
  begin
    var Dependente := TDependente.Create;
    Dependente.Id := cdsDependentes.FieldByName('ID').AsInteger;
    Dependente.Nome := cdsDependentes.FieldByName('NOME').AsString;
    Dependente.CalculaIR := cdsDependentes.FieldByName('CALCULA_IR').AsBoolean;
    Dependente.CalculaINSS := cdsDependentes.FieldByName('CALCULA_INSS').AsBoolean;
    Result.Add(Dependente);

    cdsDependentes.Next;
  end;
end;

procedure TfrmCadFuncionario.SalvarDependentes(objFuncionario: TFuncionario;
  IdFuncionario: Integer);
begin
  var ControllerDependente := TControllerDependente.Create;
  var ListaDepedentes := TObjectList<TDependente>.Create;
  try
    ListaDepedentes.Clear;
    for var Dependente in objFuncionario.Dependnetes do
    begin
      var Dep := TDependente.Create;
      Dep.Id := Dependente.Id;
      Dep.IdFuncionario := IdFuncionario;
      Dep.Nome := Dependente.Nome;
      Dep.CalculaIR := Dependente.CalculaIR;
      Dep.CalculaINSS := Dependente.CalculaINSS;

      ListaDepedentes.Add(Dep);
    end;

    ControllerDependente.Salvar(ListaDepedentes);
  finally
    ListaDepedentes.DisposeOf;
    ControllerDependente.DisposeOf;
  end;
end;

procedure TfrmCadFuncionario.SetTipoAcao(const Value: TTipoAcao);
begin
  FTipoAcao := Value;

  case FTipoAcao of
    taNavegar:
      begin
        HabilitaCampos(False);
        ControlaGridDependentes(False);

        btnNovo.Enabled := True;
        btnPesquisar.Enabled := True;
        btnEditar.Enabled := False;
        btnCancelar.Enabled := False;
        btnExcluir.Enabled := False;
        btnSalvar.Enabled := False;
      end;
    taInserir, taEditar:
      begin
        HabilitaCampos(True);
        ControlaGridDependentes(True);

        btnNovo.Enabled := False;
        btnPesquisar.Enabled := False;
        btnEditar.Enabled := False;
        btnCancelar.Enabled := True;
        btnExcluir.Enabled := False;
        btnSalvar.Enabled := True;
      end;
    taConsultar:
      begin
        HabilitaCampos(False);
        ControlaGridDependentes(False);

        btnNovo.Enabled := False;
        btnPesquisar.Enabled := False;
        btnEditar.Enabled := True;
        btnCancelar.Enabled := True;
        btnExcluir.Enabled := True;
        btnSalvar.Enabled := False;
      end;
  end;

end;

end.
