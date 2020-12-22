object FTest: TFTest
  Left = 0
  Top = 0
  ClientHeight = 165
  ClientWidth = 378
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -32
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 39
  object btTest1: TButton
    Left = 8
    Top = 16
    Width = 353
    Height = 57
    Caption = 'Teste 1 - Calculadora'
    TabOrder = 0
    OnClick = btTest1Click
  end
  object btTest2: TButton
    Left = 8
    Top = 88
    Width = 353
    Height = 58
    Caption = 'Teste 2 - Funcion'#225'rio'
    TabOrder = 1
    OnClick = btTest2Click
  end
end
