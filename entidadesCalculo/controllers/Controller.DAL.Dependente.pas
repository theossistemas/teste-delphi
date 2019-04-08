unit Controller.DAL.Dependente;

interface

uses SysUtils, Entities.Dependente,
  Controller.DAL.Base, FireDAC.Comp.Client;

type
  TDependenteDAL = class(TBaseDAL)
  private
    function GetSqlBaseDependente() : string;
    function GetSqlDependente(ADependenteID : int64) : string; overload;
    function GetSqlListDependente(AFuncionarioID : int64) : string; overload;

    function SetDependente(ADependente : TDependente; AQuery : TFDQuery; out AMessage : string) : boolean;
  public
    function SaveDependente( ADependente : TDependente; out AMessage : string) : boolean;

    function LoadDependente(ADependenteID : int64; ADependente : TDependente; out AMessage : string) : boolean; overload;
    function LoadDependente(ADependenteID : int64; out AMessage : string) : TDependente; overload;

    function LoadDependentes(AFuncionarioID : int64; ADependentes : TListDependente; out AMessage : string) : boolean; overload;
    function LoadDependentes(AFuncionarioID : int64; out AMessage : string) : TListDependente; overload;

    function DeleteDependente(ADependenteID : int64; out AMessage : string) : boolean;
    function DeleteDependentes(AFuncionarioID : int64; out AMessage : string) : boolean;
  end;

implementation

{ TDependenteDAL }

uses
   Data.DB, Constante.Connection, Common.Constantes;

function TDependenteDAL.DeleteDependente(ADependenteID: int64; out AMessage: string): boolean;
begin
  result := Delete('DEPENDENTE',
                   Format('DEPENDENTE_ID = %D', [ADependenteID]),
                   AMessage);
end;


function TDependenteDAL.DeleteDependentes(AFuncionarioID: int64; out AMessage: string): boolean;
begin
  result := Delete('DEPENDENTE',
                   Format('FUNCIONARIO_ID = %D', [AFuncionarioID]),
                   AMessage);
end;

function TDependenteDAL.GetSqlBaseDependente: string;
begin
  result := 'SELECT '
                + 'D.* '
             + 'FROM '
                 + 'DEPENDENTE D ';
end;

function TDependenteDAL.GetSqlDependente(ADependenteID: int64): string;
begin
  result := GetSqlBaseDependente()
          + 'WHERE '
               + Format('D.DEPENDENTE_ID = %D', [ADependenteID]);
end;

function TDependenteDAL.GetSqlListDependente(AFuncionarioID: int64): string;
begin
  result := GetSqlBaseDependente()
          + 'WHERE '
               + Format('D.FUNCIONARIO_ID = %D', [AFuncionarioID]);
end;

function TDependenteDAL.LoadDependentes(AFuncionarioID: int64; ADependentes: TListDependente; out AMessage: string): boolean;
var
  qryAux : TFDQuery;
begin
  result := false;
  try
    try
      ADependentes.Clear();

      //--- recupera os dados
      qryAux := GetSqlResult( GetSqlListDependente(AFuncionarioID) );
      if (not qryAux.Active) or (qryAux.IsEmpty) then
        raise Exception.Create('Dependentes não encontrados na base de dados...');

      //--- cria e seta dados na classe
      qryAux.First();
      while not qryAux.Eof do
      begin
        if not SetDependente( ADependentes.Add(), qryAux, AMessage ) then
          raise Exception.Create(AMessage);

         qryAux.Next;
      end;

      result := true;
    except
      on e : Exception do
      begin
        AMessage := e.Message;
        result := false;
      end;
    end;
  finally
    if Assigned(qryAux) then
      FreeAndNil(qryAux);
  end;
end;

function TDependenteDAL.LoadDependentes(AFuncionarioID: int64; out AMessage: string): TListDependente;
var
  list : TListDependente;
begin
  list := nil;
  result := nil;
  try
    list := TListDependente.Create();
    if not LoadDependentes(AFuncionarioID, list, AMessage)  then
      raise Exception.Create(AMessage);

    result := list;
  except
    on e : Exception do
    begin
      AMessage := e.Message;

      if Assigned(list) then
        FreeAndNil(list);
    end;
  end;
end;

function TDependenteDAL.LoadDependente(ADependenteID: int64; out AMessage: string): TDependente;
var
  Dependente : TDependente;
begin
  Dependente := nil;
  result := nil;
  try
    Dependente := TDependente.Create();
    if not LoadDependente(ADependenteID, Dependente, AMessage)  then
      raise Exception.Create(AMessage);

    result := Dependente;
  except
    on e : Exception do
    begin
      AMessage := e.Message;

      if Assigned(Dependente) then
        FreeAndNil(Dependente);
    end;
  end;
end;

function TDependenteDAL.LoadDependente(ADependenteID: int64; ADependente: TDependente;
  out AMessage: string): boolean;
var
  qryAux : TFDQuery;
begin
  result := false;
  try
    try
      //--- recupera os dados
      qryAux := GetSqlResult( GetSqlDependente(ADependenteID) );
      if (not qryAux.Active) or (qryAux.IsEmpty) then
        raise Exception.Create('Dependente não encontrado na base de dados...');

      //--- cria e seta dados na classe
      if not SetDependente( ADependente, qryAux, AMessage ) then
        raise Exception.Create(AMessage);

      result := true;
    except
      on e : Exception do
      begin
        AMessage := e.Message;
        result := false;
      end;
    end;
  finally
    if Assigned(qryAux) then
      FreeAndNil(qryAux);
  end;
end;

function TDependenteDAL.SaveDependente(ADependente: TDependente; out AMessage: string): boolean;
const
  _SQL_INSERT = 'INSERT INTO DEPENDENTE(DEPENDENTE_ID, FUNCIONARIO_ID, NOME, IS_CALCULA_IR, IS_CALCULA_INSS) '
              + 'VALUES (%D, %D, %S, %D, %D) ';

  _SQL_UPDATE = 'UPDATE DEPENDENTE SET '
                +'FUNCIONARIO_ID = %D, NOME = %S, IS_CALCULA_IR = %D, IS_CALCULA_INSS = %D '
                + 'WHERE DEPENDENTE_ID = %D ';
var
  iID : integer;
  sSQL : string;
begin
  iID := 0;

  result := false;
  try
    with ADependente do
    begin
      iID := DependenteID;

      if iID = 0 then
      begin
        iID := GetNextSequence('GEN_DEPENDENTE_ID ');

        sSQL := Format( _SQL_INSERT,
                       [ iID,
                         FuncionarioID,
                         QuotedStr(Nome),
                         BoolToInt(IsCalculaIR),
                         BoolToInt(IsCalculaINSS) ] );
      end
      else
      begin
        sSQL := Format( _SQL_UPDATE,
                       [ FuncionarioID,
                         QuotedStr(Nome),
                         BoolToInt(IsCalculaIR),
                         BoolToInt(IsCalculaINSS),
                         DependenteID ] );
      end;

      if not ExecSQL(sSQL, AMessage) then
        raise Exception.Create(AMessage);
    end;

    if iID <> 0  then
      ADependente.DependenteID := iID;

    result := true;
  except
    on e  : Exception do
    begin
      result := false;
      AMessage := e.Message;
    end;
  end;
end;

function TDependenteDAL.SetDependente(ADependente: TDependente; AQuery: TFDQuery;
  out AMessage: string): boolean;
begin
  if (not AQuery.Active) or (AQuery.IsEmpty) then
    exit(true);

  try
    with ADependente do
    begin
      DependenteID  := AQuery.FieldByName('DEPENDENTE_ID').Value;
      FuncionarioID := AQuery.FieldByName('FUNCIONARIO_ID').Value;
      Nome          := AQuery.FieldByName('NOME').Value;
      IsCalculaIR   := IntToBool( AQuery.FieldByName('IS_CALCULA_IR').Value );
      IsCalculaINSS := IntToBool( AQuery.FieldByName('IS_CALCULA_INSS').Value );
    end;

    result := true;
  except
    on e : Exception do
    begin
      result := false;
      AMessage := e.Message;
    end;
  end;
end;

end.
