inherited FrmExercicio2: TFrmExercicio2
  Caption = 'Exerc'#237'cio 2 - Entidades de C'#225'lculo'
  ClientHeight = 453
  ClientWidth = 803
  OnCreate = FormCreate
  ExplicitWidth = 809
  ExplicitHeight = 482
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMestre: TPanel
    Left = 0
    Top = 0
    Width = 803
    Height = 164
    Align = alTop
    TabOrder = 0
    object lblFuncionario: TLabel
      Left = 1
      Top = 1
      Width = 801
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Funcion'#225'rio'
      ExplicitWidth = 55
    end
    object dbgFuncionario: TDBGrid
      Left = 1
      Top = 66
      Width = 801
      Height = 97
      Align = alBottom
      DataSource = dtmExercicio2.dtsCADFUNCIONARIO
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object pnlDetalhe: TPanel
    Left = 0
    Top = 164
    Width = 803
    Height = 289
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 754
    ExplicitHeight = 439
    object lblDependentes: TLabel
      Left = 1
      Top = 1
      Width = 801
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Dependentes'
      ExplicitWidth = 64
    end
    object dbgDependentes: TDBGrid
      Left = 1
      Top = 75
      Width = 801
      Height = 213
      Align = alBottom
      DataSource = dtmExercicio2.dtsCADDEPENDENTE
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
end
