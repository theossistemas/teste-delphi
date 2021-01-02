unit Theos.Controller.Dependente.Lista;

interface

uses
  Vcl.Forms, System.SysUtils, Data.DB, Vcl.Controls, Winapi.Windows,
  Vcl.DBGrids, Vcl.Grids, Vcl.DBCtrls,

  Theos.Lib.Resource,
  Theos.View.Dependente.Lista,
  Theos.Controller.Dependente.Ficha,
  Theos.Model.Dependente;

type
  TControllerDependenteLista = class sealed
  strict private
    var
      FParent: TWinControl;
      FView: TViewDependenteLista;
      FCodigoFuncionario: Largeint;

    procedure AlteraRegistroSelecionado;
    procedure SetCodigoFuncionario(const Value: Largeint);
    procedure PopulaDadosGrid;

    procedure Init;
    procedure BindEvents;

    procedure BtnInserirClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure DBGridPrincipalDblClick(Sender: TObject);
    procedure DBGridPrincipalDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

    procedure PintaCheckBox(CheckBox: TDBCheckBox; Rect: TRect; Column: TColumn; State: TGridDrawState);
  public
    property Parent: TWinControl read FParent write FParent;
    property CodigoFuncionario: Largeint read FCodigoFuncionario write SetCodigoFuncionario;

    constructor Create; reintroduce;
    destructor Destroy; override;
    function ShowModal: Integer;
    procedure Show;
  end;

implementation

procedure TControllerDependenteLista.BindEvents;
begin
  FView.DBGridPrincipal.OnDrawColumnCell :=  DBGridPrincipalDrawColumnCell;
  FView.BtnInserir.OnClick := BtnInserirClick;
  FView.BtnAlterar.OnClick := BtnAlterarClick;
  FView.BtnExcluir.OnClick := BtnExcluirClick;
  FView.DBGridPrincipal.OnDblClick := DBGridPrincipalDblClick;
end;

constructor TControllerDependenteLista.Create;
begin
  inherited Create;
  FCodigoFuncionario := Default(Largeint);
  Init;
end;

destructor TControllerDependenteLista.Destroy;
begin
  FView.DBGridPrincipal.DataSource.DataSet.Free;
  FView.DBGridPrincipal.DataSource.Free;

  FView.Release;
  FView := nil;

  inherited Destroy;
end;

procedure TControllerDependenteLista.Init;
begin
  Application.CreateForm(TViewDependenteLista, FView);
  PopulaDadosGrid;
  BindEvents;
end;

function TControllerDependenteLista.ShowModal: Integer;
begin
  FView.Parent := nil;
  FView.BorderStyle := bsSizeable;
  FView.Align := alNone;
  Result := FView.ShowModal;
end;

procedure TControllerDependenteLista.Show;
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

  FView.Show;
end;

procedure TControllerDependenteLista.SetCodigoFuncionario(const Value: Largeint);
begin
  if FCodigoFuncionario = Value then
    Exit;
  FCodigoFuncionario := Value;
  PopulaDadosGrid;
end;

procedure TControllerDependenteLista.PopulaDadosGrid;
begin
  if Assigned(FView.DBGridPrincipal.DataSource) then
  begin
    if Assigned(FView.DBGridPrincipal.DataSource.DataSet) then
      FView.DBGridPrincipal.DataSource.DataSet.Free;
    FView.DBGridPrincipal.DataSource.Free;
  end;

  var Model := TModelDependente.Create;
  try
    Model.CODIGO_FUNCIONARIO := FCodigoFuncionario;
    FView.DBGridPrincipal.DataSource := TDataSource.Create(FView);
    FView.DBGridPrincipal.DataSource.DataSet := Model.CarregarListaDataSet;
  finally
    Model.Free;
  end;
  TBooleanField(FView.DBGridPrincipal.DataSource.DataSet.FieldByName('IS_CALCULA_IR')).DisplayValues := ';';
  TBooleanField(FView.DBGridPrincipal.DataSource.DataSet.FieldByName('IS_CALCULA_INSS')).DisplayValues := ';';
end;

procedure TControllerDependenteLista.DBGridPrincipalDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  PintaCheckBox(FView.CbCalculaIR, Rect, Column, State);
  PintaCheckBox(FView.CbCalculaINSS, Rect, Column, State);
end;

procedure TControllerDependenteLista.PintaCheckBox(CheckBox: TDBCheckBox; Rect: TRect; Column: TColumn; State: TGridDrawState);
const
  IsChecked : array[Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if (Column.Field.FieldName = CheckBox.DataField) then
  begin
    DrawRect:=Rect;
    InflateRect(DrawRect,-1,-1);
    DrawState := ISChecked[Column.Field.AsBoolean];
    FView.DBGridPrincipal.Canvas.FillRect(Rect);
    DrawFrameControl(FView.DBGridPrincipal.Canvas.Handle, DrawRect, DFC_BUTTON, DrawState);
   end;
end;

procedure TControllerDependenteLista.AlteraRegistroSelecionado;
begin
  if FView.DBGridPrincipal.DataSource.DataSet.IsEmpty then
    Exit;

  var Codigo := FView.DBGridPrincipal.DataSource.DataSet.FieldByName('CODIGO').AsLargeInt;
  var Ficha := TControllerDependenteFicha.Create(Codigo);
  try
    Ficha.CodigoFuncionario := FCodigoFuncionario;
    if Ficha.ShowModal <> mrOk then
      Exit;
    FView.DBGridPrincipal.DataSource.DataSet.Refresh;
    FView.DBGridPrincipal.DataSource.DataSet.Locate('CODIGO', Ficha.Codigo, []);
  finally
    Ficha.Free;
  end;
end;

procedure TControllerDependenteLista.BtnInserirClick(Sender: TObject);
begin
  var Ficha := TControllerDependenteFicha.Create;
  try
    Ficha.CodigoFuncionario := FCodigoFuncionario;
    if Ficha.ShowModal <> mrOk then
      Exit;
    FView.DBGridPrincipal.DataSource.DataSet.Refresh;
    FView.DBGridPrincipal.DataSource.DataSet.Locate('CODIGO', Ficha.Codigo, []);
  finally
    Ficha.Free;
  end;
end;

procedure TControllerDependenteLista.BtnAlterarClick(Sender: TObject);
begin
  AlteraRegistroSelecionado;
end;

procedure TControllerDependenteLista.BtnExcluirClick(Sender: TObject);
begin
  if FView.DBGridPrincipal.DataSource.DataSet.IsEmpty then
    Exit;

  if Application.MessageBox('Deseja Excluir o Dependente?', PChar(Application.Title), MB_YESNO + MB_ICONQUESTION) <> IDYES then
    Exit;

  var Codigo := FView.DBGridPrincipal.DataSource.DataSet.FieldByName('CODIGO').AsLargeInt;
  var Model := TModelDependente.Create;
  try
    Model.CODIGO := Codigo;
    Model.Delete;
    FView.DBGridPrincipal.DataSource.DataSet.Refresh;
  finally
    Model.Free;
  end;
end;

procedure TControllerDependenteLista.DBGridPrincipalDblClick(Sender: TObject);
begin
  AlteraRegistroSelecionado;
end;

end.
