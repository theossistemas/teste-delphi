unit Model.Dependent;

interface

uses
  System.SysUtils,
  Model.Dependent.Intf,
  Model.DAO.Intf;

type
  TModelDependent = class(TInterfacedObject, IModelDependent)
  private
    [weak]
    FParent: IDAO<IModelDependent>;
  private
    FId             : string;
    FName           : string;
    FIsCalculateIR  : Boolean;
    FIsCalculateINSS: Boolean;
  protected
    function Id(const AValue: string): IModelDependent; overload;
    function Id: string; overload;
    function Name(const AValue: string): IModelDependent; overload;
    function Name: string; overload;
    function IsCalculateIR(const AValue: Boolean): IModelDependent; overload;
    function IsCalculateIR: Boolean; overload;
    function IsCalculateINSS(const AValue: Boolean): IModelDependent; overload;
    function IsCalculateINSS: Boolean; overload;
    function Clear: IModelDependent;
    function &End: IDAO<IModelDependent>;
  public
    constructor Create(AParent: IDAO<IModelDependent>);
    destructor Destroy; override;
    class function New(AParent: IDAO<IModelDependent>): IModelDependent;
  end;

implementation

{ TModelDependent }

function TModelDependent.Clear: IModelDependent;
begin
  Result := Self;

  FId              := EmptyStr;
  FName            := EmptyStr;
  FIsCalculateIR   := False;
  FIsCalculateINSS := False;
end;

constructor TModelDependent.Create(AParent: IDAO<IModelDependent>);
begin
  FParent := AParent;
end;

destructor TModelDependent.Destroy;
begin

  inherited;
end;

class function TModelDependent.New(AParent: IDAO<IModelDependent>): IModelDependent;
begin
  Result := Self.Create(AParent);
end;

function TModelDependent.&End: IDAO<IModelDependent>;
begin
  Result := FParent;
end;

function TModelDependent.Id: string;
begin
  Result := FId;
end;

function TModelDependent.Id(const AValue: string): IModelDependent;
begin
  Result := Self;
  FId    := AValue;
end;

function TModelDependent.IsCalculateINSS(const AValue: Boolean): IModelDependent;
begin
  Result           := Self;
  FIsCalculateINSS := AValue;
end;

function TModelDependent.IsCalculateINSS: Boolean;
begin
  Result := FIsCalculateINSS;
end;

function TModelDependent.IsCalculateIR(const AValue: Boolean): IModelDependent;
begin
  Result         := Self;
  FIsCalculateIR := AValue;
end;

function TModelDependent.IsCalculateIR: Boolean;
begin
  Result := FIsCalculateIR;
end;

function TModelDependent.Name: string;
begin
  Result := FName;
end;

function TModelDependent.Name(const AValue: string): IModelDependent;
begin
  Result := Self;
  FName  := AValue;
  if FName.Trim.IsEmpty then
    raise Exception.Create('Informe o Nome do dependente.');
end;

end.
