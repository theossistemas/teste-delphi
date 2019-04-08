unit UFDependente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFTemplate, System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls,
  Entities.Dependente;

type
  TfrmDependente = class(TfrmTemplate)
    Label1: TLabel;
    edtNome: TEdit;
    chkIR: TCheckBox;
    chkINSS: TCheckBox;
    actConfirmar: TAction;
    btn5: TButton;
    procedure actConfirmarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    { Private declarations }
    FDependente : TDependente;
    FFuncionarioID : Int64;

    procedure SetEditsFromClass();
    procedure SetClassFromEdits();

    function Validate() : boolean;

    procedure SalvarDependente();
  public
    { Public declarations }
    procedure SetDependente(const Value : int64 = 0);
    procedure SetFuncionarioID( const Value : Int64);
  end;

var
  frmDependente: TfrmDependente;

implementation

uses
  Controller.Dependente;

{$R *.dfm}

procedure TfrmDependente.actConfirmarExecute(Sender: TObject);
begin
  inherited;
  if not Validate() then
    Exit();

  SalvarDependente();
end;

procedure TfrmDependente.FormCreate(Sender: TObject);
begin
  inherited;
  FDependente := TDependente.Create();
end;

procedure TfrmDependente.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(FDependente) then
    FreeAndNil(FDependente);
end;

procedure TfrmDependente.FormShow(Sender: TObject);
begin
  inherited;
  SetEditsFromClass();
  edtNome.SetFocus();
end;

procedure TfrmDependente.SalvarDependente;
var
  sMsg : string;
begin
  try
    SetClassFromEdits();

    if not TDependenteController.New()
            .SaveDependente( FDependente, sMsg )
    then
      raise Exception.Create(sMsg);

    ShowMessage('Operação realizada com SUCESSO!');

    actBack.Execute();
  except
    on E: Exception do
    begin
      ShowMessage('FALHA na gravação dos dados... Verifique! ' + e.Message );
    end;
  end;
end;

procedure TfrmDependente.SetClassFromEdits;
begin
  FDependente.FuncionarioID := FFuncionarioID;
  FDependente.Nome := edtNome.Text;
  FDependente.IsCalculaIR := chkIR.Checked;
  FDependente.IsCalculaINSS := chkINSS.Checked;
end;

procedure TfrmDependente.SetDependente(const Value : int64 = 0);
var
  sMsg : string;
begin
  if Value = 0 then
    Exit();

  if not TDependenteController.New().
    LoadDependente(Value, FDependente, sMsg)
  then
    raise Exception.Create(sMsg);

end;

procedure TfrmDependente.SetEditsFromClass;
begin
  edtNome.Text := FDependente.Nome;
  chkIR.Checked := FDependente.IsCalculaIR;
  chkINSS.Checked := FDependente.IsCalculaINSS;
end;

procedure TfrmDependente.SetFuncionarioID(const Value: Int64);
begin
  FFuncionarioID := Value;
end;

function TfrmDependente.Validate: boolean;
begin
  result := False;
  try
    if (edtNome.Text = EmptyStr) then
    begin
      edtNome.SetFocus();

      raise Exception.Create('CPF inválido...');
    end;

    result := True;
  except
    on e : Exception do
    begin
      result := False;
      ShowMessage('FALHA na validação dos dados... Verifique! ' + e.Message );
    end;

  end;
end;

end.

