unit untEntidadeCalculo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, SqlExpr, DB, DBTables, ExtCtrls, FMTBcd, StdCtrls,
  Buttons, Grids, DBGrids, Mask;

type
  TfrmFuncionario = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblResultadoINSS: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblResultadoIR: TLabel;
    btnCalcular: TBitBtn;
    Edit4: TEdit;
    Label6: TLabel;
    rdgCalcula: TRadioGroup;
    btnLimpar: TBitBtn;
    Edit2: TMaskEdit;
    Edit3: TEdit;
    procedure btnCalcularClick(Sender: TObject);
    procedure rdgCalculaClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Limpar;
    function FormataValor(Valor: String): real;
  end;

var
  frmFuncionario: TfrmFuncionario;

implementation

uses untFuncionarioDep, untConexao;

{$R *.dfm}

procedure TfrmFuncionario.btnCalcularClick(Sender: TObject);
var
  Dep : TDependentes;
  vValorSalario : Real;
begin
  try
    try
      Dep := TDependentes.Create;
      if (Edit1.Text = '') or (Edit2.Text = '') or
        (Edit3.Text = '') or (Edit4.Text = '') then
      begin
        Application.MessageBox('Favor Preencher os Campos Obrigatórios...','Informação', MB_OK+MB_ICONINFORMATION);
        Edit1.SetFocus;
        Exit;
      end else
      begin
        Dep.Nome      := Edit1.Text;
        Dep.CPF       := Edit2.Text;
        vValorSalario := FormataValor(Edit3.Text);
        Dep.salario   := vValorSalario;
        Dep.QtdeDep   := strtoInt(edit4.Text);

        if (rdgCalcula.ItemIndex = 0) then
          lblResultadoIR.Caption := FormatFloat('#,##0.00', Dep.IsCalculaIR)
        else if (rdgCalcula.ItemIndex = 1) then
          lblResultadoINSS.Caption := FormatFloat('#,##0.00', Dep.IsCalculaINSS)
        else
        begin
          lblResultadoIR.Caption := FormatFloat('#,##0.00', Dep.IsCalculaIR);
          lblResultadoINSS.Caption := FormatFloat('#,##0.00', Dep.IsCalculaINSS);
        end;
      end;
        udtConexao.sdtFuncionario.Close;
        udtConexao.sdtFuncionario.Open;
        udtConexao.sdtFuncionario.Insert;
        udtConexao.sdtFuncionario.FieldByName('Nome').Value     :=  Dep.Nome;
        udtConexao.sdtFuncionario.FieldByName('CPF').Value      :=  Dep.CPF;
        udtConexao.sdtFuncionario.FieldByName('Salario').Value  :=  Dep.salario;
        udtConexao.sdtFuncionario.Post;

      if (rdgCalcula.ItemIndex = 0) then
      begin
        udtConexao.sdtDependentes.Close;
        udtConexao.sdtDependentes.Open;
        udtConexao.sdtDependentes.Insert;
        udtConexao.sdtDependentes.FieldByName('IsCalculaIR').Value :=  StrToFloat(lblResultadoIR.Caption);
        udtConexao.sdtDependentes.Post;
        lblResultadoINSS.Caption := '';
      end else if (rdgCalcula.ItemIndex = 1) then
      begin
        udtConexao.sdtDependentes.Close;
        udtConexao.sdtDependentes.Open;
        udtConexao.sdtDependentes.Insert;
        udtConexao.sdtDependentes.FieldByName('IsCalculaINSS').Value :=  StrToFloat(lblResultadoINSS.Caption);
        udtConexao.sdtDependentes.Post;
        lblResultadoIR.Caption := '';
      end;
      if (Not (rdgCalcula.ItemIndex = 0)) and  (Not (rdgCalcula.ItemIndex = 1)) then
      begin
        udtConexao.sdtDependentes.Close;
        udtConexao.sdtDependentes.Open;
        udtConexao.sdtDependentes.Insert;
        udtConexao.sdtDependentes.FieldByName('IsCalculaIR').Value    :=  FormatFloat('#,##0.00', Dep.IsCalculaIR);
        udtConexao.sdtDependentes.FieldByName('IsCalculaINSS').Value  :=  FormatFloat('#,##0.00', Dep.IsCalculaINSS);
        udtConexao.sdtDependentes.Post;
      end;
    except on e : exception do
      ShowMessage('Ocorreu o seguonte erro: ' + e.Message);
    end;
  finally
    FreeAndNil(Dep);
    udtConexao.sdtDependentes.Close;
    udtConexao.sdtFuncionario.Close;
  end;

end;

procedure TfrmFuncionario.rdgCalculaClick(Sender: TObject);
begin
   if rdgCalcula.ItemIndex = 0 then
      btnCalcular.Enabled := True
   else if rdgCalcula.ItemIndex = 1 then
      btnCalcular.Enabled := True

end;

procedure TfrmFuncionario.Limpar;
begin
  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '0,00';
  Edit4.Text := '';
  lblResultadoINSS.Caption := '';
  lblResultadoIR.Caption := '';
  rdgCalcula.ItemIndex := -1;

end;

procedure TfrmFuncionario.btnLimparClick(Sender: TObject);
begin
  Limpar;
end;

function TfrmFuncionario.FormataValor(Valor: String): real;
var
  Cont : Integer;
  Resultado : string;
begin
  Cont      := 1;
  Resultado := '';
  while Cont <= Length(Valor) do
  begin
    if Valor[cont] <> '.' then
    begin
      if Resultado = '' then
        Resultado := Valor[cont]
      else
        Resultado := Resultado+Valor[cont];
    end;
   Cont := Cont + 1;
  end;
  Result := StrToFloat(Resultado);
end;

end.
