unit unIRepository;

interface

uses
  System.Classes, System.Generics.Collections, Data.DB;

type
  IRepository<T: class> = Interface
    ['{70DC63A7-6A8E-496B-B55E-63197E3D46AB}']
    function GetById(id: Integer): T;
    function GetAll: TObjectList<T>;
    function Post(obj: T): T; overload;
    function Put(obj: T): T; overload;
    function Delete(id: Integer): Boolean; overload;
    function Delete(obj: T): Boolean; overload;

  End;

implementation

end.
