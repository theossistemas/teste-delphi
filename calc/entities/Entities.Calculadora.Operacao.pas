unit Entities.Calculadora.Operacao;

interface

uses
  System.SysUtils, Entities.Calculadora.Interfaces, Generics.Collections,
  Entities.Calculadora.Eventos;

type
  TOperacao = class(TInterfacedObject, iOperacao, iOperacaoDisplay)
  private

  protected
    FOwnedList : Boolean;
    FList : TList<Double>;
    FEvDisplayTotal : TEvDisplayTotal;

    procedure DisplayTotal(Value : Double);
  public
    constructor Create(Value : TList<Double>);
    destructor Destroy(); override;

    function Add(Value : Double) : iOperacao;

    function Exec : Double; virtual;

    function Display() : iOperacaoDisplay;

    function Resultado(Value : TEvDisplayTotal) : iOperacaoDisplay;
    function EndDisplay : iOperacao;

  end;

implementation

{ TOperacao }

function TOperacao.Add(Value: Double): iOperacao;
begin
  result := Self;

  FList.Add(Value);
end;

constructor TOperacao.Create(Value : TList<Double>);
begin
  FList := Value;

  if Assigned(Value) then
    FOwnedList := False
  else
  begin
    FOwnedList := True;
    FList := TList<Double>.Create();
  end;
end;

destructor TOperacao.Destroy;
begin
  if (FOwnedList) and (Assigned(FList)) then
    FreeAndNil(FList);

  inherited;
end;

function TOperacao.Display: iOperacaoDisplay;
begin
  Result := Self;
end;

procedure TOperacao.DisplayTotal(Value: Double);
begin
  if Assigned(FEvDisplayTotal) then
    FEvDisplayTotal(Value);
end;

function TOperacao.EndDisplay: iOperacao;
begin
  result := Self;
end;

function TOperacao.Exec: Double;
begin
  FList.Clear();
end;

function TOperacao.Resultado(Value: TEvDisplayTotal): iOperacaoDisplay;
begin
  Result := Self;
  FEvDisplayTotal := Value;
end;

end.
