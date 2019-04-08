unit Controller.DAL.Funcionario;

interface

uses SysUtils, Entities.Funcionario,
  Controller.DAL.Base, FireDAC.Comp.Client;

type
  TFuncionarioDAL = class(TBaseDAL)
  private
    function GetSqlBaseFuncionario() : string;
    function GetSqlFuncionario(AFuncionarioID : int64) : string; overload;

    function SetFuncionario(AFuncionario : TFuncionario; AQuery : TFDQuery; out AMessage : string) : boolean;
    function FuncionarioExists(ACPF : string) : boolean;
    function GetFuncionarioID( ACPF : string ) : Int64;
  public
    function SaveFuncionario( AFuncionario : TFuncionario; out AMessage : string) : boolean;

    function LoadFuncionario(AFuncionarioID : int64; AFuncionario : TFuncionario; out AMessage : string) : boolean; overload;
    function LoadFuncionario(AFuncionarioID : int64; out AMessage : string) : TFuncionario; overload;

    function DeleteFuncionario(AFuncionarioID : int64; out AMessage : string) : boolean;
  end;

implementation

{ TFuncionarioDAL }

uses
   Data.DB, Constante.Connection;

function TFuncionarioDAL.FuncionarioExists(ACPF : string) : boolean;
begin
  Result := GetFuncionarioID(ACPF) <> 0;
end;

function TFuncionarioDAL.DeleteFuncionario(AFuncionarioID: int64; out AMessage: string): boolean;
begin
  result := Delete('FUNCIONARIO',
                   Format('FUNCIONARIO_ID = %D', [AFuncionarioID]),
                   AMessage);
end;

function TFuncionarioDAL.GetFuncionarioID(ACPF: string): Int64;
begin
  result := GetValue('FUNCIONARIO',
                      Format('CPF = %S', [QuotedStr(ACPF)]),
                      'FUNCIONARIO_ID',
                      ftInteger);
end;

function TFuncionarioDAL.GetSqlBaseFuncionario: string;
begin
  result := 'SELECT '
                + 'F.* '
             + 'FROM '
                 + 'FUNCIONARIO F ';
end;

function TFuncionarioDAL.GetSqlFuncionario(AFuncionarioID: int64): string;
begin
  result := GetSqlBaseFuncionario()
          + 'WHERE '
               + Format('F.FUNCIONARIO_ID = %D', [AFuncionarioID]);
end;

function TFuncionarioDAL.LoadFuncionario(AFuncionarioID: int64; out AMessage: string): TFuncionario;
var
  Funcionario : TFuncionario;
begin
  Funcionario := nil;
  result := nil;
  try
    Funcionario := TFuncionario.Create();
    if not LoadFuncionario(AFuncionarioID, Funcionario, AMessage)  then
      raise Exception.Create(AMessage);

    result := Funcionario;
  except
    on e : Exception do
    begin
      AMessage := e.Message;

      if Assigned(Funcionario) then
        FreeAndNil(Funcionario);
    end;
  end;
end;

function TFuncionarioDAL.LoadFuncionario(AFuncionarioID: int64; AFuncionario: TFuncionario;
  out AMessage: string): boolean;
var
  qryAux : TFDQuery;
begin
  result := false;
  try
    try
      //--- recupera os dados
      qryAux := GetSqlResult( GetSqlFuncionario(AFuncionarioID) );
      if (not qryAux.Active) or (qryAux.IsEmpty) then
        raise Exception.Create('Funcionário não encontrado na base de dados...');

      //--- cria e seta dados na classe
      if not SetFuncionario( AFuncionario, qryAux, AMessage ) then
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

function TFuncionarioDAL.SaveFuncionario(AFuncionario: TFuncionario; out AMessage: string): boolean;
const
  _SQL_INSERT = 'INSERT INTO FUNCIONARIO(FUNCIONARIO_ID, CPF, NOME, SALARIO) '
              + 'VALUES (%D, %S, %S, %S) ';

  _SQL_UPDATE = 'UPDATE FUNCIONARIO SET '
                +'CPF = %S, NOME = %S, SALARIO = %S '
                + 'WHERE FUNCIONARIO_ID = %D ';
var
  iID : integer;
  sSQL : string;
  fsFloatSetings: TFormatSettings;
begin
  fsFloatSetings.DecimalSeparator := '.';
  fsFloatSetings.ThousandSeparator := #0;

  iID := 0;

  result := false;
  try
    with AFuncionario do
    begin
      iID := FuncionarioID;
      if iID = 0 then
        iID := GetFuncionarioID( CPF );

      if iID = 0 then
      begin
        iID := GetNextSequence('GEN_FUNCIONARIO_ID ');

        sSQL := Format( _SQL_INSERT,
                       [ iID,
                         QuotedStr(CPF),
                         QuotedStr(Nome),
                         FormatFloat( _MASK_SQL_FLOAT, Salario, fsFloatSetings) ] );
      end
      else
      begin
        sSQL := Format( _SQL_UPDATE,
                       [ QuotedStr( CPF ),
                         QuotedStr(Nome),
                         FormatFloat( _MASK_SQL_FLOAT, Salario, fsFloatSetings ),
                         FuncionarioID ] );
      end;

      if not ExecSQL(sSQL, AMessage) then
        raise Exception.Create(AMessage);
    end;

    if iID <> 0  then
      AFuncionario.FuncionarioID := iID;

    result := true;
  except
    on e  : Exception do
    begin
      result := false;
      AMessage := e.Message;
    end;
  end;
end;

function TFuncionarioDAL.SetFuncionario(AFuncionario: TFuncionario; AQuery: TFDQuery;
  out AMessage: string): boolean;
begin
  if (not AQuery.Active) or (AQuery.IsEmpty) then
    exit(true);

  try
    with AFuncionario do
    begin
      FuncionarioID := AQuery.FieldByName('FUNCIONARIO_ID').Value;
      Nome          := AQuery.FieldByName('NOME').Value;
      CPF           := AQuery.FieldByName('CPF').Value;
      Salario       := AQuery.FieldByName('SALARIO').Value;
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
