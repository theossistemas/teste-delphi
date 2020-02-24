unit uCadastroDependente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, DB,
  Vcl.Mask, DataModulo, Vcl.Buttons, System.UITypes, FireDAC.Stan.Param, Vcl.Graphics;

type
  Tfrm_CadastroDependente = class(TForm)
    edtNome: TDBEdit;
    edtCPF: TDBEdit;
    navDependente: TDBNavigator;
    lblNome: TLabel;
    lblCPF: TLabel;
    ckbCalculaIR: TDBCheckBox;
    ckbCalculaINSS: TDBCheckBox;
    btnApagar: TSpeedButton;
    btnSalvar: TSpeedButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnApagarClick(Sender: TObject);
  private
    FIDFuncionario: Integer;
  end;

  procedure AbrirTela(pIDFuncionario: Integer);

var
  frm_CadastroDependente: Tfrm_CadastroDependente;

implementation

uses
  uDependente;

{$R *.dfm}

procedure AbrirTela(pIDFuncionario: Integer);
begin
  Application.CreateForm(Tfrm_CadastroDependente, frm_CadastroDependente);

  frm_CadastroDependente.FIDFuncionario                    := pIDFuncionario;
  dm.qryDependente.ParamByName('ID_FUNCIONARIO').AsInteger := pIDFuncionario;
  dm.qryDependente.Open;

  frm_CadastroDependente.ShowModal;
end;

procedure Tfrm_CadastroDependente.btnApagarClick(Sender: TObject);
var
  vDependente: TDependente;
begin
  if (MessageDlg('Deseja realmente apagar o Dependente?', mtConfirmation, [mbYes, mbNo], 0) in [mrYes, mrNone]) then
  begin
    vDependente := TDependente.Create;
    try
      vDependente.CPF := edtCPF.Text;
      vDependente.Apagar;
    finally
      vDependente.Free;
    end;
  end;
end;

procedure Tfrm_CadastroDependente.btnSalvarClick(Sender: TObject);
var
  vDependente: TDependente;
begin
  vDependente := TDependente.Create;
  try
    vDependente.Nome          := edtNome.Text;
    vDependente.CPF           := edtCPF.Text;
    vDependente.IsCalculaIR   := ckbCalculaIR.Checked;
    vDependente.IsCalculaINSS := ckbCalculaINSS.Checked;

    if dm.dsDependente.State in [dsEdit] then
    begin
      vDependente.IDDependente := dm.qryDependenteID.AsInteger;
      vDependente.Atualizar;

      MessageDlg('Dependente atualizado com sucesso.', mtInformation, [mbOK], 0);
    end
    else
    if dm.dsDependente.State in [dsInsert] then
    begin
      vDependente.IDFuncionario := FIDFuncionario;
      vDependente.Salvar;

      MessageDlg('Dependente cadastrado com sucesso.', mtInformation, [mbOK], 0);
    end;
  finally
    vDependente.Free;
  end;
end;

procedure Tfrm_CadastroDependente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm.qryDependente.Close;
end;

end.
