unit unitFuncoes;

interface

// TODOS OS USES NECESSÁRIOS SÃO ESCRITOS AQUI
// ATENÇÃO !!! UTILIZE ESTA ORDEM DO USES POR CAUSA DE UM PROBLEMA COM
//             UMA CONSTANTE USADA COM A MESSAGEDLG
Uses StdCtrls, DBCtrls, Commctrl, Windows, Messages, SysUtils, Classes, Dialogs,
     DBClient, Controls, ComCtrls, Mask, DBGrids, Forms, Graphics, ExtDlgs,Jpeg,
     DB, Grids, IniFiles;
//  Variants, Graphics, Forms,
//  ComCtrls, Grids, DBGrids, ExtCtrls, Menus, Buttons,
//  DB, Mask, Provider, jpeg;
type
  TUsuario = record
    Cd_Usuario:string;
    Cd_Pessoa:string;
    Nm_Pessoa:string;
    Bo_Colaborador:string;
    Tp_Colaborador:string;
    Bo_Cliente:string;
    Bo_Fornecedor:string;
  end;
const
  TTS_BALLOON = $40;
  TTM_SETTITLE = (WM_USER + 32);
var
  Admin_User  : String;
  Admin_Usuario:TUsuario;
  Admin_DiasRestantesLicenca:Double;  

// TODA DECLARAÇÃO DOS PROCEDIMENTOS/FUNÇÕES QUE SERÃO VISÍVEIS PARA OS OUTROS
// FORMULÁRIOS DEVEM SER FEITOS AQUI
//procedure BuscaDescricao(table, Chave, Retorno: String; var LocalRetorno: TEdit; LocalSetFocus: TDBEdit; RLabel: TLabel );
function Proximo(table, field: string): integer;
function ProximoFilho(table, field, chave, codigo: string): integer;
function CriaToolTip(WndParent: HWnd; TipoIcone: Integer; Titulo: PChar): HWND;
function TemCampoRequerido(pCds: TClientDataSet): boolean;
procedure AdicionaToolTip(Window, ToolTip: HWND; Texto: PChar);
function ValidaCPF(numCPF: string): boolean;
function ValidaCNPJ(numCNPJ: string): boolean;
function TestaCpfCnpj(Dado: string; var valido: boolean): String;
procedure CarregaEstados(combo: TComboBox);
procedure Mensagem(s: String; form: TForm; tipo: integer);
function Pergunta(s: String; form : TForm): boolean;
function DataValida(s: String): boolean;
function FloatValido(s: String): boolean;
function IntegerValido(s: String): boolean;
function FormataValor(v: Currency): String;
function ValidaData(s: String): boolean;
procedure StringToTStrings(var StringList: TStringList; Separador: TStringList; Lista: String);
function Explode (Delimiter : Char; Texto : String) : TStringList;
procedure CarregaImagem(dbImage: TDBImage; pCds:TClientDataSet);
procedure MudaParaEdicao(pCds: TClientDataSet);
procedure OrdenaGrid1(pGridPrincipal: TDBGrid; pColumn: TColumn);
function PrimeiraLetraMaiscula(Str: string): string;

procedure GravaIni(st1, st2, st3:string);
function LeIni(st1, st2:string):String;
Function Criptografa(texto:string;chave:integer):String;
Function DesCriptografa(texto:string;chave:integer):String;
procedure FormataCampos(Acds:TClientDataSet; cboCamposPesquisa:TComboBox; AAddFiltro:Boolean = false);

implementation

uses ConnectionDM, StrUtils;

procedure GravaIni(st1, st2, st3: string);
var
  viniFile :TIniFile;
begin
  viniFile := TIniFile.Create(ExtractFilePath(Application.Exename)+'\'+'config.ini');
  viniFile.WriteString(st1, st2, st3);
  viniFile.Free;
end;

function LeIni(st1, st2: string):string;
var
  viniFile :TIniFile;
begin
  viniFile := TIniFile.Create(ExtractFilePath(Application.Exename)+'\'+'config.ini');
  result := viniFile.ReadString(st1, st2, result);
  viniFile.Free;
end;


procedure Mensagem(s: String; form: TForm; tipo: integer);
begin
//   Beep;
   if tipo = 0 then
    MessageBox(form.Handle,PChar(s),'Informação',MB_OK+MB_ICONINFORMATION)
   else if tipo = 1 then
    MessageBox(form.Handle,PChar(s),'Atenção',MB_OK+MB_ICONWARNING)
   else if tipo = 2 then
     MessageBox(form.Handle,PChar(s),'Erro',MB_OK+MB_ICONERROR)
   else if tipo = 3 then
     MessageBox(form.Handle,PChar(s),'Aviso',MB_OK+MB_ICONINFORMATION);
end;

function Pergunta(s: String; form: TForm): boolean;
begin
  beep;
  if MessageBox(form.Handle,PChar(s),'Confirma',MB_YESNO+MB_ICONWARNING)=6then
    Result := True
  else
    Result := False;
end;

function CriaToolTip(WndParent: HWnd; TipoIcone: Integer; Titulo: PChar): HWND;
begin
  // Cria a janela balão
  Result := CreateWindowEx(0, 'Tooltips_Class32', nil, TTS_ALWAYSTIP or
  TTS_BALLOON, Integer(CW_USEDEFAULT), Integer(CW_USEDEFAULT),
  Integer(CW_USEDEFAULT), Integer(CW_USEDEFAULT), WndParent, 0, hInstance,
  nil);
  // Traz a janela para a frente
  if Result <> 0 then
  begin
    SetWindowPos(Result, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE or
    SWP_NOACTIVATE);
    // Configura o título e ícone da dica
    if (TipoIcone > 3) or (TipoIcone < 0) then
    TipoIcone := 0;
    SendMessage(Result, TTM_SETTITLE, TipoIcone, Integer(Titulo));
  end;
end;

//Para atribuir a janela de dica a um componente, usamos a função AdicionaToolTip:
procedure AdicionaToolTip(Window, ToolTip: HWND; Texto: PChar);
var
  Rect: TRect;
  ti: TToolInfo;
begin
  if (Window <> 0) then
  begin
    GetClientRect(Window, Rect);
    // Preenche a estrutura TToolInfo
    FillChar(Ti, Sizeof(TToolInfo), 0);
    ti.cbSize := SizeOf(TToolInfo);
    ti.uFlags := TTF_SUBCLASS;
    ti.hInst := hInstance;
    ti.hwnd := Window;
    ti.Rect := Rect;
    ti.lpszText := Texto;
    // Atribui a dica
    SendMessage(ToolTip, TTM_ADDTOOL, 0, Integer(@ti));
  end;
end;

function Proximo(table, field: string): integer;
begin
  with ConnectionDMF.qrAux do begin
    Close;
    SQL.Clear;
    Params.Clear;
    SQL.Add( ' SELECT MAX('+field+' + 1) codigo FROM '+ table);
    Open;
    Result := FieldByName('codigo').AsInteger;
    if result<= 0 then
      result:= 1;
    Close;
  end;
end;

function ProximoFilho(table, field, chave, codigo: string): integer;
begin
  with ConnectionDMF.qrAux do begin
    Close;
    SQL.Clear;
    Params.Clear;
    SQL.Add( ' SELECT MAX('+field+' + 1) codigo FROM '+ table+' WHERE '+chave+' = '+codigo);
    Open;
    Result := FieldByName('codigo').AsInteger;
    if result<= 0 then
      result:= 1;
    Close;
  end;
end;

//{Valida dígito verificador de CNPJ}
function ValidaCNPJ(numCNPJ: string): boolean;
var
  cnpj: string;
  dg1, dg2: integer;
  x, total: integer;
  ret: boolean;
begin
  numCNPJ:= StringReplace(numCNPJ,'-','',[rfReplaceAll]);
  numCNPJ:= StringReplace(numCNPJ,'/','',[rfReplaceAll]);
  numCNPJ:= StringReplace(numCNPJ,'.','',[rfReplaceAll]);
  ret:=False;
  cnpj:='';
  //Analisa os formatos
  if Length(numCNPJ) = 18 then
    if (Copy(numCNPJ,3,1) + Copy(numCNPJ,7,1) + Copy(numCNPJ,11,1) + Copy(numCNPJ,16,1) = '../-') then
    begin
      cnpj:=Copy(numCNPJ,1,2) + Copy(numCNPJ,4,3) + Copy(numCNPJ,8,3) + Copy(numCNPJ,12,4) + Copy(numCNPJ,17,2);
      ret:=True;
    end;
  if Length(numCNPJ) = 14 then
  begin
    cnpj:=numCNPJ;
    ret:=True;
  end;
  //Verifica
  if ret then
  begin
    try
      //1° digito
      total:=0;
      for x:=1 to 12 do
      begin
        if x < 5 then
            Inc(total, StrToInt(Copy(cnpj, x, 1)) * (6 - x))
        else
            Inc(total, StrToInt(Copy(cnpj, x, 1)) * (14 - x));
      end;
      dg1:=11 - (total mod 11);
      if dg1 > 9 then
          dg1:=0;
      //2° digito
      total:=0;
      for x:=1 to 13 do
      begin
        if x < 6 then
            Inc(total, StrToInt(Copy(cnpj, x, 1)) * (7 - x))
        else
            Inc(total, StrToInt(Copy(cnpj, x, 1)) * (15 - x));
      end;
      dg2:=11 - (total mod 11);
      if dg2 > 9 then
          dg2:=0;
      //Validação final
      if (dg1 = StrToInt(Copy(cnpj, 13, 1))) and (dg2 = StrToInt(Copy(cnpj, 14, 1))) then
          ret:=True
      else
          ret:=False;
    except
        ret:=False;
    end;
  //Inválidos
    case AnsiIndexStr(cnpj,['00000000000000','11111111111111','22222222222222','33333333333333','44444444444444',
                           '55555555555555','66666666666666','77777777777777','88888888888888','99999999999999']) of
        0..9:   ret:=False;
    end;
  end;
  ValidaCNPJ:=ret;
end;

{Valida dígito verificador de CPF}

function ValidaCPF(numCPF: string): boolean;
var
    cpf: string;
    x, total, dg1, dg2: Integer;
    ret: boolean;
begin
  numCPF:= StringReplace(numCPF,'-','',[rfReplaceAll]);
  numCPF:= StringReplace(numCPF,'/','',[rfReplaceAll]);
  numCPF:= StringReplace(numCPF,'.','',[rfReplaceAll]);
  ret:=True;
  for x:=1 to Length(numCPF) do
    if not (numCPF[x] in ['0'..'9', '-', '.', ' ']) then
        ret:=False;
  if ret then
  begin
    cpf:='';
    for x:=1 to Length(numCPF) do
      if numCPF[x] in ['0'..'9'] then
          cpf:=cpf + numCPF[x];
    if Length(cpf) <> 11 then
      ret:=False;
    if ret then
    begin
      ret:= False;
      //1° dígito
      total:=0;
      for x:=1 to 9 do
        total:=total + (StrToInt(cpf[x]) * x);
      dg1:=total mod 11;
      if dg1 = 10 then
        dg1:=0;
      //2° dígito
      total:=0;
      for x:=1 to 8 do
        total:=total + (StrToInt(cpf[x + 1]) * (x));
      total:=total + (dg1 * 9);
      dg2:=total mod 11;
      if dg2 = 10 then
        dg2:=0;

      //Validação final
      if dg1 = StrToInt(cpf[10]) then
        if dg2 = StrToInt(cpf[11]) then
          ret:=True;
      //Inválidos
      case AnsiIndexStr(cpf,['00000000000','11111111111','22222222222','33333333333','44444444444',
                             '55555555555','66666666666','77777777777','88888888888','99999999999']) of
          0..9:   ret:=False;
      end;
    end
    else
    begin
      //Se não informado deixa passar
      if cpf = '' then
        ret:=True;
    end;
  end;
  ValidaCPF:=ret;
end;

//Validação de  CPF/Cnpj conforme as normas da Receita Federal
// Testa um string, verificando se é um CPF ou Cnpj válido.
// Se for um ou outro, formata adequadamente. Se não, devolve sem formatar
// para chamar a rotina:   Campo := Form.TestaCpfCnpj(Campo)
function TestaCpfCnpj(Dado: string; var valido: boolean): String;
var
  i: integer;
begin
  valido:= true;
  for i:= 1 to length(Dado) do begin
    if not (Dado[i] in ['0'..'9']) then delete(Dado,i,1);
  end;
  if ((length(Dado) <> 11) and (length(Dado) <> 14))then
  begin
     MessageDlg('ATENÇÃO: O número informado NÃO representa' + #13 +
                'um CPF ou CNPJ válido pelas regras da Receita Federal',mtWarning,[mbOK],0);
     valido:= False;

  end;
  if length(Dado) = 14 then begin
     if ValidaCnpj(Dado) then begin
        //'00.000.000/0000-00'
        insert('-',Dado,13);
        insert('/',Dado,9);
        insert('.',Dado,6);
        insert('.',Dado,3);
     end
     else
     begin
       MessageDlg('O número informado NÃO representa um CNPJ' + #13 +
                     'válido pelas regras da Receita Federal', mtWarning, [mbOK], 0);
       valido:= false;
     end;
  end;
  if length(Dado) = 11 then begin
     if ValidaCPF(Dado) then begin
        //'00.000-000'
        insert('-',Dado,10);
        insert('.',Dado,7);
        insert('.',Dado,4);
     end
     else
     begin
       MessageDlg('O número informado NÃO representa um CPF' + #13 +
                       'válido pelas regras da Receita Federal', mtWarning, [mbOK], 0);
       valido:= false;
     end;
  end;
  Result := Dado;
end;

procedure CarregaEstados(combo: TComboBox);
var
  i: integer;
  aEstado:Array[0..27] of String;
begin
  aEstado[0] :='                        ';
  aEstado[1] :='AC - Acre               ';
  aEstado[2] :='AL - Alagoas            ';
  aEstado[3] :='AP - Amapá              ';
  aEstado[4] :='AM - Amazonas           ';
  aEstado[5] :='BA - Bahia              ';
  aEstado[6] :='CE - Ceará              ';
  aEstado[7] :='DF - Distrito Federal   ';
  aEstado[8] :='ES - Espírito Santo     ';
  aEstado[9] :='GO - Goiás              ';
  aEstado[10]:='MA - Maranhão           ';
  aEstado[11]:='MT - Mato Grosso        ';
  aEstado[12]:='MS - Mato Grosso do Sul ';
  aEstado[13]:='MG - Minas Gerais       ';
  aEstado[14]:='PR - Paraná             ';
  aEstado[15]:='PB - Paraíba            ';
  aEstado[16]:='PA - Pará               ';
  aEstado[17]:='PE - Pernambuco         ';
  aEstado[18]:='PI - Piauí              ';
  aEstado[19]:='RJ - Rio de Janeiro     ';
  aEstado[20]:='RN - Rio Grande do Norte';
  aEstado[21]:='RS - Rio Grande do Sul  ';
  aEstado[22]:='RO - Rondônia           ';
  aEstado[23]:='RR - Roraima            ';
  aEstado[24]:='SC - Santa Catarina     ';
  aEstado[25]:='SE - Sergipe            ';
  aEstado[26]:='SP - São Paulo          ';
  aEstado[27]:='TO - Tocantins          ';
  for i:=0 to Length(aEstado)-1 do
  begin
    combo.Items.Add(aEstado[i]);
  end;
end;
function TemCampoRequerido(pCds: TClientDataSet): boolean;
var
  i: integer;
  vCamposObrigatorios: String;
begin
//  for i:= 0 to pcds.FieldCount -1 do
//  begin
//    if (pcds.FieldList.Fields[i].Required) and (pcds.FieldList.Fields[i].IsNull) then
//      vCamposObrigatorios:= vCamposObrigatorios+#13+'['+pcds.FieldList.Fields[i].DisplayName+']';
//  end;
//  if vCamposObrigatorios <> '' then
//  begin
//    MessageDlg('Os Campos obrigatórios abaixo devem ser preenchidos. Por favor, verifique.'+#13+vCamposObrigatorios, mtInformation, [mbYes], 0);
//    Result:= true;
//  end else
//    Result:= false;

  for i:= 0 to pcds.FieldCount -1 do
  begin
    if (pcds.FieldList.Fields[i].Required) and (Trim(pcds.FieldList.Fields[i].AsString)='') then
    begin
      ShowMessage('O campo "'+pcds.FieldList.Fields[i].DisplayName+'" deve ser preenchido.');
      pcds.FieldList.Fields[i].FocusControl;
      result:= true;
      Exit;
    end else
      result:= false;
  end;
end;

function DataValida(s: String): boolean;
begin
   Result := True;
   try
      StrToDate(s);
   except
      Result := False;
   end;
end;


function FloatValido(s: String): boolean;
begin
   Result := True;
   try
      StrToFloat(s);
   except
      Result := False;
   end;
end;


function IntegerValido(s: String): boolean;
begin
   Result := True;
   try
      StrToInt(s);
   except
      Result := False;
   end;
end;


function FormataValor(v: Currency): String;
begin
   Result := FormatFloat('##0.00', v);
end;


function ValidaData(s: String): boolean;
begin
   try
      StrToDate(s);
      Result := True;
   except
      Result := False;
   end;
end;


//function ValidaCPF(num: String):boolean;
//var
//  n1,n2,n3,n4,n5,n6,n7,n8,n9: integer;
//  d1,d2: integer;
//  digitado, calculado: string;
//begin
//  n1:=StrToInt(num[1]);
//  n2:=StrToInt(num[2]);
//  n3:=StrToInt(num[3]);
//  n4:=StrToInt(num[4]);
//  n5:=StrToInt(num[5]);
//  n6:=StrToInt(num[6]);
//  n7:=StrToInt(num[7]);
//  n8:=StrToInt(num[8]);
//  n9:=StrToInt(num[9]);
//  d1:=n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
//  d1:=11-(d1 mod 11);
//  if d1>=10 then d1:=0;
//  d2:=d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
//  d2:=11-(d2 mod 11);
//  if d2>=10 then d2:=0;
//  calculado:=inttostr(d1)+inttostr(d2);
//  digitado:=num[10]+num[11];
//  if calculado=digitado then
//    cpf:=true
//  else
//    cpf:=false;
//end;
{procedure BuscaDescricao(table, Chave, Codigo, Retorno: String;
  var LocalRetorno: TEdit; LocalSetFocus: TDBEdit; RLabel: TLabel);
begin
  ConnectionDMF.qrAux.Close;
  ConnectionDMF.qrAux.SQL.Clear;
  ConnectionDMF.qrAux.Params.Clear;
  ConnectionDMF.qrAux.SQL.Add(
    'select '+Retorno+' from '+table+' where '+Chave+' = '+Codigo
  );
  ConnectionDMF.qrAux.Open;
  if not ConnectionDMF.qrAux.IsEmpty then
    LocalRetorno.Text:= ConnectionDMF.qrAux.FieldByName('c_retno').AsString
  else
  begin
    LocalRetorno.Text:= '';
    //ShowMessage(RLabel.Caption+' não cadastrado. Por favor verifique.');
    LocalSetFocus.SetFocus;
  end;
end;}
procedure StringToTStrings(var StringList: TStringList; Separador: TStringList; Lista: String);
begin
  StringList := TStringList.Create;

  // informa qual caractere delimitador
  StringList.Delimiter := Char(Separador);

  // informar o texto delimitado - não importa a quantidade de espaços
  // que irá separar os campos
  StringList.DelimitedText := Lista;

//  ShowMessage ('Quantidade de campos na string: '+IntToStr(st.count)+#13#13+
//               'st[0] = '+st.Strings[0]+#13+
//               'st[1] = '+st.Strings[1]+#13+
//               'st[2] = '+st.Strings[2]+#13+
//               'st[3] = '+st.Strings[3]+#13+
//               'st[4] = '+st.Strings[4]+#13+
//               'st[5] = '+st.Strings[5]+#13
//  );
  StringList.Free;
end;

function Explode (Delimiter : Char; Texto : String) : TStringList; 
var 
  st : TStringList; 
  i : integer; 
begin 
  st := TStringList.Create; 
  while length(Texto) > 0 do 
  begin 
    // remove presença do delimitador no início do texto 
    while Pos(Delimiter, Texto) = 1 do delete(Texto,1,1); 
    i := Pos(Delimiter,Texto); 
    if i > 0 
    then begin 
      st.add (Copy(Texto,1,i-1)); 
      delete(Texto, 1, i); 
    end 
    else break; 
  end; 
  if length(Texto) > 0 
  then st.add(Texto); 
  result := st;
end;
procedure CarregaImagem(dbImage: TDBImage; pCds:TClientDataSet);
var oJPEG: TJPEGImage;
    oPicture: TPicture;
    oDialogo: TOpenPictureDialog;
    Imagem  : TDBImage;
begin
  if not pCds.Active then
    exit;
  if not Assigned(Imagem) then
   Exit;
  if not(pCds.State in [dsEdit, dsInsert])then
    pCds.Edit;
  oDialogo := TOpenPictureDialog.Create(nil); //instancia um TOpenPictureDialog
  try
    //oDialogo.Options :=[ofOldStyleDialog];//Muda o Estilo da Tela de Busca das Fotos
    oDialogo.Filter := 'Imagens (*.jpg;*.jpeg;*.bmp)|*.jpg;*.jpeg;*.bmp'; //filtra as extensões jpg, jpeg e bmp
    oPicture := TPicture.Create; //instancia um TPicture
    try
      oJPEG := TJPEGImage.Create; //instancia um TJPEGImage
      try
        if oDialogo.Execute then //executa a janela de dialogo do Windows
        begin
          oPicture.LoadFromFile(oDialogo.FileName); //carrega o arquivo escolhido na janela de dialogo no TPicture
          oJPEG.Assign(oPicture.Graphic); //copia a imagem carregada do arquivo para o objeto do tipo TJPEGImage, se for bmp já converte pra Jpeg
          dbImage.Picture.Graphic.Assign(oJPEG);
        end;
      finally
        FreeAndNil(oJPEG);
      end;
    finally
      FreeAndNil(oPicture);
    end;
  finally
    FreeAndNil(oDialogo);
  end;
end;
procedure MudaParaEdicao(pCds: TClientDataSet);
begin
  if not (pcds.State in [dsinsert, dsEdit])then
    pcds.Edit;
end;

procedure OrdenaGrid1(pGridPrincipal: TDBGrid; pColumn: TColumn);
Var
  i:Integer;
  OldCursor: TCursor;
  vTitleFontColor,
  vTitleColor,
  vColor,
  vFontcolor : TColor;
  vTitleFontStyle :TFontStyles;
begin
  //if (pGridPrincipal.DataSource.DataSet as TClientDataSet).IsEmpty then
    //exit;
  OldCursor:= Screen.Cursor;
  Screen.Cursor:= crHourGlass;
  //if (pGridPrincipal.DataSource.DataSet as TClientDataSet).IndexName = '' then
  //begin
    //PEGA AS PROPRIEDADES ORIGINAIS DO GRID
    vTitleFontColor  := clBlack;{pColumn.Title.Font.Color;}
    vColor           := clWindow;{pColumn.Color;}
    vFontcolor       := clBlack;{pColumn.Font.Color;}
    vTitleFontStyle  := [];{pColumn.Title.Font.Style;}
  //end;
  Try
    for i:=0 to pColumn.Grid.FieldCount - 1 do
    begin
      with pGridPrincipal do
      begin
        with Columns.Items[i] do
        begin
          //Volta propriedades das outras colunas
          Title.Caption    := StringReplace(Title.Caption,' <','',[rfReplaceAll]);
          Title.Caption    := StringReplace(Title.Caption,' >','',[rfReplaceAll]);
          Title.Font.Color := vTitleFontColor;
          Title.Font.Style := vTitleFontStyle;
          Color            := vColor;
          Font.color       := vFontcolor;
        end;
      end;
    end;
    with (pGridPrincipal.DataSource.DataSet as TClientDataSet) do
    begin
      if IndexFieldNames = pColumn.FieldName then
        IndexFieldNames:= ''
      else
      begin
        IndexFieldNames:= pColumn.FieldName;
        //pColumn.Color                                     := $00F0F0F0;//Cor do Fundo da Coluna (Branco Gelo Claro)
        pColumn.Title.Font.Style                          := [fsBold];//Negrito
      end;
    end;
    //propriedades da coluna selecinada
  Except
    Screen.Cursor:= OldCursor;
    //ShowMessage('Não foi possível ordenar os valores');
  End;
  Screen.Cursor:= OldCursor;
end;

function PrimeiraLetraMaiscula(Str: string): string;
var
  i: integer;
  esp: boolean;
begin
  str := LowerCase(Trim(str));
  for i := 1 to Length(str) do
  begin
    if i = 1 then
      str[i] := UpCase(str[i])
    else
      begin
        if i <> Length(str) then
        begin
          esp := (str[i] = ' ');
          if esp then
            str[i+1] := UpCase(str[i+1]);
        end;
      end;
  end;
  Result := Str;
end;

//funcao que retorno o código ASCII dos caracteres
function AsciiToInt(Caracter: Char): Integer;
var
  i: Integer;
begin
  i := 32;
  while i < 255 do begin
    if Chr(i) = Caracter then
      Break;
    i := i + 1;
  end;
  Result := i;
end;

Function Criptografa(texto:string;chave:integer):String;
var
  cont:integer;
  retorno:string;
begin
  if (trim(texto)=EmptyStr) or (chave=0) then begin
    result:=texto;
  end else begin
    retorno:='';
    for cont:=1 to length(texto) do begin
      retorno:=retorno+chr(asciitoint(texto[cont])+chave);
    end;
    result:=retorno;
  end;
end;


{Esta funcao é semelhante a funcao de Criptografia mais com o objetivo de descriptografar a string }

Function DesCriptografa(texto:string;chave:integer):String;
var
  cont:integer;
  retorno:string;
begin
  if (trim(texto)=EmptyStr) or (chave=0) then begin
    result:=texto;
  end else begin
    retorno:='';
    for cont:=1 to length(texto) do begin
      retorno:=retorno+chr(asciitoint(texto[cont])-chave);
    end;
    result:=retorno;
  end;
end;

procedure FormataCampos(Acds:TClientDataSet; cboCamposPesquisa:TComboBox; AAddFiltro:Boolean = false);
var
  i: Integer;
  vDisplayLabel:String;
begin
  for i:= 0 to Acds.FieldCount -1 do
  begin
//CODIGO QUE PODE SER USANDO NO EVENTO ONSETTEXT DO FIELD
//  if (Length(Text) > 5 )then
//    (sender as TField).AsString := copy(Text,1,2)+'/'+copy(Text,3,2)+'/'+copy(Text,5,length(Text))
//  else
//    (sender as TField).AsString:= Text;
    vDisplayLabel := Acds.FieldList.Fields[i].DisplayLabel;
    vDisplayLabel := StringReplace(vDisplayLabel, 'CD_', 'Cód. ',[rfReplaceAll]);
    vDisplayLabel := StringReplace(vDisplayLabel, 'NR_', 'Nr. ',[rfReplaceAll]);
    vDisplayLabel := StringReplace(vDisplayLabel, 'VL_', 'Vl. ',[rfReplaceAll]);
    vDisplayLabel := StringReplace(vDisplayLabel, 'QT_', 'Qt. ',[rfReplaceAll]);
    vDisplayLabel := StringReplace(vDisplayLabel, 'PC_', '% ',[rfReplaceAll]);
    vDisplayLabel := StringReplace(vDisplayLabel, 'DT_', 'Dt. ',[rfReplaceAll]);
    vDisplayLabel := StringReplace(vDisplayLabel, 'DH_', 'Dh. ',[rfReplaceAll]);
    vDisplayLabel := StringReplace(vDisplayLabel, 'OBS_', 'Obs. ',[rfReplaceAll]);
    vDisplayLabel := StringReplace(vDisplayLabel, 'DS_', 'Desc. ',[rfReplaceAll]);
    vDisplayLabel := StringReplace(vDisplayLabel, 'NM_RZ_', 'Nome ',[rfReplaceAll]);
    vDisplayLabel := StringReplace(vDisplayLabel, 'NM_', 'Nome ',[rfReplaceAll]);
    vDisplayLabel := StringReplace(vDisplayLabel, 'TP_', 'Tp. ',[rfReplaceAll]);
    vDisplayLabel := StringReplace(vDisplayLabel, 'BO_', '',[rfReplaceAll]);
    vDisplayLabel := StringReplace(vDisplayLabel, '_', ' ',[rfReplaceAll]);

    vDisplayLabel := PrimeiraLetraMaiscula(vDisplayLabel);

    Acds.FieldList.Fields[i].DisplayLabel := vDisplayLabel;

    if (Acds.FieldList.Fields[i].ClassType <> TDataSetField)and(Acds.FieldList.Fields[i].Visible) then
    begin

      if (Pos('VL_',UpperCase(Acds.FieldList.Fields[i].FieldName))>0)or
         (Pos('PC_',UpperCase(Acds.FieldList.Fields[i].FieldName))>0)or
         (Pos('QT_',UpperCase(Acds.FieldList.Fields[i].FieldName))>0)
      then
      begin
        if Acds.FieldList.Fields[i] is TFloatField then
        begin
          TFloatField(Acds.FieldList.Fields[i]).DisplayFormat := '###,###,##0.00';
          TFloatField(Acds.FieldList.Fields[i]).EditFormat := '########0.00';
        end;
      end
      else
//      if (Pos('CPF',UpperCase(Acds.FieldList.Fields[i].FieldName))>0)then
//        Acds.FieldList.Fields[i].EditMask:= '.000\.000\.000\-00;0;'
//      else
//      if (Pos('CNPJ',UpperCase(Acds.FieldList.Fields[i].FieldName))>0)then
//        Acds.FieldList.Fields[i].EditMask:= '.00\.000\.000\/0000\-00;0;'
//      else
//      if (Pos('FONE_FIXO',UpperCase(Acds.FieldList.Fields[i].FieldName))>0)then
//        Acds.FieldList.Fields[i].EditMask:= '\(00\)0000\-0000;0;'
//      else
//      if (Pos('FONE_CELULAR',UpperCase(Acds.FieldList.Fields[i].FieldName))>0)then
//        Acds.FieldList.Fields[i].EditMask:= '\(00\)00000\-0000;0;'
//      else      
      if (Pos('DH_',UpperCase(Acds.FieldList.Fields[i].FieldName))>0)then
        Acds.FieldList.Fields[i].EditMask:= '90/90/0000;1;_'//'90/90/0000 !90:00:00;1;_'//'90/90/0000 00:00:00;0;_'
        //TDateField(Acds.FieldList.Fields[i]).DisplayFormat:= 'DD/MM/YYYY'
      else
      if (Pos('DT_',UpperCase(Acds.FieldList.Fields[i].FieldName))>0)then
        Acds.FieldList.Fields[i].EditMask:= '90/90/0000;1;_';
  //      TDateField(Acds.FieldList.Fields[i]).DisplayFormat:= 'DD/MM/YYYY';
      if (Acds.FieldList.Fields[i].Tag <> 1) and AAddFiltro then
        cboCamposPesquisa.AddItem(Acds.FieldList.Fields[i].DisplayName, nil);

    end;
  end;

end;


end.
