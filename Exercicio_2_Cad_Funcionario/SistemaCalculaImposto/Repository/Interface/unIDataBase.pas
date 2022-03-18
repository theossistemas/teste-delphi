unit unIDataBase;

interface

uses
  System.SysUtils, System.Classes, Data.DB;

type
  IConnection = Interface
    ['{53E6A9EB-9133-440A-86B3-898AB26CE9D2}']
    function GetConnection: TCustomConnection;
    function StartTransaction: IConnection;
    function Commit: IConnection;
    Function RollBack: IConnection;
  End;

  IQuery = Interface
    ['{E6BD222C-1277-4E47-AC9B-833D5AA633BD}']
    function Close: IQuery;
    function SQLClear: IQuery;
    function SQLAdd(aValue: String): IQuery;
    function SQL(aValue: TStrings): IQuery;
    function ParamByName(aField: string; aValue: Variant): IQuery;
    function Open: IQuery;
    function ExecSQL: IQuery;

    function DataSource(aValue: TDataSource): IQuery;
    function GetQuery: TDataSet;
    function Connection: IConnection;
  End;

  IFactoryConnection = Interface
    ['{CE96A32C-4EC4-46F4-9058-F46D74F3A563}']
    function GetConnection: IConnection;
  End;

  IFactoryQuery = Interface
    ['{D7537BD0-B716-4E63-B7A7-D9F7702494BB}']
    function Query: IQuery;
  End;


implementation

end.
