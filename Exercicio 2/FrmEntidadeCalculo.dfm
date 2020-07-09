object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Entidades de Calculo'
  ClientHeight = 636
  ClientWidth = 705
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  Scaled = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pDependente: TPanel
    Left = 0
    Top = 295
    Width = 705
    Height = 341
    Align = alClient
    TabOrder = 0
    object lNomeDependente: TLabel
      Left = 8
      Top = 108
      Width = 89
      Height = 13
      Caption = 'Nome Dependente'
    end
    object Label1: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 697
      Height = 45
      Align = alTop
      Alignment = taCenter
      BiDiMode = bdLeftToRight
      Caption = 'DEPENDENTES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ExplicitWidth = 276
    end
    object BtnAdicionarDependente: TSpeedButton
      Left = 208
      Top = 173
      Width = 296
      Height = 23
      Caption = 'Adicionar'
      OnClick = BtnAdicionarDependenteClick
    end
    object DbDependente: TDBGrid
      Left = 1
      Top = 196
      Width = 703
      Height = 144
      Align = alBottom
      DataSource = dsDependentes
      DrawingStyle = gdsGradient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object EdtNomeDependente: TEdit
      Left = 8
      Top = 127
      Width = 217
      Height = 21
      TabOrder = 1
    end
    object CbINSS: TCheckBox
      Left = 8
      Top = 167
      Width = 97
      Height = 17
      Caption = 'INSS'
      TabOrder = 2
    end
    object CbIR: TCheckBox
      Left = 128
      Top = 167
      Width = 65
      Height = 17
      Caption = 'IR'
      TabOrder = 3
    end
  end
  object pFuncionario: TPanel
    Left = 0
    Top = 0
    Width = 705
    Height = 295
    Align = alTop
    TabOrder = 1
    object BtnCalcularINSS: TSpeedButton
      Left = 8
      Top = 53
      Width = 120
      Height = 40
      Caption = 'Calcular INSS'
      OnClick = BtnCalcularINSSClick
    end
    object Nome: TLabel
      Left = 8
      Top = 99
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object CPF: TLabel
      Left = 241
      Top = 99
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object Label3: TLabel
      Left = 472
      Top = 99
      Width = 32
      Height = 13
      Caption = 'Sal'#225'rio'
    end
    object BtnAdicionarFuncionario: TSpeedButton
      Left = 208
      Top = 152
      Width = 296
      Height = 23
      Caption = 'Adicionar'
      OnClick = BtnAdicionarFuncionarioClick
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 697
      Height = 45
      Align = alTop
      Alignment = taCenter
      BiDiMode = bdLeftToRight
      Caption = 'FUNCIONARIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ExplicitWidth = 276
    end
    object BtnCalcularIR: TSpeedButton
      Left = 134
      Top = 53
      Width = 120
      Height = 40
      Caption = 'Calcular IR'
      OnClick = BtnCalcularIRClick
    end
    object DbFuncionario: TDBGrid
      Left = 1
      Top = 174
      Width = 703
      Height = 120
      Align = alBottom
      DataSource = DsFuncionarios
      DrawingStyle = gdsGradient
      FixedColor = clGradientActiveCaption
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnMouseUp = DbFuncionarioMouseUp
    end
    object EdtNomeFuncionario: TEdit
      Left = 8
      Top = 118
      Width = 217
      Height = 21
      MaxLength = 20
      TabOrder = 1
    end
    object EdtSalarioFuncionario: TEdit
      Left = 472
      Top = 118
      Width = 217
      Height = 21
      MaxLength = 9
      NumbersOnly = True
      TabOrder = 2
    end
    object EdtCPFFuncionario: TEdit
      Left = 241
      Top = 118
      Width = 217
      Height = 21
      MaxLength = 14
      TabOrder = 3
    end
  end
  object ODialog: TOpenDialog
    Left = 544
    Top = 384
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 552
    Top = 15
  end
  object FDPhysFBDriverLink2: TFDPhysFBDriverLink
    Left = 600
    Top = 615
  end
  object FDMemTableFuncionarios: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 608
    Top = 335
    object FDMemTableFuncionariosCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object FDMemTableFuncionariosNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object FDMemTableFuncionariosCPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object FDMemTableFuncionariosSALARIO: TSingleField
      FieldName = 'SALARIO'
    end
  end
  object FDMemTableDependentes: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 608
    Top = 415
    object FDMemTableDependentesCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object FDMemTableDependentesNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object FDMemTableDependentesISCALCULAIR: TBooleanField
      FieldName = 'ISCALCULAIR'
    end
    object FDMemTableDependentesISCALCULAINSS: TBooleanField
      FieldName = 'ISCALCULAINSS'
    end
    object FDMemTableDependentesCODIGOFUNCIONARIO: TIntegerField
      FieldName = 'CODIGOFUNCIONARIO'
    end
  end
  object DsFuncionarios: TDataSource
    DataSet = FDMemTableFuncionarios
    Left = 536
    Top = 319
  end
  object dsDependentes: TDataSource
    DataSet = FDMemTableDependentes
    Left = 504
    Top = 407
  end
end
