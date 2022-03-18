unit unFuncionario;

interface

uses
  System.Classes, System.Generics.Collections, unDependente;

type
  TFuncionario = class
  private
    FCodigo: Integer;
    FNome: string;
    FCPF: string;
    FSalario: real;
    FListaDendentes: TObjectList<TDependente>;
    procedure SetListaDendentes(const Value: TObjectList<TDependente>);
    function GetINSS: real;
    function GetIR: real;

  public
    constructor Create;
    destructor Destroy; override;
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
    property CPF: string read FCPF write FCPF;
    property Salario: real read FSalario write FSalario;
    property ListaDendentes: TObjectList<TDependente> read FListaDendentes write SetListaDendentes;
    property INSS: real read GetINSS;
    property IR: real   read GetIR;
  end;

implementation

uses
  System.SysUtils, unCalculaImpostos;

{ TFuncionario }

constructor TFuncionario.Create;
begin
  FListaDendentes := TObjectList<TDependente>.Create;
end;

destructor TFuncionario.Destroy;
begin
  FreeAndNil(FListaDendentes);
  inherited;
end;

function TFuncionario.GetINSS: real;
var
  vValorINSS: Real;
  vCalculaImpostoIR : ICalculaImposto;
begin
  vCalculaImpostoIR := TCalculaImpostoINSS.Create;
  vValorINSS := vCalculaImpostoIR.Calcular(Self);

  Result := vValorINSS;
end;

function TFuncionario.GetIR: real;
var
  vValorIR: Real;
  vCalculaImpostoIR : ICalculaImposto;
begin
  vCalculaImpostoIR := TCalculaImpostoIR.Create;
  vValorIR := vCalculaImpostoIR.Calcular(Self);
  Result := vValorIR;
end;


procedure TFuncionario.SetListaDendentes(const Value: TObjectList<TDependente>);
begin
  if Assigned(FListaDendentes) then
    FreeAndNil(FListaDendentes);
  FListaDendentes := Value;
end;

end.
