unit uGenericDAO;

interface

uses
  Db, Rtti, uEntityAtributo, TypInfo, SysUtils, uDMBaseDados;

type
  TGenericDAO = class
  private
    class function GetTableName<T: class>(Obj: T): String;

  public
    constructor Create;
    destructor Destroy;
    class function Insert<T: class>(Obj: T):boolean;
    class function GetAll<T: class>(Obj: T): TDataSet;
    class function GetID<T: class>(Obj: T): integer;
  end;

implementation


constructor TGenericDAO.Create;
begin
  dmBaseDados.Conectar;
end;

destructor TGenericDAO.Destroy;
begin
  dmBaseDados.Desconectar;
end;

class function TGenericDAO.GetTableName<T>(Obj: T): String;
var
  Contexto: TRttiContext;
  TypObj: TRttiType;
  Atributo: TCustomAttribute;
  strTable: String;
begin
  Contexto := TRttiContext.Create;
  TypObj := Contexto.GetType(TObject(Obj).ClassInfo);
  for Atributo in TypObj.GetAttributes do
  begin
    if Atributo is TableName then
      Exit(TableName(Atributo).Name);
  end;
end;

class function TGenericDAO.Insert<T>(Obj: T):boolean;
var
  Contexto: TRttiContext;
  TypObj: TRttiType;
  Prop: TRttiProperty;
  strInsert, strFields, strValues: String;
  Atributo: TCustomAttribute;
begin
  strInsert := '';
  strFields := '';
  strValues := '';

  strInsert := 'INSERT INTO ' + GetTableName(Obj);

  Contexto := TRttiContext.Create;
  TypObj := Contexto.GetType(TObject(Obj).ClassInfo);

  for Prop in TypObj.GetProperties do
  begin
    for Atributo in Prop.GetAttributes do
    begin
      if Atributo is FieldName then
      begin
        strFields := strFields + FieldName(Atributo).Name + ', ';

        case Prop.GetValue(TObject(Obj)).Kind of

          tkWChar, tkLString, tkWString, tkString, tkChar, tkUString:
            strValues := strValues + QuotedStr(Prop.GetValue(TObject(Obj)).AsString) + ',';

          tkInteger, tkInt64:
            strValues := strValues + IntToStr(Prop.GetValue(TObject(Obj)).AsInteger) + ',';

          tkFloat:
            strValues := strValues + FloatToStr(Prop.GetValue(TObject(Obj)).AsExtended) + ',';

          tkEnumeration:
            if Prop.GetValue(TObject(Obj)).AsBoolean then
              strValues := strValues + 'True,'
            else
              strValues := strValues + 'False,';
        else
          raise Exception.Create('Tipo não suportado');
        end;
      end;
    end;
  end;

  strFields := Copy(Trim(strFields), 1, Length(Trim(strFields)) - 1);
  strValues := Copy(Trim(strValues), 1, Length(Trim(strValues)) - 1);
  strInsert := strInsert + ' ( ' + strFields + ' ) VALUES ( ' + strValues + ' )';

  result := dmBaseDados.execSql(strInsert);
end;

class function TGenericDAO.GetAll<T>(Obj: T): TDataSet;
begin
  result := dmBaseDados.getDataSet('SELECT T1.* ' + ' FROM ' + GetTableName(Obj) + ' T1 ' );
end;

class function TGenericDAO.GetID<T>(Obj: T): integer;
var
  oDataSet: TDataSet;
begin
  oDataSet := dmBaseDados.getDataSet('SELECT MAX(ID) as ID ' + ' FROM ' + GetTableName(Obj));
  result := oDataSet.FieldByName('ID').AsInteger + 1;
end;

end.
