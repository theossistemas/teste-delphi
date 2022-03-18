unit unMyLibrary;

interface

uses
  System.RTTI, System.Generics.Collections, unFuncionario, Datasnap.DBClient,
  IniFiles, Vcl.Forms;

type
  TMyLibrary = class
  public
    class procedure PreencheDataset(pListaDeEntidades: TObjectList<TObject>;
      pCdsDados: TClientDataset; pClasse: TClass;
      pCamposDaEntidade, pCamposDoCds: array of String);

      //Configuracao de arquivos
    class procedure SetValorIni(pLocal, pSessao, pSubSessao, pValor: string);
    class function GetValorIni(pLocal, pSessao, pSubSessao: string; pValorDefault: String = ''): string;
    class function ExisteArquivoDeConfiguracao: Boolean;

    //Criptografar e Descriptografar
    class function Criptografa(texto:string;chave:integer):String;
    class function DesCriptografa(texto:string;chave:integer):String;

    //Criacao de Formulario
    class procedure CriarFormularioModal(pClassForm: TFormClass);
  end;

implementation

uses
  System.SysUtils;

class procedure TMyLibrary.SetValorIni(pLocal, pSessao, pSubSessao,
  pValor: string);
var
  vArquivo: TIniFile;
begin
  vArquivo := TIniFile.Create(pLocal);
  try
    vArquivo.WriteString(pSessao, pSubSessao, pValor);
  finally
    vArquivo.DisposeOf;
  end;
end;

{ TMyLibrary }

class procedure TMyLibrary.CriarFormularioModal(pClassForm: TFormClass);
var
  vForm: TForm;
begin
  vForm := pClassForm.Create(Application);
  try
    vForm.ShowModal;
  finally
    FreeAndNil(vForm);
  end;
end;

class function TMyLibrary.Criptografa(texto: string; chave: integer): String;
begin
  //Rotina nao implementada, projeto de teste. Mas em um projeto rela seria necessário.
  result:= texto;
end;

class function TMyLibrary.DesCriptografa(texto: string; chave: integer): String;
begin
  //Rotina não implementada, projeto de teste. Mas em um projeto rela seria necessário.
  result:= texto;
end;

class function TMyLibrary.ExisteArquivoDeConfiguracao: Boolean;
var
  vArquivoDeConfiguracao: string;
begin
  try
    vArquivoDeConfiguracao := ExtractFilePath(Application.ExeName) + ChangeFileExt(ExtractFileName(Application.ExeName), '.ini');
    Result := FileExists(vArquivoDeConfiguracao);
  except on E: Exception do
    raise Exception.Create(E.Message);
  end;
end;

class function TMyLibrary.GetValorIni(pLocal, pSessao,
  pSubSessao: string; pValorDefault: String = ''): string;
var
  vArquivo: TIniFile;
begin
  vArquivo := TIniFile.Create(pLocal);
  try
    Result := vArquivo.ReadString(pSessao, pSubSessao, pValorDefault);
  finally
    vArquivo.DisposeOf;
  end;
end;

class procedure TMyLibrary.PreencheDataset(pListaDeEntidades
  : TObjectList<TObject>; pCdsDados: TClientDataset; pClasse: TClass;
  pCamposDaEntidade, pCamposDoCds: array of String);
var
  Contexto: TRttiContext;
  Tipo: TRttiType;
  vFieldAtualAux: Integer;
  vObjeto: TObject;
begin
  // Cria o contexto do RTTI
  Contexto := TRttiContext.Create;

  try
    // Obtém as informações de RTTI da classe TFuncionario
    Tipo := Contexto.GetType(pClasse.ClassInfo);
    pCdsDados.EmptyDataSet;
    for vObjeto in pListaDeEntidades do
    begin
      pCdsDados.Insert;
      for vFieldAtualAux := 0 to Length(pCamposDaEntidade) - 1 do
      begin
        pCdsDados.FieldByName(pCamposDoCds[vFieldAtualAux]).AsVariant :=
          Tipo.GetProperty(pCamposDaEntidade[vFieldAtualAux]).GetValue(vObjeto)
          .AsVariant;
      end;
      pCdsDados.Post;
    end;

  finally
    Contexto.Free;
  end;

end;

end.
