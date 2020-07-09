unit uFuncionarioController;

interface

uses UConexao, uFuncionario, Vcl.Dialogs, FireDAC.Comp.Client, Data.DB,Types;

type
  TFuncionarioControl = class
  private
    FConexao: TConexao;
    FFuncionario: TFuncionario;
    FDependente: TDependente;

  class var
    FInstance: TFuncionarioControl;
    ODialog: TOpenDialog;
  public
    Constructor Create;
    Destructor Destroy; override;

    Procedure CalcularIRouINSS(ds: TDataset;Tipo : TipoCalculo);

    class function GetInstance: TFuncionarioControl;
    Function Carregar: TFdQuery;
    Function CarregarDependentes(CodigoFuncionario: Integer): TFdQuery;
    Function SalvarFuncionario: Boolean;
    Function SalvarDependente: Boolean;
    property Funcionario: TFuncionario read FFuncionario write FFuncionario;
    Property Dependente: TDependente read FDependente write FDependente;
    property Conexao: TConexao read FConexao write FConexao;
  end;

implementation

uses System.SysUtils, Vcl.Forms;
{ TFuncionarioControl }

procedure TFuncionarioControl.CalcularIRouINSS(ds: TDataset;Tipo : TipoCalculo);
var
QtdIR : Integer;
VDependente : TDependente;
begin

FFuncionario.FListaDependentes := TListaDependentes.Create();
qtdIR := 0;
  if ds.RecordCount > 0 then
  begin
    ds.First;
    while not ds.Eof do
    begin
    VDependente := TDependente.Create;
    VDependente.Codigo := ds.Fields[0].AsInteger;
    VDependente.Nome:= ds.Fields[1].AsString;
    VDependente.IsCalculaIR:= ds.Fields[2].AsBoolean;
    if VDependente.IsCalculaIR then
     Inc(qtdIR);
    VDependente.IsCalculaINSS:= ds.Fields[3].AsBoolean;
    VDependente.CodigoFuncionario:= ds.Fields[4].AsInteger;
    FFuncionario.FListaDependentes.Adicionar(VDependente);
    ds.Next;
    VDependente.Free;
    end;
  end;

  case Tipo of
    CalculoINSS: FFuncionario.CalculoINSS;
    CalculoIR  : FFuncionario.CalculoIR(qtdIR);
  end;

end;


Function TFuncionarioControl.Carregar: TFdQuery;
begin
  Result := FFuncionario.Carregar;
end;

function TFuncionarioControl.CarregarDependentes(CodigoFuncionario: Integer)
  : TFdQuery;
begin
  Result := FDependente.Carregar(CodigoFuncionario);
end;

constructor TFuncionarioControl.Create;
begin
  ODialog := TOpenDialog.Create(nil);
  ShowMessage('Escolha o Caminho do banco de dados por favor !');
  if ODialog.Execute then
  begin
    FConexao := TConexao.Create(ODialog.FileName);
  end
  else
  begin
    ShowMessage('Falha ao conectar com o banco de dados!!' + #13 +
      'Encerrando aplicação !');
    Application.Terminate;
  end;
  FFuncionario := TFuncionario.Create();
  FDependente := TDependente.Create();
end;

destructor TFuncionarioControl.Destroy;
begin
  if Assigned(FFuncionario) then
    FreeAndNil(FFuncionario);
  if Assigned(FDependente) then
    FDependente.Free;
  if Assigned(FConexao) then

    FreeAndNil(FConexao);

  inherited;
end;

class function TFuncionarioControl.GetInstance: TFuncionarioControl;
begin
  if not Assigned(Self.FInstance) then
    Self.FInstance := TFuncionarioControl.Create();

  Result := Self.FInstance;
end;

function TFuncionarioControl.SalvarDependente: Boolean;
begin
  Result := FDependente.Salvar;
end;

function TFuncionarioControl.SalvarFuncionario: Boolean;
begin
  Result := FFuncionario.Salvar;
end;

end.
