unit MenuPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TMenuPrincipalF = class(TForm)
    btnEx1Calculadora: TButton;
    btnEx2EntidadesCalc: TButton;
    procedure btnEx1CalculadoraClick(Sender: TObject);
    procedure btnEx2EntidadesCalcClick(Sender: TObject);
    procedure btnEx1CalculadoraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnEx2EntidadesCalcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure fecharForm(form :TForm; var key :Word);
    { Public declarations }
  end;

var
  MenuPrincipalF: TMenuPrincipalF;

implementation

uses
  Ex1Calculadora, Ex2EntidadesCalc, unitFuncoes;

{$R *.dfm}

procedure TMenuPrincipalF.fecharForm(form: TForm; var key: Word);
begin
  if key = VK_ESCAPE then
  begin
    form.Close;
  end;
end;

procedure TMenuPrincipalF.btnEx1CalculadoraClick(Sender: TObject);
begin
  Ex1CalculadoraF.ShowModal;        
end;

procedure TMenuPrincipalF.btnEx2EntidadesCalcClick(Sender: TObject);
begin
  Ex2EntidadesCalcF.ShowModal;
end;

procedure TMenuPrincipalF.btnEx1CalculadoraKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  fecharForm(self, Key);
end;

procedure TMenuPrincipalF.btnEx2EntidadesCalcKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  fecharForm(self, Key);
end;

procedure TMenuPrincipalF.FormShow(Sender: TObject);
begin
  if LeIni('Banco','TipoConexao') = '' then
    GravaIni('Banco','TipoConexao',  '1');

  if LeIni('Banco','DatabaseLocal') = '' then
    GravaIni('Banco','DatabaseLocal',  '');

  if LeIni('Banco','DatabaseRemoto') = '' then
    GravaIni('Banco','DatabaseRemoto',  '');

  if LeIni('Backup','Destino') = '' then
    GravaIni('Backup','Destino',  '');

  if LeIni('Banco', 'User') = '' then
    GravaIni('Banco', 'User', 'SYSDBA');


  if LeIni('Banco', 'Password')= '' then
    GravaIni('Banco', 'Password', Criptografa('wlworksys', 1));

end;

end.
