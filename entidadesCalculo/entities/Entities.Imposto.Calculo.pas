unit Entities.Imposto.Calculo;

interface

uses
  System.SysUtils, Entities.Funcionario, Entities.Imposto.Interfaces;

type
  TCalculoImposto = class(TInterfacedObject, iCalculo)
  private

  protected
    FResultado : Double;

    FSalario : Double;
    FDependente : Integer;

    FAliquota : Double;
    FDeducao : Double;

    function CalcDeducao(AQtde : integer) : Double;
    function CalcAliquota(Value: double): Double;
  public
    constructor Create();
    destructor Destroy(); override;

    function SetSalario(Value : Double) : iCalculo;
    function SetQtdeDependente(Value : integer) : iCalculo;
    function SetAliquota(Value: double) : iCalculo;
    function SetVlrDeducao(Value: double) : iCalculo;

    function Exec : Double; virtual;
  end;

implementation

{ TCalculo }

function TCalculoImposto.CalcAliquota(Value: double): Double;
begin
  result := Value * FAliquota / 100;
end;

function TCalculoImposto.CalcDeducao(AQtde: integer): Double;
begin
  result := FDeducao * AQtde;
end;

constructor TCalculoImposto.Create();
begin
  inherited Create();

  FResultado := 0;

  FSalario := 0;
  FDependente := 0;

  FAliquota := 0;
  FDeducao := 0;
end;

destructor TCalculoImposto.Destroy;
begin

  inherited;
end;

function TCalculoImposto.Exec: Double;
begin
  result := FResultado;
end;

function TCalculoImposto.SetAliquota(Value: double): iCalculo;
begin
  result := Self;
  FAliquota := Value;
end;

function TCalculoImposto.SetVlrDeducao(Value: double): iCalculo;
begin
  result := Self;
  FDeducao := Value;
end;

function TCalculoImposto.SetQtdeDependente(Value: integer): iCalculo;
begin
  result := Self;
  FDependente := Value;
end;

function TCalculoImposto.SetSalario(Value: Double): iCalculo;
begin
  result := Self;
  FSalario := Value;
end;

end.
