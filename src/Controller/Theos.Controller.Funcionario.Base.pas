unit Theos.Controller.Funcionario.Base;

interface

uses
  Vcl.Forms, System.SysUtils, Data.DB, Vcl.Controls, Winapi.Windows,

  Theos.Lib.Resource,
  Theos.View.Funcionario.Base,
  Theos.Controller.Funcionario.Lista,
  Theos.Controller.Dependente.Lista,
  Theos.Model.Funcionario;

type
  TControllerFuncionarioBase = class sealed
  strict private
    var
      FView: TViewFuncionarioBase;

      FControllerFuncionarioLista: TControllerFuncionarioLista;
      FControllerDependenteLista: TControllerDependenteLista;

    procedure Init;

    procedure DataSetAfterScroll(DataSet: TDataSet);

  public
    constructor Create; reintroduce;
    destructor Destroy; override;
    function ShowModal: Integer;
  end;

implementation

constructor TControllerFuncionarioBase.Create;
begin
  inherited Create;
  Init;
end;

destructor TControllerFuncionarioBase.Destroy;
begin
  FView.Release;
  FView := nil;
  FControllerFuncionarioLista.Free;
  FControllerDependenteLista.Free;
  inherited Destroy;
end;

procedure TControllerFuncionarioBase.Init;
begin
  Application.CreateForm(TViewFuncionarioBase, FView);

  FControllerDependenteLista := TControllerDependenteLista.Create;
  FControllerDependenteLista.Parent := FView.PnlDependente;
  FControllerDependenteLista.Show;

  FControllerFuncionarioLista := TControllerFuncionarioLista.Create;
  FControllerFuncionarioLista.Parent := FView.PnlFuncionario;
  FControllerFuncionarioLista.OnAfterScroll := DataSetAfterScroll;
  FControllerFuncionarioLista.Show;

end;

function TControllerFuncionarioBase.ShowModal: Integer;
begin
  result := FView.ShowModal;
end;

procedure TControllerFuncionarioBase.DataSetAfterScroll(DataSet: TDataSet);
begin
  FControllerDependenteLista.CodigoFuncionario := DataSet.FieldByName('CODIGO').AsLargeInt;
end;

end.
