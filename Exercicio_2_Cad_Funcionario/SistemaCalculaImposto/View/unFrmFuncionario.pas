unit unFrmFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  unTelaHeranca, Data.DB, Datasnap.DBClient, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls, unEnum,
  System.Generics.Collections, unFuncionario, unFuncionarioController,
  unDependente, unDependenteController, System.ImageList, Vcl.ImgList;

type
  TfrmFuncionarios = class(TfrmTelaHeranca)
    pnlDependentes: TPanel;
    cdsDependente: TClientDataSet;
    dtsDependentes: TDataSource;
    pnlDadosFuncionario: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    dbeNome: TDBEdit;
    dbeCPF: TDBEdit;
    dbeSalario: TDBEdit;
    dbeINSS: TDBEdit;
    dbeIR: TDBEdit;
    pnlCadastroDependentes: TPanel;
    pnlGridDependentes: TPanel;
    grdDependentes: TDBGrid;
    btnDependenteGravar: TButton;
    btnDependenteApagar: TButton;
    Panel4: TPanel;
    Label7: TLabel;
    edtDependenteNome: TDBEdit;
    btnDependenteNovo: TButton;
    btnDependenteAlterar: TButton;
    chkDependenteINSS: TDBCheckBox;
    chkDependenteIR: TDBCheckBox;
    btnDependenteCancelar: TButton;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnApagarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure cdsListagemAfterScroll(DataSet: TDataSet);
    procedure cdsListagemAfterOpen(DataSet: TDataSet);
    procedure btnDependenteNovoClick(Sender: TObject);
    procedure btnDependenteGravarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure chkDependenteINSSClick(Sender: TObject);
    procedure chkDependenteIRClick(Sender: TObject);
    procedure grdDependentesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CheckBoxDbgridDrawColumnCell(Sender: TObject; const Rect: TRect;
      Column: TColumn; const pFieldName: string);
    procedure cdsDependenteGetText(Sender: TField; var Text: string; DisplayText: Boolean);
       procedure grdDependentesColEnter(Sender: TObject);
    procedure dtsDependentesStateChange(Sender: TObject);
    procedure btnDependenteAlterarClick(Sender: TObject);
    procedure grdDependentesDblClick(Sender: TObject);
    procedure btnDependenteApagarClick(Sender: TObject);
    procedure cdsDependenteNewRecord(DataSet: TDataSet);
    procedure btnDependenteCancelarClick(Sender: TObject);
    procedure dtsDependentesDataChange(Sender: TObject; Field: TField);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
    FFuncionarioController: TFuncionarioController;
    FListaFuncionarios: TObjectList<TFuncionario>;
    FDependenteController: TDependenteController;
    procedure PreencheDataSetFuncionario;
    procedure PreencherDatasetDependentes;
    procedure CriaFieldsFuncionario;
    procedure CriaFieldsDependentes;
    function SalvarFuncionario: Boolean;
    procedure HabilitaInabilitaDependentes(const pHabilitarDependentes : Boolean);
  protected
    procedure GravaRegistro; Override;
  public
    { Public declarations }
  end;

var
  frmFuncionarios: TfrmFuncionarios;

implementation

uses
  unMyLibrary, System.Math;

{$R *.dfm}

procedure TfrmFuncionarios.btnAlterarClick(Sender: TObject);
begin
  if cdsListagem.IsEmpty then exit;

  inherited;
  dbeNome.SetFocus
end;

procedure TfrmFuncionarios.btnApagarClick(Sender: TObject);
var
  vCodigoFuncionario: Integer;
begin
    if cdsListagem.IsEmpty then exit;
  if not cdsDependente.IsEmpty then
  begin
    ShowMessage('Este Funcionário Possui Dependentes e Não Pode ser Deletado!');
    Exit;
  end;

  vCodigoFuncionario := cdsListagem.FieldByName('CODIGO').AsInteger;
  inherited;
  if FFuncionarioController.Delete(vCodigoFuncionario) then
  begin
    cdsListagem.Delete;
    ShowMessage('Funcionário ' + IntToStr(vCodigoFuncionario) +
      ' foi excluído com sucesso.');
  end;
end;

procedure TfrmFuncionarios.btnCancelarClick(Sender: TObject);
begin
  inherited;
  cdsListagem.Cancel;
  cdsDependente.Cancel;
end;

procedure TfrmFuncionarios.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  PreencheDataSetFuncionario;
end;

procedure TfrmFuncionarios.btnDependenteCancelarClick(Sender: TObject);
begin
  cdsDependente.Cancel;
end;

procedure TfrmFuncionarios.btnDependenteGravarClick(Sender: TObject);
var
  vDependente, vDependenteRetorno: TDependente;
begin
  if SalvarFuncionario then
  begin
    cdsListagem.Edit;
    EstadoDoCadastro := ecAlterar;
  end;

  vDependente := TDependente.Create;
  try
    // cdsDependente.Post;
    if (cdsDependente.State in dsEditModes) then
    begin
      vDependente.CodigoFuncionario := cdsListagem.FieldByName('CODIGO').AsInteger;
      vDependente.Nome := cdsDependente.FieldByName('NOME').AsString;
      vDependente.CalcularIR := cdsDependente.FieldByName('CALCULARIR').AsBoolean;
      vDependente.CalcularINSS := cdsDependente.FieldByName('CALCULARINSS').AsBoolean;

      if cdsDependente.State = dsInsert then
      begin
        vDependenteRetorno := FDependenteController.Post(vDependente);
      end
      else if cdsDependente.State = dsEdit then
      begin
        vDependente.Codigo := cdsDependente.FieldByName('CODIGO').AsInteger;
        vDependenteRetorno := FDependenteController.Put(vDependente);
      end;

      PreencheDataSetFuncionario;
      PreencherDatasetDependentes;

      cdsListagem.Locate('CODIGO', vDependente.CodigoFuncionario, []);
      cdsDependente.Locate('CODIGO', vDependente.Codigo, [])
    end
  finally
    if Assigned(vDependente) then FreeAndNil(vDependente);
    if Assigned(vDependenteRetorno) then FreeAndNil(vDependenteRetorno)
  end;
end;

procedure TfrmFuncionarios.btnDependenteAlterarClick(Sender: TObject);
begin
  inherited;
  if cdsDependente.IsEmpty then
    exit;
  if SalvarFuncionario then
  begin
    cdsListagem.Edit;
    EstadoDoCadastro := ecAlterar;
  end;
  cdsDependente.Edit;
  edtDependenteNome.SetFocus;
end;

procedure TfrmFuncionarios.btnDependenteApagarClick(Sender: TObject);
begin
  if cdsDependente.IsEmpty then
    exit;
  if SalvarFuncionario then
  begin
    cdsListagem.Edit;
    EstadoDoCadastro := ecAlterar;
  end;

  FDependenteController.Delete(cdsDependente.FieldByName('CODIGO').AsInteger);
  cdsDependente.Delete;

end;

procedure TfrmFuncionarios.btnNovoClick(Sender: TObject);
begin
  inherited;
  dbeNome.SetFocus;
end;

procedure TfrmFuncionarios.btnDependenteNovoClick(Sender: TObject);
begin
  inherited;
  if SalvarFuncionario then
  begin
    cdsListagem.Edit;
    EstadoDoCadastro := ecAlterar;
  end;
  cdsDependente.Insert;
  edtDependenteNome.SetFocus;
end;

procedure TfrmFuncionarios.btnGravarClick(Sender: TObject);
begin
  if (EstadoDoCadastro = ecNenhum) then
    raise Exception.Create('Funcionário Não Está em Edição ou Inserção');

  if dbeNome.Text = EmptyStr then
  begin
    ShowMessage('Informe o nome');
    dbeNome.SetFocus;
    Exit;
  end;

  if Trim(dbeCPF.Text) = EmptyStr then
  begin
    ShowMessage('Informe o CPF');
    dbeCPF.SetFocus;
    Exit;
  end;

  if dbeSalario.Text = EmptyStr then
  begin
    ShowMessage('Informe o Salário');
    dbeSalario.SetFocus;
    Exit;
  end;
  inherited;

end;

procedure TfrmFuncionarios.cdsDependenteGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  Text := EmptyStr;
end;


procedure TfrmFuncionarios.cdsDependenteNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('CALCULARIR').AsBoolean := False;
  DataSet.FieldByName('CALCULARINSS').AsBoolean := False;
end;

procedure TfrmFuncionarios.cdsListagemAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('CPF').EditMask := '!999\.999\.999\-99;0;_';
  TNumericField(DataSet.FieldByName('SALARIO')).DisplayFormat := '###,##0.00';
  TNumericField(DataSet.FieldByName('INSS')).DisplayFormat := '###,##0.00';
  TNumericField(DataSet.FieldByName('IR')).DisplayFormat := '###,##0.00';
end;

procedure TfrmFuncionarios.cdsListagemAfterScroll(DataSet: TDataSet);
begin
  PreencherDatasetDependentes;
end;

procedure TfrmFuncionarios.CheckBoxDbgridDrawColumnCell(Sender: TObject;
  const Rect: TRect; Column: TColumn; const pFieldName: string);
var
  Check: Integer;
  R: TRect;
begin
  if ((Sender as TDBGrid).DataSource.DataSet.IsEmpty) then
    Exit;
  if Column.FieldName = pFieldName then
  begin
    TDBGrid(Sender).Canvas.FillRect(Rect);

    if ((Sender as TDBGrid).DataSource.DataSet.FieldByName(pFieldName).AsBoolean)
    then
      Check := DFCS_CHECKED
    else
      Check := 0;

    R := Rect;
    InflateRect(R, -2, -2);
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON,
      DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmFuncionarios.chkDependenteINSSClick(Sender: TObject);
begin
  cdsDependente.Edit;
  cdsDependente.FieldByName('CALCULARINSS').AsBoolean :=
    not cdsDependente.FieldByName('CALCULARINSS').AsBoolean;
end;

procedure TfrmFuncionarios.chkDependenteIRClick(Sender: TObject);
begin
  inherited;
  cdsDependente.Edit;
  cdsDependente.FieldByName('CALCULARIR').AsBoolean :=
    not cdsDependente.FieldByName('CALCULARIR').AsBoolean;
end;

procedure TfrmFuncionarios.CriaFieldsDependentes;
begin
  cdsDependente.FieldDefs.Clear;
  cdsDependente.FieldDefs.Add('CODIGO', ftInteger);
  cdsDependente.FieldDefs.Add('NOME', ftString, 100, False);
  cdsDependente.FieldDefs.Add('CALCULARINSS', ftBoolean);
  cdsDependente.FieldDefs.Add('CALCULARIR', ftBoolean);
  cdsDependente.CreateDataSet;

  cdsDependente.FieldByName('CALCULARINSS').OnGetText := cdsDependenteGetText;
  cdsDependente.FieldByName('CALCULARIR').OnGetText := cdsDependenteGetText;
end;

procedure TfrmFuncionarios.CriaFieldsFuncionario;
begin
  cdsListagem.FieldDefs.Clear;
  cdsListagem.FieldDefs.Add('Codigo', ftInteger);
  cdsListagem.FieldDefs.Add('Nome', ftString, 100, False);
  cdsListagem.FieldDefs.Add('CPF', ftString, 20, False);
  cdsListagem.FieldDefs.Add('Salario', ftFloat);
  cdsListagem.FieldDefs.Add('INSS', ftFloat);
  cdsListagem.FieldDefs.Add('IR', ftFloat);

  cdsListagem.CreateDataSet;
end;

procedure TfrmFuncionarios.dtsDependentesDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  HabilitaInabilitaDependentes(dtsDependentes.State in dsEditModes);
end;

procedure TfrmFuncionarios.dtsDependentesStateChange(Sender: TObject);
begin
  inherited;
  HabilitaInabilitaDependentes(dtsDependentes.State in dsEditModes);
end;

procedure TfrmFuncionarios.grdDependentesColEnter(Sender: TObject);
begin
  inherited;
  if (UpperCase(TDBGrid(Sender).SelectedField.FieldName) = 'CALCULARINSS') or
    (UpperCase(TDBGrid(Sender).SelectedField.FieldName) = 'CALCULARIR') then
    TDBGrid(Sender).Options := TDBGrid(Sender).Options - [dgEditing]
  else
    TDBGrid(Sender).Options := TDBGrid(Sender).Options + [dgEditing];
end;

procedure TfrmFuncionarios.grdDependentesDblClick(Sender: TObject);
begin
  inherited;
  if not cdsDependente.IsEmpty then
    btnDependenteAlterar.Click;
end;

procedure TfrmFuncionarios.grdDependentesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  CheckBoxDbgridDrawColumnCell(Sender, Rect, Column, 'CALCULARINSS');
  CheckBoxDbgridDrawColumnCell(Sender, Rect, Column, 'CALCULARIR');
end;

procedure TfrmFuncionarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FListaFuncionarios) then
    FreeAndNil(FListaFuncionarios);

  FreeAndNil(FDependenteController);
  FreeAndNil(FFuncionarioController);

  inherited;

end;

procedure TfrmFuncionarios.FormCreate(Sender: TObject);
begin
  CriaFieldsFuncionario;
  CriaFieldsDependentes;
  FFuncionarioController := TFuncionarioController.Create;
  FDependenteController := TDependenteController.Create;
  // PreencherDataset;
  PreencheDataSetFuncionario;
  inherited;

end;

procedure TfrmFuncionarios.GravaRegistro;
begin
  if SalvarFuncionario then
  begin
    ShowMessage('Funcionário Salvo Com Sucesso.');
  end;
end;

procedure TfrmFuncionarios.HabilitaInabilitaDependentes
  (const pHabilitarDependentes: Boolean);
begin
  edtDependenteNome.Enabled := pHabilitarDependentes;
  chkDependenteINSS.Enabled := pHabilitarDependentes;
  chkDependenteIR.Enabled := pHabilitarDependentes;
  chkDependenteIR.Enabled := pHabilitarDependentes;
  btnDependenteGravar.Enabled := pHabilitarDependentes;
  btnDependenteCancelar.Enabled := pHabilitarDependentes;
  btnDependenteNovo.Enabled := not pHabilitarDependentes;
  btnDependenteApagar.Enabled := not pHabilitarDependentes;
  btnDependenteAlterar.Enabled := not pHabilitarDependentes ;
  if cdsDependente.IsEmpty then
  begin
    btnDependenteApagar.Enabled  := False;
    btnDependenteAlterar.Enabled := False;
  end;
end;

procedure TfrmFuncionarios.PreencheDataSetFuncionario;
begin
  if Assigned(FListaFuncionarios) then
    FreeAndNil(FListaFuncionarios);

  if mskPequisar.Text = EmptyStr then
    FListaFuncionarios := FFuncionarioController.GetAll
  else
    FListaFuncionarios := FFuncionarioController.GetByNome
      ('%' + Trim(mskPequisar.Text) + '%');

  TMyLibrary.PreencheDataset(TObjectList<TObject>(FListaFuncionarios),
    cdsListagem, TFuncionario, ['CODIGO', 'NOME', 'CPF', 'SALARIO', 'INSS',
    'IR'], ['CODIGO', 'NOME', 'CPF', 'SALARIO', 'INSS', 'IR']);
  cdsListagem.IndexFieldNames := 'CODIGO';
  cdsListagem.First;
end;

procedure TfrmFuncionarios.PreencherDatasetDependentes;
var
  vFuncionario: TFuncionario;
  vListaDependentes: TObjectList<TDependente>;
begin
  cdsDependente.EmptyDataSet;
  for vFuncionario in FListaFuncionarios do
  begin
    if cdsListagem.FieldByName('CODIGO').AsInteger = vFuncionario.Codigo then
    begin
      vListaDependentes := vFuncionario.ListaDendentes;
      TMyLibrary.PreencheDataset(TObjectList<TObject>(vListaDependentes),
        cdsDependente, TDependente, ['CODIGO', 'NOME', 'CalcularINSS',
        'CalcularIR'], ['CODIGO', 'NOME', 'CALCULARINSS', 'CALCULARIR']);

      Break
    end;
  end;
end;

function TfrmFuncionarios.SalvarFuncionario: Boolean;
var
  Funcionario, FuncionarioRetorno: TFuncionario;
begin
  Result := False;
  Funcionario := TFuncionario.Create;
  try
    Funcionario.Nome := cdsListagem.FieldByName('NOME').Text;
    Funcionario.CPF := cdsListagem.FieldByName('CPF').Text;
    Funcionario.Salario := cdsListagem.FieldByName('SALARIO').AsFloat;

    if (EstadoDoCadastro = ecInserir) then
    begin
      FuncionarioRetorno := FFuncionarioController.Post(Funcionario);
      if Assigned(FuncionarioRetorno) then
      begin
        cdsListagem.FieldByName('CODIGO').AsInteger := FuncionarioRetorno.Codigo;
        cdsListagem.FieldByName('INSS').AsFloat := FuncionarioRetorno.INSS;
        cdsListagem.FieldByName('IR').AsFloat := FuncionarioRetorno.IR;
        cdsListagem.Post;

        Result := True;
      end;
    end
    else if (EstadoDoCadastro = ecAlterar) then
    begin
      Funcionario.Codigo := cdsListagem.FieldByName('CODIGO').AsInteger;
      FuncionarioRetorno := FFuncionarioController.Put(Funcionario);

      if Assigned(FuncionarioRetorno) then
      begin
        cdsListagem.Edit;
        cdsListagem.FieldByName('INSS').AsFloat := FuncionarioRetorno.INSS;
        cdsListagem.FieldByName('IR').AsFloat := FuncionarioRetorno.IR;
        cdsListagem.Post;
        Result := True;
      end;
    end
  finally
    if Assigned(Funcionario) then FreeAndNil(Funcionario);
  end;
end;

end.
