object Ex1CalculadoraF: TEx1CalculadoraF
  Left = 457
  Top = 204
  Width = 436
  Height = 410
  Caption = 'Exerc'#237'cio 1 - Calculadora'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object edtHistorico: TEdit
    Left = 5
    Top = 8
    Width = 196
    Height = 17
    BevelInner = bvNone
    BorderStyle = bsNone
    Color = clBtnFace
    Enabled = False
    TabOrder = 2
  end
  object edtVisor: TEdit
    Left = 5
    Top = 27
    Width = 198
    Height = 38
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnKeyPress = edtVisorKeyPress
  end
  object btnSete: TButton
    Left = 5
    Top = 116
    Width = 50
    Height = 50
    Caption = '7'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = btnSeteClick
  end
  object btnQuatro: TButton
    Left = 5
    Top = 167
    Width = 50
    Height = 50
    Caption = '4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnClick = btnQuatroClick
  end
  object btnZero: TButton
    Left = 56
    Top = 269
    Width = 49
    Height = 50
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 20
    OnClick = btnZeroClick
  end
  object bntUm: TButton
    Left = 5
    Top = 219
    Width = 50
    Height = 50
    Caption = '1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    OnClick = bntUmClick
  end
  object btnOito: TButton
    Left = 55
    Top = 116
    Width = 50
    Height = 50
    Caption = '8'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = btnOitoClick
  end
  object btnCinco: TButton
    Left = 55
    Top = 167
    Width = 50
    Height = 50
    Caption = '5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    OnClick = btnCincoClick
  end
  object btnDois: TButton
    Left = 55
    Top = 219
    Width = 50
    Height = 50
    Caption = '2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
    OnClick = btnDoisClick
  end
  object btnVirgula: TButton
    Left = 105
    Top = 269
    Width = 50
    Height = 50
    Caption = ','
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 21
    OnClick = btnVirgulaClick
  end
  object btnNove: TButton
    Left = 105
    Top = 116
    Width = 50
    Height = 50
    Caption = '9'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = btnNoveClick
  end
  object btnSeis: TButton
    Left = 105
    Top = 167
    Width = 50
    Height = 50
    Caption = '6'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    OnClick = btnSeisClick
  end
  object btnTres: TButton
    Left = 105
    Top = 219
    Width = 50
    Height = 50
    Caption = '3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 17
    OnClick = btnTresClick
  end
  object btnLimpar: TButton
    Left = 5
    Top = 66
    Width = 100
    Height = 50
    Caption = 'C'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnLimparClick
  end
  object btnSomar: TButton
    Left = 155
    Top = 219
    Width = 50
    Height = 50
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 18
    OnClick = btnSomarClick
  end
  object btnDividir: TButton
    Left = 155
    Top = 66
    Width = 50
    Height = 50
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = btnDividirClick
  end
  object btnMultiplicar: TButton
    Left = 155
    Top = 116
    Width = 50
    Height = 50
    Caption = 'x'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = btnMultiplicarClick
  end
  object btnDiminuir: TButton
    Left = 155
    Top = 167
    Width = 50
    Height = 50
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    OnClick = btnDiminuirClick
  end
  object btnApagar: TButton
    Left = 105
    Top = 66
    Width = 50
    Height = 50
    Caption = '<'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btnApagarClick
  end
  object redtHistorico: TRichEdit
    Left = 207
    Top = 1
    Width = 210
    Height = 368
    Lines.Strings = (
      '')
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object btnHistorico: TButton
    Left = 184
    Top = 5
    Width = 19
    Height = 18
    Caption = 'H'
    TabOrder = 1
    OnClick = btnHistoricoClick
  end
  object btnImpostoA: TButton
    Left = 5
    Top = 319
    Width = 65
    Height = 50
    Hint = 'Base de C'#225'lculo (Valor imposto na calculadora) * 20 % - 500'
    Caption = 'Imposto A'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 23
    OnClick = btnImpostoAClick
  end
  object btnImpostoB: TButton
    Left = 72
    Top = 319
    Width = 65
    Height = 50
    Hint = 'Imposto A '#8211' 15'
    Caption = 'Imposto B'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 24
    OnClick = btnImpostoBClick
  end
  object btnImpostoC: TButton
    Left = 140
    Top = 319
    Width = 65
    Height = 50
    Hint = 'Imposto A + imposto B'
    Caption = 'Imposto C'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 25
    OnClick = btnImpostoCClick
  end
  object btnIgual: TButton
    Left = 155
    Top = 269
    Width = 50
    Height = 50
    Caption = '='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 22
    OnClick = btnIgualClick
  end
  object btnNegativoPositivo: TButton
    Left = 5
    Top = 269
    Width = 50
    Height = 50
    Caption = '+ / -'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 19
    OnClick = btnNegativoPositivoClick
  end
end
