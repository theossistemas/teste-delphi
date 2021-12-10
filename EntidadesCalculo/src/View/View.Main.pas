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
  Data.DB,
  Vcl.StdCtrls,
  dxGDIPlusClasses,
  Vcl.ExtCtrls,
  Vcl.WinXCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.WinXPanels,
  Controller.Intf;

type
  TViewMain = class(TForm)
    cpAdd: TCardPanel;
    cView: TCard;
    cEdit: TCard;
    dsEmployee: TDataSource;
    pnlViewTop: TPanel;
    pnlViewGrid: TPanel;
    dbgrdView: TDBGrid;
    sbSearch: TSearchBox;
    imgEmployee: TImage;
    lblCaption: TLabel;
    pnlAdd: TPanel;
    imgAdd: TImage;
    lblAdd: TLabel;
    lblAddSub: TLabel;
    pnlDelete: TPanel;
    imgDelete: TImage;
    lblDelete: TLabel;
    lblDeleteSub: TLabel;
    lblCalculateIR: TLabel;
    pnlEditTop: TPanel;
    pnlEdit: TPanel;
    edtName: TLabeledEdit;
    edtCPF: TLabeledEdit;
    edtSalary: TLabeledEdit;
    pnlSave: TPanel;
    imgSave: TImage;
    lblSave: TLabel;
    lblSaveSub: TLabel;
    pnlCancel: TPanel;
    imgCancel: TImage;
    lblCancel: TLabel;
    lblCancelSub: TLabel;
    lblDependents: TLabel;
    bvlSep: TBevel;
    edtDependentName: TLabeledEdit;
    chkIsCalculateIR: TCheckBox;
    chkIsCalculateINSS: TCheckBox;
    btnAddDependent: TButton;
    mmoCalc: TMemo;
    procedure DoAddEmployee(Sender: TObject);
    procedure DoDeleteEmployee(Sender: TObject);
    procedure DoSaveEmployee(Sender: TObject);
    procedure DoCancel(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddDependentClick(Sender: TObject);
    procedure lblCalculateIRClick(Sender: TObject);
  strict private
    FController: IController;
  private
    function GetController: IController;
    procedure ShowView;
    procedure ShowEdit;
  public
    { Public declarations }
  end;

var
  ViewMain: TViewMain;

implementation

{$R *.dfm}

uses
  Controller;

procedure TViewMain.btnAddDependentClick(Sender: TObject);
begin
  GetController
    .Entities
      .Employee
        .This
          .AddDependent(
            GetController
              .Entities
                .Dependent
                  .This
                    .Name(edtDependentName.Text)
                    .IsCalculateIR(chkIsCalculateIR.Checked)
                    .IsCalculateINSS(chkIsCalculateINSS.Checked)
                  .&End
          )
end;

procedure TViewMain.DoAddEmployee(Sender: TObject);
begin
  ShowEdit;
end;

procedure TViewMain.DoCancel(Sender: TObject);
begin
  ShowView;
end;

procedure TViewMain.DoDeleteEmployee(Sender: TObject);
begin
  if MessageDlg('Deseja realmente remover o funcionário selecionado?', TMsgDlgType.mtWarning, [mbYes, mbNo], 0) = ID_YES then
    GetController.Entities.Employee.Delete('');
end;

procedure TViewMain.DoSaveEmployee(Sender: TObject);
var
  lSalary: Currency;
begin
  lSalary := 0;
  if (not Trim(edtSalary.Text).IsEmpty) and (not TryStrToCurr(edtSalary.Text, lSalary)) then
    raise Exception.Create('Salário informado incorretamente.');

  GetController
    .Entities
      .Employee
        .This
          .Name(edtName.Text)
          .CPF(edtCPF.Text)
          .Salary(lSalary)
        .&End
      .Save;

  ShowView;
end;

procedure TViewMain.FormShow(Sender: TObject);
begin
  GetController.Entities.Employee.DataSet(dsEmployee);

  ShowView;
end;

function TViewMain.GetController: IController;
begin
  if not Assigned(FController) then
    FController := TController.New;
  Result := FController;
end;

procedure TViewMain.lblCalculateIRClick(Sender: TObject);
begin
  mmoCalc.Text := 'IR........ ' + FormatFloat('#,##0.00', GetController.Entities.Employee.This.GetIR);
  mmoCalc.Lines.Add('INSS...... ' + FormatFloat('#,##0.00', GetController.Entities.Employee.This.GetINSS));
end;

procedure TViewMain.ShowEdit;
begin
  cpAdd.ActiveCard := cEdit;
  edtName.Clear;
  edtCPF.Clear;
  edtSalary.Clear;
  edtDependentName.Clear;
  chkIsCalculateIR.Checked := False;
  chkIsCalculateINSS.Checked := False;
end;

procedure TViewMain.ShowView;
begin
  cpAdd.ActiveCard := cView;

  GetController.Entities.Employee.FindAll;
end;

end.
