unit UModels;

interface

uses System.Generics.Collections;

type classDependente = class
    private
          FId             : Integer;
          FIdFuncionario  : Integer;
          FNome           : string;
          FIsCalcularIR   : boolean;
          FIsCalcularINSS : boolean;
    public
          property ID             : integer  read FID             write FID;
          property IDFuncionario  : integer  read FIDFuncionario  write FIDFuncionario;
          property Nome           : string   read FNome           write FNome;
          property IsCalcularIR   : boolean  read FIsCalcularIR   write FIsCalcularIR;
          property IsCalcularINSS : boolean  read FIsCalcularINSS write FIsCalcularINSS;

end;

type classFuncionario = class
     private
          FId      : Integer;
          FNome    : string;
          FCpf     : string;
          FSalario : Extended;
          FListaDependentes: TObjectList<classDependente>;

     protected
        { protected declarations }
     public
          property ID      : integer  read FID      write FID;
          property Nome    : string   read FNome    write FNome;
          property Cpf     : string   read FCpf     write FCpf;
          property Salario : Extended read FSalario write FSalario;

          property ListaDependentes: TObjectList<classDependente> read FListaDependentes
                                                                 write FListaDependentes;
          
          Constructor Create;
     published

end;



implementation

{ classFuncionario }

constructor classFuncionario.Create;
var
funcionarioDependente : classDependente;
begin
  inherited;

     ListaDependentes := TObjectList<classDependente>.Create();
     
  end;

end.
