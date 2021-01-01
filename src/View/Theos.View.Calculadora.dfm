object ViewCalculadora: TViewCalculadora
  Left = 0
  Top = 0
  Caption = 'ViewCalculadora'
  ClientHeight = 173
  ClientWidth = 475
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Padding.Left = 10
  Padding.Top = 10
  Padding.Right = 10
  Padding.Bottom = 10
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object LbVisorResultado: TLabel
    Left = 10
    Top = 10
    Width = 455
    Height = 48
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alTop
    Alignment = taRightJustify
    Caption = 'LbVisorResultado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitLeft = 163
    ExplicitWidth = 302
  end
  object LbValor: TLabel
    Left = 10
    Top = 58
    Width = 455
    Height = 48
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alTop
    Alignment = taRightJustify
    Caption = 'LbValor'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitLeft = 333
    ExplicitWidth = 132
  end
  object BtnImpostoA: TSpeedButton
    Left = 11
    Top = 128
    Width = 100
    Height = 25
    Caption = 'F1 - Imposto A'
  end
  object BtnImpostoB: TSpeedButton
    Left = 122
    Top = 128
    Width = 100
    Height = 25
    Caption = 'F2 - Imposto B'
  end
  object BtnImpostoC: TSpeedButton
    Left = 234
    Top = 128
    Width = 100
    Height = 25
    Caption = 'F3 - Imposto C'
  end
end
