unit uControle;



interface

uses

   Windows, Messages, SysUtils, Classes,  Controls, Forms, Dialogs,

   Variants, Contnrs, SqlExpr,  StrUtils, inifiles,

   uConexaoBanco;



type

  TControle = class

    private

      FConexao  : TConexaoBanco;

      FSqqGeral : TSQLQuery;

    public



     constructor Create;

     destructor  Destroy; override;

     property SqqGeral : TSQLQuery read FSqqGeral write FSqqGeral;



  end;



implementation



{ TControle }

constructor TControle.Create;

begin

   FConexao  := TConexaoBanco.Create;

   FSqqGeral := TSQLQuery.Create(Application);

   FSqqGeral.SQLConnection := FConexao.ConexaoBanco;

end;



destructor TControle.Destroy;

begin

  inherited;

end;



end.
