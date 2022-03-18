unit unFireDacQuery;

interface

uses
  Data.DB, System.SysUtils, System.Classes, unIDatabase, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Phys.IBBase, FireDAC.Phys.IBWrapper, FireDAC.Phys.FB,
  FireDAC.Comp.Client, unFactoryConnection;

type
  TFireDacQuery = class(TInterfacedObject, IQuery)
  private
    FDQuery: TFDQuery;

  class var
    FIntancia: IQuery;
    FConnection: IConnection;

    constructor Create;
  public
    destructor Destroy; override;
    class function New: IQuery;

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

  public

  end;

implementation

{ TFireDacQuery }

function TFireDacQuery.Close: IQuery;
begin
  Result := Self;
  FDQuery.Close;
end;

function TFireDacQuery.Connection: IConnection;
begin
  Result := FConnection;
end;

constructor TFireDacQuery.Create;
begin
  FDQuery := TFDQuery.Create(nil);
  FConnection := TFactoryConnection.New.GetConnection;
  FDQuery.Connection := TFDCustomConnection(FConnection.GetConnection);
end;

function TFireDacQuery.DataSource(aValue: TDataSource): IQuery;
begin
  Result := Self;
  FDQuery.DataSource := aValue;
end;

destructor TFireDacQuery.Destroy;
begin
  if Assigned(FDQuery) then
    FreeAndNil(FDQuery);

  inherited;
end;

function TFireDacQuery.ExecSQL: IQuery;
begin
  Result := Self;
  FDQuery.ExecSQL;
end;

function TFireDacQuery.GetQuery: TDataSet;
begin
  Result := FDQuery;
end;

class function TFireDacQuery.New: IQuery;
begin
  // Result := Self.Create;
  if not Assigned(Self.FIntancia) then
    Self.FIntancia := Self.Create;

  Result := Self.FIntancia;
end;

function TFireDacQuery.Open: IQuery;
begin
  Result := Self;
  FDQuery.Open;
end;

function TFireDacQuery.ParamByName(aField: string; aValue: Variant): IQuery;
begin
  Result := Self;
  FDQuery.ParamByName(aField).Value := aValue;
end;

function TFireDacQuery.SQL(aValue: TStrings): IQuery;
begin
  Result := Self;
  FDQuery.SQL := aValue;
end;

function TFireDacQuery.SQLAdd(aValue: String): IQuery;
begin
  Result := Self;
  FDQuery.SQL.Add(aValue); // Verificar se é isto mesmo
end;

function TFireDacQuery.SQLClear: IQuery;
begin
  Result := Self;
  FDQuery.SQL.Clear;
end;

end.
