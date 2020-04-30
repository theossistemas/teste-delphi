object frmCalculadoraMain: TfrmCalculadoraMain
  Left = 0
  Top = 0
  Caption = 'Th'#232'os - Calculadora Inteligente'
  ClientHeight = 149
  ClientWidth = 399
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lblDigite: TLabel
    Left = 9
    Top = 8
    Width = 82
    Height = 13
    Caption = 'Digite os valores '
  end
  object lblResultado: TLabel
    Left = 202
    Top = 8
    Width = 48
    Height = 13
    Caption = 'Resultado'
  end
  object edtEntrada: TEdit
    Left = 8
    Top = 24
    Width = 185
    Height = 21
    TabOrder = 0
    Text = '0'
    OnKeyPress = edtEntradaKeyPress
  end
  object edtResultado: TEdit
    Left = 199
    Top = 24
    Width = 185
    Height = 21
    Color = clInfoBk
    Enabled = False
    TabOrder = 1
  end
  object btnImpostoA: TButton
    Left = 8
    Top = 51
    Width = 75
    Height = 25
    Caption = 'Imposto A'
    TabOrder = 2
    OnClick = btnImpostoAClick
  end
  object btnImpostoB: TButton
    Left = 8
    Top = 82
    Width = 75
    Height = 25
    Caption = 'Imposto B'
    TabOrder = 3
    OnClick = btnImpostoBClick
  end
  object btnImpostoC: TButton
    Left = 8
    Top = 113
    Width = 75
    Height = 25
    Caption = 'Imposto C'
    TabOrder = 4
    OnClick = btnImpostoCClick
  end
  object edtImpostoA: TEdit
    Left = 88
    Top = 53
    Width = 105
    Height = 21
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 5
    Text = '0'
    OnKeyPress = edtEntradaKeyPress
  end
  object edtImpostoB: TEdit
    Left = 89
    Top = 84
    Width = 105
    Height = 21
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 6
    Text = '0'
    OnKeyPress = edtEntradaKeyPress
  end
  object edtImpostoC: TEdit
    Left = 88
    Top = 115
    Width = 105
    Height = 21
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 7
    Text = '0'
    OnKeyPress = edtEntradaKeyPress
  end
end
