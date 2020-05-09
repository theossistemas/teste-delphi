object Frm_EntidadesCalculo: TFrm_EntidadesCalculo
  Left = 613
  Top = 239
  Width = 386
  Height = 353
  Caption = 'Entidades de C'#225'lculo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 7
    Width = 353
    Height = 298
    Caption = 'Funcion'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'GpFuncionario'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 25
      Top = 76
      Width = 36
      Height = 14
      Caption = 'C'#243'digo:'
      FocusControl = DBEdit_Codigo
    end
    object Label2: TLabel
      Left = 8
      Top = 155
      Width = 52
      Height = 14
      Caption = 'Sal'#225'rio R$:'
      FocusControl = DBEdit_Salario
    end
    object Label3: TLabel
      Left = 30
      Top = 101
      Width = 30
      Height = 14
      Caption = 'Nome:'
      FocusControl = DBEdit_Nome
    end
    object Label4: TLabel
      Left = 38
      Top = 130
      Width = 22
      Height = 14
      Caption = 'CPF:'
      FocusControl = DBEdit_CPF
    end
    object DBEdit_Codigo: TDBEdit
      Left = 66
      Top = 74
      Width = 39
      Height = 22
      TabStop = False
      Color = clBtnFace
      DataField = 'CODIGO'
      DataSource = dsFuncioario
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit_Salario: TDBEdit
      Left = 66
      Top = 152
      Width = 135
      Height = 22
      DataField = 'SALARIO'
      DataSource = dsFuncioario
      TabOrder = 4
    end
    object DBEdit_Nome: TDBEdit
      Left = 66
      Top = 100
      Width = 270
      Height = 22
      DataField = 'NOME'
      DataSource = dsFuncioario
      TabOrder = 2
    end
    object DBEdit_CPF: TDBEdit
      Left = 66
      Top = 126
      Width = 135
      Height = 22
      DataField = 'CPF'
      DataSource = dsFuncioario
      MaxLength = 11
      TabOrder = 3
      OnKeyPress = DBEdit_CPFKeyPress
    end
    object DBNavigator1: TDBNavigator
      Left = 64
      Top = 32
      Width = 240
      Height = 25
      DataSource = dsFuncioario
      TabOrder = 0
    end
    object btDependentes: TButton
      Left = 232
      Top = 136
      Width = 89
      Height = 33
      Caption = 'Dependentes'
      TabOrder = 5
      OnClick = btDependentesClick
    end
    object gbImpostos: TGroupBox
      Left = 17
      Top = 187
      Width = 320
      Height = 94
      Caption = 'C'#225'lculo dos impostos'
      TabOrder = 6
      object Label5: TLabel
        Left = 143
        Top = 28
        Width = 28
        Height = 14
        Caption = 'IR R$:'
      end
      object Label6: TLabel
        Left = 130
        Top = 57
        Width = 42
        Height = 14
        Caption = 'INSS R$:'
      end
      object btCalcular: TButton
        Left = 16
        Top = 34
        Width = 97
        Height = 33
        Caption = 'Calcular'
        TabOrder = 0
        OnClick = btCalcularClick
      end
      object edtIR: TEdit
        Left = 176
        Top = 24
        Width = 121
        Height = 22
        TabStop = False
        ReadOnly = True
        TabOrder = 1
      end
      object edtINSS: TEdit
        Left = 176
        Top = 53
        Width = 121
        Height = 22
        TabStop = False
        ReadOnly = True
        TabOrder = 2
      end
    end
  end
  object dspDependente: TDataSetProvider
    DataSet = DMCadastro.SQLDependente
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowCommandText]
    Left = 76
    Top = 263
  end
  object cdsCalculo: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'dspDependente'
    Left = 45
    Top = 263
    object IntegerField1: TIntegerField
      DisplayLabel = 'C'#243'd. Funcion'#225'rio'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField1: TStringField
      DisplayLabel = 'Nome do Funcion'#225'rio'
      DisplayWidth = 33
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsCalculoFUNCIONARIO: TIntegerField
      FieldName = 'FUNCIONARIO'
    end
    object cdsCalculoISCALCULAIR: TStringField
      FieldName = 'ISCALCULAIR'
      Size = 1
    end
    object cdsCalculoISCALCULAINSS: TStringField
      FieldName = 'ISCALCULAINSS'
      Size = 1
    end
  end
  object dspFuncionario: TDataSetProvider
    DataSet = DMCadastro.SQLFuncionario
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowCommandText]
    Left = 164
    Top = 72
  end
  object cdsFuncionario: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'dspFuncionario'
    AfterInsert = cdsFuncionarioAfterInsert
    AfterEdit = cdsFuncionarioAfterEdit
    AfterPost = cdsFuncionarioAfterPost
    AfterCancel = cdsFuncionarioAfterCancel
    AfterScroll = cdsFuncionarioAfterScroll
    OnNewRecord = cdsFuncionarioNewRecord
    Left = 195
    Top = 72
    object cdsFuncionarioCODIGO: TIntegerField
      DisplayLabel = 'C'#243'd. Funcion'#225'rio'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFuncionarioNOME: TStringField
      DisplayLabel = 'Nome do Funcion'#225'rio'
      DisplayWidth = 33
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsFuncionarioCPF: TStringField
      DisplayLabel = 'CPF do Funcion'#225'rio'
      DisplayWidth = 33
      FieldName = 'CPF'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsFuncionarioSALARIO: TFloatField
      DisplayLabel = 'Sal'#225'rio do funcion'#225'rio'
      FieldName = 'SALARIO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dsFuncioario: TDataSource
    DataSet = cdsFuncionario
    Left = 228
    Top = 72
  end
end
