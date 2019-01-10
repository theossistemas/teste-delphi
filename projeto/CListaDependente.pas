unit CListaDependente;

interface

uses Classes, SysUtils, CDependente;

type
  TListaDependente = class
  private
    { Private declarations }
    FListaDependente: TList;
  public
    constructor Create;
    Destructor Destroy; override;
    procedure adicionar(oDependente: TDependente);
    function getLista: TList;
  end;

implementation

{ TListaDependente }

constructor TListaDependente.Create;
begin
  self.FListaDependente := TList.Create;
end;

procedure TListaDependente.adicionar(oDependente: TDependente);
begin
  self.FListaDependente.Add(oDependente);
end;

function TListaDependente.getLista: TList;
begin
  result := self.FListaDependente;
end;

destructor TListaDependente.Destroy;
begin
  FreeAndNil(self.FListaDependente);
  inherited;
end;

end.
