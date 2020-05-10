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
    Left = 24
    Top = 304
    Width = 47
    Height = 13
    Caption = 'Vl. Sal'#225'rio'
    FocusControl = DBEdit4
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
    Width = 134
    Height = 21
    Color = clScrollBar
    DataField = 'ID_FUNCIONARIO'
    DataSource = dsFuncionario
    ReadOnly = True
    TabOrder = 4
  end
  object dbedtNOME: TDBEdit
    Left = 24
    Top = 240
    Width = 500
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
    Left = 24
    Top = 320
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
  object qrFuncionario: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM FUNCIONARIO')
    SQLConnection = ConnectionDMF.SQLConn
    Left = 680
    Top = 24
    object qrFuncionarioID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
      Required = True
    end
    object qrFuncionarioNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object qrFuncionarioCPF: TStringField
      FieldName = 'CPF'
      Size = 15
    end
    object qrFuncionarioVL_SALARIO: TFloatField
      FieldName = 'VL_SALARIO'
    end
  end
  object dspFuncionario: TDataSetProvider
    DataSet = qrFuncionario
    Left = 718
    Top = 24
  end
  object cdsFuncionario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFuncionario'
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
  end
  object dsFuncionario: TDataSource
    DataSet = cdsFuncionario
    Left = 787
    Top = 24
  end
end
