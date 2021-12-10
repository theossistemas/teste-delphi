unit View.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.WinXCtrls,
  Vcl.StdCtrls,
  dxGDIPlusClasses,
  Controller.Calculator.Intf,
  Model.Calculator.Types;

type
  TViewMain = class(TForm)
    pnlCalc1: TPanel;
    gpNumbers: TGridPanel;
    gpOperators: TGridPanel;
    pnlNum7: TPanel;
    pnlNum8: TPanel;
    pnlNum9: TPanel;
    pnlNum4: TPanel;
    pnlNum5: TPanel;
    pnlNum6: TPanel;
    pnlNum1: TPanel;
    pnlNum2: TPanel;
    pnlNum3: TPanel;
    pnlNum0: TPanel;
    pnlComma: TPanel;
    pnlEqual: TPanel;
    pnlOperatorDivide: TPanel;
    pnlOperatorMultiply: TPanel;
    pnlOperatorSubtract: TPanel;
    pnlOperatorSum: TPanel;
    pnlTax: TPanel;
    gpTax: TGridPanel;
    pnlTaxA: TPanel;
    pnlTaxB: TPanel;
    pnlTaxC: TPanel;
    pnlTop: TPanel;
    imgMenu: TImage;
    lblType: TLabel;
    pnlInternal: TPanel;
    svOptions: TSplitView;
    lblCalc: TLabel;
    pnlDefault: TPanel;
    imgCalc: TImage;
    lblDefault: TLabel;
    pnlTypeTax: TPanel;
    imgTypeTax: TImage;
    lblTypeTax: TLabel;
    pnlResults: TPanel;
    pnlHistory: TPanel;
    lblHistory: TLabel;
    lblResult: TLabel;
    gpClear: TGridPanel;
    pnlPlusMinus: TPanel;
    pnlCE: TPanel;
    pnlC: TPanel;
    pnlBackspace: TPanel;
    procedure DoModifyColorNumberEnter(Sender: TObject);
    procedure DoModifyColorNumberLeave(Sender: TObject);
    procedure DoModifyColorOperatorsLeave(Sender: TObject);
    procedure DoClickCalcArithmetic(Sender: TObject);
    procedure DoClickCalcTax(Sender: TObject);
    procedure DoClickNumber(Sender: TObject);
    procedure imgMenuClick(Sender: TObject);
    procedure pnlTaxAClick(Sender: TObject);
    procedure pnlTaxBClick(Sender: TObject);
    procedure pnlTaxCClick(Sender: TObject);
    procedure pnlCEClick(Sender: TObject);
    procedure pnlCClick(Sender: TObject);
    procedure pnlBackspaceClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure pnlOperatorDivideClick(Sender: TObject);
    procedure pnlOperatorMultiplyClick(Sender: TObject);
    procedure pnlOperatorSubtractClick(Sender: TObject);
    procedure pnlOperatorSumClick(Sender: TObject);
    procedure pnlEqualClick(Sender: TObject);
    procedure pnlCommaClick(Sender: TObject);
    procedure pnlPlusMinusClick(Sender: TObject);
  strict protected
    procedure CloseMenu;
  strict private
    FController: IControllerCalculator;
    FTemporary: Boolean;
  private
    procedure ShowResult(AValue: string);
    function GetController: IControllerCalculator;
    function GetValueDisplay: Currency;
    procedure SetValueDisplay(const AValue: string);
    function DisplayIsEmpty: Boolean;
    procedure DoSetOperator(const AOperator: TOperatorKind);
  end;

var
  ViewMain: TViewMain;

implementation

{$R *.dfm}

uses
  Controller.Calculator;

procedure TViewMain.CloseMenu;
begin
  if svOptions.Opened then
    svOptions.Close;
end;

function TViewMain.DisplayIsEmpty: Boolean;
begin
  Result := SameText(lblResult.Caption, '0') or (Trim(lblResult.Caption).IsEmpty);
end;

procedure TViewMain.DoClickCalcArithmetic(Sender: TObject);
begin
  gpTax.Visible := False;
  lblType.Caption := 'Padrão';
  CloseMenu;
end;

procedure TViewMain.DoClickCalcTax(Sender: TObject);
begin
  gpTax.Visible := True;
  lblType.Caption := 'Imposto';
  CloseMenu;
end;

procedure TViewMain.DoClickNumber(Sender: TObject);
begin
  if Sender is TPanel then
  begin
    SetValueDisplay(TPanel(Sender).Caption);
    FTemporary := False;
  end;
end;

procedure TViewMain.DoModifyColorNumberEnter(Sender: TObject);
begin
  if Sender is TPanel then
    TPanel(Sender).Color := $D1D1D1;
end;

procedure TViewMain.DoModifyColorNumberLeave(Sender: TObject);
begin
  if Sender is TPanel then
    TPanel(Sender).Color := $FAFAFA;
end;

procedure TViewMain.DoModifyColorOperatorsLeave(Sender: TObject);
begin
  if Sender is TPanel then
    TPanel(Sender).Color := $00F0F0F0;
end;

procedure TViewMain.DoSetOperator(const AOperator: TOperatorKind);
begin
  GetController
    .Services
      .Arithmetic
        .AddNumber(GetValueDisplay)
        .SetOperation(AOperator);
  FTemporary := True;
end;

procedure TViewMain.FormCreate(Sender: TObject);
begin
  FTemporary := False;
  GetController
    .Services
      .Arithmetic
        .NotifyHistoric(
          procedure(AValue: string)
          begin
            lblHistory.Caption := AValue;
          end)
        .NotifyResult(ShowResult);
end;

procedure TViewMain.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      pnlCEClick(Sender);
    VK_BACK:
      pnlBackspaceClick(Sender);
  end;
end;

procedure TViewMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '1':
      DoClickNumber(pnlNum1);
    '2':
      DoClickNumber(pnlNum2);
    '3':
      DoClickNumber(pnlNum3);
    '4':
      DoClickNumber(pnlNum4);
    '5':
      DoClickNumber(pnlNum5);
    '6':
      DoClickNumber(pnlNum6);
    '7':
      DoClickNumber(pnlNum7);
    '8':
      DoClickNumber(pnlNum8);
    '9':
      DoClickNumber(pnlNum9);
    '0':
      DoClickNumber(pnlNum0);
    ',', '.':
      pnlCommaClick(Sender);
    '+':
      pnlOperatorSumClick(Sender);
    '-':
      pnlOperatorSubtractClick(Sender);
    '*':
      pnlOperatorMultiplyClick(Sender);
    '/':
      pnlOperatorDivideClick(Sender);
    '=', #13:
      pnlEqualClick(Sender);
  end;
end;

procedure TViewMain.imgMenuClick(Sender: TObject);
begin
  if svOptions.Opened then
    CloseMenu
  else
    svOptions.Open;
end;

procedure TViewMain.pnlBackspaceClick(Sender: TObject);
begin
  lblResult.Caption := Copy(lblResult.Caption, 1, Length(lblResult.Caption) - 1);
  if DisplayIsEmpty then
    SetValueDisplay('');
end;

procedure TViewMain.pnlCClick(Sender: TObject);
begin
  SetValueDisplay(EmptyStr);
end;

procedure TViewMain.pnlCEClick(Sender: TObject);
begin
  SetValueDisplay(EmptyStr);
  GetController
    .Services
      .Arithmetic
        .Clear;
end;

procedure TViewMain.pnlCommaClick(Sender: TObject);
begin
  SetValueDisplay(',');
end;

procedure TViewMain.pnlEqualClick(Sender: TObject);
begin
  GetController
    .Services
      .Arithmetic
        .AddNumber(GetValueDisplay)
        .Execute;
  FTemporary := True;
end;

procedure TViewMain.pnlOperatorDivideClick(Sender: TObject);
begin
  DoSetOperator(TOperatorKind.Division);
end;

procedure TViewMain.pnlOperatorMultiplyClick(Sender: TObject);
begin
  DoSetOperator(TOperatorKind.Multiplication);
end;

procedure TViewMain.pnlOperatorSubtractClick(Sender: TObject);
begin
  DoSetOperator(TOperatorKind.Subtraction);
end;

procedure TViewMain.pnlOperatorSumClick(Sender: TObject);
begin
  DoSetOperator(TOperatorKind.Addition);
end;

procedure TViewMain.pnlPlusMinusClick(Sender: TObject);
begin
  ShowMessage('Não implementado');
end;

procedure TViewMain.pnlTaxAClick(Sender: TObject);
begin
  GetController
    .Services
      .Tax
        .TaxA
          .NotifyResult(ShowResult)
          .Base(GetValueDisplay)
          .Execute;
end;

procedure TViewMain.pnlTaxBClick(Sender: TObject);
begin
  GetController
    .Services
      .Tax
        .TaxB
          .NotifyResult(ShowResult)
          .Base(GetValueDisplay)
          .Execute;
end;

procedure TViewMain.pnlTaxCClick(Sender: TObject);
begin
  GetController
    .Services
      .Tax
        .TaxC
          .NotifyResult(ShowResult)
          .Base(GetValueDisplay)
          .Execute;
end;

procedure TViewMain.SetValueDisplay(const AValue: string);
begin
  if AValue.Trim.IsEmpty then
  begin
    lblResult.Caption := '0';
    Exit;
  end;

  if SameText(AValue, ',') and (Pos(',', lblResult.Caption) > 0) and (not FTemporary) then
    Exit;

  if DisplayIsEmpty or FTemporary then
  begin
    lblResult.Caption := AValue;
    if SameText(AValue, ',') then
      lblResult.Caption := '0,';
  end
  else
    lblResult.Caption := Trim(lblResult.Caption) + AValue.Trim;
end;

procedure TViewMain.ShowResult(AValue: string);
begin
  lblResult.Caption := AValue;
  if Trim(lblResult.Caption).IsEmpty then
    lblResult.Caption := '0';
end;

function TViewMain.GetController: IControllerCalculator;
begin
  if not Assigned(FController) then
    FController := TControllerCalculator.New;
  Result := FController;
end;

function TViewMain.GetValueDisplay: Currency;
begin
  if not TryStrToCurr(Trim(lblResult.Caption), Result) then
    Result := 0;
end;

end.
