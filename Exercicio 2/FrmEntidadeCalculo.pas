unit FrmEntidadeCalculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  uConexao, FireDAC.Phys.FBDef, FireDAC.Stan.Intf, FireDAC.Phys,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB, uFuncionarioController, FireDAC.DApt,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TForm1 = class(TForm)
    pDependente: TPanel;
    pFuncionario: TPanel;
    DbDependente: TDBGrid;
    DbFuncionario: TDBGrid;
    BtnCalcularINSS: TSpeedButton;
    EdtNomeFuncionario: TEdit;
    EdtSalarioFuncionario: TEdit;
    EdtCPFFuncionario: TEdit;
    Nome: TLabel;
    CPF: TLabel;
    Label3: TLabel;
    BtnAdicionarFuncionario: TSpeedButton;
    EdtNomeDependente: TEdit;
    lNomeDependente: TLabel;
    CbINSS: TCheckBox;
    CbIR: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    BtnAdicionarDependente: TSpeedButton;
    ODialog: TOpenDialog;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDPhysFBDriverLink2: TFDPhysFBDriverLink;
    FDMemTableFuncionarios: TFDMemTable;
    FDMemTableDependentes: TFDMemTable;
    DsFuncionarios: TDataSource;
    dsDependentes: TDataSource;
    FDMemTableFuncionariosCODIGO: TIntegerField;
    FDMemTableFuncionariosNOME: TStringField;
    FDMemTableFuncionariosCPF: TStringField;
    FDMemTableFuncionariosSALARIO: TSingleField;
    BtnCalcularIR: TSpeedButton;
    FDMemTableDependentesCODIGO: TIntegerField;
    FDMemTableDependentesNOME: TStringField;
    FDMemTableDependentesISCALCULAIR: TBooleanField;
    FDMemTableDependentesISCALCULAINSS: TBooleanField;
    FDMemTableDependentesCODIGOFUNCIONARIO: TIntegerField;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnAdicionarFuncionarioClick(Sender: TObject);
    procedure DbFuncionarioMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnAdicionarDependenteClick(Sender: TObject);
    procedure BtnCalcularINSSClick(Sender: TObject);
    procedure BtnCalcularIRClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarFuncionarios;
    procedure CarregarDependentes;
    procedure BindFuncionario;
    procedure BindDependentes;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
         uses Types;
{$R *.dfm}

procedure TForm1.BindDependentes;
begin
      EdtNomeDependente.Text := FDMemTableDependentes.Fields[1].AsString;
      CbINSS.Checked :=  FDMemTableDependentes.Fields[3].AsBoolean;
      CbIR.Checked :=   FDMemTableDependentes.Fields[2].AsBoolean;
end;

procedure TForm1.BindFuncionario;
begin
     EdtNomeFuncionario.Text    := FDMemTableFuncionarios.Fields[1].AsString;
     EdtCPFFuncionario.Text     := FDMemTableFuncionarios.Fields[2].AsString;
     EdtSalarioFuncionario.Text := FDMemTableFuncionarios.Fields[3].AsString;
    TFuncionarioControl.GetInstance().Funcionario.Nome    :=  FDMemTableFuncionarios.Fields[1].AsString;
   TFuncionarioControl.GetInstance().Funcionario.CPF      :=  FDMemTableFuncionarios.Fields[2].AsString;
   TFuncionarioControl.GetInstance().Funcionario.Salario  :=  FDMemTableFuncionarios.Fields[3].AsFloat;
end;

procedure TForm1.BtnAdicionarDependenteClick(Sender: TObject);
begin
  TFuncionarioControl.GetInstance().Dependente.Nome              := EdtNomeDependente.Text  ;
  TFuncionarioControl.GetInstance().Dependente.IsCalculaIR       := CbIR.Checked;
  TFuncionarioControl.GetInstance().Dependente.IsCalculaINSS     :=  CbINSS.Checked;
  TFuncionarioControl.GetInstance().Dependente.CodigoFuncionario := FDMemTableFuncionarios.Fields[0].AsInteger;
  if TFuncionarioControl.GetInstance().SalvarDependente then
  ShowMessage('Incluido com sucesso!');

  Self.CarregarDependentes; 
end;

procedure TForm1.BtnAdicionarFuncionarioClick(Sender: TObject);
begin
   TFuncionarioControl.GetInstance().Funcionario.Nome    :=  EdtNomeFuncionario.Text  ;
   TFuncionarioControl.GetInstance().Funcionario.CPF     :=  EdtCPFFuncionario.Text;
   TFuncionarioControl.GetInstance().Funcionario.Salario :=  StrToFloat(EdtSalarioFuncionario.Text);
   if TFuncionarioControl.GetInstance().SalvarFuncionario Then
    ShowMessage('Incluido com sucesso!');

    
   Self.CarregarFuncionarios();
end;

procedure TForm1.BtnCalcularINSSClick(Sender: TObject);
begin
if FDMemtableFuncionarios.RecordCount > 0 then
begin
 TFuncionarioControl.GetInstance().CalcularIRouINSS(dsDependentes.DataSet,CalculoINSS);
end;
end;

procedure TForm1.BtnCalcularIRClick(Sender: TObject);
begin
 TFuncionarioControl.GetInstance().CalcularIRouINSS(dsDependentes.DataSet,CalculoIR);
end;

procedure TForm1.CarregarDependentes;
Var
VQuery : TFDQuery;
begin

   Self.FDMemTableDependentes.Close;
  VQuery :=   TFuncionarioControl.GetInstance().CarregarDependentes(FDMemTableFuncionarios.Fields[0].AsInteger);
  try
    VQuery.FetchAll;
      Self.FDMemTableDependentes.Data := VQuery.Data;

  finally
    VQuery.Close;
    VQuery.Free;
  end;  
end;

procedure TForm1.CarregarFuncionarios;
var
  VQuery: TFDQuery;
begin
  Self.FDMemTableFuncionarios.Close;
  VQuery :=   TFuncionarioControl.GetInstance().Carregar();
  try
    VQuery.FetchAll;
    Self.FDMemTableFuncionarios.Data := VQuery.Data;

  finally
    VQuery.Close;
    VQuery.Free;
  end;
end;

procedure TForm1.DbFuncionarioMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Self.BindFuncionario;
if FDMemTableDependentes.RecordCount > 0 then
FDMemTableDependentes.Delete;
Self.CarregarDependentes;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Self.CarregarFuncionarios;

  if FDMemTableFuncionarios.RecordCount > 0 then
  begin
   Self.BindFuncionario;
   Self.CarregarDependentes;
   if  FDMemTableDependentes.RecordCount > 0 then
   Self.BindDependentes;
  end;

   
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  TFuncionarioControl.GetInstance().Destroy();
end;

end.
