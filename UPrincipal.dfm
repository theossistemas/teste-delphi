object FrmMenu: TFrmMenu
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Menu'
  ClientHeight = 266
  ClientWidth = 415
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 19
  object btnExe01: TButton
    Left = 104
    Top = 8
    Width = 209
    Height = 121
    Caption = 'Exerc'#237'cio 01'
    Enabled = False
    TabOrder = 0
  end
  object btnExe02: TButton
    Left = 104
    Top = 135
    Width = 209
    Height = 121
    Caption = 'Exerc'#237'cio 02'
    TabOrder = 1
    OnClick = btnExe02Click
  end
end
