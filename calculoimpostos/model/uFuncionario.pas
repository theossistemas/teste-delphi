unit uFuncionario;

interface

uses
  System.SysUtils, System.Generics.Collections, uDependente;

type
  TFuncionario = class
  private
    FID: Integer;
    FNome: String;
    FCPF: String;
    FSalario: Double;
    FListaDependentes: TObjectList<TDependente>;
    FIsCalculaINSS: Boolean;
    FQtdDependentesIR: Integer;
    procedure SetCPF(const Value: String);
    procedure SetNome(const Value: String);
    function GetIsCalculaINSS: Boolean;
    function GetQtdDependentesIR: Integer;
  protected
    { protected declarations }
  public
    constructor Create;
    destructor Destroy; override;
    procedure AdicionarDependente(oDependente: TDependente);
    function LocalizarDependente(iIDDependente: Integer): Integer;
    procedure ExcluirDependente(iIDDependente: Integer);
  published
    property ID: Integer read FID write FID;
    property Nome: String read FNome write SetNome;
    property CPF: String read FCPF write SetCPF;
    property Salario: Double read FSalario write FSalario;
    property ListaDependentes: TObjectList<TDependente> read FListaDependentes
      write FListaDependentes;
    property IsCalculaINSS: Boolean read GetIsCalculaINSS;
    property QtdDependentesIR: Integer read GetQtdDependentesIR;
  end;

implementation

{ TFuncionario }

procedure TFuncionario.AdicionarDependente(oDependente: TDependente);
var
  iIndice: Integer;
begin
  FListaDependentes.Add(TDependente.Create);
  iIndice := FListaDependentes.Count - 1;
  FListaDependentes[iIndice].ID := oDependente.ID;
  FListaDependentes[iIndice].Nome := oDependente.Nome;
  FListaDependentes[iIndice].IsCalculaIR := oDependente.IsCalculaIR;
  FListaDependentes[iIndice].IsCalculaINSS := oDependente.IsCalculaINSS;
  FListaDependentes[iIndice].Status := TStatus.stNovo;
end;

constructor TFuncionario.Create;
begin
  FListaDependentes := TObjectList<TDependente>.Create;
end;

destructor TFuncionario.Destroy;
begin
  FreeAndNil(FListaDependentes);
  inherited;
end;

procedure TFuncionario.ExcluirDependente(iIDDependente: Integer);
var
  iIndice: Integer;
begin
  iIndice := LocalizarDependente(iIDDependente);
  if iIndice >= 0 then begin
    if FListaDependentes[iIndice].Status = TStatus.stNone then begin
      FListaDependentes[iIndice].Status := TStatus.stExcluir;
    end else begin
      FListaDependentes.Delete(iIndice);
    end;
  end;
end;

function TFuncionario.GetIsCalculaINSS: Boolean;
var
  iIndice: Integer;
begin
  Result := false;
  for iIndice := 0 to FListaDependentes.Count - 1 do begin
    if FListaDependentes[iIndice].IsCalculaINSS then begin
      Result := true;
      break;
    end;
  end;
end;

function TFuncionario.GetQtdDependentesIR: Integer;
var
  iIndice: Integer;
begin
  Result := 0;
  for iIndice := 0 to FListaDependentes.Count - 1 do begin
    if FListaDependentes[iIndice].IsCalculaIR then begin
      Inc(Result);
    end;
  end;
end;

function TFuncionario.LocalizarDependente(iIDDependente: Integer): Integer;
var
  iIndice: Integer;
begin
  Result := -1;
  for iIndice := 0 to FListaDependentes.Count - 1 do begin
    if iIDDependente = FListaDependentes[iIndice].ID then begin
      Result := iIndice;
      Exit;
    end;
  end;
end;

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
