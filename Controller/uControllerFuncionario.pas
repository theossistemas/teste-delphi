unit uControllerFuncionario;

interface

uses
  System.Generics.Collections, System.SysUtils, uClasseFuncionario;

type
  TControllerFuncionario = class
  private
    FFuncionario: TFuncionario;
    FDependente: TDependente;
    procedure SetFuncionario(const Value: TFuncionario);
    procedure SetDependente(const Value: TDependente);
  public
    constructor Create;
    destructor Destroy;
    procedure AdicionarDependente(const sNome: string; bCalcularINSS, bCalcularIR: boolean);
    property Funcionario: TFuncionario read FFuncionario write SetFuncionario;
    property Dependente: TDependente read FDependente write SetDependente;
  end;

implementation

{ TControllerFuncionario }

procedure TControllerFuncionario.AdicionarDependente(const sNome: string;
  bCalcularINSS, bCalcularIR: boolean);
begin
  FDependente := TDependente.Create;
  FDependente.Nome := sNome;
  FDependente.CalcularIR := bCalcularIR;
  FDependente.CalcularINSS := bCalcularINSS;
  FFuncionario.Dependentes.Add(FDependente);
end;

constructor TControllerFuncionario.Create;
begin
  FFuncionario := TFuncionario.Create;
  FDependente := TDependente.Create;
end;

destructor TControllerFuncionario.Destroy;
begin
  FreeAndNil(FFuncionario);
  FreeAndNil(FDependente);
end;

procedure TControllerFuncionario.SetDependente(const Value: TDependente);
begin
  FDependente := Value;
end;

procedure TControllerFuncionario.SetFuncionario(const Value: TFuncionario);
begin
  FFuncionario := Value;
end;

end.
