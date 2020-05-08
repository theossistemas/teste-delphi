object Ex1CalculadoraF: TEx1CalculadoraF
  Left = 457
  Top = 204
  Width = 410
  Height = 359
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
    TabOrder = 0
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
    TabOrder = 1
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
    TabOrder = 5
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
    TabOrder = 9
    OnClick = btnQuatroClick
  end
  object btnZero: TButton
    Left = 5
    Top = 269
    Width = 100
    Height = 50
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 17
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
    TabOrder = 13
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
    TabOrder = 6
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
    TabOrder = 10
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
    TabOrder = 14
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
    TabOrder = 18
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
    TabOrder = 7
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
    TabOrder = 11
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
    TabOrder = 15
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
    TabOrder = 2
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
    TabOrder = 16
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
    TabOrder = 4
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
    TabOrder = 8
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
    TabOrder = 12
    OnClick = btnDiminuirClick
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
    TabOrder = 19
    OnClick = btnIgualClick
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
    TabOrder = 3
    OnClick = btnApagarClick
  end
  object redtHistorico: TRichEdit
    Left = 207
    Top = 1
    Width = 185
    Height = 318
    Lines.Strings = (
      'redtHistorico')
    ScrollBars = ssBoth
    TabOrder = 20
  end
  object btnHistorico: TButton
    Left = 180
    Top = 1
    Width = 25
    Height = 25
    Caption = 'H'
    TabOrder = 21
    OnClick = btnHistoricoClick
  end
end
