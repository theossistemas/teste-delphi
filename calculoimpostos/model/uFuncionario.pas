unit uFuncionario;

interface

type
  TFuncionario = class
  private
    FID: Integer;
    FNome: String;
    FCPF: String;
    FSalario: Double;
    procedure SetCPF(const Value: String);
    procedure SetNome(const Value: String);
  protected
    { protected declarations }
  public
    { public declarations }
  published
    property ID: Integer read FID write FID;
    property Nome: String read FNome write SetNome;
    property CPF: String read FCPF write SetCPF;
    property Salario: Double read FSalario write FSalario;
  end;

implementation

uses
  System.SysUtils;

{ TFuncionario }

procedure TFuncionario.SetCPF(const Value: String);
begin
  if Length(Trim(Value)) > 11 then begin
    raise EArgumentException.Create('O CPF deve conter apenas 11 caracteres');
  end;

  FCPF := Trim(Value);
end;

procedure TFuncionario.SetNome(const Value: String);
begin
if Length(Trim(Value)) > 200 then begin
    raise EArgumentException.Create('O nome deve conter apenas 200 caracteres');
  end;

  FNome := Trim(Value);
end;

end.
