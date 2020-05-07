object FrmCadastro: TFrmCadastro
  Left = 0
  Top = 0
  ActiveControl = edCPF
  Caption = 'Cadastro'
  ClientHeight = 422
  ClientWidth = 533
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 533
    Height = 358
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 378
    object Label1: TLabel
      Left = 16
      Top = 50
      Width = 40
      Height = 16
      Caption = 'Salario'
    end
    object Label2: TLabel
      Left = 16
      Top = 10
      Width = 22
      Height = 16
      Caption = 'CPF'
    end
    object Label3: TLabel
      Left = 143
      Top = 10
      Width = 33
      Height = 16
      Caption = 'Nome'
    end
    object Label5: TLabel
      Left = 16
      Top = 304
      Width = 46
      Height = 16
      Caption = 'Valor IR'
    end
    object Label6: TLabel
      Left = 143
      Top = 304
      Width = 62
      Height = 16
      Caption = 'Valor INSS'
    end
    object edSalario: TEdit
      Left = 16
      Top = 66
      Width = 121
      Height = 24
      Alignment = taRightJustify
      MaxLength = 15
      TabOrder = 2
      Text = '1000'
      OnKeyPress = somenteNumero
    end
    object edCPF: TMaskEdit
      Left = 17
      Top = 26
      Width = 120
      Height = 24
      EditMask = '999.999.999-99;0;_'
      MaxLength = 14
      TabOrder = 0
      Text = '04943389970'
      OnExit = edCPFExit
    end
    object edNome: TEdit
      Left = 143
      Top = 26
      Width = 372
      Height = 24
      MaxLength = 100
      TabOrder = 1
      Text = 'ricardo'
    end
    object gpDependente: TGroupBox
      Left = 1
      Top = 96
      Width = 531
      Height = 208
      Caption = 'Dependente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object Label4: TLabel
        Left = 15
        Top = 18
        Width = 33
        Height = 16
        Caption = 'Nome'
      end
      object edNomeDep: TEdit
        Left = 15
        Top = 35
        Width = 499
        Height = 24
        MaxLength = 100
        TabOrder = 0
        Text = 'miguel'
      end
      object cbCalculaIR: TCheckBox
        Left = 16
        Top = 65
        Width = 97
        Height = 17
        Caption = 'Calcular IR '
        TabOrder = 1
      end
      object cbCalculaINSS: TCheckBox
        Left = 128
        Top = 65
        Width = 97
        Height = 17
        Caption = 'Calcular INSS'
        TabOrder = 2
      end
      object btnSalvarDependente: TButton
        Left = 392
        Top = 65
        Width = 122
        Height = 25
        Caption = 'Salvar Dependente'
        TabOrder = 3
        OnClick = btnSalvarDependenteClick
      end
      object DBGrid1: TDBGrid
        Left = 2
        Top = 96
        Width = 527
        Height = 110
        Align = alBottom
        DataSource = dsDependente
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        PopupMenu = PopupMenu1
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calculaIR'
            Title.Caption = 'Calcula IR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calculaINSS'
            Title.Caption = 'Calcula INSS'
            Visible = True
          end>
      end
    end
    object edIR: TEdit
      Left = 16
      Top = 320
      Width = 121
      Height = 24
      Alignment = taRightJustify
      Enabled = False
      MaxLength = 15
      TabOrder = 4
      Text = '0'
      OnKeyPress = somenteNumero
    end
    object edINSS: TEdit
      Left = 143
      Top = 320
      Width = 121
      Height = 24
      Alignment = taRightJustify
      Enabled = False
      MaxLength = 15
      TabOrder = 5
      Text = '0'
      OnKeyPress = somenteNumero
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 358
    Width = 533
    Height = 64
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 379
    object btnSalvar: TButton
      Left = 440
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btnSalvarClick
    end
  end
  object cdDependente: TClientDataSet
    PersistDataPacket.Data = {
      7C0000009619E0BD0100000018000000050000000000030000007C0002496402
      00010000000000044E6F6D650100490000000100055749445448020002006400
      0963616C63756C61495202000100000000000B63616C63756C61494E53530200
      010000000000036370660100490000000100055749445448020002000B000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftSmallint
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'calculaIR'
        DataType = ftSmallint
      end
      item
        Name = 'calculaINSS'
        DataType = ftSmallint
      end
      item
        Name = 'cpf'
        DataType = ftString
        Size = 11
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end
      item
        Name = 'ID'
        Fields = 'ID'
      end>
    IndexFieldNames = 'ID'
    Params = <>
    StoreDefs = True
    AfterPost = cdDependenteAfterPost
    Left = 400
    Top = 72
    object cdDependenteId: TSmallintField
      DisplayWidth = 7
      FieldName = 'Id'
    end
    object cdDependenteNome: TStringField
      DisplayWidth = 100
      FieldName = 'Nome'
      Size = 100
    end
    object cdDependentecalculaIR: TSmallintField
      DisplayWidth = 10
      FieldName = 'calculaIR'
      OnGetText = cdDependentecalculaIRGetText
    end
    object cdDependentecalculaINSS: TSmallintField
      DisplayWidth = 10
      FieldName = 'calculaINSS'
      OnGetText = cdDependentecalculaINSSGetText
    end
    object cdDependentecpf: TStringField
      DisplayWidth = 11
      FieldName = 'cpf'
      Size = 11
    end
  end
  object dsDependente: TDataSource
    DataSet = cdDependente
    OnDataChange = dsDependenteDataChange
    Left = 448
    Top = 72
  end
  object PopupMenu1: TPopupMenu
    Left = 264
    Top = 216
    object ExcluirDependente: TMenuItem
      Caption = 'Excluir Dependente'
      Enabled = False
      OnClick = ExcluirDependenteClick
    end
  end
end
