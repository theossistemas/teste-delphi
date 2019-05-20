object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Calculadora'
  ClientHeight = 369
  ClientWidth = 421
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpButton1: TSpeedButton
    Left = 8
    Top = 64
    Width = 73
    Height = 65
    Caption = '1'
    OnClick = SpButton1Click
  end
  object SpButton2: TSpeedButton
    Left = 87
    Top = 64
    Width = 73
    Height = 65
    Caption = '2'
    OnClick = SpButton2Click
  end
  object SpButton3: TSpeedButton
    Left = 166
    Top = 64
    Width = 73
    Height = 65
    Caption = '3'
    OnClick = SpButton3Click
  end
  object SpButton4: TSpeedButton
    Left = 8
    Top = 135
    Width = 73
    Height = 65
    Caption = '4'
    OnClick = SpButton4Click
  end
  object SpButton5: TSpeedButton
    Left = 87
    Top = 135
    Width = 73
    Height = 65
    Caption = '5'
    OnClick = SpButton5Click
  end
  object SpButton6: TSpeedButton
    Left = 166
    Top = 135
    Width = 73
    Height = 65
    Caption = '6'
    OnClick = SpButton6Click
  end
  object SpButton7: TSpeedButton
    Left = 8
    Top = 206
    Width = 73
    Height = 65
    Caption = '7'
    OnClick = SpButton7Click
  end
  object SpButton8: TSpeedButton
    Left = 87
    Top = 206
    Width = 73
    Height = 65
    Caption = '8'
    OnClick = SpButton8Click
  end
  object SpButton9: TSpeedButton
    Left = 166
    Top = 206
    Width = 73
    Height = 65
    Caption = '9'
    OnClick = SpButton9Click
  end
  object SpButtonSomar: TSpeedButton
    Left = 256
    Top = 64
    Width = 73
    Height = 65
    Caption = '+'
    OnClick = SpButtonSomarClick
  end
  object SpButtonSubtrair: TSpeedButton
    Left = 256
    Top = 135
    Width = 73
    Height = 65
    Caption = '-'
    OnClick = SpButtonSubtrairClick
  end
  object SpButtonMultiplicar: TSpeedButton
    Left = 256
    Top = 206
    Width = 73
    Height = 65
    Caption = '*'
    OnClick = SpButtonMultiplicarClick
  end
  object SpButtonDividir: TSpeedButton
    Left = 256
    Top = 277
    Width = 73
    Height = 65
    Caption = '/'
    OnClick = SpButtonDividirClick
  end
  object SpButtonLimpar: TSpeedButton
    Left = 8
    Top = 277
    Width = 73
    Height = 65
    Caption = 'C'
    OnClick = SpButtonLimparClick
  end
  object SpButton0: TSpeedButton
    Left = 87
    Top = 277
    Width = 152
    Height = 65
    Caption = '0'
    OnClick = SpButton0Click
  end
  object SpButtonMaisMenos: TSpeedButton
    Left = 335
    Top = 64
    Width = 73
    Height = 65
    Caption = '+-'
    OnClick = SpButtonMaisMenosClick
  end
  object SpButtonPonto: TSpeedButton
    Left = 335
    Top = 135
    Width = 73
    Height = 65
    Caption = '.'
    OnClick = SpButtonPontoClick
  end
  object SpButtonIgual: TSpeedButton
    Left = 335
    Top = 206
    Width = 73
    Height = 136
    Caption = '='
    OnClick = SpButtonIgualClick
  end
  object Visor: TEdit
    Left = 8
    Top = 8
    Width = 400
    Height = 41
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
end
