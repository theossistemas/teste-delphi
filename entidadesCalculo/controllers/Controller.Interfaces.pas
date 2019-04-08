unit Controller.Interfaces;

interface

uses
  FireDAC.Comp.Client, Entities.Funcionario, Entities.Dependente;

type
  iDAL = interface
    ['{0C2B8A0F-A72D-4DA3-B9B9-27F2C45F577C}']
    procedure StartTransaction();
    procedure RollbackTransaction();
    procedure CommitTransaction();
  end;

  iFuncionarioController = interface
    ['{787A4403-F584-4C71-91DB-E500D61FD4CC}']

    function SaveFuncionario( AFuncionario : TFuncionario; out AMessage : string) : boolean;

    function LoadFuncionario(AFuncionarioID : int64; AFuncionario : TFuncionario; out AMessage : string) : boolean; overload;
    function LoadFuncionario(AFuncionarioID : int64; out AMessage : string) : TFuncionario; overload;

    function DeleteFuncionario(AFuncionarioID : int64; out AMessage : string) : boolean;
  end;

  iDependenteController = interface
    ['{32224456-AA20-4511-88B9-939209C80B60}']

    function SaveDependente( ADependente : TDependente; out AMessage : string) : boolean; overload;
    function SaveDependente( AFuncionarioID : Int64; ADependentes : TListDependente; out AMessage : string; AUseTransaction : Boolean = true) : boolean; overload;

    function LoadDependente(ADependenteID : int64; ADependente : TDependente; out AMessage : string) : boolean; overload;
    function LoadDependente(ADependenteID : int64; out AMessage : string) : TDependente; overload;

    function LoadDependentes(AFuncionarioID : int64; ADependentes : TListDependente; out AMessage : string) : boolean; overload;
    function LoadDependentes(AFuncionarioID : int64; out AMessage : string) : TListDependente; overload;

    function DeleteDependente(ADependenteID : int64; out AMessage : string) : boolean;
    function DeleteDependentes(AFuncionarioID : int64; out AMessage : string) : boolean;
  end;



implementation

end.
