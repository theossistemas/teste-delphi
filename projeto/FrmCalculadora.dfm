object FCalculadora: TFCalculadora
  Left = 228
  Top = 174
  Width = 250
  Height = 328
  Caption = 'Calculadora'
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
  object btnSete: TButton
    Left = 24
    Top = 72
    Width = 49
    Height = 41
    Caption = '7'
    TabOrder = 0
    OnClick = NumeroClick
  end
  object btnoito: TButton
    Left = 72
    Top = 72
    Width = 49
    Height = 41
    Caption = '8'
    TabOrder = 1
    OnClick = NumeroClick
  end
  object btnNove: TButton
    Left = 120
    Top = 72
    Width = 49
    Height = 41
    Caption = '9'
    TabOrder = 2
    OnClick = NumeroClick
  end
  object btnSeis: TButton
    Left = 120
    Top = 112
    Width = 49
    Height = 41
    Caption = '6'
    TabOrder = 3
    OnClick = NumeroClick
  end
  object btnCinco: TButton
    Left = 72
    Top = 112
    Width = 49
    Height = 41
    Caption = '5'
    TabOrder = 4
    OnClick = NumeroClick
  end
  object btnQuatro: TButton
    Left = 24
    Top = 112
    Width = 49
    Height = 41
    Caption = '4'
    TabOrder = 5
    OnClick = NumeroClick
  end
  object btnTres: TButton
    Left = 120
    Top = 152
    Width = 49
    Height = 41
    Caption = '3'
    TabOrder = 6
    OnClick = NumeroClick
  end
  object btnDois: TButton
    Left = 72
    Top = 152
    Width = 49
    Height = 41
    Caption = '2'
    TabOrder = 7
    OnClick = NumeroClick
  end
  object btnUm: TButton
    Left = 24
    Top = 152
    Width = 49
    Height = 41
    Caption = '1'
    TabOrder = 8
    OnClick = NumeroClick
  end
  object edtResultado: TEdit
    Left = 24
    Top = 16
    Width = 193
    Height = 21
    TabOrder = 9
    Text = '0'
  end
  object btnZero: TButton
    Left = 72
    Top = 192
    Width = 49
    Height = 41
    Caption = '0'
    TabOrder = 10
    OnClick = NumeroClick
  end
  object btnLimpar: TButton
    Left = 24
    Top = 192
    Width = 49
    Height = 41
    Caption = 'Limpar'
    TabOrder = 11
    OnClick = btnLimparClick
  end
  object btnIgual: TButton
    Left = 120
    Top = 192
    Width = 49
    Height = 41
    Caption = '='
    TabOrder = 12
    OnClick = btnIgualClick
  end
  object btnMais: TButton
    Left = 168
    Top = 72
    Width = 49
    Height = 41
    Caption = '+'
    TabOrder = 13
    OnClick = OperacaoClick
  end
  object btnMenos: TButton
    Left = 168
    Top = 112
    Width = 49
    Height = 41
    Caption = '-'
    TabOrder = 14
    OnClick = OperacaoClick
  end
  object btnMultiplicar: TButton
    Left = 168
    Top = 152
    Width = 49
    Height = 41
    Caption = '*'
    TabOrder = 15
    OnClick = OperacaoClick
  end
  object btnDividir: TButton
    Left = 168
    Top = 192
    Width = 49
    Height = 41
    Caption = '/'
    TabOrder = 16
    OnClick = OperacaoClick
  end
  object btnImpostoA: TButton
    Left = 24
    Top = 248
    Width = 57
    Height = 25
    Caption = 'Imposto A'
    TabOrder = 17
    OnClick = btnImpostoClick
  end
  object btnImpostoC: TButton
    Left = 160
    Top = 248
    Width = 57
    Height = 25
    Caption = 'Imposto C'
    TabOrder = 18
    OnClick = btnImpostoClick
  end
  object btnImpostoB: TButton
    Left = 88
    Top = 248
    Width = 65
    Height = 25
    Caption = 'Imposto B'
    TabOrder = 19
    OnClick = btnImpostoClick
  end
end
