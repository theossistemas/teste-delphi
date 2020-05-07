unit uFuncoes;

interface

uses
  System.SysUtils;

type
  TFuncoes = class
    public
      function IsNumber(texto: String) : Boolean;
      function IsOperation(texto: String) : Boolean;
  end;

implementation

{ TFuncoes }

function TFuncoes.IsNumber(texto: String): Boolean;
var
  number: Double;
begin
  Result := TryStrToFloat(texto, number);
end;

function TFuncoes.IsOperation(texto: String): Boolean;
begin
  Result := Pos(texto, '+-*/') > 0;
end;

end.
