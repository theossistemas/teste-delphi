unit Theos.Controller.Funcionario.Ficha;

interface

uses
  Vcl.Forms, System.SysUtils, Data.DB, Vcl.Controls, Winapi.Windows,
  System.Classes, Vcl.Dialogs,

  Theos.Lib.Resource,
  Theos.Api.Pessoa,
  Theos.Dao.Operacao,
  Theos.View.Funcionario.Ficha,
  Theos.Model.Funcionario;

type
  TControllerFuncionarioFicha = class sealed
  strict private
    var
      FView: TViewFuncionarioFicha;
      FModel: TModelFuncionario;

      FCodigo: Largeint;
      FOperacao: TOperacao;

    procedure Init;
    procedure BindEvents;

    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure EdtSalarioChange(Sender: TObject);
    procedure EdtSalarioExit(Sender: TObject);
    procedure BtnListaDependentesClick(Sender: TObject);

    procedure AlimentaModel;
    procedure AlimentaView;
    procedure LimpaView;

    function ValidarDados: Boolean;

    function ValidarCPFValido: Boolean;

    function ValidarCPFJaCadastrado: Boolean;
    function ValidarCPFFoiAlterado: Boolean;

    procedure CalculaImpostos;
  public
    property Codigo: Largeint read FCodigo;

    constructor Create; reintroduce; overload;
    constructor Create(const Codigo: Largeint); overload;
    destructor Destroy; override;
    function ShowModal: Integer;
  end;

implementation

constructor TControllerFuncionarioFicha.Create(const Codigo: Largeint);
begin
  inherited Create;
  FOperacao := TOperacao.Editar;
  Init;
  FCodigo := Codigo;
end;

constructor TControllerFuncionarioFicha.Create;
begin
  inherited Create;
  FOperacao := TOperacao.Inserir;
  Init;
end;

destructor TControllerFuncionarioFicha.Destroy;
begin
  FView.Release;
  FView := nil;
  FModel.Free;
  inherited Destroy;
end;

procedure TControllerFuncionarioFicha.EdtSalarioChange(Sender: TObject);
begin
  TThread.Queue(nil,
    procedure
    begin
      var txt := string(FView.EdtSalario.Text);
      var txt2 := String.Empty;

      for var i := 0 to Length(txt) - 1 do
      begin
        if not CharInSet(txt.Chars[i], ['0'..'9']) then
          Continue;

        txt2 := txt2 + txt.Chars[i];
      end;

      txt := txt2;
      FView.EdtSalario.Text := FormatFloat(MASCARA_NUMERO, StrToFloatDef(txt, 0) / 100);
      FView.EdtSalario.SelStart := Length(FView.EdtSalario.Text);
    end
  );
end;

procedure TControllerFuncionarioFicha.EdtSalarioExit(Sender: TObject);
begin
  FModel.SALARIO := String(FView.EdtSalario.Text).Trim.Replace(FormatSettings.ThousandSeparator, String.Empty, [rfReplaceAll]).ToDouble;
  CalculaImpostos;
end;

procedure TControllerFuncionarioFicha.Init;
begin
  FCodigo := Default(Largeint);
  FModel := TModelFuncionario.Create;
  Application.CreateForm(TViewFuncionarioFicha, FView);
  FView.EdtCPF.EditMask := MASCARA_CPF;
  BindEvents;
end;

function TControllerFuncionarioFicha.ShowModal: Integer;
begin
  LimpaView;
  if FOperacao = TOperacao.Editar then
    AlimentaView;
  Result := FView.ShowModal;
end;

procedure TControllerFuncionarioFicha.AlimentaModel;
begin
  FModel.Clear;

  if not String(FView.EdtCodigo.Text).Trim.IsEmpty then
    FModel.CODIGO := String(FView.EdtCodigo.Text).Trim.ToInt64;

  if not String(FView.EdtNome.Text).Trim.IsEmpty then
    FModel.NOME := String(FView.EdtNome.Text).Trim;

  if not String(FView.EdtCPF.Text).Trim.IsEmpty then
    FModel.CPF := String(FView.EdtCPF.Text).Trim;

  if not String(FView.EdtSalario.Text).Trim.IsEmpty then
    FModel.SALARIO := String(FView.EdtSalario.Text).Trim.Replace(FormatSettings.ThousandSeparator, String.Empty, [rfReplaceAll]).ToDouble;
end;

procedure TControllerFuncionarioFicha.AlimentaView;
begin
  FModel.Clear;
  FModel.CODIGO := FCodigo;
  if not FModel.Carregar then
    Exit;

  if FModel.CODIGO.HasValue then
    FView.EdtCodigo.Text := FModel.CODIGO.GetValueOrDefault.ToString;

  if FModel.NOME.HasValue then
    FView.EdtNome.Text := FModel.NOME.GetValueOrDefault.Trim;

  if FModel.CPF.HasValue then
    FView.EdtCPF.Text := FModel.CPF.GetValueOrDefault.Trim;

  if FModel.SALARIO.HasValue then
    FView.EdtSalario.Text := CurrToStrF(FModel.SALARIO.GetValueOrDefault, ffFixed, 2);

  CalculaImpostos;
end;

procedure TControllerFuncionarioFicha.LimpaView;
begin
  FView.EdtCodigo.Clear;
  FView.EdtNome.Clear;
  FView.EdtSalario.Clear;
  FView.EdtCPF.Clear;

  FView.EdtValorINSS.Clear;
  FView.EdtBaseIR.Clear;
  FView.EdtValorIR.Clear;

end;

procedure TControllerFuncionarioFicha.BindEvents;
begin
  FView.BtnSalvar.OnClick := BtnSalvarClick;
  FView.BtnCancelar.OnClick := BtnCancelarClick;
  FView.EdtSalario.OnChange := EdtSalarioChange;
  FView.EdtSalario.OnExit := EdtSalarioExit;
  FView.BtnListaDependentes.OnClick := BtnListaDependentesClick;
end;

procedure TControllerFuncionarioFicha.BtnCancelarClick(Sender: TObject);
begin
  FView.ModalResult := mrCancel;
end;

procedure TControllerFuncionarioFicha.BtnSalvarClick(Sender: TObject);
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

function TControllerFuncionarioFicha.ValidarCPFValido: Boolean;
begin
  if TPessoa.ValidarCPF(FView.EdtCPF.Text) then
    Exit(True);

  const MensagemErro = 'O CPF (%s) informado é inválido. Verifique!';
  var ConteudoMensagemErro := PWideChar(Format(MensagemErro, [FView.EdtCPF.Text]));
  Application.MessageBox(ConteudoMensagemErro, PChar(Application.Title), MB_OK + MB_ICONSTOP);

  if FView.EdtCPF.CanFocus then
    FView.EdtCPF.SetFocus;

  Result := False;
end;

function TControllerFuncionarioFicha.ValidarCPFFoiAlterado: Boolean;
begin
  if FOperacao = TOperacao.Inserir then
    Exit(True);

  if FModel.CPF.GetValueOrDefault.Trim = String(FView.EdtCPF.Text).Trim then
    Exit(False);

  Result := True;
end;

function TControllerFuncionarioFicha.ValidarCPFJaCadastrado: Boolean;
begin
  if not ValidarCPFFoiAlterado then
    Exit(True);

  var Filtro := TModelFuncionario.Create;
  try
    Filtro.CPF := String(FView.EdtCPF.Text).Trim;
    if not Filtro.Carregar then
      Exit(True);

    Result := False;

    const MensagemErro = 'O CPF (%s) já foi informado em outro cadastro (%s - %s). Verifique!';
    var ConteudoMensagemErro := PWideChar(Format(MensagemErro, [FView.EdtCPF.Text, Filtro.CODIGO.GetValueOrDefault.ToString, Filtro.NOME.GetValueOrDefault]));
    Application.MessageBox(ConteudoMensagemErro, PChar(Application.Title), MB_OK + MB_ICONSTOP);

    if FView.EdtCPF.CanFocus then
      FView.EdtCPF.SetFocus;

  finally
    Filtro.Free;
  end;
end;

function TControllerFuncionarioFicha.ValidarDados: Boolean;
begin
  if not ValidarCPFJaCadastrado then
    Exit(False);

  if not ValidarCPFValido then
    Exit(False);

  Result := True;
end;

procedure TControllerFuncionarioFicha.BtnListaDependentesClick(Sender: TObject);
begin
  var ConteudoMensagem := TStringList.Create;
  var Lista := FModel.DEPENDENTES;
  try
    for var Dependente in Lista do
      ConteudoMensagem.Add(Dependente.CODIGO.GetValueOrDefault.ToString + ' - ' + Dependente.NOME.GetValueOrDefault);
    ShowMessage(ConteudoMensagem.Text);
    Lista.Clear;
  finally
    Lista.Free;
    ConteudoMensagem.Free;
  end;
end;

procedure TControllerFuncionarioFicha.CalculaImpostos;
begin
  FView.EdtValorINSS.Text := CurrToStrF(FModel.INSS, ffFixed, 2);
  FView.EdtBaseIR.Text := CurrToStrF(FModel.BaseIR, ffFixed, 2);
  FView.EdtValorIR.Text := CurrToStrF(FModel.IR, ffFixed, 2);
end;


end.
