object FFuncionario: TFFuncionario
  Left = 231
  Top = 173
  Width = 602
  Height = 371
  Caption = 'Funcion'#225'rio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object Label2: TLabel
    Left = 376
    Top = 8
    Width = 20
    Height = 13
    Caption = 'CPF'
  end
  object Label3: TLabel
    Left = 480
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Sal'#225'rio'
  end
  object edtNome: TEdit
    Left = 16
    Top = 24
    Width = 353
    Height = 21
    TabOrder = 0
  end
  object edtCpf: TEdit
    Left = 376
    Top = 24
    Width = 97
    Height = 21
    TabOrder = 1
  end
  object edtSalario: TEdit
    Left = 480
    Top = 24
    Width = 97
    Height = 21
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 64
    Width = 561
    Height = 233
    Caption = 'Dependente'
    TabOrder = 3
    object Label4: TLabel
      Left = 16
      Top = 24
      Width = 28
      Height = 13
      Caption = 'Nome'
    end
    object edtNomeDependente: TEdit
      Left = 16
      Top = 40
      Width = 265
      Height = 21
      TabOrder = 0
    end
    object cbCalculaIR: TCheckBox
      Left = 304
      Top = 40
      Width = 73
      Height = 17
      Caption = 'Calcula IR'
      TabOrder = 1
    end
    object cbCalculaINSS: TCheckBox
      Left = 384
      Top = 40
      Width = 73
      Height = 17
      Caption = 'Calcula INSS'
      TabOrder = 2
    end
    object btnIncluirDependente: TButton
      Left = 470
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Incluir'
      TabOrder = 3
      OnClick = btnIncluirDependenteClick
    end
  end
  object btnGravar: TButton
    Left = 503
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 4
    OnClick = btnGravarClick
  end
  object DBGrid1: TDBGrid
    Left = 32
    Top = 136
    Width = 441
    Height = 121
    DataSource = dsDependente
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'iscalculair'
        Title.Caption = 'Calcula IR'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'iscalculainss'
        Title.Caption = 'Calcula INSS'
        Width = 70
        Visible = True
      end>
  end
  object dsDependente: TDataSource
    DataSet = cdsDependente
    Left = 384
    Top = 208
  end
  object cdsDependente: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 208
    object cdsDependentenome: TStringField
      FieldName = 'nome'
      Size = 100
    end
    object cdsDependenteiscalculair: TBooleanField
      FieldName = 'iscalculair'
    end
    object cdsDependenteiscalculainss: TBooleanField
      FieldName = 'iscalculainss'
    end
  end
end
