unit Theos.Model.Funcionario;

interface

uses
  Data.DB, Vcl.Forms, System.SysUtils, System.Generics.Collections,

  Theos.Api.Pessoa,
  Theos.Dao.DB,
  Theos.Lib.Nullable,

  Theos.Model.Dependente;

type
  TModelFuncionario = class sealed
  strict private
    const
      NOME_TABELA = 'FUNCIONARIO';

    var
      FCODIGO: Nullable<Largeint>;
      FNOME: Nullable<String>;
      FCPF: Nullable<String>;
      FSALARIO: Nullable<Double>;

    function GetDEPENDENTES: TListModelDependente;

    procedure AlimentaModel(const DataSet: TDataSet);
    function AlimentaParametros: TParams;
    procedure AlimentaDataset(const DataSet: TDataSet);

    function GetINSS: Double;
    function GetBaseIR: Double;
    function GetIR: Double;

  public
    property CODIGO: Nullable<Largeint> read FCODIGO write FCODIGO;
    property NOME: Nullable<String> read FNOME write FNOME;
    property CPF: Nullable<String> read FCPF write FCPF;
    property SALARIO: Nullable<Double> read FSALARIO write FSALARIO;

    property INSS: Double read GetINSS;
    property BaseIR: Double read GetBaseIR;
    property IR: Double read GetIR;

    property DEPENDENTES: TListModelDependente read GetDEPENDENTES;

    procedure Insert;
    procedure Update;
    procedure Delete;
    function Carregar: Boolean;
    procedure Clear;

    function CarregarListaDataSet: TDataSet;

    constructor Create; reintroduce;
    destructor Destroy; override;
  end;

implementation

constructor TModelFuncionario.Create;
begin
  inherited Create;
  Clear;
end;

destructor TModelFuncionario.Destroy;
begin
  inherited Destroy;
end;

procedure TModelFuncionario.AlimentaDataset(const DataSet: TDataSet);
begin
  DataSet.FieldByName('CODIGO').Clear;
  if FCODIGO.HasValue then
    DataSet.FieldByName('CODIGO').Value := FCODIGO.GetValueOrDefault;

  DataSet.FieldByName('NOME').Clear;
  if FNOME.HasValue then
    DataSet.FieldByName('NOME').Value := FNOME.GetValueOrDefault.Trim;

  DataSet.FieldByName('CPF').Clear;
  if FCPF.HasValue then
    DataSet.FieldByName('CPF').Value := FCPF.GetValueOrDefault.Trim;

  DataSet.FieldByName('SALARIO').Clear;
  if FSALARIO.HasValue then
    DataSet.FieldByName('SALARIO').Value := FSALARIO.GetValueOrDefault;
end;

procedure TModelFuncionario.AlimentaModel(const DataSet: TDataSet);
begin
  Clear;

  if not DataSet.FieldByName('CODIGO').IsNull then
    FCODIGO := DataSet.FieldByName('CODIGO').Value;

  if not DataSet.FieldByName('NOME').IsNull then
    FNOME := DataSet.FieldByName('NOME').Value;

  if not DataSet.FieldByName('CPF').IsNull then
    FCPF := DataSet.FieldByName('CPF').Value;

  if not DataSet.FieldByName('SALARIO').IsNull then
    FSALARIO := DataSet.FieldByName('SALARIO').Value;
end;

function TModelFuncionario.AlimentaParametros: TParams;
begin
  Result := TParams.Create;
  Result.Clear;

  if FCODIGO.HasValue then
  begin
    Result.CreateParam(ftUnknown, 'CODIGO', ptInput);
    Result.ParamByName('CODIGO').Value := FCODIGO.GetValueOrDefault;
  end;

  if FNOME.HasValue then
  begin
    Result.CreateParam(ftUnknown, 'NOME', ptInput);
    Result.ParamByName('NOME').Value := FNOME.GetValueOrDefault.Trim;
  end;

  if FCPF.HasValue then
  begin
    Result.CreateParam(ftUnknown, 'CPF', ptInput);
    Result.ParamByName('CPF').Value := FCPF.GetValueOrDefault.Trim;
  end;

  if FSALARIO.HasValue then
  begin
    Result.CreateParam(ftUnknown, 'SALARIO', ptInput);
    Result.ParamByName('SALARIO').Value := FSALARIO.GetValueOrDefault;
  end;
end;

function TModelFuncionario.Carregar: Boolean;
begin
  var Dataset := CarregarListaDataSet;
  try
    Result := not Dataset.IsEmpty;
    AlimentaModel(Dataset);
  finally
    Dataset.Free;
  end;
end;

function TModelFuncionario.CarregarListaDataSet: TDataSet;
begin
  var SQL := 'SELECT * FROM ' + NOME_TABELA;
  var Parametros := AlimentaParametros;
  try
    result := TConexao.Instance.CriaQuery(SQL, Parametros);
  finally
    Parametros.Free;
  end;
end;

procedure TModelFuncionario.Clear;
begin
  FCODIGO.Clear;
  FNOME.Clear;
  FCPF.Clear;
  FSALARIO.Clear;
end;

procedure TModelFuncionario.Insert;
begin
  var SQL := 'SELECT * FROM ' + NOME_TABELA + ' WHERE FALSE';
  var DataSet := TConexao.Instance.CriaQuery(SQL);
  try
    DataSet.Insert;
    AlimentaDataset(DataSet);
    DataSet.Post;
    AlimentaModel(DataSet);
    DataSet.Close;
  finally
    DataSet.Free;
  end;
end;

procedure TModelFuncionario.Update;
begin
  var SQL := 'SELECT * FROM ' + NOME_TABELA + ' WHERE CODIGO = ' + FCODIGO.GetValueOrDefault.ToString;
  var DataSet := TConexao.Instance.CriaQuery(SQL);
  try
    if DataSet.IsEmpty then
      Exit;

    DataSet.Edit;
    AlimentaDataset(DataSet);
    DataSet.Post;
    AlimentaModel(DataSet);
    DataSet.Close;
  finally
    DataSet.Free;
  end;
end;

procedure TModelFuncionario.Delete;
begin
  var SQL := 'SELECT CODIGO FROM ' + NOME_TABELA + ' WHERE CODIGO = ' + FCODIGO.GetValueOrDefault.ToString;
  var DataSet := TConexao.Instance.CriaQuery(SQL);
  try
    if DataSet.IsEmpty then
      Exit;
    DataSet.Delete;
    Clear;
    DataSet.Close;
  finally
    DataSet.Free;
  end;
end;

function TModelFuncionario.GetDEPENDENTES: TListModelDependente;
begin
  var FiltroDependente := TModelDependente.Create;
  try
    FiltroDependente.CODIGO_FUNCIONARIO := FCODIGO.GetValueOrDefault;
    Result := FiltroDependente.CarregarListaModel;
  finally
    FiltroDependente.Free;
  end;
end;

function TModelFuncionario.GetINSS: Double;
begin
  var FiltroDependente := TModelDependente.Create;
  try
    FiltroDependente.CODIGO_FUNCIONARIO := FCODIGO.GetValueOrDefault;
    FiltroDependente.IS_CALCULA_INSS := True;

    var PossuiDependentesQueCalculamINSS := FiltroDependente.Carregar;

    Result := TPessoa.Imposto.CalcularINSS(FSALARIO.GetValueOrDefault, PossuiDependentesQueCalculamINSS);

  finally
    FiltroDependente.Free;
  end;
end;

function TModelFuncionario.GetBaseIR: Double;
begin
  var FiltroDependente := TModelDependente.Create;
  try
    FiltroDependente.CODIGO_FUNCIONARIO := FCODIGO.GetValueOrDefault;
    FiltroDependente.IS_CALCULA_IR := True;
    var ListaDependentes := FiltroDependente.CarregarListaModel;
    try
      result := TPessoa.Imposto.CalcularBaseIR(FSALARIO.GetValueOrDefault, ListaDependentes.Count);
    finally
      ListaDependentes.Free;
    end;
  finally
    FiltroDependente.Free;
  end;
end;

function TModelFuncionario.GetIR: Double;
begin
  result := TPessoa.Imposto.CalcularIR(BaseIR);
end;

end.
