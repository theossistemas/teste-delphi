unit Model.Employee.DAO;

interface

uses
  System.SysUtils,
  Data.DB,
  Model.DAO.Intf,
  Model.Employee.Intf,
  Model.Connection.Global;

type
  TModelEmployeeDAO = class(TInterfacedObject, IDAO<IModelEmployee>, IModelEmployeeDependent)
  strict private
    procedure OnDataSourceChange(Sender: TObject; Field: TField);
  private
    FEmployee: IModelEmployee;
    FConnection: IModelConnection;
    FStatement: IModelStatement;
    FStatementView: IModelStatement;
  protected
    function FindAll: IDAO<IModelEmployee>;
    function Save: IDAO<IModelEmployee>;
    function Delete(const AId: string): IDAO<IModelEmployee>;
    function DataSet(ADataSource: TDataSource): IDAO<IModelEmployee>;
    function This: IModelEmployee;

    (* IModelEmployeeDependent *)
    function GetCountIR: Int32;
    function GetCountINSS: Int32;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IDAO<IModelEmployee>;
  end;

implementation

uses
  Parser.Sql,
  Model.Employee,
  Utils.Global;

{ TModelEmployeeDAO }

constructor TModelEmployeeDAO.Create;
begin
  FConnection := GlobalConnection.CreateConnection;
  FStatement := FConnection.CreateStatement;
  FStatementView := FConnection.CreateStatement;
  FEmployee := TModelEmployee.New(Self);
end;

function TModelEmployeeDAO.DataSet(ADataSource: TDataSource): IDAO<IModelEmployee>;
begin
  Result := Self;
  ADataSource.DataSet := FStatementView.DataSet;
  ADataSource.OnDataChange := OnDataSourceChange;
end;

function TModelEmployeeDAO.Delete(const AId: string): IDAO<IModelEmployee>;
var
  lId: string;
begin
  Result := Self;
  if AId.Trim.IsEmpty and (not FStatementView.Opened) then
    Exit;
  lId := AId.Trim;
  if lId.IsEmpty then
    lId := FStatementView.GetValue('Id').AsString;

  try
    FStatement.Execute('delete from employee where em_objectid = %s', [TParserSql.FromString(lId)]);
  except
    raise Exception.Create('Não foi possível excluir o funcionário informado.');
  end;
  FindAll;
end;

destructor TModelEmployeeDAO.Destroy;
begin
  FConnection.Disconnect;

  inherited;
end;

function TModelEmployeeDAO.FindAll: IDAO<IModelEmployee>;
begin
  Result := Self;
  FStatementView.Open('select e.em_objectid Id, e.em_name Nome, e.em_cpf CPF, e.em_salary Salario from employee e order by em_name');
end;

function TModelEmployeeDAO.GetCountINSS: Int32;
begin
  Result := FStatement
              .Command
                .Add('select')
                .Add('    count(*) as qtd')
                .Add(' from dependent d')
                .Add(' join employee_dependent ed on ed.ed_oid_dependent = d.de_objectid')
                .Add(' where')
                .Add('    d.de_is_calculate_inss = True and ed.ed_oid_employee = %s')
              .&End([TParserSql.FromString(FEmployee.Id)])
              .Open
              .GetValue('qtd').AsInteger;
end;

function TModelEmployeeDAO.GetCountIR: Int32;
begin
  Result := FStatement
              .Command
                .Add('select')
                .Add('    count(*) as qtd')
                .Add(' from dependent d')
                .Add(' join employee_dependent ed on ed.ed_oid_dependent = d.de_objectid')
                .Add(' where')
                .Add('    d.de_is_calculate_ir = True and ed.ed_oid_employee = %s')
              .&End([TParserSql.FromString(FEmployee.Id)])
              .Open
              .GetValue('qtd').AsInteger;
end;

class function TModelEmployeeDAO.New: IDAO<IModelEmployee>;
begin
  Result := Self.Create;
end;

procedure TModelEmployeeDAO.OnDataSourceChange(Sender: TObject; Field: TField);
begin
  if FStatementView.HasRecord then
    FEmployee
      .Id(FStatementView.GetValue('Id').AsString)
      .Name(FStatementView.GetValue('Nome').AsString)
      .CPF(FStatementView.GetValue('CPF').AsString)
      .Salary(FStatementView.GetValue('Salario').AsCurrency);
end;

function TModelEmployeeDAO.Save: IDAO<IModelEmployee>;
var
  lObjectId: string;
  lIndex: Integer;
begin
  Result := Self;
  lObjectId := FEmployee.Id.Trim;
  if lObjectId.IsEmpty then
  begin
    lObjectId := TGlobalUtils.CreateObjectId;
    FEmployee.Id(lObjectId);
  end;

  if FStatement
    .Command
      .Add('update or insert into employee (em_objectid, em_name, em_cpf, em_salary) values (%s, %s, %s, %s) matching (em_objectid)')
      .&End([
        TParserSql.FromString(lObjectId),
        TParserSql.FromString(FEmployee.Name),
        TParserSql.FromString(FEmployee.CPF),
        TParserSql.FromCurrency(FEmployee.Salary)
      ])
    .Execute = 0 then
    raise Exception.Create('Não foi possível salvar o funcionário selecionado.');

  for lIndex := 0 to Pred(FEmployee.Dependents.Count) do
  begin
    FEmployee.Dependents.Items[lIndex].Save;

    FStatement
      .Command
        .Add('update or insert into employee_dependent(ed_oid_employee, ed_oid_dependent) values (%s, %s) matching (ed_oid_employee, ed_oid_dependent)')
        .&End([
          TParserSql.FromString(FEmployee.Id),
          TParserSql.FromString(FEmployee.Dependents.Items[lIndex].This.Id)
        ])
      .Execute;
  end;

  FEmployee.Clear;
end;

function TModelEmployeeDAO.This: IModelEmployee;
begin
  Result := FEmployee;
end;

end.
