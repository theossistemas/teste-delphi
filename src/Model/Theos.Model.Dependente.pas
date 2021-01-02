unit Theos.Model.Dependente;

interface

uses
  Data.DB, Vcl.Forms, System.SysUtils, System.Generics.Collections,

  Theos.Dao.DB,
  Theos.Lib.Nullable;

type
  TModelDependente = class;
  TListModelDependente = TObjectList<TModelDependente>;
  TModelDependente = class sealed
  strict private
    const
      NOME_TABELA = 'DEPENDENTE';

    var
      FCODIGO: Nullable<Largeint>;
      FCODIGO_FUNCIONARIO: Nullable<Largeint>;
      FNOME: Nullable<String>;
      FIS_CALCULA_IR: Nullable<Boolean>;
      FIS_CALCULA_INSS: Nullable<Boolean>;

    procedure AlimentaModel(const DataSet: TDataSet);
    function AlimentaParametros: TParams;
    procedure AlimentaDataset(const DataSet: TDataSet);

  public
    property CODIGO: Nullable<Largeint> read FCODIGO write FCODIGO;
    property CODIGO_FUNCIONARIO: Nullable<Largeint> read FCODIGO_FUNCIONARIO write FCODIGO_FUNCIONARIO;
    property NOME: Nullable<String> read FNOME write FNOME;
    property IS_CALCULA_IR: Nullable<Boolean> read FIS_CALCULA_IR write FIS_CALCULA_IR;
    property IS_CALCULA_INSS: Nullable<Boolean> read FIS_CALCULA_INSS write FIS_CALCULA_INSS;

    procedure Insert;
    procedure Update;
    procedure Delete;
    function Carregar: Boolean;
    procedure Clear;

    function CarregarListaDataSet: TDataSet;
    function CarregarListaModel: TListModelDependente;

    constructor Create; reintroduce;
    destructor Destroy; override;

  end;

implementation

constructor TModelDependente.Create;
begin
  inherited Create;
  Clear;
end;

destructor TModelDependente.Destroy;
begin

  inherited Destroy;
end;

procedure TModelDependente.AlimentaDataset(const DataSet: TDataSet);
begin
  DataSet.FieldByName('CODIGO').Clear;
  if FCODIGO.HasValue then
    DataSet.FieldByName('CODIGO').Value := FCODIGO.GetValueOrDefault;

  DataSet.FieldByName('CODIGO_FUNCIONARIO').Clear;
  if FCODIGO_FUNCIONARIO.HasValue then
    DataSet.FieldByName('CODIGO_FUNCIONARIO').Value := FCODIGO_FUNCIONARIO.GetValueOrDefault;

  DataSet.FieldByName('NOME').Clear;
  if FNOME.HasValue then
    DataSet.FieldByName('NOME').Value := FNOME.GetValueOrDefault.Trim;

  DataSet.FieldByName('IS_CALCULA_IR').Clear;
  if FIS_CALCULA_IR.HasValue then
    DataSet.FieldByName('IS_CALCULA_IR').Value := FIS_CALCULA_IR.GetValueOrDefault;

  DataSet.FieldByName('IS_CALCULA_INSS').Clear;
  if FIS_CALCULA_INSS.HasValue then
    DataSet.FieldByName('IS_CALCULA_INSS').Value := FIS_CALCULA_INSS.GetValueOrDefault;
end;

procedure TModelDependente.AlimentaModel(const DataSet: TDataSet);
begin
  Clear;

  if not DataSet.FieldByName('CODIGO').IsNull then
    FCODIGO := DataSet.FieldByName('CODIGO').Value;

  if not DataSet.FieldByName('CODIGO_FUNCIONARIO').IsNull then
    FCODIGO_FUNCIONARIO := DataSet.FieldByName('CODIGO_FUNCIONARIO').Value;

  if not DataSet.FieldByName('NOME').IsNull then
    FNOME := DataSet.FieldByName('NOME').Value;

  if not DataSet.FieldByName('IS_CALCULA_IR').IsNull then
    FIS_CALCULA_IR := DataSet.FieldByName('IS_CALCULA_IR').Value;

  if not DataSet.FieldByName('IS_CALCULA_INSS').IsNull then
    FIS_CALCULA_INSS := DataSet.FieldByName('IS_CALCULA_INSS').Value;
end;

function TModelDependente.AlimentaParametros: TParams;
begin
  Result := TParams.Create;
  Result.Clear;

  if FCODIGO.HasValue then
  begin
    Result.CreateParam(ftUnknown, 'CODIGO', ptInput);
    Result.ParamByName('CODIGO').Value := FCODIGO.GetValueOrDefault;
  end;

  if FCODIGO_FUNCIONARIO.HasValue then
  begin
    Result.CreateParam(ftUnknown, 'CODIGO_FUNCIONARIO', ptInput);
    Result.ParamByName('CODIGO_FUNCIONARIO').Value := FCODIGO_FUNCIONARIO.GetValueOrDefault;
  end;

  if FNOME.HasValue then
  begin
    Result.CreateParam(ftUnknown, 'NOME', ptInput);
    Result.ParamByName('NOME').Value := FNOME.GetValueOrDefault.Trim;
  end;

  if FIS_CALCULA_IR.HasValue then
  begin
    Result.CreateParam(ftUnknown, 'IS_CALCULA_IR', ptInput);
    Result.ParamByName('IS_CALCULA_IR').Value := FIS_CALCULA_IR.GetValueOrDefault;
  end;

  if FIS_CALCULA_INSS.HasValue then
  begin
    Result.CreateParam(ftUnknown, 'IS_CALCULA_INSS', ptInput);
    Result.ParamByName('IS_CALCULA_INSS').Value := FIS_CALCULA_INSS.GetValueOrDefault;
  end;
end;

function TModelDependente.Carregar: Boolean;
begin
  var Dataset := CarregarListaDataSet;
  try
    Result := not Dataset.IsEmpty;
    AlimentaModel(Dataset);
  finally
    Dataset.Free;
  end;
end;

function TModelDependente.CarregarListaDataSet: TDataSet;
begin
  var SQL := 'SELECT * FROM ' + NOME_TABELA;
  var Parametros := AlimentaParametros;
  try
    result := TConexao.Instance.CriaQuery(SQL, Parametros);
  finally
    Parametros.Free;
  end;
end;

procedure TModelDependente.Clear;
begin
  FCODIGO.Clear;
  FCODIGO_FUNCIONARIO.Clear;
  FNOME.Clear;
  FIS_CALCULA_IR.Clear;
  FIS_CALCULA_INSS.Clear;
end;

procedure TModelDependente.Insert;
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

procedure TModelDependente.Update;
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

procedure TModelDependente.Delete;
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

function TModelDependente.CarregarListaModel: TListModelDependente;
begin
  Result := TListModelDependente.Create;
  Result.Clear;
  var Dataset := CarregarListaDataSet;
  try
    while not Dataset.Eof do
    begin
      var ModelDependente := TModelDependente.Create;
      ModelDependente.AlimentaModel(Dataset);
      Result.Add(ModelDependente);
      Dataset.Next;
    end;
  finally
    Dataset.Free;
  end;
  Result.TrimExcess;
end;

end.
