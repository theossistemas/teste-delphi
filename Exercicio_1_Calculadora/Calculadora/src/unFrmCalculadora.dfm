object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Calculadora'
  ClientHeight = 332
  ClientWidth = 261
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object b6: TSpeedButton
    Left = 149
    Top = 130
    Width = 51
    Height = 39
    Caption = '6'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = btnAdicionaDigitoVisorClick
  end
  object b1: TSpeedButton
    Left = 40
    Top = 170
    Width = 50
    Height = 39
    Caption = '1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnAdicionaDigitoVisorClick
  end
  object b0: TSpeedButton
    Left = 40
    Top = 210
    Width = 50
    Height = 39
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = btnAdicionaDigitoVisorClick
  end
  object b2: TSpeedButton
    Left = 94
    Top = 170
    Width = 50
    Height = 39
    Caption = '2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnAdicionaDigitoVisorClick
  end
  object b3: TSpeedButton
    Left = 149
    Top = 170
    Width = 51
    Height = 39
    Caption = '3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnAdicionaDigitoVisorClick
  end
  object b4: TSpeedButton
    Left = 40
    Top = 130
    Width = 50
    Height = 39
    Caption = '4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = btnAdicionaDigitoVisorClick
  end
  object b7: TSpeedButton
    Left = 40
    Top = 90
    Width = 50
    Height = 39
    Caption = '7'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = btnAdicionaDigitoVisorClick
  end
  object b8: TSpeedButton
    Left = 94
    Top = 90
    Width = 50
    Height = 39
    Caption = '8'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = btnAdicionaDigitoVisorClick
  end
  object b9: TSpeedButton
    Left = 149
    Top = 90
    Width = 51
    Height = 39
    Caption = '9'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = btnAdicionaDigitoVisorClick
  end
  object bponto: TSpeedButton
    Left = 94
    Top = 210
    Width = 51
    Height = 39
    Caption = ','
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = btnAdicionaDigitoVisorClick
  end
  object bigual: TSpeedButton
    Left = 204
    Top = 210
    Width = 50
    Height = 39
    Caption = '='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnIgualClick
  end
  object bmais: TSpeedButton
    Left = 204
    Top = 170
    Width = 50
    Height = 39
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnOperacaoClick
  end
  object bmenos: TSpeedButton
    Left = 204
    Top = 130
    Width = 50
    Height = 39
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnOperacaoClick
  end
  object bmulti: TSpeedButton
    Left = 204
    Top = 90
    Width = 50
    Height = 38
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnOperacaoClick
  end
  object bdiv: TSpeedButton
    Left = 149
    Top = 47
    Width = 105
    Height = 39
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnOperacaoClick
  end
  object bapaga: TSpeedButton
    Left = 149
    Top = 210
    Width = 50
    Height = 39
    Caption = #11013
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = bapagaClick
  end
  object bce: TSpeedButton
    Left = 40
    Top = 47
    Width = 104
    Height = 39
    Caption = 'CE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnLimparClick
  end
  object b5: TSpeedButton
    Left = 94
    Top = 130
    Width = 50
    Height = 39
    Caption = '5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = btnAdicionaDigitoVisorClick
  end
  object bA: TSpeedButton
    Left = 40
    Top = 282
    Width = 69
    Height = 39
    Caption = 'A'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton6Click
  end
  object bB: TSpeedButton
    Left = 112
    Top = 282
    Width = 69
    Height = 39
    Caption = 'B'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object bc: TSpeedButton
    Left = 185
    Top = 282
    Width = 69
    Height = 39
    Caption = 'C'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton2Click
  end
  object lblOperacaoAtual: TLabel
    Left = 8
    Top = 13
    Width = 26
    Height = 21
    Alignment = taCenter
    AutoSize = False
    Caption = 'N'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 40
    Top = 258
    Width = 114
    Height = 16
    Caption = 'Fun'#231#245'es Especiais'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pValor: TPanel
    Left = 40
    Top = 8
    Width = 214
    Height = 33
    Hint = 'CTRL+ENTER copia Valor e encerra'
    Alignment = taRightJustify
    BevelOuter = bvNone
    BorderWidth = 5
    BorderStyle = bsSingle
    Caption = '0  '
    Color = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    TabStop = True
  end
end
