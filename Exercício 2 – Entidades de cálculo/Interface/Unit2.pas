unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxLayoutContainer, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, Vcl.StdCtrls,
  dxLayoutControl,Vcl.Grids, Vcl.DBGrids,conexaobanco,Banco,
  dxLayoutControlAdapters,Funcionario, Vcl.Menus;

type
  Tfrmprincipal = class(TForm)
    dxlybotaoLayoutControl1Group_Root: TdxLayoutGroup;
    dxlytcntrl1: TdxLayoutControl;
    btnInsert: TButton;
    dxlytm3: TdxLayoutItem;
    edtNome: TEdit;
    dxlytm1: TdxLayoutItem;
    dxlybotao1: TdxLayoutGroup;
    edtSalario: TEdit;
    dxlytm2: TdxLayoutItem;
    edtcpf: TEdit;
    dxlytm4: TdxLayoutItem;
    edtIR: TEdit;
    dxlytm5: TdxLayoutItem;
    edtINSS: TEdit;
    dxlytm6: TdxLayoutItem;
    dxlytcrtdgrp1: TdxLayoutAutoCreatedGroup;
    btn1: TButton;
    dxlytm7: TdxLayoutItem;
    dxlytcrtdgrp2: TdxLayoutAutoCreatedGroup;
    procedure btnInsertClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure Limparcampos;
    procedure edtSalarioKeyPress(Sender: TObject; var Key: Char);
    procedure edtcpfKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmprincipal: Tfrmprincipal;

implementation

{$R *.dfm}



procedure Tfrmprincipal.btn1Click(Sender: TObject);
var

Pesquisa : Funcionario.TDependente;
Fumc : Funcionario.TFuncionario;
resultadoINSS: Double;
ResultadoIR : Double;
begin
Pesquisa := TDependente.Create;
Fumc :=TFuncionario.Create;
Fumc.Nomes := edtNome.Text;
Fumc.CPF := edtcpf.Text;
Fumc.Salario := StrToFloat(edtSalario.Text);
resultadoINSS := Fumc.IsCalculaINSS;
edtINSS.Text :=FloatToStr(resultadoINSS);
ResultadoIR := Fumc.IsCalculaIR;
edtIR.Text := FloatToStr(ResultadoIR);
btnInsert.Enabled := True;

end;



procedure Tfrmprincipal.btnInsertClick(Sender: TObject);
var
Inserir : Funcionario.TDependente;
begin
//  edtSalario.Text := StringReplace(edtSalario.Text, ',', '.', []);
//  edtINSS.Text := StringReplace(edtINSS.Text, ',', '.', []);
//  edtIR.Text := StringReplace(edtIR.Text, ',', '.', []);

  Inserir := TDependente.Create;
  Inserir.Nomes := edtNome.Text;
  Inserir.CPF := edtcpf.Text;
  Inserir.Salario := StrToFloat(edtSalario.Text);
  Inserir.INSS := StrToFloat(edtINSS.Text);
  Inserir.IR := StrToFloat(edtIR.Text);
  Inserir.insertbanco;
  Limparcampos;

end;



procedure Tfrmprincipal.edtcpfKeyPress(Sender: TObject; var Key: Char);
begin
if (not (key in ['0'..'9',#8])) and (Key <> #8) then
  Key := #0;
end;

procedure Tfrmprincipal.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if (not (key in ['a'..'z',#32])) and (Key <> #8) then
  Key := #0;
end;

procedure Tfrmprincipal.edtSalarioKeyPress(Sender: TObject; var Key: Char);
begin
if (not (key in ['0'..'9',',',#8])) and (Key <> #8) then
  Key := #0;
end;

procedure Tfrmprincipal.Limparcampos;
begin
edtNome.Text :='';
edtSalario.Text :='';
edtcpf.Text :='';
edtIR.Text:='';
edtINSS.Text :='';
btnInsert.Enabled := False;

end;

end.
