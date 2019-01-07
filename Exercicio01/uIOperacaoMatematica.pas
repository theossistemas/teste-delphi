(*
Autor..: Alexandre Pedro
Contato: alexandre.pedro@gmail.com
*)


unit uIOperacaoMatematica;


interface

type
  IOperacaoMatematica = interface['{1D59ABCD-19FC-48AA-9C3D-6882CF68A74B}']

    function Calcular(const vValor01, vValor02 : Double):Double; overload;
    function Calcular:Double; overload;

    function GetPrimeiraOperacao:Boolean;
    procedure SetPrimeiraOperacao(vValor:Boolean);
    function GetValor01:Double;
    procedure SetValor01(vValor:Double);
    function GetValor02:Double;
    procedure SetValor02(vValor:Double);
    function GetSinalOperacao:Char;


    property PrimeiraOperacao: Boolean read GetPrimeiraOperacao write SetPrimeiraOperacao;
    property SinalOperacao:Char read GetSinalOperacao;
    property Valor01:double read GetValor01 write SetValor01;
    property Valor02:double read GetValor02 write SetValor02;




  end;


implementation

end.
