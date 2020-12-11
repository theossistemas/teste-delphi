unit UControle;

interface

uses

sqlexpr, forms , uconexaobanco, SysUtils;


type

TControle = class
private
  { private declarations }
  FConexao  : TConexaoBanco;
  FSqqGeral : TSQLQuery;
protected
  { protected declarations }
public
  { public declarations }
  constructor Create;
  destructor Destroy; override;
  property SqqGeral : TSQLQuery read FSqqGeral write FSqqGeral;
published
  { published declarations }
end;

implementation

{ TControle }

constructor TControle.Create;
begin
  FConexao  := TConexaoBanco.Create;
  FSqqGeral := TSQLQuery.Create(Application);
  FSqqGeral.SQLConnection := FConexao.ConexaoBanco;
end;

destructor TControle.Destroy;
begin
  FreeAndNil( FConexao );
  FreeAndNil( FSqqGeral );

  inherited;
end;


end.
