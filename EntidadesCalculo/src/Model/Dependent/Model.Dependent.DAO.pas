unit Model.Dependent.DAO;

interface

uses
  System.SysUtils,
  Data.DB,
  Model.DAO.Intf,
  Model.Dependent.Intf,
  Model.Connection.Global;

type
  TModelDependentDAO = class(TInterfacedObject, IDAO<IModelDependent>)
  strict private
    procedure CheckInfo;
  private
    FDependent: IModelDependent;
    FConnection: IModelConnection;
    FStatement: IModelStatement;
  protected
    function FindAll: IDAO<IModelDependent>;
    function Save: IDAO<IModelDependent>;
    function Delete(const AId: string): IDAO<IModelDependent>;
    function DataSet(ADataSource: TDataSource): IDAO<IModelDependent>;
    function This: IModelDependent;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IDAO<IModelDependent>;
  end;

implementation

uses
  Model.Dependent,
  Parser.Sql,
  Utils.Global;

{ TModelDependentDAO }

procedure TModelDependentDAO.CheckInfo;
begin
  if FDependent.Name.Trim.IsEmpty then
    raise Exception.Create('Nome do Dependente não informado.');
end;

constructor TModelDependentDAO.Create;
begin
  FConnection := GlobalConnection.CreateConnection;
  FStatement := FConnection.CreateStatement;
  FDependent := TModelDependent.New(Self);
end;

destructor TModelDependentDAO.Destroy;
begin

  inherited;
end;

class function TModelDependentDAO.New: IDAO<IModelDependent>;
begin
  Result := Self.Create;
end;

function TModelDependentDAO.DataSet(ADataSource: TDataSource): IDAO<IModelDependent>;
begin
  Result := Self;
  ADataSource.DataSet := FStatement.DataSet;
end;

function TModelDependentDAO.Delete(const AId: string): IDAO<IModelDependent>;
var
  lRowAff: Int32;
begin
  Result := Self;

  FStatement.Execute('delete from dependent where de_objectid = %s', [TParserSql.FromString(AId)], lRowAff);
  if lRowAff = 0 then
    raise Exception.Create('Não foi possível excluir o funcionário informado.');
end;

function TModelDependentDAO.FindAll: IDAO<IModelDependent>;
begin

end;

function TModelDependentDAO.Save: IDAO<IModelDependent>;
var
  lObjectId: string;
begin
  Result := Self;
  CheckInfo;

  lObjectId := FDependent.Id.Trim;
  if lObjectId.IsEmpty then
  begin
    lObjectId := TGlobalUtils.CreateObjectId;
    FDependent.Id(lObjectId);
  end;

  if FStatement
    .Command
      .Add('update or insert into dependent (de_objectid, de_name, de_is_calculate_ir, de_is_calculate_inss) values (%s, %s, %s, %s) matching (de_objectid)')
      .&End([
        TParserSql.FromString(lObjectId),
        TParserSql.FromString(FDependent.Name),
        TParserSql.FromBoolean(FDependent.IsCalculateIR),
        TParserSql.FromBoolean(FDependent.IsCalculateINSS)
      ])
    .Execute = 0 then
    raise Exception.CreateFmt('Não foi possível salvar o dependente %s.', [FDependent.Name]);
end;

function TModelDependentDAO.This: IModelDependent;
begin
  Result := FDependent;
end;

end.
