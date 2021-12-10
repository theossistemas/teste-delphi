unit Model.DB.Intf;

interface

uses
  System.SysUtils,
  System.Rtti,
  Data.DB;

type
  IModelStatement = interface;

  IModelConnection = interface
    ['{F5C099B0-C333-445F-97A3-FF3C4C20CD38}']
    function AddParams(const AParamName: string; const AParamValue: string): IModelConnection; overload;
    function AddParams(const AParamName: string; const AParamValue: string; const AArgs: array of const): IModelConnection; overload;
    function Connect: IModelConnection;
    function Disconnect: IModelConnection;
    function Connected: Boolean;
    function Component: TCustomConnection;
    function CreateStatement: IModelStatement;
  end;

  IModelCommand = interface
    ['{7CE56ACC-6C9C-48BB-BA14-698CCEA131E4}']
    function Add(const ASql: string): IModelCommand; overload;
    function Add(const ASql: string; const AArgs: array of const): IModelCommand; overload;
    function &End: IModelStatement; overload;
    function &End(const AArgs: array of const): IModelStatement; overload;
  end;

  IModelStatement = interface
    ['{1E00C43A-D909-4CD0-B0AC-35D798D39DC8}']
    function Command(const ASql: string): IModelStatement; overload;
    function Command(const ASql: string; const AArgs: array of const): IModelStatement; overload;
    function Command: IModelCommand; overload;
    function Open: IModelStatement; overload;
    function Open(const ASql: string): IModelStatement; overload;
    function Open(const ASql: string; const AArgs: array of const): IModelStatement; overload;
    function Opened: Boolean;
    function Execute: Int32; overload;
    function Execute(const ASql: string): IModelStatement; overload;
    function Execute(const ASql: string; const AArgs: array of const): IModelStatement; overload;
    function Execute(const ASql: string; out ARowsAffected: Int32): IModelStatement; overload;
    function Execute(const ASql: string; const AArgs: array of const; out ARowsAffected: Int32): IModelStatement; overload;
    function Execute(out ARowsAffected: Int32): IModelStatement; overload;
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
  end;

  IModelConnectionFactory = interface
    ['{42931E01-EBFB-44B8-86A8-34EA10788495}']
    function CreateConnection: IModelConnection;
  end;

implementation

end.
