unit uCadastroFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, uCadastroDependente, System.UITypes, DB, System.StrUtils,
  IdBaseComponent, IdComponent, IdCustomTCPServer, IdMappedPortTCP,
  IdMappedTelnet;

type
  Tfrm_CadastroFuncionario = class(TForm)
    edtNome: TDBEdit;
    edtCPF: TDBEdit;
    lblNome: TLabel;
    lblCPF: TLabel;
    navFuncionario: TDBNavigator;
    lblSalario: TLabel;
    edtSalario: TDBEdit;
    btnSalvar: TSpeedButton;
    btnApagar: TSpeedButton;
    btnCadastrarDependente: TSpeedButton;
    mmo: TMemo;
    lblDependentes: TLabel;
    edtCalculoIR: TEdit;
    edtCalculoINSS: TEdit;
    lblIR: TLabel;
    lblINSS: TLabel;
    lblImpostos: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnCadastrarDependenteClick(Sender: TObject);
    procedure btnCalcularImpostosClick(Sender: TObject);
  private
    function RetirarMascaraSalario(pValor: String): String;
  public
    procedure ListarDependentes;
    procedure CalcularImpostos;
  end;

  procedure ChamarTela;

var
  frm_CadastroFuncionario: Tfrm_CadastroFuncionario;

implementation

{$R *.dfm}

uses DataModule, uFuncionario, uDependente, System.MaskUtils;

procedure ChamarTela;
begin
  Application.CreateForm(Tfrm_CadastroFuncionario, frm_CadastroFuncionario);

  dm.qryFuncionario.Open;

  frm_CadastroFuncionario.ListarDependentes;
  frm_CadastroFuncionario.CalcularImpostos;

  frm_CadastroFuncionario.ShowModal;
end;

procedure Tfrm_CadastroFuncionario.btnApagarClick(Sender: TObject);
var
  vFuncionario: TFuncionario;
begin
  if (MessageDlg('Deseja realmente apagar o Funcionário?', mtConfirmation, [mbYes, mbNo], 0) in [mrYes, mrNone]) then
  begin
    vFuncionario := TFuncionario.Create;
    try
      vFuncionario.CPF           := edtCPF.Text;
      vFuncionario.IDFuncionario := dm.qryFuncionarioIDFUNCIONARIO.AsInteger;
      vFuncionario.Delete;
    finally
      vFuncionario.Free;
    end;
  end;
end;

procedure Tfrm_CadastroFuncionario.btnCadastrarDependenteClick(Sender: TObject);
begin
  uCadastroDependente.AbrirTela(dm.qryFuncionarioIDFUNCIONARIO.AsInteger);
  ListarDependentes;
  CalcularImpostos;
end;

procedure Tfrm_CadastroFuncionario.btnCalcularImpostosClick(Sender: TObject);
begin
  CalcularImpostos;
end;

procedure Tfrm_CadastroFuncionario.btnSalvarClick(Sender: TObject);
var
  vFuncionario: TFuncionario;
begin
  vFuncionario := TFuncionario.Create;
  try
    vFuncionario.Nome    := edtNome.Text;
    vFuncionario.CPF     := edtCPF.Text;
    vFuncionario.Salario := StrToCurrDef(RetirarMascaraSalario(edtSalario.Text), 0);

    if dm.dsFuncionario.State in [dsEdit] then
    begin
      vFuncionario.IDFuncionario := dm.qryFuncionarioIDFUNCIONARIO.AsInteger;
      vFuncionario.Update;

      MessageDlg('Funcionário atualizado com sucesso.', mtInformation, [mbOK], 0);
    end
    else if dm.dsFuncionario.State in [dsInsert] then
    begin
      vFuncionario.Save;

      MessageDlg('Funcionário cadastrado com sucesso.', mtInformation, [mbOK], 0);
    end;
  finally
    vFuncionario.Free;
  end;

  CalcularImpostos;
end;

procedure Tfrm_CadastroFuncionario.CalcularImpostos;
var
  vFuncionario: TFuncionario;
begin
  vFuncionario := TFuncionario.Create;
  try
    vFuncionario := vFuncionario.FindOne;
    edtCalculoIR.Text   := FormatFloat(',0.00', vFuncionario.CalcularIR(vFuncionario));
    edtCalculoINSS.Text := FormatFloat(',0.00', vFuncionario.CalcularINSS(vFuncionario));
  finally
    vFuncionario.Free;
  end;
end;

procedure Tfrm_CadastroFuncionario.ListarDependentes;
var
  vFuncionario: TFuncionario;
  vDependente: TDependente;
begin
  vFuncionario := TFuncionario.Create;
  try
    mmo.Clear;
    for vDependente in vFuncionario.AdicionarDependenteList(dm.qryFuncionarioIDFUNCIONARIO.AsInteger) do
    begin
      mmo.Lines.Add('Nome: ' + vDependente.Nome);
      mmo.Lines.Add('CPF: ' + FormatMaskText('000\.000\.000\-00;0', vDependente.CPF));
      mmo.Lines.Add('Calcula IR: ' + IfThen(vDependente.IsCalculaIR, 'Sim', 'Não'));
      mmo.Lines.Add('Calcula INSS: ' + IfThen(vDependente.IsCalculaINSS, 'Sim', 'Não'));
      mmo.Lines.Add(#13);
    end;
  finally
    vFuncionario.Free;
  end;
end;

function Tfrm_CadastroFuncionario.RetirarMascaraSalario(pValor: String): String;
var
  I: Byte;
begin
  Result := EmptyStr;

  for I := 1 to Length(pValor) do
  begin
    if CharInSet(pValor[I], ['1','2','3','4','5','6','7','8','9','0',',']) then
    begin
      Result := Result + pValor[I];
    end;
  end;
end;

end.