unit UFrmFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, ufuncionariopersist;

type
  TfrmFuncionario = class(TForm)
    btnExecutar: TButton;
    memObs: TMemo;
    procedure btnExecutarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFuncionario: TfrmFuncionario;

implementation

{$R *.dfm}

uses UConexao, UDependentePersist, UFuncionario, UDependente;

procedure TfrmFuncionario.btnExecutarClick(Sender: TObject);
  var funcionario: Tfuncionario;
    dependente1: Tdependente;
    dependente2: Tdependente;
    FuncionarioPersist: TFuncionarioPersist;

    funcDoBanco : Tfuncionario;
begin

  // incluindo dados no banco.
  funcionario := TFuncionario.Create(0, 'Theos','654321', 10000);
  dependente1 := TDependente.Create(0, 0, 'dependente 1', true, false);
  dependente2 := TDependente.Create(0, 0, 'dependente 2', true, true);
  funcionario.AddDependente(dependente1)
    .AddDependente(dependente2);
  FuncionarioPersist:= TFuncionarioPersist.Create;
  FuncionarioPersist.Save(funcionario);

  // recuperando dados do banco e exibindo na tela.
  funcdoBanco := FuncionarioPersist.GetById(funcionario.Id);

  memObs.Clear();
  memObs.Lines.Add(Format( 'Funcionário: %s', [funcdobanco.Nome] ) );
  memObs.Lines.Add(Format( '  Salario: %f', [funcdobanco.Salario] ) );
  memObs.Lines.Add( '  Dependentes:' );
  funcDoBanco.ForInDependentes(procedure (dep: TDependente) begin
    memObs.Lines.Add(Format( '    Nome: %s', [dep.Nome] ) );
  end);

  memObs.Lines.Add(Format( '  Imposto de Renda: %f', [funcdobanco.ValorIR] ) );
  memObs.Lines.Add(Format( '  INSS            : %f', [funcdobanco.ValorINSS] ) );

end;

end.
