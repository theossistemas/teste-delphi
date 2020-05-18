unit uFuncionarioDependente;

interface

type
  TFuncionarioDependente = class
    private
      FIDFuncionario: Integer;
      FIDDependente: Integer;
    published
      property IDFuncionario: Integer read FIDFuncionario write FIDFuncionario;
      property IDDependente: Integer read FIDDependente write FIDDependente;
  end;

implementation

end.
