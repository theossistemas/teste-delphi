unit uFCalc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.Actions,
  Vcl.ActnList, Vcl.Buttons, Vcl.StdCtrls;

type
  TFCalc = class(TForm)
    pCalc: TPanel;
    Bevel1: TBevel;
    lbNumber: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    alCalc: TActionList;
    alEqual: TAction;
    al1: TAction;
    al2: TAction;
    al3: TAction;
    al4: TAction;
    al5: TAction;
    al6: TAction;
    al7: TAction;
    al8: TAction;
    al9: TAction;
    al0: TAction;
    alDotch: TAction;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    lbHistory: TLabel;
    alAdd: TAction;
    alSub: TAction;
    alMult: TAction;
    alDiv: TAction;
    alA: TAction;
    alB: TAction;
    alC: TAction;
    procedure FormCreate(Sender: TObject);
    procedure al1Execute(Sender: TObject);
    procedure alAddExecute(Sender: TObject);
    procedure alEqualExecute(Sender: TObject);
    procedure alAExecute(Sender: TObject);
    procedure alBExecute(Sender: TObject);
    procedure alCExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FInOperation: boolean;
    procedure NumberOperation(aAction: TAction); overload;
    procedure NumberOperation(aNumber: string); overload;
    procedure ActionOperation(aACtion: TAction); overload;
    procedure ActionOperation(aOperation: string); overload;
  public
    { Public declarations }
  end;

var
  FCalc: TFCalc;

implementation

{$R *.dfm}

uses System.StrUtils, uCalc;

procedure TFCalc.al1Execute(Sender: TObject);
begin

  NumberOperation(TAction(Sender));
end;

procedure TFCalc.alAddExecute(Sender: TObject);
begin

  ActionOperation(TAction(Sender));
end;

procedure TFCalc.alAExecute(Sender: TObject);
begin

  Calc.Number  := StrToFloatDef(lbNumber.Caption, 0);
  Calc.TaxA;
  FInOperation := FALSE;

end;

procedure TFCalc.alBExecute(Sender: TObject);
begin

  Calc.Number  := StrToFloatDef(lbNumber.Caption, 0);
  Calc.TaxB;
  FInOperation := FALSE;
end;

procedure TFCalc.alCExecute(Sender: TObject);
begin

  Calc.Number  := StrToFloatDef(lbNumber.Caption, 0);
  Calc.TaxC;
  FInOperation := FALSE;
end;

procedure TFCalc.alEqualExecute(Sender: TObject);
begin

  Calc.Number  := StrToFloatDef(lbNumber.Caption, 0);
  Calc.Equal;
  FInOperation := FALSE;
end;

procedure TFCalc.FormCreate(Sender: TObject);
begin

  alDotch.Caption := FormatSettings.DecimalSeparator;
  Calc.LbDisplay  := lbNumber;
  Calc.LbHistory  := lbHistory;
end;

procedure TFCalc.FormKeyPress(Sender: TObject; var Key: Char);
begin

  case Key of

    '1': al1.Execute;
    '2': al2.Execute;
    '3': al3.Execute;
    '4': al4.Execute;
    '5': al5.Execute;
    '6': al6.Execute;
    '7': al7.Execute;
    '8': al8.Execute;
    '9': al9.Execute;
    '0': al0.Execute;
    ',','.': alDotch.Execute;
    '+': alAdd.Execute;
    '-': alSub.Execute;
    '*': alMult.Execute;
    '/': alDiv.Execute;
    '=', #13: alEqual.Execute;
  end;

  if CharInSet(Key, ['1','2','3','4','5','6','7','8','9','0',',','.','+','-','*','/','=']) then
    Key := #0;
end;

procedure TFCalc.NumberOperation(aAction: TAction);
begin

  NumberOperation(aAction.Caption);
end;

procedure TFCalc.NumberOperation(aNumber: string);
var

  lCaption: string;
begin

  lCaption         := ifthen((StrToFloatDef(lbNumber.Caption, 0) = 0) OR (NOT FInOperation),
                             '',
                             lbNumber.Caption);
  FInOperation     := TRUE;
  lCaption         := trim(lCaption) + trim(aNumber);
  lbNumber.Caption := lCaption;
end;

procedure TFCalc.ActionOperation(aAction: TAction);
begin

  ActionOperation(aAction.Caption);
end;

procedure TFCalc.ActionOperation(aOperation: string);
begin

  Calc.Number       := StrToFloatDef(lbNumber.Caption, 0);
  Calc.OperationStr := aOperation;
  Calc.Balance;
  FInOperation      := FALSE;
end;

end.
