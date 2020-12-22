unit uFTestFuncionarioDependente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFuncionario, uDependente, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TFTestFuncionarioDependente = class(TForm)
    ednome: TLabeledEdit;
    edsalario: TLabeledEdit;
    eddependente: TLabeledEdit;
    edcpf: TLabeledEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cbir: TCheckBox;
    cbinss: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    btIR: TButton;
    BitBtn3: TBitBtn;
    Button4: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btIRClick(Sender: TObject);
  private
    { Private declarations }
    FFuncionario: TFuncionario;
    FDependente : TDependente;
  public
    { Public declarations }
  end;

var
  FTestFuncionarioDependente: TFTestFuncionarioDependente;

implementation

{$R *.dfm}

procedure TFTestFuncionarioDependente.BitBtn1Click(Sender: TObject);
begin

  if NOT Assigned(FFuncionario) then
    FFuncionario := TFuncionario.Create;

  FFuncionario.CPF     := edCPF.Text;
  FFuncionario.Nome    := edNome.Text;
  FFuncionario.Salario := StrToFloatDef(edSalario.Text, 10000);
end;

procedure TFTestFuncionarioDependente.BitBtn2Click(Sender: TObject);
begin

  if NOT Assigned(FFuncionario) then
    FFuncionario := TFuncionario.Create;

  if (edCPF.Text > emptyStr) then
  begin

    FFuncionario.CPF := edCPF.Text;

    if (edNome.Text = emptyStr) then
    begin

      FFuncionario.GetRecord;

      edNome.Text    := FFuncionario.Nome;
      edSalario.Text := FloatToStr(FFuncionario.Salario);
    end
    else
    begin

      FFuncionario.Nome    := edNome.Text;
      FFuncionario.Salario := StrToFloatDef(edSalario.Text, 10000);
      FFuncionario.UpdateRecord;
    end;
  end;
end;

procedure TFTestFuncionarioDependente.BitBtn3Click(Sender: TObject);
begin

  FFuncionario.UpdateRecord(TRUE);
end;

procedure TFTestFuncionarioDependente.btIRClick(Sender: TObject);
var

  I: integer;
begin

  for I := 0 to FFuncionario.Dependentes.Count - 1 do
    Memo1.Lines.Add(' Dependente: ' + FFuncionario.Dependentes.Items[I].Nome
                  + ' IR' + BoolToStr(FFuncionario.Dependentes.Items[I].IsCalculaIR)
                  + ' INSS' + BoolToStr(FFuncionario.Dependentes.Items[I].IsCalculaINSS));

  Memo1.Lines.Add('Salario: ' + FloatToStr(FFuncionario.Salario) + ' IR: ' + FloatToStr(FFuncionario.IR));
  Memo1.Lines.Add('Salario: ' + FloatToStr(FFuncionario.Salario) + ' INSS: ' + FloatToStr(FFuncionario.INSS));
  Memo1.Lines.Add('**************************');
  Memo1.Refresh;
end;

procedure TFTestFuncionarioDependente.Button1Click(Sender: TObject);
begin

  if NOT Assigned(FDependente) then
    FDependente := TDependente.Create;

  FDependente.Nome            := edDependente.Text;
  FDependente.IsCalculaIR     := cbIR.Checked;
  FDependente.IsCalculaINSS   := cbINSS.Checked;
  FDependente.Funcionario_CPF := edCPF.Text;

  FFuncionario.Dependentes.Add(FFuncionario.Dependentes.Count, FDependente);
end;

procedure TFTestFuncionarioDependente.Button2Click(Sender: TObject);
begin

  FFuncionario.UpdateRecord;
end;

procedure TFTestFuncionarioDependente.Button4Click(Sender: TObject);
begin

  if FDependente.Id > 0 then
    FDependente.UpdateRecord(TRUE);
end;

end.
