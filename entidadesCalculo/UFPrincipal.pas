unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, System.Actions, Vcl.ActnList,
  Entities.Dependente, Entities.Funcionario, UDMView;

type
  TfrmPrincipal = class(TForm)
    panHeader: TPanel;
    Label1: TLabel;
    lblVersao: TLabel;
    panBody: TPanel;
    lbl3: TLabel;
    lbl4: TLabel;
    pnl1: TPanel;
    btn5: TButton;
    gridFuncionarios: TDBGrid;
    gridDependentes: TDBGrid;
    btn1: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    ActionList: TActionList;
    actIncluirFunc: TAction;
    actExcluirFunc: TAction;
    actEditarFunc: TAction;
    actCalcularFunc: TAction;
    actIncluirDep: TAction;
    actEditarDep: TAction;
    actExcluirDep: TAction;
    Button6: TButton;
    actClose: TAction;
    dsListFuncionarios: TDataSource;
    dsListDependentes: TDataSource;
    panGeral: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    edtAliqIR: TEdit;
    Label4: TLabel;
    edtDedIR: TEdit;
    Label5: TLabel;
    edtAliqINSS: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actIncluirFuncExecute(Sender: TObject);
    procedure actExcluirFuncExecute(Sender: TObject);
    procedure actEditarFuncExecute(Sender: TObject);
    procedure actCalcularFuncExecute(Sender: TObject);
    procedure actIncluirDepExecute(Sender: TObject);
    procedure actEditarDepExecute(Sender: TObject);
    procedure actExcluirDepExecute(Sender: TObject);
  private
    { Private declarations }
    procedure ShowFormFuncionario(Value : Integer = 0);
    procedure ShowFormDependente(Value : Integer = 0);

    procedure SetListFuncionarios();
    procedure UpdateListFuncionarios();
    procedure UpdateListDependentes();

    procedure IncluirFunc();
    procedure EditarFunc();
    procedure ExcluirFunc();

    procedure CalcularImpostos();

    procedure IncluirDep();
    procedure EditarDep();
    procedure ExcluirDep();

    procedure OnCloseFunc(Sender: TObject; var Action: TCloseAction);
    procedure OnCloseDep(Sender: TObject; var Action: TCloseAction);

    procedure OnCalcIR(const Value : Double);
    procedure OnCalcINSS(const Value : Double);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses Common.Util, UFFuncionario, UFDependente, Controller.Funcionario, Controller.Dependente,
Controller.CalculoImposto;

{$R *.dfm}

procedure TfrmPrincipal.actCalcularFuncExecute(Sender: TObject);
begin
  CalcularImpostos();
end;

procedure TfrmPrincipal.actCloseExecute(Sender: TObject);
begin
  self.Close();
end;

procedure TfrmPrincipal.actEditarDepExecute(Sender: TObject);
begin
  EditarDep();
end;

procedure TfrmPrincipal.actEditarFuncExecute(Sender: TObject);
begin
  EditarFunc();
end;

procedure TfrmPrincipal.actExcluirDepExecute(Sender: TObject);
begin
  ExcluirDep();
end;

procedure TfrmPrincipal.actExcluirFuncExecute(Sender: TObject);
begin
  ExcluirFunc();
end;

procedure TfrmPrincipal.actIncluirDepExecute(Sender: TObject);
begin
   IncluirDep();
end;

procedure TfrmPrincipal.actIncluirFuncExecute(Sender: TObject);
begin
  IncluirFunc();
end;

procedure TfrmPrincipal.CalcularImpostos;
var
  func : TFuncionario;
  sMsg : string;
begin
  func := nil;
  if (not dmView.qryListFuncionarios.Active) or (dmView.qryListFuncionarios.IsEmpty)
  then
  begin
    ShowMessage('Listagem de funcionários vazia...');
    Exit();
  end;

  try
    try
      func := TFuncionarioController.New()
        .LoadFuncionario( dmView.qryListFuncionariosFUNCIONARIO_ID.AsLargeInt, sMsg );
      if not Assigned(func) or (sMsg <> EmptyStr) then
        raise Exception.Create(sMsg);

       TCalculoImpostoController.New(func)
          .Eventos
            .OnCalcIR( OnCalcIR )
            .OnCalcINSS( OnCalcINSS )
          .EndEventos()
          .SetAliquotaIR( StrToFloat( edtAliqIR.Text ) )
          .SetDeducaoIR(  StrToFloat( edtDedIR.Text ) )
          .SetAliquotaINSS( StrToFloat( edtAliqINSS.Text ) )
          .CalcularIR()
          .CalcularINSS();
    except
      on E: Exception do
      begin
        ShowMessage('FALHA na operação...' + e.Message);
      end;
    end;

  finally
    if Assigned(func) then
      FreeAndNil(func);
  end;
end;

procedure TfrmPrincipal.EditarDep;
begin
  if (not dmView.qryListDependentes.Active) or (dmView.qryListDependentes.IsEmpty)
  then
    Exit();

  ShowFormDependente( dmView.qryListDependentesDEPENDENTE_ID.AsLargeInt );
end;

procedure TfrmPrincipal.EditarFunc;
begin
  if (not dmView.qryListFuncionarios.Active) or (dmView.qryListFuncionarios.IsEmpty)
  then
    Exit();

  ShowFormFuncionario( dmView.qryListFuncionariosFUNCIONARIO_ID.AsLargeInt );
end;

procedure TfrmPrincipal.ExcluirDep;
var
  sMsg : string;
begin
  if (not dmView.qryListDependentes.Active) or (dmView.qryListDependentes.IsEmpty)
  then
    Exit();

  try
    try
      if not TDependenteController.New()
              .DeleteDependente( dmView.qryListDependentesDEPENDENTE_ID.AsLargeInt,
                                  sMsg )
      then
        raise Exception.Create(sMsg);
    except
      on E: Exception do
      begin
        ShowMessage('FALHA na operação... ' + e.Message);
      end;
    end;
  finally
    UpdateListDependentes();
  end;
end;

procedure TfrmPrincipal.ExcluirFunc;
var
  sMsg : string;
begin
  if (not dmView.qryListFuncionarios.Active) or (dmView.qryListFuncionarios.IsEmpty)
  then
    Exit();

  try
    try
      if not TFuncionarioController.New()
              .DeleteFuncionario( dmView.qryListFuncionariosFUNCIONARIO_ID.AsLargeInt,
                                  sMsg )
      then
        raise Exception.Create(sMsg);
    except
      on E: Exception do
      begin
        ShowMessage('FALHA na operação... ' + e.Message);
      end;
    end;
  finally
    SetListFuncionarios();
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  lblVersao.Caption := GetAppVersionStr(ParamStr(0));
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  dmView.qryListFuncionarios.Close();
  dmView.qryListDependentes.Close();
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  SetListFuncionarios();
end;

procedure TfrmPrincipal.IncluirDep;
begin
  if (not dmView.qryListFuncionarios.Active) or (dmView.qryListFuncionarios.IsEmpty)
  then
  begin
    ShowMessage('Listagem de funcionários vazia...');
    Exit();
  end;

  ShowFormDependente();
end;

procedure TfrmPrincipal.IncluirFunc;
begin
  ShowFormFuncionario();
end;

procedure TfrmPrincipal.OnCalcINSS(const Value: Double);
begin
  ShowMessage( Format('Valor do INSS: %S', [FormatFloat(',0.00', Value)]) );
end;

procedure TfrmPrincipal.OnCalcIR(const Value: Double);
begin
  ShowMessage( Format('Valor do IR: %S', [FormatFloat(',0.00', Value)]) );
end;

procedure TfrmPrincipal.OnCloseDep(Sender: TObject; var Action: TCloseAction);
begin
  UpdateListDependentes();

  panGeral.Visible := True;
  Application.ProcessMessages();
end;

procedure TfrmPrincipal.OnCloseFunc(Sender: TObject; var Action: TCloseAction);
begin
  SetListFuncionarios();
  panGeral.Visible := True;
  Application.ProcessMessages();
end;

procedure TfrmPrincipal.SetListFuncionarios();
begin
  dmView.SetListFuncionarios();
end;

procedure TfrmPrincipal.ShowFormDependente(Value : Integer = 0);
var
  frm : TfrmDependente;
begin
  panGeral.Visible := False;
  Application.ProcessMessages();

  frm := TfrmDependente.Create(Application);
  frm.Width := panBody.Width;
  frm.Height := panBody.Height;
  frm.Parent := panBody;
  frm.OnClose := OnCloseDep;
  frm.SetDependente(Value);
  frm.SetFuncionarioID( dmView.qryListFuncionariosFUNCIONARIO_ID.AsLargeInt );
  frm.Show();
end;

procedure TfrmPrincipal.ShowFormFuncionario(Value : Integer = 0);
var
  frm : TfrmFuncionario;
begin
  panGeral.Visible := False;
  Application.ProcessMessages();

  frm := TfrmFuncionario.Create(Application);
  frm.Width := panBody.Width;
  frm.Height := panBody.Height;
  frm.Parent := panBody;
  frm.OnClose := OnCloseFunc;
  frm.SetFuncionario(Value);
  frm.Show();
end;

procedure TfrmPrincipal.UpdateListDependentes;
begin
  dmView.qryListDependentes.Refresh();
end;

procedure TfrmPrincipal.UpdateListFuncionarios;
begin
  dmView.qryListFuncionarios.Refresh();
end;

end.
