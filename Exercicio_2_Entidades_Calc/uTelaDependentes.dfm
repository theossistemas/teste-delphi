object Frm_Dependentes: TFrm_Dependentes
  Left = 687
  Top = 351
  Width = 336
  Height = 188
  Caption = 'Dependentes'
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
    Left = 32
    Top = 88
    Width = 36
    Height = 13
    Caption = 'C'#243'digo:'
  end
  object Label2: TLabel
    Left = 16
    Top = 55
    Width = 55
    Height = 13
    Caption = 'Funcion'#225'rio'
  end
  object Label3: TLabel
    Left = 32
    Top = 120
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object DBEdit_Codigo: TDBEdit
    Left = 75
    Top = 84
    Width = 121
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'CODIGO'
    DataSource = dsDependente
    ReadOnly = True
    TabOrder = 0
  end
  object DBEdit_Funcionario: TDBEdit
    Left = 75
    Top = 52
    Width = 121
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'FUNCIONARIO'
    DataSource = dsDependente
    ReadOnly = True
    TabOrder = 1
  end
  object DBEdit_Nome: TDBEdit
    Left = 75
    Top = 116
    Width = 121
    Height = 21
    DataField = 'NOME'
    DataSource = dsDependente
    TabOrder = 2
  end
  object DBcbx_IsCalculaIR: TDBCheckBox
    Left = 216
    Top = 64
    Width = 97
    Height = 17
    Caption = 'Calcula IR?'
    DataField = 'ISCALCULAIR'
    DataSource = dsDependente
    TabOrder = 3
    ValueChecked = 'S'
    ValueUnchecked = 'N'
  end
  object DBcbx_IsCalculaINSS: TDBCheckBox
    Left = 216
    Top = 96
    Width = 97
    Height = 17
    Caption = 'Calcula INSS?'
    DataField = 'ISCALCULAINSS'
    DataSource = dsDependente
    TabOrder = 4
    ValueChecked = 'S'
    ValueUnchecked = 'N'
  end
  object DBNavigator1: TDBNavigator
    Left = 40
    Top = 8
    Width = 240
    Height = 25
    DataSource = dsDependente
    TabOrder = 5
  end
  object cdsDependente: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'dspDependente'
    AfterInsert = cdsDependenteAfterInsert
    AfterPost = cdsDependenteAfterPost
    OnNewRecord = cdsDependenteNewRecord
    Left = 213
    Top = 16
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
    object cdsDependenteFUNCIONARIO: TIntegerField
      FieldName = 'FUNCIONARIO'
    end
    object cdsDependenteISCALCULAIR: TStringField
      FieldName = 'ISCALCULAIR'
      Size = 1
    end
    object cdsDependenteISCALCULAINSS: TStringField
      FieldName = 'ISCALCULAINSS'
      Size = 1
    end
  end
  object dsDependente: TDataSource
    DataSet = cdsDependente
    Left = 275
    Top = 16
  end
  object dspDependente: TDataSetProvider
    DataSet = DMCadastro.SQLDependente
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowCommandText]
    Left = 244
    Top = 16
  end
end
