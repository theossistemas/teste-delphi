object Ex2EntidadesCalcF: TEx2EntidadesCalcF
  Left = 210
  Top = 178
  Width = 917
  Height = 480
  Caption = 'Exerc'#237'cio 2 - Entidades de c'#225'lculo - FUNCIONARIO'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 184
    Width = 80
    Height = 13
    Caption = 'Cod. Funcion'#225'rio'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 24
    Top = 224
    Width = 28
    Height = 13
    Caption = 'Nome'
    FocusControl = dbedtNOME
  end
  object Label3: TLabel
    Left = 24
    Top = 264
    Width = 20
    Height = 13
    Caption = 'CPF'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 168
    Top = 264
    Width = 47
    Height = 13
    Caption = 'Vl. Sal'#225'rio'
    FocusControl = DBEdit4
  end
  object Label7: TLabel
    Left = 24
    Top = 307
    Width = 70
    Height = 13
    Caption = 'Vl IR Dedu'#231#227'o'
  end
  object Label8: TLabel
    Left = 168
    Top = 307
    Width = 87
    Height = 13
    Caption = 'Vl. INSS Dedu'#231#227'o'
  end
  object btnCancelar: TBitBtn
    Left = 728
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 0
    OnClick = btnCancelarClick
  end
  object btnSalvar: TBitBtn
    Left = 816
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 1
    OnClick = btnSalvarClick
  end
  object btnNovo: TButton
    Left = 16
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 2
    OnClick = btnNovoClick
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 8
    Width = 873
    Height = 120
    DataSource = dsFuncionario
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBEdit1: TDBEdit
    Left = 24
    Top = 200
    Width = 81
    Height = 21
    Color = clBtnFace
    DataField = 'ID_FUNCIONARIO'
    DataSource = dsFuncionario
    ReadOnly = True
    TabOrder = 4
  end
  object dbedtNOME: TDBEdit
    Left = 24
    Top = 240
    Width = 278
    Height = 21
    DataField = 'NOME'
    DataSource = dsFuncionario
    TabOrder = 5
  end
  object DBEdit3: TDBEdit
    Left = 24
    Top = 280
    Width = 134
    Height = 21
    DataField = 'CPF'
    DataSource = dsFuncionario
    TabOrder = 6
  end
  object DBEdit4: TDBEdit
    Left = 168
    Top = 280
    Width = 134
    Height = 21
    DataField = 'VL_SALARIO'
    DataSource = dsFuncionario
    TabOrder = 7
  end
  object btnRemover: TButton
    Left = 96
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Remover'
    TabOrder = 8
    OnClick = btnRemoverClick
  end
  object grpDependentes: TGroupBox
    Left = 312
    Top = 120
    Width = 577
    Height = 265
    Caption = 'Dependentes'
    TabOrder = 9
    object Label5: TLabel
      Left = 24
      Top = 176
      Width = 84
      Height = 13
      Caption = 'Cod. Dependente'
      FocusControl = DBEdit2
    end
    object Label6: TLabel
      Left = 24
      Top = 216
      Width = 105
      Height = 13
      Caption = 'Nome do Dependente'
      FocusControl = dbedtNOME_DEPENDENTE
    end
    object DBGrid2: TDBGrid
      Left = 8
      Top = 16
      Width = 561
      Height = 120
      DataSource = dsDependente
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object btnNovoDependente: TButton
      Left = 16
      Top = 136
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 1
      OnClick = btnNovoDependenteClick
    end
    object btnRemoverDependente: TButton
      Left = 96
      Top = 136
      Width = 75
      Height = 25
      Caption = 'Remover'
      TabOrder = 2
      OnClick = btnRemoverDependenteClick
    end
    object DBEdit2: TDBEdit
      Left = 24
      Top = 192
      Width = 134
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'ID_DEPENDENTE'
      DataSource = dsDependente
      ReadOnly = True
      TabOrder = 3
    end
    object dbedtNOME_DEPENDENTE: TDBEdit
      Left = 24
      Top = 232
      Width = 400
      Height = 21
      DataField = 'NOME'
      DataSource = dsDependente
      TabOrder = 4
    end
    object dbchkCALCULA_IR: TDBCheckBox
      Left = 176
      Top = 192
      Width = 97
      Height = 17
      Caption = 'Calcula IR'
      DataField = 'BO_CALCULA_IR'
      DataSource = dsDependente
      TabOrder = 5
      ValueChecked = 'SIM'
      ValueUnchecked = 'NAO'
    end
    object dbchkCALCULA_INSS: TDBCheckBox
      Left = 264
      Top = 192
      Width = 97
      Height = 17
      Caption = 'Calcula INSS'
      DataField = 'BO_CALCULA_INSS'
      DataSource = dsDependente
      TabOrder = 6
      ValueChecked = 'SIM'
      ValueUnchecked = 'NAO'
    end
  end
  object medtVlIR: TMaskEdit
    Left = 24
    Top = 322
    Width = 115
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 10
  end
  object medtVlINSS: TMaskEdit
    Left = 168
    Top = 321
    Width = 115
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 11
  end
  object cdsAux: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAux2'
    RemoteServer = ConnectionDMF.Localconnection
    Left = 584
    Top = 58
  end
  object dsPrincipal: TDataSource
    Left = 614
    Top = 58
  end
  object cdsFuncionario: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspFuncionario'
    RemoteServer = ConnectionDMF.Localconnection
    AfterScroll = cdsFuncionarioAfterScroll
    Left = 756
    Top = 24
    object cdsFuncionarioID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
      Required = True
    end
    object cdsFuncionarioNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsFuncionarioCPF: TStringField
      FieldName = 'CPF'
      Size = 15
    end
    object cdsFuncionarioVL_SALARIO: TFloatField
      FieldName = 'VL_SALARIO'
    end
    object cdsFuncionarioqrDependente: TDataSetField
      FieldName = 'qrDependente'
    end
  end
  object dsFuncionario: TDataSource
    DataSet = cdsFuncionario
    Left = 787
    Top = 24
  end
  object cdsDependente: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsFuncionarioqrDependente
    Params = <>
    AfterInsert = cdsDependenteAfterInsert
    Left = 736
    Top = 96
    object cdsDependenteID_DEPENDENTE: TIntegerField
      FieldName = 'ID_DEPENDENTE'
      Required = True
    end
    object cdsDependenteNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsDependenteBO_CALCULA_IR: TStringField
      FieldName = 'BO_CALCULA_IR'
      FixedChar = True
      Size = 3
    end
    object cdsDependenteBO_CALCULA_INSS: TStringField
      FieldName = 'BO_CALCULA_INSS'
      FixedChar = True
      Size = 3
    end
    object cdsDependenteID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
      Required = True
    end
  end
  object dsDependente: TDataSource
    DataSet = cdsDependente
    Left = 808
    Top = 88
  end
end
