object FCalc: TFCalc
  Left = 0
  Top = 0
  Caption = 'Calculadora'
  ClientHeight = 433
  ClientWidth = 466
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pCalc: TPanel
    Left = 0
    Top = 0
    Width = 466
    Height = 433
    Align = alClient
    TabOrder = 0
    object Bevel1: TBevel
      Left = 16
      Top = 8
      Width = 441
      Height = 89
      Shape = bsFrame
    end
    object lbNumber: TLabel
      Left = 48
      Top = 41
      Width = 396
      Height = 40
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 384
      Top = 104
      Width = 72
      Height = 72
      Action = al9
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton2: TSpeedButton
      Left = 306
      Top = 103
      Width = 72
      Height = 72
      Action = al8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton3: TSpeedButton
      Left = 228
      Top = 103
      Width = 72
      Height = 72
      Action = al7
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton4: TSpeedButton
      Left = 384
      Top = 264
      Width = 72
      Height = 72
      Action = al3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton5: TSpeedButton
      Left = 306
      Top = 263
      Width = 72
      Height = 72
      Action = al2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton6: TSpeedButton
      Left = 228
      Top = 263
      Width = 72
      Height = 72
      Action = al1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton9: TSpeedButton
      Left = 228
      Top = 183
      Width = 72
      Height = 72
      Action = al4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton8: TSpeedButton
      Left = 306
      Top = 183
      Width = 72
      Height = 72
      Action = al5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton7: TSpeedButton
      Left = 384
      Top = 184
      Width = 72
      Height = 72
      Action = al6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton10: TSpeedButton
      Left = 384
      Top = 345
      Width = 72
      Height = 72
      Action = alDotch
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton11: TSpeedButton
      Left = 228
      Top = 344
      Width = 150
      Height = 72
      Action = al0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton12: TSpeedButton
      Left = 16
      Top = 103
      Width = 72
      Height = 72
      Action = alA
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton13: TSpeedButton
      Left = 16
      Top = 183
      Width = 72
      Height = 72
      Action = alB
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton14: TSpeedButton
      Left = 16
      Top = 263
      Width = 72
      Height = 72
      Action = alC
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton15: TSpeedButton
      Left = 16
      Top = 344
      Width = 72
      Height = 72
      Action = alEqual
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton16: TSpeedButton
      Left = 94
      Top = 103
      Width = 72
      Height = 72
      Action = alAdd
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton17: TSpeedButton
      Left = 94
      Top = 183
      Width = 72
      Height = 72
      Action = alSub
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton18: TSpeedButton
      Left = 94
      Top = 263
      Width = 72
      Height = 72
      Action = alMult
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton19: TSpeedButton
      Left = 94
      Top = 344
      Width = 72
      Height = 72
      Action = alDiv
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbHistory: TLabel
      Left = 24
      Top = 11
      Width = 420
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object alCalc: TActionList
    Left = 88
    Top = 152
    object alEqual: TAction
      Category = 'Operation'
      Caption = '='
      OnExecute = alEqualExecute
    end
    object al1: TAction
      Category = 'Screen'
      Caption = '1'
      OnExecute = al1Execute
    end
    object al2: TAction
      Category = 'Screen'
      Caption = '2'
      OnExecute = al1Execute
    end
    object al3: TAction
      Category = 'Screen'
      Caption = '3'
      OnExecute = al1Execute
    end
    object al4: TAction
      Category = 'Screen'
      Caption = '4'
      OnExecute = al1Execute
    end
    object al5: TAction
      Category = 'Screen'
      Caption = '5'
      OnExecute = al1Execute
    end
    object al6: TAction
      Category = 'Screen'
      Caption = '6'
      OnExecute = al1Execute
    end
    object al7: TAction
      Category = 'Screen'
      Caption = '7'
      OnExecute = al1Execute
    end
    object al8: TAction
      Category = 'Screen'
      Caption = '8'
      OnExecute = al1Execute
    end
    object al9: TAction
      Category = 'Screen'
      Caption = '9'
      OnExecute = al1Execute
    end
    object al0: TAction
      Category = 'Screen'
      Caption = '0'
      OnExecute = al1Execute
    end
    object alDotch: TAction
      Category = 'Screen'
      Caption = ','
      OnExecute = al1Execute
    end
    object alAdd: TAction
      Category = 'Operation'
      Caption = '+'
      OnExecute = alAddExecute
    end
    object alSub: TAction
      Category = 'Operation'
      Caption = '-'
      OnExecute = alAddExecute
    end
    object alMult: TAction
      Category = 'Operation'
      Caption = '*'
      OnExecute = alAddExecute
    end
    object alDiv: TAction
      Category = 'Operation'
      Caption = '/'
      OnExecute = alAddExecute
    end
    object alA: TAction
      Category = 'Operation'
      Caption = 'Imp A'
      OnExecute = alAExecute
    end
    object alB: TAction
      Category = 'Operation'
      Caption = 'Imp B'
      OnExecute = alBExecute
    end
    object alC: TAction
      Category = 'Operation'
      Caption = 'Imp C'
      OnExecute = alCExecute
    end
  end
end
