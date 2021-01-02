unit Theos.Controller.Dependente.Ficha;

interface

uses
  Vcl.Forms, System.SysUtils, Data.DB, Vcl.Controls, Winapi.Windows,
  System.Classes,

  Theos.Lib.Resource,
  Theos.Api.Pessoa,
  Theos.Dao.Operacao,
  Theos.View.Dependente.Ficha,
  Theos.Model.Dependente;

type
  TControllerDependenteFicha = class sealed
  strict private
    var
      FView: TViewDependenteFicha;
      FModel: TModelDependente;

      FCodigo: Largeint;
      FCodigoFuncionario: Largeint;
      FOperacao: TOperacao;

    procedure Init;
    procedure BindEvents;

    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);

    procedure AlimentaModel;
    procedure AlimentaView;
    procedure LimpaView;

    function ValidarDados: Boolean;

  public
    property Codigo: Largeint read FCodigo;
    property CodigoFuncionario: Largeint read FCodigoFuncionario write FCodigoFuncionario;

    constructor Create; reintroduce; overload;
    constructor Create(const Codigo: Largeint); overload;
    destructor Destroy; override;
    function ShowModal: Integer;
  end;

implementation

constructor TControllerDependenteFicha.Create(const Codigo: Largeint);
begin
  inherited Create;
  FOperacao := TOperacao.Editar;
  Init;
  FCodigo := Codigo;
end;

constructor TControllerDependenteFicha.Create;
begin
  inherited Create;
  FOperacao := TOperacao.Inserir;
  Init;
end;

destructor TControllerDependenteFicha.Destroy;
begin
  FView.Release;
  FView := nil;
  FModel.Free;
  inherited Destroy;
end;

procedure TControllerDependenteFicha.Init;
begin
  FCodigo := Default(Largeint);
  FModel := TModelDependente.Create;
  Application.CreateForm(TViewDependenteFicha, FView);
  BindEvents;
end;

function TControllerDependenteFicha.ShowModal: Integer;
begin
  LimpaView;
  if FOperacao = TOperacao.Editar then
    AlimentaView;
  Result := FView.ShowModal;
end;

procedure TControllerDependenteFicha.AlimentaModel;
begin
  FModel.Clear;

  if not String(FView.EdtCodigo.Text).Trim.IsEmpty then
    FModel.CODIGO := String(FView.EdtCodigo.Text).Trim.ToInt64;

  FModel.CODIGO_FUNCIONARIO := FCodigoFuncionario;

  if not String(FView.EdtNome.Text).Trim.IsEmpty then
    FModel.NOME := String(FView.EdtNome.Text).Trim;

  FModel.IS_CALCULA_IR := FView.CbCalculaIR.Checked;

  FModel.IS_CALCULA_INSS := FView.CbCalculaINSS.Checked;

end;

procedure TControllerDependenteFicha.AlimentaView;
begin
  FModel.Clear;
  FModel.CODIGO := FCodigo;
  if not FModel.Carregar then
    Exit;

  if FModel.CODIGO.HasValue then
    FView.EdtCodigo.Text := FModel.CODIGO.GetValueOrDefault.ToString;

  if FModel.NOME.HasValue then
    FView.EdtNome.Text := FModel.NOME.GetValueOrDefault.Trim;

  FView.CbCalculaIR.Checked := FModel.IS_CALCULA_IR.GetValueOrDefault;

  FView.CbCalculaINSS.Checked := FModel.IS_CALCULA_INSS.GetValueOrDefault;
end;

procedure TControllerDependenteFicha.LimpaView;
begin
  FView.EdtCodigo.Clear;
  FView.EdtNome.Clear;
  FView.CbCalculaIR.Checked := False;
  FView.CbCalculaINSS.Checked := False;
end;

procedure TControllerDependenteFicha.BindEvents;
begin
  FView.BtnSalvar.OnClick := BtnSalvarClick;
  FView.BtnCancelar.OnClick := BtnCancelarClick;
end;

procedure TControllerDependenteFicha.BtnCancelarClick(Sender: TObject);
begin
  FView.ModalResult := mrCancel;
end;

procedure TControllerDependenteFicha.BtnSalvarClick(Sender: TObject);
begin
  if not ValidarDados then
    Exit;

  AlimentaModel;

  case FOperacao of
    Inserir: FModel.Insert;
    Editar: FModel.Update;
  end;
  FCodigo := FModel.CODIGO.GetValueOrDefault;
  FView.ModalResult := mrOk;
end;

function TControllerDependenteFicha.ValidarDados: Boolean;
begin
  Result := True;
end;


end.
