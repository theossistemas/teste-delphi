﻿inherited FrmExercicio1: TFrmExercicio1
  Caption = 'Exerc'#237'cio 1 - Calculadora'
  ClientHeight = 351
  ClientWidth = 303
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  ExplicitWidth = 309
  ExplicitHeight = 380
  PixelsPerInch = 96
  TextHeight = 13
  object pnlVisor: TPanel
    Left = 0
    Top = 0
    Width = 303
    Height = 54
    Align = alTop
    TabOrder = 0
    object edtVisor: TEdit
      Left = 1
      Top = 1
      Width = 301
      Height = 52
      Align = alClient
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -35
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = 'edtVisor'
      ExplicitHeight = 69
    end
  end
  object pnlOperacoes: TPanel
    Left = 228
    Top = 54
    Width = 75
    Height = 297
    Align = alRight
    TabOrder = 1
    ExplicitLeft = 232
    ExplicitTop = 72
    ExplicitHeight = 294
    object btnOpDivisao: TSpeedButton
      Left = 6
      Top = 10
      Width = 57
      Height = 51
      Caption = '/'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnClick
    end
    object btnOpMultiplicacao: TSpeedButton
      Left = 6
      Top = 67
      Width = 57
      Height = 51
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnClick
    end
    object btnSubtração: TSpeedButton
      Left = 6
      Top = 124
      Width = 57
      Height = 51
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnClick
    end
    object btnSoma: TSpeedButton
      Left = 6
      Top = 181
      Width = 57
      Height = 51
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnClick
    end
    object btnIgual: TSpeedButton
      Left = 6
      Top = 236
      Width = 57
      Height = 51
      Caption = '='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnClick
    end
  end
  object pnlNumeros: TPanel
    Left = 0
    Top = 54
    Width = 228
    Height = 297
    Align = alClient
    TabOrder = 2
    ExplicitTop = 72
    ExplicitWidth = 227
    ExplicitHeight = 302
    object btn1: TSpeedButton
      Left = 16
      Top = 181
      Width = 57
      Height = 51
      Caption = '1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnClick
    end
    object btn2: TSpeedButton
      Left = 88
      Top = 181
      Width = 57
      Height = 51
      Caption = '2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnClick
    end
    object btn3: TSpeedButton
      Left = 161
      Top = 181
      Width = 57
      Height = 51
      Caption = '3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnClick
    end
    object btn4: TSpeedButton
      Left = 16
      Top = 124
      Width = 57
      Height = 51
      Caption = '4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnClick
    end
    object btn5: TSpeedButton
      Left = 88
      Top = 124
      Width = 57
      Height = 51
      Caption = '5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnClick
    end
    object btn6: TSpeedButton
      Left = 161
      Top = 124
      Width = 57
      Height = 51
      Caption = '6'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnClick
    end
    object btn7: TSpeedButton
      Left = 16
      Top = 67
      Width = 57
      Height = 51
      Caption = '7'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnClick
    end
    object btn8: TSpeedButton
      Left = 88
      Top = 67
      Width = 57
      Height = 51
      Caption = '8'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnClick
    end
    object btn9: TSpeedButton
      Left = 161
      Top = 67
      Width = 57
      Height = 51
      Caption = '9'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnClick
    end
    object btn0: TSpeedButton
      Left = 16
      Top = 236
      Width = 202
      Height = 51
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnClick
    end
    object btnCE: TSpeedButton
      Left = 16
      Top = 10
      Width = 57
      Height = 51
      Caption = 'CE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnClick
    end
    object btnBackspace: TSpeedButton
      Left = 161
      Top = 10
      Width = 57
      Height = 51
      Caption = '<-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnClick
    end
  end
end
