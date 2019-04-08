unit Controller.Dependente;

interface

uses
  Controller.Interfaces, Controller.DAL.Dependente, Entities.Dependente;

type
  TDependenteController = class sealed (TInterfacedObject, iDependenteController)
  private
    FDAO : TDependenteDAL;
  public
    constructor Create();
    destructor Destroy(); override;

    class function New() : iDependenteController;

    function SaveDependente( ADependente : TDependente; out AMessage : string) : boolean; overload;
    function SaveDependente( AFuncionarioID : Int64; ADependentes : TListDependente; out AMessage : string; AUseTransaction : Boolean = true) : boolean; overload;

    function LoadDependente(ADependenteID : int64; ADependente : TDependente; out AMessage : string) : boolean; overload;
    function LoadDependente(ADependenteID : int64; out AMessage : string) : TDependente; overload;

    function LoadDependentes(AFuncionarioID : int64; ADependentes : TListDependente; out AMessage : string) : boolean; overload;
    function LoadDependentes(AFuncionarioID : int64; out AMessage : string) : TListDependente; overload;

    function DeleteDependente(ADependenteID : int64; out AMessage : string) : boolean;
    function DeleteDependentes(AFuncionarioID : int64; out AMessage : string) : boolean;
  end;

implementation

uses UDMServer, System.SysUtils;

{ TDependenteController }

constructor TDependenteController.Create;
begin
  FDAO := TDependenteDAL.Create(dmServer.FDConnection);
end;

function TDependenteController.DeleteDependente(ADependenteID: int64; out AMessage: string): boolean;
begin
  result := FDAO.DeleteDependente(ADependenteID, AMessage);
end;

function TDependenteController.DeleteDependentes(AFuncionarioID: int64; out AMessage: string): boolean;
begin
  Result := FDAO.DeleteDependentes( AFuncionarioID, AMessage );
end;

destructor TDependenteController.Destroy;
begin
  if Assigned(FDAO) then
    FreeAndNil(FDAO);

  inherited;
end;

function TDependenteController.LoadDependente(ADependenteID: int64; out AMessage: string): TDependente;
begin
  result := FDAO.LoadDependente( ADependenteID, AMessage );
end;

function TDependenteController.LoadDependentes(AFuncionarioID: int64; ADependentes: TListDependente; out AMessage: string): boolean;
begin
  result := FDAO.LoadDependentes( AFuncionarioID, ADependentes, AMessage );
end;

function TDependenteController.LoadDependentes(AFuncionarioID: int64; out AMessage: string): TListDependente;
begin
  result := FDAO.LoadDependentes( AFuncionarioID, AMessage );
end;

class function TDependenteController.New: iDependenteController;
begin
  result := TDependenteController.Create();
end;

function TDependenteController.LoadDependente(ADependenteID: int64; ADependente: TDependente; out AMessage: string): boolean;
begin
  result := FDAO.LoadDependente(ADependenteID, ADependente, AMessage);
end;

function TDependenteController.SaveDependente(ADependente: TDependente; out AMessage: string): boolean;
begin
  result := FDAO.SaveDependente( ADependente, AMessage )
end;

function TDependenteController.SaveDependente(AFuncionarioID: Int64; ADependentes: TListDependente; out AMessage: string; AUseTransaction: Boolean): boolean;
var
  dep : TDependente;
begin
  result := False;
  try
    if AUseTransaction then
      FDAO.StartTransaction();

    for dep in ADependentes do
    begin
      if not SaveDependente(dep, AMessage) then
        raise Exception.Create(AMessage);
    end;

    if AUseTransaction then
      FDAO.CommitTransaction();

    Result := True;
  except
    on e : Exception do
    begin
      result := False;
      AMessage := e.Message;

      if AUseTransaction then
        FDAO.RollbackTransaction();
    end;
  end;
end;

end.

