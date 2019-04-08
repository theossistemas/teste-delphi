unit Controller.DAL.Base;

interface

uses
  DB, DBClient, FireDAC.Comp.Client, Controller.Interfaces;

type
  TBaseDAL = class(TInterfacedObject, iDAL)
  private
    FConnection : TFDConnection;
  protected
    function Delete(const ATableName,  AWhere : string; out AMessage : string) : boolean;
    function GetNextSequence(const ASequenceName : string) : variant;
    function GetSqlResult(const ASql : string) : TFDQuery;
    function ExecSQL( const ASQL : string; out AMessage : string) : Boolean;

    function GetValue(const ATabela, AWhere, AFieldReturn: string; ATypeReturn: TFieldType = ftVariant; AOrderBy : string = ''): Variant;
  public
    constructor Create(Value : TFDConnection);
    destructor Destroy(); override;

    class function New(Value : TFDConnection) : iDAL;

    procedure StartTransaction();
    procedure RollbackTransaction();
    procedure CommitTransaction();
  end;

implementation

uses SysUtils, System.Classes, Constante.Connection, Variants;

{ TBaseDAL }

procedure TBaseDAL.CommitTransaction();
begin
  if FConnection.InTransaction then
    FConnection.Commit();
end;

constructor TBaseDAL.Create(Value: TFDConnection);
begin
  FConnection := Value;
end;

function TBaseDAL.Delete(const ATableName,  AWhere : string; out AMessage : string) : boolean;
const
  _SQL_DELETE = 'DELETE FROM %S WHERE %S';

var
  qryTemp : TFDQuery;
begin
  result := false;

  qryTemp := TFDQuery.Create(nil);
  try
    try
      qryTemp.Connection := FConnection;
      qryTemp.ExecSQL( Format(_SQL_DELETE,
                             [ATableName,
                             AWhere])
                     );

      result := true;
    except
      on e : Exception do
      begin
        result := False;
        AMessage := e.Message;
      end;
    end;
  finally
    if Assigned(qryTemp) then
      FreeAndNil(qryTemp);
  end;
end;

destructor TBaseDAL.Destroy;
begin

  inherited;
end;

function TBaseDAL.ExecSQL( const ASQL : string; out AMessage : string) : Boolean;
var
  qryTemp : TFDQuery;
begin
  result := false;

  qryTemp := TFDQuery.Create(nil);
  try
    try
      qryTemp.Connection := FConnection;
      qryTemp.ExecSQL( ASQL);
      result := true;
    except
      on e : Exception do
      begin
        result := False;
        AMessage := e.Message;
      end;
    end;
  finally
      FreeAndNil(qryTemp);
  end;
end;

function TBaseDAL.GetNextSequence(const ASequenceName : string) : variant;
const
  _SQL_NEXT_SEQUENCE = 'SELECT NEXT VALUE FOR %S FROM RDB$DATABASE';
var
  qryTemp : TFDQuery;
begin
  result := 0;
  qryTemp := TFDQuery.Create(nil);
  try
    qryTemp.Connection := FConnection;
    qryTemp.SQL.Text := Format( _SQL_NEXT_SEQUENCE, [ASequenceName]);
    qryTemp.Open();

    result := qryTemp.FieldByName('GEN_ID').Value;
  finally
    FreeAndNil(qryTemp);
  end;
end;

function TBaseDAL.GetSqlResult(const ASql : string) : TFDQuery;
var
  qryTemp : TFDQuery;
begin
  result := nil;

  qryTemp := TFDQuery.Create(nil);
  try
    try
      qryTemp.Close();
      qryTemp.Connection := FConnection;
      qryTemp.SQL.Clear();
      qryTemp.SQL.Add( ASql );
      qryTemp.Open();
      qryTemp.FetchAll();
    except
      on e : Exception do
      begin
        qryTemp.Disconnect();
        qryTemp.Close();
      end;
    end;
  finally
    result := qryTemp;
  end;
end;

function TBaseDAL.GetValue(const ATabela, AWhere, AFieldReturn: string; ATypeReturn: TFieldType; AOrderBy: string): Variant;
var
  sSql : string;
  qryTemp : TFDQuery;
begin
  Result := Null;

  sSql := 'SELECT ' + AFieldReturn + ' FROM ' + ATabela;
  if AWhere <> '' then
    sSql := sSql + ' WHERE '+ AWhere;

  if AOrderBy <> EmptyStr then
    sSql := sSql + ' ORDER BY ' + AOrderBy;

  qryTemp := TFDQuery.Create(nil);
  try
    qryTemp.Connection := FConnection;
    qryTemp.SQL.Text := sSql;
    qryTemp.Open();

    if not qryTemp.IsEmpty then
    begin
      if ATypeReturn = ftFloat then Result := qryTemp.FieldByName(AFieldReturn).AsFloat
      else if ATypeReturn = ftInteger then Result := qryTemp.FieldByName(AFieldReturn).AsInteger
      else if ATypeReturn = ftString then Result := qryTemp.FieldByName(AFieldReturn).AsString
      else if ATypeReturn = ftDateTime then Result := qryTemp.FieldByName(AFieldReturn).AsDateTime
      else if ATypeReturn = ftBoolean then Result := qryTemp.FieldByName(AFieldReturn).AsBoolean
      else
        Result := qryTemp.FieldByName(AFieldReturn).Value
    end
    else
    begin
      if ATypeReturn = ftFloat then Result := 0
      else if ATypeReturn = ftInteger then Result := 0
      else if ATypeReturn = ftString then Result := ''
      else if ATypeReturn = ftDateTime then Result := 0
      else if ATypeReturn = ftBoolean then Result := False
      else if ATypeReturn = ftLargeint then Result := 0
      else
        Result := Null
    end;
  finally
    FreeAndNil(qryTemp);
  end;

end;

class function TBaseDAL.New(Value: TFDConnection): iDAL;
begin

end;

procedure TBaseDAL.RollbackTransaction();
begin
  if FConnection.InTransaction then
    FConnection.Rollback();
end;

procedure TBaseDAL.StartTransaction();
begin
  if FConnection.InTransaction then
    FConnection.StartTransaction();
end;

end.
