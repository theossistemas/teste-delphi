unit Controller.CalculoImposto;

interface

uses
  Controller.Calculo.Interfaces, Controller.Calculo.Eventos,
  Entities.Funcionario;

type
  TCalculoImpostoController = class(TInterfacedObject, iCalculoImpostoController, iEventosCalculoImpostoController)
  private
    FOnCalcIR : TEvtOnCalc;
    FOnCalcINSS : TEvtOnCalc;

    FAliquotaIR : Double;
    FAliquotaINSS : Double;
    FDeducaoIR : Double;

    FFuncionario : TFuncionario;
  public
    constructor Create(Value : TFuncionario);
    destructor Destroy(); override;

    class function New(Value : TFuncionario) : iCalculoImpostoController;

    function CalcularIR() : iCalculoImpostoController;
    function CalcularINSS() : iCalculoImpostoController;

    function Eventos() : iEventosCalculoImpostoController;

    function OnCalcIR(Value : TEvtOnCalc) : iEventosCalculoImpostoController;
    function OnCalcINSS(Value : TEvtOnCalc) : iEventosCalculoImpostoController;

    function SetAliquotaIR(Value : double) : iCalculoImpostoController;
    function SetDeducaoIR(Value : double) : iCalculoImpostoController;
    function SetAliquotaINSS(Value : double) : iCalculoImpostoController;

    function EndEventos : iCalculoImpostoController;
  end;

implementation

uses
  Entities.Imposto.IR, Entities.Imposto.INSS;



{ TCalculoImpostoController }

function TCalculoImpostoController.CalcularINSS: iCalculoImpostoController;
var
  dValue : Double;
begin
  result := Self;

  dValue := TImpostoINSS.New()
              .SetSalario( FFuncionario.Salario )
              .SetQtdeDependente( FFuncionario.Dependentes.QtdeIsCalculaINSS )
              .SetAliquota( FAliquotaINSS )
              .Exec();

  if AssigneD(FOnCalcINSS) then
    FOnCalcINSS(dValue);
end;

function TCalculoImpostoController.CalcularIR: iCalculoImpostoController;
var
  dValue : Double;
begin
  result := Self;

  dValue := TImpostoIR.New()
              .SetSalario( FFuncionario.Salario )
              .SetQtdeDependente( FFuncionario.Dependentes.QtdeIsCalculaIR )
              .SetAliquota( FAliquotaIR )
              .SetVlrDeducao( FDeducaoIR )
              .Exec();

  if AssigneD(FOnCalcIR) then
    FOnCalcIR(dValue);
end;

constructor TCalculoImpostoController.Create(Value : TFuncionario);
begin
  inherited Create();
  FFuncionario := Value;

  FOnCalcIR := nil;
  FOnCalcINSS := nil;

  FAliquotaIR   := 0;
  FAliquotaINSS := 0;
  FDeducaoIR    := 0;
end;

destructor TCalculoImpostoController.Destroy;
begin

  inherited;
end;

function TCalculoImpostoController.EndEventos: iCalculoImpostoController;
begin
  result := Self;
end;

function TCalculoImpostoController.Eventos: iEventosCalculoImpostoController;
begin
  result := Self;
end;

class function TCalculoImpostoController.New(Value : TFuncionario) : iCalculoImpostoController;
begin
  result := TCalculoImpostoController.Create(Value);
end;

function TCalculoImpostoController.OnCalcINSS(Value: TEvtOnCalc): iEventosCalculoImpostoController;
begin
  result := Self;
  FOnCalcINSS := Value;
end;

function TCalculoImpostoController.OnCalcIR(Value: TEvtOnCalc): iEventosCalculoImpostoController;
begin
  result := Self;
  FOnCalcIR := Value;
end;

function TCalculoImpostoController.SetAliquotaINSS(Value: double): iCalculoImpostoController;
begin
  result := Self;
  FAliquotaINSS := Value;
end;

function TCalculoImpostoController.SetAliquotaIR(Value: double): iCalculoImpostoController;
begin
  result := Self;
  FAliquotaIR := Value;
end;

function TCalculoImpostoController.SetDeducaoIR(Value: double): iCalculoImpostoController;
begin
  result := Self;
  FDeducaoIR := Value;
end;

end.
