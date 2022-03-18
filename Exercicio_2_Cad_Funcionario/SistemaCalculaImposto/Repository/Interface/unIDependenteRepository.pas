unit unIDependenteRepository;

interface

uses
  System.Generics.Collections, unIRepository;

type
  IDependenteRepository<T: class> = Interface(IRepository<T>)
    ['{5605862D-C128-49D1-BD64-D062F629E3F7}']
    function GetByNome(nome: string): TObjectList<T>;
    function GetByFuncionario(idFuncionari: Integer): TObjectList<T>;
  End;

implementation

end.
