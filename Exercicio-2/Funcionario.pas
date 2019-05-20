unit Funcionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,uFuncionarioControle,uDependenteControle;

type
  TFrmFuncionario = class(TForm)
    GbFunc: TGroupBox;
    LbNome: TLabel;
    EdNome: TEdit;
    EdSalarioBruto: TEdit;
    LbSalarioBruto: TLabel;
    LbCPF: TLabel;
    deMskFunCpf: TMaskEdit;
    CmBListaDep: TComboBox;
    LbLstDepedentes: TLabel;
    GbDependentes: TGroupBox;
    EdtNomeDep: TEdit;
    LbNomeDep: TLabel;
    ButCalcularIR: TButton;
    ButCalcularINSS: TButton;
    EdSalarioLiquido: TEdit;
    LbSalarioLiqui: TLabel;
    BtSalvar: TButton;
    BtAlterar: TButton;
    BtDeletar: TButton;
    deMskDepCpf: TMaskEdit;
    LbDepCpf: TLabel;
    BtLimpar: TButton;
    procedure BtSalvarClick(Sender: TObject);
    procedure ButCalcularIRClick(Sender: TObject);
    procedure ButCalcularINSSClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtAlterarClick(Sender: TObject);
    procedure BtDeletarClick(Sender: TObject);
    procedure EdtNomeDepExit(Sender: TObject);
    procedure BtLimparClick(Sender: TObject);
    procedure deMskFunCpfExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cFun: TFuncionarioControle;
    cDep: TDependenteControle;

  end;

    Function CalcularIR(iSalario: Real; iQtd: Integer): REAL;
    Function CalcularINSS(iSalario: Real; iQtd: Integer): REAL;
    Function VerificacaoTotal: Boolean;

var
  FrmFuncionario: TFrmFuncionario;
  iSalarioCalculado: Real;
  bCalcularIR,bCalcularINSS: Boolean;

implementation

{$R *.dfm}

Function CalcularIR(iSalario: Real; iQtd:Integer): REAL;
var
 iSalarioBruto,iValor: Real;
begin
  iSalarioBruto := StrToFloat(FrmFuncionario.EdSalarioBruto.text);
  iValor:= iSalarioBruto - (iQtd*100);
  Result:= (iValor*100)/15;
end;


Function CalcularINSS(iSalario: Real; iQtd:Integer): REAL;
var
 iSalarioBruto,iValor: Real;
begin
  iSalarioBruto := StrToFloat(FrmFuncionario.EdSalarioBruto.text);
  iValor:= (iSalarioBruto*100)/(8*iQtd);
  Result:=  iValor;
end;


Function VerificacaoTotal: Boolean;
var
 bErro: Boolean;
begin
 bErro:= true;
 with FrmFuncionario do
 begin
  if ((deMskFunCpf.Text <> '')  and (EdNome.Text = '')) then
  begin
     Showmessage('É obrigatório informar o nome do funcionário!');
     bErro:= False;
  end;
  if (bErro) and ((EdSalarioBruto.Text = '0') or (EdSalarioBruto.Text = '')) then
  begin
    Showmessage('É obrigatório informar o salário do funcionário"');
    bErro:= false;
  end;
  if (deMskDepCpf.Text <> '')  and (EdtNomeDep.Text = '') then
  begin
     Showmessage('É obrigatório informar o nome do Dependente!');
     bErro:= False;
  end;
 end;
end;



procedure TFrmFuncionario.BtAlterarClick(Sender: TObject);
begin
 with FrmFuncionario do
 begin
   if VerificacaoTotal then
   begin
      cfun.Nome:= EdNome.Text;
      cFun.Cpf:= deMskFunCpf.Text;
      cFun.SalarioLiquido:= StrToFloat(EdSalarioLiquido.Text);
      cFun.SalarioBruto:= StrToFloat(EdSalarioBruto.Text);
      cFun.AlteraFuncionario;


      cDep.Nome:= EdtNomeDep.Text;
      cDep.Cpf:= deMskDepCpf.Text;
      if bCalcularIR then
        cDep.CalcularIR:= 'S'
      else
        cDep.CalcularIR:= 'N';

      if bCalcularINSS then
        cDep.CalcularINSS:= 'S'
      else
        cDep.CalcularINSS:= 'N';
      cDep.AlteraDependente;
   end;
 end;
end;

procedure TFrmFuncionario.BtDeletarClick(Sender: TObject);
begin
 with FrmFuncionario do
 begin
    cFun.Cpf:= deMskFunCpf.Text;
    cDep.Cpf:= deMskDepCpf.Text;
    cDep.ExcluirDependente;
    cFun.ExcluirFuncionario;
 end;
end;

procedure TFrmFuncionario.BtLimparClick(Sender: TObject);
begin
 with FrmFuncionario do
 begin
    deMskFunCpf.Text := '';
    EdNome.Text:= '';
    EdSalarioBruto.Text := '0';
    EdSalarioLiquido.Text := '0';
    CmBListaDep.Text := '0';
    deMskDepCpf.Text := '';
    EdtNomeDep.Text:= '';
    ButCalcularIR.Enabled:= false;
    ButCalcularINSS.Enabled:= false;
    bCalcularIR:= false;
    bCalcularINSS:= false;
 end;
end;

procedure TFrmFuncionario.BtSalvarClick(Sender: TObject);
begin
 with FrmFuncionario do
 begin
   if VerificacaoTotal then
   begin
      cfun.Nome:= EdNome.Text;
      cFun.Cpf:= deMskFunCpf.Text;
      cFun.SalarioLiquido:= StrToFloat(EdSalarioLiquido.Text);
      cFun.SalarioBruto:= StrToFloat(EdSalarioBruto.Text);
      cFun.InsereFuncionario;

      cDep.Nome:= EdtNomeDep.Text;
      cDep.Cpf:= deMskDepCpf.Text;
      if bCalcularIR then
        cDep.CalcularIR:= 'S'
      else
        cDep.CalcularIR:= 'N';

      if bCalcularINSS then
        cDep.CalcularINSS:= 'S'
      else
        cDep.CalcularINSS:= 'N';
      cDep.InsereDependente;
   end;
 end;
end;


procedure TFrmFuncionario.ButCalcularINSSClick(Sender: TObject);
var
 iValor:Real;
begin
  iValor:= CalcularINSS(StrToFloat(EdSalarioBruto.Text),1);
  if EdSalarioLiquido.Text = '0' then
  begin
    EdSalarioLiquido.Text:= FloatToStr(StrToFloat(EdSalarioBruto.Text) - iValor);
  end
  else
  begin
   EdSalarioLiquido.Text:= FloatToStr(StrToFloat(EdSalarioLiquido.Text) - iValor);
  end;
  bCalcularIr:= true;
end;

procedure TFrmFuncionario.ButCalcularIRClick(Sender: TObject);
var
 iValor:Real;
begin
  iValor:= CalcularIR(StrToFloat(EdSalarioBruto.Text),1);
  if EdSalarioLiquido.Text = '0' then
  begin
    EdSalarioLiquido.Text:= FloatToStr(StrToFloat(EdSalarioBruto.Text) - iValor);
  end
  else
  begin
   EdSalarioLiquido.Text:= FloatToStr(StrToFloat(EdSalarioLiquido.Text) - iValor);
  end;
  bCalcularINSS:= true;
end;

procedure TFrmFuncionario.deMskFunCpfExit(Sender: TObject);
var
 sListaDep: TStringList;
 iQtd: Integer;
begin
  with FrmFuncionario do
    begin
    if deMskFunCpf.Text <> '' then
    begin
      try
        sListaDep:= TStringList.Create;
        cFun.PesquisaFuncionario(deMskFunCpf.Text);
        if cFun.Nome <> '' then
        begin
          deMskFunCpf.Text := cFun.Cpf;
          EdSalarioBruto.Text := FloatToStr(cFun.SalarioBruto);
          EdSalarioLiquido.Text := FloatToStr(cFun.SalarioLiquido);
          sListaDep := cDep.PesquisaAllDependente(cFun.Cpf);
          for iQtd := 0 to sListaDep.Count-1 do
            CmBListaDep.Items.Add(sListaDep.Strings[iQtd]);
        end;
      finally
        sListaDep.Free;
      end;

    end;
  end;

end;

procedure TFrmFuncionario.EdtNomeDepExit(Sender: TObject);
begin
 with FrmFuncionario do
 begin
  if (deMskDepCpf.Text <> '')  and  ( EdtNomeDep.Text <> '') then
  begin
     ButCalcularIR.Enabled:= true;
     ButCalcularINSS.Enabled:= true;
  end;
 end;
end;

procedure TFrmFuncionario.FormCreate(Sender: TObject);
begin
   bCalcularIR:= false;
   bCalcularINSS:= false;
end;

end.
