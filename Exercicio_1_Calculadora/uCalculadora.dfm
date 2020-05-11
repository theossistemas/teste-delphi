object Frm_Calculadora: TFrm_Calculadora
  Left = 859
  Top = 272
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Calculadora'
  ClientHeight = 324
  ClientWidth = 333
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
  object edtVisor: TEdit
    Left = 120
    Top = 14
    Width = 199
    Height = 37
    TabStop = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 12
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    Text = '0'
  end
  object btSomar: TButton
    Left = 269
    Top = 211
    Width = 50
    Height = 50
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    OnClick = btSomarClick
  end
  object btResultado: TButton
    Left = 269
    Top = 261
    Width = 50
    Height = 50
    Caption = '='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 17
    OnClick = btResultadoClick
  end
  object btSubtrair: TButton
    Left = 269
    Top = 161
    Width = 50
    Height = 50
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = btSubtrairClick
  end
  object btMultiplicar: TButton
    Left = 269
    Top = 112
    Width = 50
    Height = 50
    Caption = 'X'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = btMultiplicarClick
  end
  object btDividir: TButton
    Left = 269
    Top = 63
    Width = 50
    Height = 50
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btDividirClick
  end
  object btUm: TButton
    Left = 121
    Top = 211
    Width = 50
    Height = 50
    Caption = '1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnClick = btUmClick
  end
  object btDois: TButton
    Left = 170
    Top = 211
    Width = 50
    Height = 50
    Caption = '2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    OnClick = btDoisClick
  end
  object btTres: TButton
    Left = 219
    Top = 211
    Width = 50
    Height = 50
    Caption = '3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    OnClick = btTresClick
  end
  object btZero: TButton
    Left = 169
    Top = 261
    Width = 50
    Height = 50
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    OnClick = btZeroClick
  end
  object btQuatro: TButton
    Left = 121
    Top = 161
    Width = 50
    Height = 50
    Caption = '4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = btQuatroClick
  end
  object btCinco: TButton
    Left = 170
    Top = 161
    Width = 50
    Height = 50
    Caption = '5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = btCincoClick
  end
  object btSeis: TButton
    Left = 219
    Top = 161
    Width = 50
    Height = 50
    Caption = '6'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = btSeisClick
  end
  object btSete: TButton
    Left = 121
    Top = 112
    Width = 50
    Height = 50
    Caption = '7'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btSeteClick
  end
  object btOito: TButton
    Left = 170
    Top = 112
    Width = 50
    Height = 50
    Caption = '8'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btOitoClick
  end
  object btNove: TButton
    Left = 219
    Top = 112
    Width = 50
    Height = 50
    Caption = '9'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = btNoveClick
  end
  object btVirgula: TButton
    Left = 219
    Top = 261
    Width = 50
    Height = 50
    Caption = ','
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
    OnClick = btVirgulaClick
  end
  object btResetar: TButton
    Left = 219
    Top = 63
    Width = 50
    Height = 50
    Caption = 'C'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btResetarClick
  end
  object btImpostoA: TButton
    Left = 16
    Top = 72
    Width = 97
    Height = 33
    Caption = 'Imposto A'
    TabOrder = 18
    OnClick = btImpostoAClick
  end
  object btImpostoB: TButton
    Left = 16
    Top = 110
    Width = 97
    Height = 33
    Caption = 'Imposto B'
    TabOrder = 19
    OnClick = btImpostoBClick
  end
  object btImpostoC: TButton
    Left = 16
    Top = 148
    Width = 97
    Height = 33
    Caption = 'Imposto C'
    TabOrder = 20
    OnClick = btImpostoCClick
  end
end
