object MenuPrincipalF: TMenuPrincipalF
  Left = 192
  Top = 125
  Width = 928
  Height = 480
  Caption = 'Menu Principal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnEx1Calculadora: TButton
    Left = 26
    Top = 104
    Width = 409
    Height = 97
    Caption = 'Exerc'#237'cio 1 - Calculadora'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnEx1CalculadoraClick
    OnKeyDown = btnEx1CalculadoraKeyDown
  end
  object btnEx2EntidadesCalc: TButton
    Left = 472
    Top = 104
    Width = 409
    Height = 97
    Caption = 'Exerc'#237'cio 2 - Entidades de c'#225'lculo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnEx2EntidadesCalcClick
    OnKeyDown = btnEx2EntidadesCalcKeyDown
  end
end
