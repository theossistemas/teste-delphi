unit UFFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFTemplate, System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls,
  Entities.Funcionario, Vcl.Mask;

type
  TfrmFuncionario = class(TfrmTemplate)
    edtNome: TEdit;
    edtCPF: TMaskEdit;
    edtSalario: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btn5: TButton;
    actConfirmar: TAction;
    procedure actConfirmarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }

    FFuncionario: TFuncionario;

    procedure SetEditsFromClass();
    procedure SetClassFromEdits();
    function Validate(): boolean;

    procedure SalvarFuncionario();
  public
    { Public declarations }
    procedure SetFuncionario(const Value: int64);
  end;

var
  frmFuncionario: TfrmFuncionario;

implementation

uses
  Controller.Funcionario;

{$R *.dfm}

{ TfrmFuncionario }

procedure TfrmFuncionario.actConfirmarExecute(Sender: TObject);
begin
  inherited;
  if not Validate() then
    Exit();

  SalvarFuncionario();
end;

procedure TfrmFuncionario.FormCreate(Sender: TObject);
begin
  inherited;
  FFuncionario := TFuncionario.Create();
end;

procedure TfrmFuncionario.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(FFuncionario) then
    FreeAndNil(FFuncionario);;
end;

procedure TfrmFuncionario.FormShow(Sender: TObject);
begin
  inherited;
  SetEditsFromClass();

  edtCPF.SetFocus();
end;

procedure TfrmFuncionario.SalvarFuncionario;
var
  sMsg : string;
begin
  try
    SetClassFromEdits();

    if not TFuncionarioController.New()
            .SaveFuncionario( FFuncionario, sMsg )
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

procedure TfrmFuncionario.SetClassFromEdits;
begin
  FFuncionario.CPF := edtCPF.Text;
  FFuncionario.Nome := edtNome.Text;
  FFuncionario.Salario := StrToFloat( edtSalario.Text );
end;

procedure TfrmFuncionario.SetEditsFromClass;
begin
  edtCPF.Text := FFuncionario.CPF;
  edtNome.Text := FFuncionario.Nome;
  edtSalario.Text := FloatToStr( FFuncionario.Salario );
end;

procedure TfrmFuncionario.SetFuncionario(const Value: int64);
var
  sMsg : string;
begin
  if Value = 0 then
    Exit();

  if (not TFuncionarioController.New()
          .LoadFuncionario(Value, FFuncionario, sMsg) )
  then
    raise Exception.Create(sMsg);
end;

function TfrmFuncionario.Validate: boolean;
begin
  result := False;
  try
    if (edtCPF.Text = EmptyStr) then
    begin
      edtCPF.SetFocus();

      raise Exception.Create('CPF inválido...');
    end;

    if (edtNome.Text = EmptyStr) then
    begin
      edtNome.SetFocus();

      raise Exception.Create('CPF inválido...');
    end;

    if StrToFloat(edtSalario.Text) = 0 then
    begin
      edtSalario.SetFocus();

      raise Exception.Create('Salário inválido...');
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
