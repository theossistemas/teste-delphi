unit Model.DB.Statement.FireDAC;

interface

uses
  System.SysUtils,
  System.Rtti,
  System.Classes,
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Model.DB.Intf;

type
  TModelStatamentFireDAC = class(TInterfacedObject, IModelStatement)
  strict private
    function IsAssigned: Boolean;
    procedure CheckAssigned;
    procedure CheckOpened;
    procedure CheckCommand;
  private
    [weak]
    FConnection: IModelConnection;
    FStatement: TFDQuery;
  protected
    function Command(const ASql: string): IModelStatement; overload;
    function Command(const ASql: string; const AArgs: array of const): IModelStatement; overload;
    function Command: IModelCommand; overload;
    function Open: IModelStatement; overload;
    function Open(const ASql: string): IModelStatement; overload;
    function Open(const ASql: string; const AArgs: array of const): IModelStatement; overload;
    function Opened: Boolean;
    function Execute(const ASql: string): IModelStatement; overload;
    function Execute(const ASql: string; const AArgs: array of const): IModelStatement; overload;
    function Execute(const ASql: string; out ARowsAffected: Int32): IModelStatement; overload;
    function Execute(const ASql: string; const AArgs: array of const; out ARowsAffected: Int32): IModelStatement; overload;
    function Execute(out ARowsAffected: Int32): IModelStatement; overload;
    function Execute: Int32; overload;
    function Close: IModelStatement;
    function ForEach(AProc: TProc): IModelStatement; overload;
    function ForEach(AProc: TProc<TDataSet>): IModelStatement; overload;
    function Append: IModelStatement;
    function AppendOrEdit: IModelStatement;
    function Edit: IModelStatement;
    function Save: IModelStatement;
    function Cancel: IModelStatement;
    function Delete: IModelStatement;
    function HasRecord: Boolean;
    function RecordCount: Int32;
    function NotEof: Boolean;
    function BeginUpdate: IModelStatement;
    function EndUpdate: IModelStatement;
    function GetValue(const AFieldName: string): TField;
    function SetValue(const AFieldName: string; const AValue: TValue): IModelStatement;
    function SetParam(const AFieldName: string; const AValue: TValue): IModelStatement;
    function DataSet: TDataSet;
  public
    constructor Create(AParent: IModelConnection);
    destructor Destroy; override;
    class function New(AParent: IModelConnection): IModelStatement;
  end;

implementation

type
  TModelCommand = class(TInterfacedObject, IModelCommand)
  strict private
    FBuilder: TStringBuilder;
  private
    [weak]
    FParent: IModelStatement;
  protected
    function Add(const ASql: string): IModelCommand; overload;
    function Add(const ASql: string; const AArgs: array of const): IModelCommand; overload;
    function &End: IModelStatement; overload;
    function &End(const AArgs: array of const): IModelStatement; overload;
  public
    constructor Create(AParent: IModelStatement);
    destructor Destroy; override;
    class function New(AParent: IModelStatement): IModelCommand;
  end;

{ TModelStatamentFireDAC }

function TModelStatamentFireDAC.Append: IModelStatement;
begin
  Result := Self;
  CheckOpened;
  FStatement.Append;
end;

function TModelStatamentFireDAC.AppendOrEdit: IModelStatement;
begin
  Result := Self;
  CheckOpened;
  if Self.HasRecord then
    FStatement.Edit
  else
    FStatement.Insert;
end;

function TModelStatamentFireDAC.BeginUpdate: IModelStatement;
begin
  Result := Self;
  if IsAssigned and (not FStatement.ControlsDisabled) then
    FStatement.DisableControls;
end;

function TModelStatamentFireDAC.Cancel: IModelStatement;
begin
  Result := Self;
  if FStatement.State in dsEditModes then
    FStatement.Cancel;
end;

procedure TModelStatamentFireDAC.CheckAssigned;
begin
  if not IsAssigned then
    raise Exception.Create('Dataset not assigned.');
end;

procedure TModelStatamentFireDAC.CheckCommand;
begin
  if IsAssigned and (FStatement.SQL.Count = 0) then
    raise Exception.Create('Command not defined.');
end;

procedure TModelStatamentFireDAC.CheckOpened;
begin
  CheckAssigned;
  if not FStatement.Active then
    raise Exception.Create('Dataset closed.');
end;

function TModelStatamentFireDAC.Close: IModelStatement;
begin
  Result := Self;
  if Opened then
    FStatement.Close;
end;

function TModelStatamentFireDAC.Command(const ASql: string): IModelStatement;
begin
  Result := Self;
  Self.Close;
  FStatement.SQL.Clear;
  FStatement.SQL.Text := ASql;
end;

function TModelStatamentFireDAC.Command: IModelCommand;
begin
  Result := TModelCommand.New(Self);
end;

function TModelStatamentFireDAC.Command(const ASql: string; const AArgs: array of const): IModelStatement;
begin
  Result := Self.Command(Format(ASql, AArgs));
end;

constructor TModelStatamentFireDAC.Create(AParent: IModelConnection);
begin
  FConnection := AParent;
  FStatement := TFDQuery.Create(nil);
  FStatement.Connection := TFDConnection(FConnection.Component);
end;

function TModelStatamentFireDAC.DataSet: TDataSet;
begin
  Result := FStatement;
end;

function TModelStatamentFireDAC.Delete: IModelStatement;
begin
  Result := Self;
  if HasRecord then
    FStatement.Delete;
end;

destructor TModelStatamentFireDAC.Destroy;
begin
  Self.Close;
  FreeAndNil(FStatement);

  inherited;
end;

function TModelStatamentFireDAC.Edit: IModelStatement;
begin
  Result := Self;
  if HasRecord then
    FStatement.Edit;
end;

function TModelStatamentFireDAC.EndUpdate: IModelStatement;
begin
  Result := Self;
  if IsAssigned and FStatement.ControlsDisabled then
    FStatement.EnableControls;
end;

function TModelStatamentFireDAC.Execute(const ASql: string): IModelStatement;
var
  lRowsAffected: Int32;
begin
  Result := Self.Execute(ASql, lRowsAffected);
end;

function TModelStatamentFireDAC.Execute(const ASql: string; out ARowsAffected: Int32): IModelStatement;
begin
  Result := Self;
  ARowsAffected := Self.Command(ASql).Execute;
end;

function TModelStatamentFireDAC.Execute(out ARowsAffected: Int32): IModelStatement;
begin
  Result := Self;
  ARowsAffected := Self.Execute;
end;

function TModelStatamentFireDAC.Execute: Int32;
begin
  CheckCommand;
  FStatement.ExecSQL;
  Result := FStatement.RowsAffected;
end;

function TModelStatamentFireDAC.Execute(const ASql: string; const AArgs: array of const; out ARowsAffected: Int32): IModelStatement;
begin
  Result := Self.Execute(Format(ASql, AArgs), ARowsAffected);
end;

function TModelStatamentFireDAC.Execute(const ASql: string; const AArgs: array of const): IModelStatement;
begin
  Result := Self.Execute(Format(ASql, AArgs));
end;

function TModelStatamentFireDAC.ForEach(AProc: TProc<TDataSet>): IModelStatement;
begin
  Result := Self;

  if not Assigned(AProc) then
    Exit;
  if not HasRecord then
    Exit;

  Self.BeginUpdate;
  try
    FStatement.First;
    while not FStatement.Eof do
    begin
      AProc(FStatement);
      FStatement.Next;
    end;
  finally
    Self.EndUpdate;
  end;
end;

function TModelStatamentFireDAC.ForEach(AProc: TProc): IModelStatement;
begin
  Result := Self.ForEach(
    procedure(ADataset: TDataSet)
    begin
      AProc;
    end);
end;

function TModelStatamentFireDAC.GetValue(const AFieldName: string): TField;
begin
  CheckOpened;
  Result := FStatement.FieldByName(AFieldName);
end;

function TModelStatamentFireDAC.HasRecord: Boolean;
begin
  Result := Self.RecordCount > 0;
end;

function TModelStatamentFireDAC.IsAssigned: Boolean;
begin
  Result := Assigned(FStatement);
end;

class function TModelStatamentFireDAC.New(AParent: IModelConnection): IModelStatement;
begin
  Result := Self.Create(AParent);
end;

function TModelStatamentFireDAC.NotEof: Boolean;
begin
  Result := False;
  if not Opened then
    Exit;
  Result := not FStatement.Eof;
  if Result then
    FStatement.Next;
end;

function TModelStatamentFireDAC.Open(const ASql: string; const AArgs: array of const): IModelStatement;
begin
  Result := Self.Open(Format(ASql, AArgs));
end;

function TModelStatamentFireDAC.Open: IModelStatement;
begin
  Result := Self;
  CheckCommand;
  FStatement.Open;
end;

function TModelStatamentFireDAC.Open(const ASql: string): IModelStatement;
begin
  Result := Self.Command(ASql).Open;
end;

function TModelStatamentFireDAC.Opened: Boolean;
begin
  CheckAssigned;
  Result := FStatement.Active;
end;

function TModelStatamentFireDAC.RecordCount: Int32;
begin
  Result := 0;
  if Opened then
    Result := FStatement.RecordCount;
end;

function TModelStatamentFireDAC.Save: IModelStatement;
begin
  Result := Self;
  if FStatement.State in dsEditModes then
    FStatement.Post;
end;

function TModelStatamentFireDAC.SetParam(const AFieldName: string; const AValue: TValue): IModelStatement;
begin
  Result := Self;

  if not IsAssigned then
    Exit;

  case AValue.Kind of
    tkInteger:
      FStatement.ParamByName(AFieldName).AsInteger := AValue.AsType<Int32>;
    tkFloat:
      begin
        if AValue.TypeInfo = TypeInfo(System.TDate) then
          FStatement.ParamByName(AFieldName).AsDate := AValue.AsType<TDate>
        else if AValue.TypeInfo = TypeInfo(System.TTime) then
          FStatement.ParamByName(AFieldName).AsTime := AValue.AsType<TTime>
        else if AValue.TypeInfo = TypeInfo(System.TDateTime) then
          FStatement.ParamByName(AFieldName).AsDateTime := AValue.AsType<TDateTime>
        else
          FStatement.ParamByName(AFieldName).AsFloat := AValue.AsType<Double>;
      end;
    tkString, tkUString, tkChar, tkWChar, tkLString, tkWString:
      FStatement.ParamByName(AFieldName).AsString := AValue.AsType<string>;
    tkInt64:
      FStatement.ParamByName(AFieldName).AsLargeInt := AValue.AsType<Int64>;
  else
    try
      FStatement.ParamByName(AFieldName).AsString := AValue.AsType<string>;
    except
    end;
  end;
end;

function TModelStatamentFireDAC.SetValue(const AFieldName: string; const AValue: TValue): IModelStatement;
begin
  Result := Self;

  if not Opened then
    Exit;

  case AValue.Kind of
    tkInteger:
      FStatement.FieldByName(AFieldName).AsInteger := AValue.AsType<Int32>;
    tkFloat:
      begin
        if AValue.TypeInfo = TypeInfo(System.TDate) then
          FStatement.FieldByName(AFieldName).AsDateTime := AValue.AsType<TDate>
        else if AValue.TypeInfo = TypeInfo(System.TTime) then
          FStatement.FieldByName(AFieldName).AsDateTime := AValue.AsType<TTime>
        else if AValue.TypeInfo = TypeInfo(System.TDateTime) then
          FStatement.FieldByName(AFieldName).AsDateTime := AValue.AsType<TDateTime>
        else
          FStatement.FieldByName(AFieldName).AsFloat := AValue.AsType<Double>;
      end;
    tkString, tkUString, tkChar, tkWChar, tkLString, tkWString:
      FStatement.FieldByName(AFieldName).AsString := AValue.AsType<string>;
    tkVariant:
      FStatement.FieldByName(AFieldName).AsVariant := AValue.AsType<Variant>;
    tkInt64:
      FStatement.FieldByName(AFieldName).AsLargeInt := AValue.AsType<Int64>;
  else
    FStatement.FieldByName(AFieldName).AsVariant := AValue.AsType<Variant>;
  end;
end;

{ TModelCommand }

constructor TModelCommand.Create(AParent: IModelStatement);
begin
  FParent := AParent;
  FBuilder := TStringBuilder.Create;
end;

destructor TModelCommand.Destroy;
begin
  FreeAndNil(FBuilder);

  inherited;
end;

class function TModelCommand.New(AParent: IModelStatement): IModelCommand;
begin
  Result := Self.Create(AParent);
end;

function TModelCommand.Add(const ASql: string): IModelCommand;
begin
  Result := Self;
  if not ASql.Trim.IsEmpty then
    FBuilder.Append(ASql).Append(' ');
end;

function TModelCommand.Add(const ASql: string; const AArgs: array of const): IModelCommand;
begin
  Result := Self.Add(Format(ASql, AArgs));
end;

function TModelCommand.&End: IModelStatement;
begin
  Result := FParent.Command(FBuilder.ToString);
end;

function TModelCommand.&End(const AArgs: array of const): IModelStatement;
begin
  Result := FParent.Command(Format(FBuilder.ToString, AArgs));
end;

end.

