unit Controller.Funcionario;

interface

uses
  Controller.Interfaces, Controller.DAL.Funcionario, Entities.Funcionario, Entities.Dependente,
  Controller.Dependente;

type
  TFuncionarioController = class sealed (TInterfacedObject, iFuncionarioController)
  private
    FDAO : TFuncionarioDAL;

    function LoadDependentes(AFuncionarioID : Int64; AListDep : TListDependente; out AMessage : string) : Boolean;
  public
    constructor Create();
    destructor Destroy(); override;

    class function New() : iFuncionarioController;

    function SaveFuncionario( AFuncionario : TFuncionario; out AMessage : string) : boolean;

    function LoadFuncionario(AFuncionarioID : int64; AFuncionario : TFuncionario; out AMessage : string) : boolean; overload;
    function LoadFuncionario(AFuncionarioID : int64; out AMessage : string) : TFuncionario; overload;

    function DeleteFuncionario(AFuncionarioID : int64; out AMessage : string) : boolean;
  end;

implementation

uses UDMServer, System.SysUtils;

{ TFuncionarioController }

constructor TFuncionarioController.Create;
begin
  FDAO := TFuncionarioDAL.Create(dmServer.FDConnection);
end;

function TFuncionarioController.DeleteFuncionario(AFuncionarioID: int64; out AMessage: string): boolean;
begin
  result := FDAO.DeleteFuncionario(AFuncionarioID, AMessage);
end;

destructor TFuncionarioController.Destroy;
begin
  if Assigned(FDAO) then
    FreeAndNil(FDAO);

  inherited;
end;

function TFuncionarioController.LoadDependentes(AFuncionarioID: Int64; AListDep: TListDependente; out AMessage: string): Boolean;
begin
  Result := TDependenteController.New()
              .LoadDependentes( AFuncionarioID, AListDep, AMessage );
end;

function TFuncionarioController.LoadFuncionario(AFuncionarioID: int64; out AMessage: string): TFuncionario;
var
  func : TFuncionario;
  sMSg : string;
begin
  result := nil;
  try
    func := FDAO.LoadFuncionario( AFuncionarioID, AMessage );
    if not Assigned(func) or (AMessage <> EmptyStr) then
      raise Exception.Create(AMessage);

    LoadDependentes(AFuncionarioID, func.Dependentes, sMsg);

    result := func;
  except
    on e : Exception do
    begin
      AMessage := e.Message;
      
      if Assigned(func) then
        FreeAndNil(func);
    end;
  end;
end;

class function TFuncionarioController.New: iFuncionarioController;
begin
  result := TFuncionarioController.Create();
end;

function TFuncionarioController.LoadFuncionario(AFuncionarioID: int64; AFuncionario: TFuncionario; out AMessage: string): boolean;
var
  sMsg : string;
begin
  result := False;
  try
    if not FDAO.LoadFuncionario(AFuncionarioID, AFuncionario, AMessage) then
      raise Exception.Create(AMessage);

    LoadDependentes( AFuncionarioID, AFuncionario.Dependentes, sMsg );

    result := True;
  except
    on e : Exception do
    begin
      result := False;
      AMessage := e.Message;
    end;
  end;
end;

function TFuncionarioController.SaveFuncionario(AFuncionario: TFuncionario; out AMessage: string): boolean;
begin
  result := FDAO.SaveFuncionario( AFuncionario, AMessage )
end;

end.
