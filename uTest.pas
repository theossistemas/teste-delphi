unit uTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uFCalc, uFTestFuncionarioDependente;

type
  TFTest = class(TForm)
    btTest1: TButton;
    btTest2: TButton;
    procedure btTest1Click(Sender: TObject);
    procedure btTest2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTest: TFTest;

implementation

{$R *.dfm}

procedure TFTest.btTest1Click(Sender: TObject);
begin

  FCalc := TFCalc.Create(Self);
  try

    FCalc.ShowModal;
  finally

    FreeAndNIL(FCalc);
  end;
end;

procedure TFTest.btTest2Click(Sender: TObject);
begin

  FTestFuncionarioDependente := TFTestFuncionarioDependente.Create(Self);
  with FTestFuncionarioDependente do
  try

    ShowModal;
  finally

    Free;
  end;
end;

end.
