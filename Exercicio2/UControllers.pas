unit UControllers;

interface

uses UModels, UConexao, FireDAC.comp.Client, Vcl.Dialogs, db, StrUtils, SysUtils;

type controllerFuncionario = class
     private

     public
           function CalculaINSS( v_salario:Extended ): Extended;
           function CalculaIR( v_salario:Extended; v_qtdDependente: Integer ): Extended;
           function CadastrarFuncionario(f_funcionario : classFuncionario):string;
           function RetornaImpostos(f_funcionario : classFuncionario): String;
end;

implementation

{ controllerFuncionario }
function controllerFuncionario.CadastrarFuncionario(f_funcionario: classFuncionario): string;
var
   Query      : TFDQuery;
   FConexao   : classConexao;
   dependente : classDependente;
begin
     FConexao := classConexao.Create();
     Query := FConexao.CriarQuery;

     try
        try
          Query.SQL.Clear;
          Query.SQL.Add('INSERT INTO FUNCIONARIO (ID,NOME,SALARIO)');
          Query.SQL.Add('VALUES (GEN_ID(GEN_FUNCIONARIO,1),:NOME,:SALARIO)');
          Query.SQL.Add('RETURNING ID');
          Query.Prepare;
          Query.ParamByName('NOME').AsString    := f_funcionario.Nome;
          Query.ParamByName('SALARIO').AsBCD    := f_funcionario.Salario;
          Query.Open;

          f_funcionario.ID := Query.FieldByName('ID').AsInteger;

          Query.SQL.Clear;
          Query.SQL.Add('INSERT INTO DEPENDENTE (ID,IDFUNCIONARIO,NOME,ISCALCULARIR,ISCALCULARINSS)');
          Query.SQL.Add('VALUES (GEN_ID(GEN_DEPENDENTE,1),:IDFUNC,:NOME,:ISCALCULARIR,:ISCALCULARINSS)');
          Query.Prepare;

          for dependente in f_funcionario.ListaDependentes do
              begin
                   Query.Params.ClearValues;
                   Query.ParamByName('IDFUNC').AsInteger          := f_funcionario.ID;
                   Query.ParamByName('NOME').AsString             := dependente.Nome;
                   Query.ParamByName('ISCALCULARIR').AsSmallInt   := StrToInt(ifthen(dependente.IsCalcularIR,'1','0'));
                   Query.ParamByName('ISCALCULARINSS').AsSmallInt := StrToInt(ifthen(dependente.IsCalcularINSS,'1','0'));
                   Query.ExecSQL;
              end;

          Result := 'Funcionário cadastrado com sucesso.' + sLineBreak + 'ID: ' + IntToStr(f_funcionario.ID);
        except
              on e : Exception do
                 Result := e.Message;
        end;
     finally
            Query.Free;
            FConexao.Free;
     end;
end;

function controllerFuncionario.CalculaINSS(v_salario: Extended): Extended;
var
  v_DescINSS : Extended;
begin
     v_DescINSS := 8; //%

     Result   := 0;
     Result   := ((v_DescINSS / 100) * v_salario );
end;

function controllerFuncionario.CalculaIR(v_salario: Extended;
  v_qtdDependente: Integer): Extended;
var
   v_DescIR   : Extended;
begin
     v_DescIR := 100;//R$

     Result   := 0;
     Result   := ((15 / 100) * ( v_salario - (v_DescIR * v_qtdDependente)));

end;


function controllerFuncionario.RetornaImpostos(
  f_funcionario: classFuncionario): String;
var
   v_CalcINSS : Boolean;
   v_CalcIR   : Integer;
   dependente : classDependente;
begin
     v_CalcINSS := False;
     v_CalcIR   := 0;
     
     for dependente in f_funcionario.ListaDependentes do
         begin
              if dependente.IsCalcularINSS then
                 v_CalcINSS := True;

              if dependente.IsCalcularIR then
                 Inc(v_CalcIR);
         end;

     Result := '';

     if v_CalcINSS then
        Result := 'INSS: ' + FloatToStr(CalculaINSS(f_funcionario.Salario))
     else
        Result := 'INSS: 0';

     if v_CalcIR > 0 then
        Result := Result + ' IR: ' + FloatToStr(CalculaIR(f_funcionario.Salario,v_CalcIR))
     else
        Result := Result + ' IR: 0';
end;

end.
