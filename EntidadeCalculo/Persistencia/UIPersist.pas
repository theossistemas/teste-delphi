unit UIPersist;

interface
uses
  System.Generics.Collections, Data.DB;


type IPersist<T: class> = interface
  function Get(): TList<T>;
  function GetDataSet(): TDataSet; overload;
  function GetById(Id: Integer): T;
  function Save(Entidade: T): boolean;
  function Delete(Entidade: T): boolean;
end;

implementation


end.
