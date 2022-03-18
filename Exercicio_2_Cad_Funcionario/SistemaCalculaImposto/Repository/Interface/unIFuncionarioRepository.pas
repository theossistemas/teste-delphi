unit unIFuncionarioRepository;

interface

uses
  System.Classes, System.Generics.Collections, Data.DB, unIRepository;

type
  IFuncionarioRepository<T: class> = Interface(IRepository<T>)
    ['{06AC51A0-424A-412A-A17C-23D6D27AC9E7}']
    function GetByNome(nome: string): TObjectList<T>;

  End;

implementation

end.
