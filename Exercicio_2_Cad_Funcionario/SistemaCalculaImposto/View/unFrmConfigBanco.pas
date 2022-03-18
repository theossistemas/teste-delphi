unit unFrmConfigBanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unFormBasePadrao, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, unDmGeral;

type
  TfrmConfigBanco = class(TfrmFormBasePadrao)
    edtLocal: TEdit;
    opnPasta: TOpenDialog;
    Button1: TButton;
    Label1: TLabel;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    edtUsuario: TEdit;
    Label3: TLabel;
    edtSenha: TEdit;
    Label4: TLabel;
    edtServer: TEdit;
    Label5: TLabel;
    edtPort: TEdit;
    edtDriver: TEdit;
    Label6: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfigBanco: TfrmConfigBanco;

implementation

uses
  unMyLibrary;

const
  CHAVE_SEGURANCA = 123456;

{$R *.dfm}

procedure TfrmConfigBanco.Button1Click(Sender: TObject);
var
  vArquivoDeConfiguracao: string;
begin
  vArquivoDeConfiguracao := ExtractFilePath(Application.ExeName) +
    ChangeFileExt(ExtractFileName(Application.ExeName), '.ini');
  TMyLibrary.SetValorIni(vArquivoDeConfiguracao, 'CONFIGURACAO', 'LOCAL_DB',
    edtLocal.Text);
  TMyLibrary.SetValorIni(vArquivoDeConfiguracao, 'CONFIGURACAO', 'USER_NAME',
    edtUsuario.Text);
  TMyLibrary.SetValorIni(vArquivoDeConfiguracao, 'CONFIGURACAO', 'PASSWORD',
    TMyLibrary.Criptografa(edtSenha.Text, CHAVE_SEGURANCA));

  TMyLibrary.SetValorIni(vArquivoDeConfiguracao, 'CONFIGURACAO', 'SERVER',
    edtServer.Text);
  TMyLibrary.SetValorIni(vArquivoDeConfiguracao, 'CONFIGURACAO', 'PORT',
    edtPort.Text);
  TMyLibrary.SetValorIni(vArquivoDeConfiguracao, 'CONFIGURACAO', 'DRIVER_ID',
    edtDriver.Text);

  ShowMessage('Configurações Feita com Sucesso!');
  Self.Close;
end;

procedure TfrmConfigBanco.FormShow(Sender: TObject);
var
  vArquivoDeConfiguracao, vSenha: string;
begin
  vArquivoDeConfiguracao := ExtractFilePath(Application.ExeName) +
    ChangeFileExt(ExtractFileName(Application.ExeName), '.ini');

  edtLocal.Text := TMyLibrary.GetValorIni(vArquivoDeConfiguracao,
    'CONFIGURACAO', 'LOCAL_DB', ExtractFilePath(Application.ExeName) + 'Base\BANCO.FDB');
  edtUsuario.Text := TMyLibrary.GetValorIni(vArquivoDeConfiguracao,
    'CONFIGURACAO', 'USER_NAME', 'sysdba');

  vSenha := TMyLibrary.GetValorIni(vArquivoDeConfiguracao, 'CONFIGURACAO', 'PASSWORD', '');
  if vSenha <> EmptyStr then
    vSenha := TMyLibrary.DesCriptografa(vSenha, CHAVE_SEGURANCA )
  else
    vSenha := 'masterkey';
  edtSenha.Text := vSenha;

  edtServer.Text := TMyLibrary.GetValorIni(vArquivoDeConfiguracao,
    'CONFIGURACAO', 'SERVER', 'localhost');
  edtPort.Text := TMyLibrary.GetValorIni(vArquivoDeConfiguracao, 'CONFIGURACAO',
    'PORT', '3050');

  edtDriver.Text := TMyLibrary.GetValorIni(vArquivoDeConfiguracao,
    'CONFIGURACAO', 'DRIVER_ID', 'FB');

end;

procedure TfrmConfigBanco.SpeedButton1Click(Sender: TObject);
begin
  if opnPasta.Execute then
  begin
    edtLocal.Text := opnPasta.FileName;
  end;
end;

end.
