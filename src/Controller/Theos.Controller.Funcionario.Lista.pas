unit Theos.Controller.Funcionario.Lista;

interface

uses
  Vcl.Forms, System.SysUtils, Data.DB, Vcl.Controls, Winapi.Windows,

  Theos.Lib.Resource,
  Theos.View.Funcionario.Lista,
  Theos.Controller.Funcionario.Ficha,
  Theos.Model.Funcionario;

type
  TControllerFuncionarioLista = class sealed
  strict private
    var
      FView: TViewFuncionarioLista;
      FParent: TWinControl;
      FOnAfterScroll: TDataSetNotifyEvent;

    procedure SetOnAfterScroll(const Value: TDataSetNotifyEvent);

    procedure Init;
    procedure BindEvents;

    procedure BtnInserirClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure DBGridPrincipalDblClick(Sender: TObject);
    procedure AlteraRegistroSelecionado;

  public
    property Parent: TWinControl read FParent write FParent;
    property OnAfterScroll: TDataSetNotifyEvent read FOnAfterScroll write SetOnAfterScroll;

    constructor Create; reintroduce;
    destructor Destroy; override;
    function ShowModal: Integer;
    procedure Show;
  end;

implementation

constructor TControllerFuncionarioLista.Create;
begin
  inherited Create;
  Init;
end;

destructor TControllerFuncionarioLista.Destroy;
begin
  FView.DBGridPrincipal.DataSource.DataSet.Free;
  FView.DBGridPrincipal.DataSource.Free;

  FView.Release;
  FView := nil;

  inherited Destroy;
end;

procedure TControllerFuncionarioLista.Init;
begin
  Application.CreateForm(TViewFuncionarioLista, FView);
  var Model := TModelFuncionario.Create;
  try
    FView.DBGridPrincipal.DataSource := TDataSource.Create(FView);
    FView.DBGridPrincipal.DataSource.DataSet := Model.CarregarListaDataSet;
  finally
    Model.Free;
  end;
  TNumericField(FView.DBGridPrincipal.DataSource.DataSet.FieldByName('SALARIO')).DisplayFormat := MASCARA_NUMERO;
  TStringField(FView.DBGridPrincipal.DataSource.DataSet.FieldByName('CPF')).EditMask := MASCARA_CPF;
  BindEvents;
end;

function TControllerFuncionarioLista.ShowModal: Integer;
begin
  FView.Parent := nil;
  FView.BorderStyle := bsSizeable;
  FView.Align := alNone;

  if Assigned(FOnAfterScroll) then
    FOnAfterScroll(FView.DBGridPrincipal.DataSource.DataSet);

  Result := FView.ShowModal;
end;

procedure TControllerFuncionarioLista.Show;
begin
  FView.Parent := nil;
  FView.BorderStyle := bsSizeable;
  FView.Align := alNone;

  if Assigned(FParent) then
  begin
    FView.Parent := FParent;
    FView.BorderStyle := bsNone;
    FView.Align := alClient;
  end;

  if Assigned(FOnAfterScroll) then
    FOnAfterScroll(FView.DBGridPrincipal.DataSource.DataSet);

  FView.Show;
end;

procedure TControllerFuncionarioLista.BindEvents;
begin
  FView.BtnInserir.OnClick := BtnInserirClick;
  FView.BtnAlterar.OnClick := BtnAlterarClick;
  FView.BtnExcluir.OnClick := BtnExcluirClick;
  FView.DBGridPrincipal.OnDblClick := DBGridPrincipalDblClick;
end;

procedure TControllerFuncionarioLista.BtnInserirClick(Sender: TObject);
begin
  var Ficha := TControllerFuncionarioFicha.Create;
  try
    if Ficha.ShowModal <> mrOk then
      Exit;
    FView.DBGridPrincipal.DataSource.DataSet.Refresh;
    FView.DBGridPrincipal.DataSource.DataSet.Locate('CODIGO', Ficha.Codigo, []);
  finally
    Ficha.Free;
  end;
end;

procedure TControllerFuncionarioLista.BtnAlterarClick(Sender: TObject);
begin
  AlteraRegistroSelecionado;
end;

procedure TControllerFuncionarioLista.BtnExcluirClick(Sender: TObject);
begin
  if FView.DBGridPrincipal.DataSource.DataSet.IsEmpty then
    Exit;

  if Application.MessageBox('Deseja Excluir o Funcionário?', PChar(Application.Title), MB_YESNO + MB_ICONQUESTION) <> IDYES then
    Exit;

  var Codigo := FView.DBGridPrincipal.DataSource.DataSet.FieldByName('CODIGO').AsLargeInt;
  var Model := TModelFuncionario.Create;
  try
    Model.CODIGO := Codigo;
    Model.Delete;
    FView.DBGridPrincipal.DataSource.DataSet.Refresh;
  finally
    Model.Free;
  end;
end;

procedure TControllerFuncionarioLista.AlteraRegistroSelecionado;
begin
  if FView.DBGridPrincipal.DataSource.DataSet.IsEmpty then
    Exit;

  var Codigo := FView.DBGridPrincipal.DataSource.DataSet.FieldByName('CODIGO').AsLargeInt;
  var Ficha := TControllerFuncionarioFicha.Create(Codigo);
  try
    if Ficha.ShowModal <> mrOk then
      Exit;
    FView.DBGridPrincipal.DataSource.DataSet.Refresh;
    FView.DBGridPrincipal.DataSource.DataSet.Locate('CODIGO', Ficha.Codigo, []);
  finally
    Ficha.Free;
  end;
end;

procedure TControllerFuncionarioLista.DBGridPrincipalDblClick(Sender: TObject);
begin
  AlteraRegistroSelecionado;
end;

procedure TControllerFuncionarioLista.SetOnAfterScroll(const Value: TDataSetNotifyEvent);
begin
  FOnAfterScroll := Value;
  FView.DBGridPrincipal.DataSource.DataSet.AfterScroll := nil;
  if Assigned(FOnAfterScroll) then
    FView.DBGridPrincipal.DataSource.DataSet.AfterScroll := FOnAfterScroll;
end;

end.
