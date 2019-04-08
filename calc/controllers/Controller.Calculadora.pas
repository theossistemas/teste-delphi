unit Controller.Calculadora;

interface

uses
  System.SysUtils, Common.Constante, Controller.Calculadora.Interfaces,
  Entities.Calculadora, Entities.Calculadora.Interfaces,
  Controller.Calculadora.Eventos;
type
  TCalculadoraController = class(TInterfacedObject, iCalculadoraController, iEventosCalculadoraController)
  private
    FVlrMemoria : Double;
    FVlrAtual : Double;

    FEntrada : string;

    FUltimaOperacao : TOperacao;
    FOperacao : TOperacao;
    FOperacaoPress : Boolean;

    FCalculadora : iCalculadora;

    FOnChange : TEvtOnChange;
    FOnCalc   : TEvtOnCalc;

    procedure TrataOperacao(Value : TOperacao);

    procedure OnCalc(Value : Double); overload;
    procedure OnCalcImposto(Value : Double);

    function GetValorEntrada() : Double;
    procedure TrataOnChange();
    procedure TrataOnCalc();
  public
    constructor Create();
    destructor Destroy(); override;
    class function New() : iCalculadoraController;

    function Add(Value : Char) : iCalculadoraController;
    function Reset() : iCalculadoraController;

    function Eventos() : iEventosCalculadoraController;

    function OnChange(Value: TEvtOnChange): iEventosCalculadoraController;
    function OnCalc(Value : TEvtOnCalc) : iEventosCalculadoraController; overload;

    function EndEventos : iCalculadoraController;
  end;

implementation

uses
  System.StrUtils;

{ TCalculadoraController }

function TCalculadoraController.Add(Value: Char): iCalculadoraController;
var
  bOK : Boolean;
  op : TOperacao;
begin
  result := Self;
  if Value in ['=', '+', '-', '*', '/', 'A', 'B', 'C'] then
  begin
    op := StrToOperacao( Value, bOK );
    if not bOK then
      raise Exception.Create(Format('Operador <%S> inválido...', [Value]));

    FOperacaoPress := True;

    TrataOperacao(op);
  end
  else if Value in ['0' .. '9', '.', ',']  then
  begin
    if (Value in ['.', ',']) and (ContainsStr( FEntrada, ',' ) ) then
      Exit();

    if FOperacaoPress then
      FEntrada := '0';

    if (FEntrada = '0') then
      FEntrada := EmptyStr;

    FOperacaoPress  := False;
    FEntrada := FEntrada + Value;

    TrataOnChange();
  end
  else
    raise Exception.Create(Format('Entrada <%S> inválida...', [Value]));
end;

constructor TCalculadoraController.Create;
begin
  FOnChange := nil;

  FCalculadora := TCalculadora.New
                    .Display
                      .Resultado(OnCalc)
                    .EndDisplay();

  self.Reset();
end;

destructor TCalculadoraController.Destroy;
begin

  inherited;
end;

function TCalculadoraController.EndEventos: iCalculadoraController;
begin
  result := Self;
end;

function TCalculadoraController.Eventos: iEventosCalculadoraController;
begin
  Result := self;
end;

function TCalculadoraController.GetValorEntrada: Double;
begin
  if  (FEntrada <> EmptyStr) and (StrToFloat(FEntrada) <> 0) then
    result := StrToFloat(FEntrada)
  else
    result := FVlrMemoria;
end;

class function TCalculadoraController.New: iCalculadoraController;
begin
  result := TCalculadoraController.Create();
end;

procedure TCalculadoraController.OnCalc(Value: Double);
begin
  FVlrMemoria := Value;
  TrataOnCalc();
end;

function TCalculadoraController.OnCalc(Value: TEvtOnCalc): iEventosCalculadoraController;
begin
  Result := Self;
  FOnCalc := Value;
end;

procedure TCalculadoraController.OnCalcImposto(Value: Double);
begin
  FVlrMemoria := Value;
  FEntrada := '0';
  TrataOnCalc();
end;

function TCalculadoraController.OnChange(Value: TEvtOnChange): iEventosCalculadoraController;
begin
  result := Self;
  FOnChange := Value;
end;

function TCalculadoraController.Reset: iCalculadoraController;
begin
  result := Self;

  FEntrada    := '0';
  FVlrMemoria := 0;
  FVlrAtual   := 0;

  FUltimaOperacao := TOperacao.opNenhum;
  FOperacao       := TOperacao.opNenhum;
  FOperacaoPress  := False;

  FCalculadora.Reset();

  TrataOnChange();
end;

procedure TCalculadoraController.TrataOnCalc;
begin
  if Assigned(FOnCalc) then
    FOnCalc(FVlrMemoria,
            FOperacao);
end;

procedure TCalculadoraController.TrataOnChange;
begin
  if Assigned(FOnChange) then
    FOnChange(FVlrMemoria,
              FVlrAtual,
              FEntrada,
              FOperacao,
              FUltimaOperacao);
end;

//* Quando digitarmos um número e escolhermos uma operação, a calculadora checa se é a primeira vez.
//	* Se for, o resultado é o número do visor.

//* Conforme trocamos, as operações são executadas, o valor é armazenado e a operação é atualizada.
//* Ao clicar em igual, checamos se é a primeira vez.
//	* Se for, executamos a última operação com o número do visor.
//	* Caso não seja, a operação será executada, mas usamos o que guardamos do visor no primeiro clique de igual. Isso permite que façamos 5 / 5 * 2 (igual, igual).

//* Utilizando a calculadora acima aumente as funcionalidades criando botões com cálculos específicos e com os seguintes impostos abaixo em cada botão:
//	* Imposto A = Base de Cálculo (Valor imposto na calculadora) * 20 % - 500.
//	* Imposto B = Imposto A – 15.
//	* Imposto C = Imposto A + imposto B.
procedure TCalculadoraController.TrataOperacao(Value: TOperacao);
begin
  try
    if (Value in [opImpostoA, opImpostoB, opImpostoC]) then
      FOperacao := Value;


    if (FOperacao in [opNenhum] ) and (FVlrMemoria = 0)
       and (not (Value in [opImpostoA, opImpostoB, opImpostoC]) )
    then
    begin
      FVlrAtual := GetValorEntrada();
      FVlrMemoria := FVlrAtual;
      FOperacao := Value;
      Exit();
    end;

    if Value = opIgualdade then
    begin
      FVlrAtual := GetValorEntrada();

      case FOperacao of
        opAdicao:
          begin
            FCalculadora
              .Add(FVlrMemoria)
              .Add(FVlrAtual)
            .Somar()
              .Exec();
          end;

        opSubtracao:
          begin
            FCalculadora
              .Add(FVlrMemoria)
              .Add(FVlrAtual)
            .Subtrair()
              .Exec();
          end;

        opMultiplicao:
          begin
            FCalculadora
              .Add(FVlrMemoria)
              .Add(FVlrAtual)
            .Multiplicar()
              .Exec();
          end;

        opDivisao:
          begin
            FCalculadora
              .Add(FVlrMemoria)
              .Add(FVlrAtual)
            .Dividir()
              .Exec();
          end;

        opImpostoA:
          begin
            FCalculadora
              .Add(FVlrAtual)
            .ImpostoA()
              .Display()
                .Resultado(OnCalcImposto)
              .EndDisplay()
              .Exec();
          end;

          opImpostoB:
          begin
            FCalculadora
              .Add(FVlrAtual)
            .ImpostoB()
              .Display()
                .Resultado(OnCalcImposto)
              .EndDisplay()
              .Exec();
          end;

          opImpostoC:
          begin
            FCalculadora
              .Add(FVlrAtual)
            .ImpostoC()
              .Display()
                .Resultado(OnCalcImposto)
              .EndDisplay()
              .Exec();
          end;
      end;
    end
    else
    begin
      TrataOperacao(opIgualdade);
      FVlrAtual     := FVlrMemoria;
      FOperacao     := Value;

      if (Value in [opImpostoA, opImpostoB, opImpostoC] ) then
        FOperacao := opIgualdade;
    end;
  finally
    TrataOnChange();
    TrataOnCalc();
  end;
end;

end.
