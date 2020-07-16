unit untFrmExercicio2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, untDtmExercicio2,
  Vcl.Mask, Vcl.DBCtrls, FireDAC.Comp.Client, untControllerExercicio2, untFuncionario, untDependente,
  Generics.Collections;

type
  TFrmExercicio2 = class(TFrmBase)
    pnlMestre: TPanel;
    pnlDetalhe: TPanel;
    dbgDependentes: TDBGrid;
    dbgFuncionario: TDBGrid;
    pnlTituloCadFuncionario: TPanel;
    Panel1: TPanel;
    lblFuncionario: TLabel;
    lblDependentes: TLabel;
    lblID_FUNCIONARIO: TLabel;
    edtID_FUNCIONARIO: TDBEdit;
    lblNOME_Funcionario: TLabel;
    edtNOME_Funcionario: TDBEdit;
    lblCPF: TLabel;
    edtCPF: TDBEdit;
    lblSALARIO: TLabel;
    edtSALARIO: TDBEdit;
    btnNovoFuncionario: TButton;
    btnExcluirFuncionario: TButton;
    btnCancelarFuncionario: TButton;
    btnSalvarFuncionario: TButton;
    btnCalcularImpostos: TButton;
    edtINSS: TEdit;
    lblINSS: TLabel;
    lblIR: TLabel;
    edtIR: TEdit;
    lblID_DEPENDENTE: TLabel;
    edtID_DEPENDENTE: TDBEdit;
    lblNOME_Dependente: TLabel;
    edtNOME_Dependente: TDBEdit;
    cmbISCALCULAINSS: TDBComboBox;
    cmbISCALCULAIR: TDBComboBox;
    lblISCALCULAINSS: TLabel;
    lblISCALCULAIR: TLabel;
    btnNovoDependente: TButton;
    btnExcluirDependente: TButton;
    btnCancelarDependente: TButton;
    btnSalvarDependente: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoFuncionarioClick(Sender: TObject);
    procedure btnExcluirFuncionarioClick(Sender: TObject);
    procedure btnCancelarFuncionarioClick(Sender: TObject);
    procedure btnSalvarFuncionarioClick(Sender: TObject);
    procedure btnNovoDependenteClick(Sender: TObject);
    procedure btnExcluirDependenteClick(Sender: TObject);
    procedure btnCancelarDependenteClick(Sender: TObject);
    procedure btnSalvarDependenteClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCalcularImpostosClick(Sender: TObject);
  private
    { Private declarations }
    FqryCADFUNCIONARIO: TFDQuery;
    FqryCADDEPENDENTE: TFDQuery;

    FControllerExercicio2: TControllerExercicio2;

    function fcTestarExisteRegistroDataSet(pDataSet: TFDQuery): Boolean;
    function fcTestarExisteDependenteCalculaINSS(const pListaDependentes: TObjectList<TDependente>): Boolean;
    function fcTestarExisteDependenteCalculaIR(const pListaDependentes: TObjectList<TDependente>): Boolean;
    function fcTestarExisteFuncionarioCadastrado(const pDataSetFuncionario: TFDQuery): Boolean;

    function fcRetornarValorINSS(const pFuncionario: TFuncionario): Double;
    function fcRetornarValorIR(const pFuncionario: TFuncionario): Double;
    function fcRetornarNumeroDependentesCalculaIR(const pListaDependentes: TObjectList<TDependente>): Integer;

    procedure prPrepararFuncionario(pQryFuncionario, pQryDependentes: TFDQuery; const pFuncionario: TFuncionario);
    procedure prPrepararDependente(pQryDependentes: TFDQuery; const pFuncionario: TFuncionario);
    procedure prAtualizarDataSet(var pDataSet: TFDQuery);
  public
    { Public declarations }
  end;

var
  FrmExercicio2: TFrmExercicio2;

implementation

{$R *.dfm}

const
  cFORMATOVALOR = '%.2f';

procedure TFrmExercicio2.btnCalcularImpostosClick(Sender: TObject);
var
  vValorImposto: Double;
  vFuncionario: TFuncionario;
begin
  inherited;

  if not fcTestarExisteFuncionarioCadastrado(FqryCADFUNCIONARIO) then
  begin
    ShowMessage('Não há funcionário cadastrado para efetuar o cálculo.');
    Exit;
  end;

  vFuncionario := TFuncionario.Create;

  try
    prPrepararFuncionario(FqryCADFUNCIONARIO, FqryCADDEPENDENTE, vFuncionario);
    vValorImposto := fcRetornarValorINSS(vFuncionario);
    edtINSS.Text  := Format(cFORMATOVALOR, [vValorImposto]);

    vValorImposto := fcRetornarValorIR(vFuncionario);
    edtIR.Text    := Format(cFORMATOVALOR, [vValorImposto]);
  finally
    vFuncionario.Destroy;
  end;
end;

procedure TFrmExercicio2.btnCancelarDependenteClick(Sender: TObject);
begin
  inherited;
  FqryCADDEPENDENTE.Cancel;
end;

procedure TFrmExercicio2.btnCancelarFuncionarioClick(Sender: TObject);
begin
  inherited;
  FqryCADFUNCIONARIO.Cancel;
end;

procedure TFrmExercicio2.btnExcluirDependenteClick(Sender: TObject);
begin
  inherited;
  if not fcTestarExisteRegistroDataSet(FqryCADDEPENDENTE) then
    Exit;

  FControllerExercicio2.prExcluirDependente(FqryCADDEPENDENTE.FieldByName('ID_DEPENDENTE').AsInteger);
  prAtualizarDataSet(FqryCADDEPENDENTE);
end;

procedure TFrmExercicio2.btnExcluirFuncionarioClick(Sender: TObject);
begin
  inherited;
  if not fcTestarExisteRegistroDataSet(FqryCADFUNCIONARIO)then
    Exit;

  FControllerExercicio2.prExcluirFuncionario(FqryCADFUNCIONARIO.FieldByName('ID_FUNCIONARIO').AsInteger);
  prAtualizarDataSet(FqryCADFUNCIONARIO);
end;

procedure TFrmExercicio2.btnNovoDependenteClick(Sender: TObject);
begin
  inherited;
  FqryCADDEPENDENTE.Insert;
  FqryCADDEPENDENTE.FieldByName('ID_DEPENDENTE').AsInteger := FControllerExercicio2.fcGerarIdDependente;
end;

procedure TFrmExercicio2.btnNovoFuncionarioClick(Sender: TObject);
begin
  inherited;
  FqryCADFUNCIONARIO.Insert;
  FqryCADFUNCIONARIO.FieldByName('ID_FUNCIONARIO').AsInteger := FControllerExercicio2.fcGerarIdFuncionario;
end;

procedure TFrmExercicio2.btnSalvarDependenteClick(Sender: TObject);
var
  vDependente: TDependente;
begin
  inherited;
  vDependente := TDependente.Create;

  vDependente.Id_Dependente  := FqryCADDEPENDENTE.FieldByName('ID_DEPENDENTE').AsInteger;
  vDependente.Nome           := FqryCADDEPENDENTE.FieldByName('NOME').AsString;
  vDependente.IsCalcularIR   := FqryCADDEPENDENTE.FieldByName('ISCALCULAIR').AsInteger;
  vDependente.IsCalcularINSS := FqryCADDEPENDENTE.FieldByName('ISCALCULAINSS').AsInteger;

  FqryCADDEPENDENTE.Cancel;
  FControllerExercicio2.prSalvarDependente(FqryCADFUNCIONARIO.FieldByName('ID_FUNCIONARIO').AsInteger, vDependente);
  prAtualizarDataSet(FqryCADDEPENDENTE);
end;

procedure TFrmExercicio2.btnSalvarFuncionarioClick(Sender: TObject);
var
  vFuncionario: TFuncionario;
begin
  inherited;
  vFuncionario := TFuncionario.Create;

  vFuncionario.Id_Funcionario := FqryCADFUNCIONARIO.FieldByName('ID_FUNCIONARIO').AsInteger;
  vFuncionario.Nome           := FqryCADFUNCIONARIO.FieldByName('NOME').AsString;
  vFuncionario.CPF            := FqryCADFUNCIONARIO.FieldByName('CPF').AsString;
  vFuncionario.Salario        := FqryCADFUNCIONARIO.FieldByName('SALARIO').AsFloat;

  FqryCADFUNCIONARIO.Cancel;
  FControllerExercicio2.prSalvarFuncionario(vFuncionario);
  prAtualizarDataSet(FqryCADFUNCIONARIO);
end;

function TFrmExercicio2.fcRetornarNumeroDependentesCalculaIR(const pListaDependentes: TObjectList<TDependente>): Integer;
var
  vContador: Integer;
begin
  Result := 0;

  if not Assigned(pListaDependentes) then
    Exit;

  if pListaDependentes.Count = 0 then
    Exit;

  for vContador := 0 to pListaDependentes.Count - 1 do
  begin
    if pListaDependentes[vContador].IsCalcularIR > 0 then
      Inc(Result);
  end;
end;

function TFrmExercicio2.fcRetornarValorINSS(const pFuncionario: TFuncionario): Double;
const
  cFATORINSS = 0.08;
var
  vListaDependentes: TObjectList<TDependente>;
begin
  Result := 0;

  if not Assigned(pFuncionario) then
    Exit;

  if pFuncionario.Salario <= 0 then
    Exit;

  vListaDependentes := pFuncionario.ListaDependentes;

  if fcTestarExisteDependenteCalculaINSS(vListaDependentes) then
    Result := pFuncionario.Salario * cFatorINSS;
end;

function TFrmExercicio2.fcRetornarValorIR(const pFuncionario: TFuncionario): Double;
const
  cFATORIR = 0.15;
  cVALORDEDUCAOPORDEPENDENTE = 100;
var
  vListaDependentes: TObjectList<TDependente>;
  vValorDeducao: Double;
begin
  Result := 0;

  if not Assigned(pFuncionario) then
    Exit;

  if pFuncionario.Salario <= 0 then
    Exit;

  vValorDeducao     := 0;
  vListaDependentes := pFuncionario.ListaDependentes;

  if fcTestarExisteDependenteCalculaIR(vListaDependentes) then
    vValorDeducao := fcRetornarNumeroDependentesCalculaIR(vListaDependentes) * cVALORDEDUCAOPORDEPENDENTE;

  Result := (pFuncionario.Salario - vValorDeducao) * cFATORIR;
end;

function TFrmExercicio2.fcTestarExisteDependenteCalculaINSS(const pListaDependentes: TObjectList<TDependente>): Boolean;
var
  vContador: Integer;
begin
  Result := False;

  if not Assigned(pListaDependentes) then
    Exit;

  if pListaDependentes.Count = 0 then
    Exit;

  for vContador := 0 to pListaDependentes.Count - 1 do
  begin
    if pListaDependentes[vContador].IsCalcularINSS > 0 then
    begin
      Result := True;
      Break;
    end;
  end;
end;

function TFrmExercicio2.fcTestarExisteDependenteCalculaIR(const pListaDependentes: TObjectList<TDependente>): Boolean;
var
  vContador: Integer;
begin
  Result := False;

  if not Assigned(pListaDependentes) then
    Exit;

  if pListaDependentes.Count = 0 then
    Exit;

  for vContador := 0 to pListaDependentes.Count - 1 do
  begin
    if pListaDependentes[vContador].IsCalcularIR > 0 then
    begin
      Result := True;
      Break;
    end;
  end;
end;

function TFrmExercicio2.fcTestarExisteFuncionarioCadastrado(const pDataSetFuncionario: TFDQuery): Boolean;
begin
  Result := False;

  if not Assigned(pDataSetFuncionario) then
    Exit;

  Result := pDataSetFuncionario.RecordCount > 0;
end;

function TFrmExercicio2.fcTestarExisteRegistroDataSet(pDataSet: TFDQuery): Boolean;
begin
  Result := False;

  if not Assigned(pDataSet) then
    Exit;

  Result := pDataSet.RecordCount > 0;
end;

procedure TFrmExercicio2.FormCreate(Sender: TObject);
begin
  inherited;
  dtmExercicio2 := TdtmExercicio2.Create(Self, ExtractFilePath(Application.ExeName));

  FqryCADFUNCIONARIO := dtmExercicio2.qryCADFUNCIONARIO;
  FqryCADDEPENDENTE  := dtmExercicio2.qryCADDEPENDENTE;

  FControllerExercicio2 := TControllerExercicio2.Create;

  edtINSS.Text := Format(cFORMATOVALOR, [0.0]);
  edtIR.Text   := Format(cFORMATOVALOR, [0.0]);
end;

procedure TFrmExercicio2.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FControllerExercicio2);
  inherited;
end;

procedure TFrmExercicio2.prAtualizarDataSet(var pDataSet: TFDQuery);
begin
  if not Assigned(pDataSet) then
    Exit;

  pDataSet.Refresh;
end;

procedure TFrmExercicio2.prPrepararDependente(pQryDependentes: TFDQuery; const pFuncionario: TFuncionario);
var
  vListaDependentes: TObjectList<TDependente>;
  vDependente: TDependente;
begin
  vListaDependentes := TObjectList<TDependente>.Create;

  pQryDependentes.First;
  while not pQryDependentes.Eof do
  begin
    vDependente := TDependente.Create;
    vDependente.Id_Dependente  := pQryDependentes.FieldByName('ID_DEPENDENTE').AsInteger;
    vDependente.Nome           := pQryDependentes.FieldByName('NOME').AsString;
    vDependente.IsCalcularIR   := pQryDependentes.FieldByName('ISCALCULAIR').AsInteger;
    vDependente.IsCalcularINSS := pQryDependentes.FieldByName('ISCALCULAINSS').AsInteger;

    vListaDependentes.Add(vDependente);
    pQryDependentes.Next;
  end;

  pQryDependentes.First;
  pFuncionario.ListaDependentes := vListaDependentes;
end;

procedure TFrmExercicio2.prPrepararFuncionario(pQryFuncionario, pQryDependentes: TFDQuery; const pFuncionario: TFuncionario);
begin
  pFuncionario.Id_Funcionario := pQryFuncionario.FieldByName('ID_FUNCIONARIO').AsInteger;
  pFuncionario.Nome           := pQryFuncionario.FieldByName('NOME').AsString;
  pFuncionario.CPF            := pQryFuncionario.FieldByName('CPF').AsString;
  pFuncionario.Salario        := pQryFuncionario.FieldByName('SALARIO').AsFloat;

  prPrepararDependente(pQryDependentes, pFuncionario);
end;

end.
