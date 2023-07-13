unit Funcionario;

interface

uses
  System.Generics.Collections, System.SysUtils, Dependente;

type

  TFuncionario = class
  private
    Fid: Integer;
    FNome: string;
    FCPF: string;
    FSalario: Double;
    FINSS: Double;
    FIR: Double;
    FDependnetes: TObjectList<TDependente>;
    procedure SetDependnetes(const Value: TObjectList<TDependente>);
  public
    constructor Create;
    destructor Destroy; override;

    property Id: Integer  read FId write FId;
    property Nome: string read FNome write FNome;
    property CPF: string read FCPF write FCPF;
    property Salario: Double read FSalario write FSalario;
    property INSS: Double read FINSS write FINSS;
    property IR: Double read FIR write FIR;
    property Dependnetes: TObjectList<TDependente> read FDependnetes write SetDependnetes;
  end;


implementation

{ TFuncionario }

constructor TFuncionario.Create;
begin
  Dependnetes := TObjectList<TDependente>.Create;
end;

destructor TFuncionario.Destroy;
begin
  Dependnetes.DisposeOf;
  inherited;
end;

procedure TFuncionario.SetDependnetes(const Value: TObjectList<TDependente>);
begin
  FDependnetes := Value;
end;

end.
