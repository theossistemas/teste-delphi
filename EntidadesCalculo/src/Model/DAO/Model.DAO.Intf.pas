unit Model.DAO.Intf;

interface

uses
  Data.DB;

type
  IDAO<T: IInterface> = interface
    ['{11C178AD-9DA2-4EE3-98EB-769DAAE8DF54}']
    function FindAll: IDAO<T>;
    function Save: IDAO<T>;
    function Delete(const AId: string): IDAO<T>;
    function DataSet(ADataSource: TDataSource): IDAO<T>;
    function This: T;
  end;

implementation

end.
