object frmCalculadora: TfrmCalculadora
  Left = 270
  Top = 124
  Width = 395
  Height = 333
  BorderIcons = [biSystemMenu]
  Caption = '                                          Calculadora'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnSete: TBitBtn
    Left = 40
    Top = 72
    Width = 81
    Height = 41
    Cursor = crHandPoint
    Caption = '7'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnNumeroClick
  end
  object btnNove: TBitBtn
    Left = 200
    Top = 72
    Width = 65
    Height = 41
    Cursor = crHandPoint
    Caption = '9'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnNumeroClick
  end
  object btnOito: TBitBtn
    Left = 128
    Top = 72
    Width = 65
    Height = 41
    Cursor = crHandPoint
    Caption = '8'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnNumeroClick
  end
  object btnSoma: TBitBtn
    Left = 280
    Top = 72
    Width = 33
    Height = 41
    Cursor = crHandPoint
    Caption = '+'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnSomaClick
  end
  object btnQuatro: TBitBtn
    Left = 40
    Top = 120
    Width = 81
    Height = 41
    Cursor = crHandPoint
    Caption = '4'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btnNumeroClick
  end
  object btnCinco: TBitBtn
    Left = 128
    Top = 120
    Width = 65
    Height = 41
    Cursor = crHandPoint
    Caption = '5'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = btnNumeroClick
  end
  object btnSeis: TBitBtn
    Left = 200
    Top = 120
    Width = 65
    Height = 41
    Cursor = crHandPoint
    Caption = '6'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = btnNumeroClick
  end
  object btnSubtr: TBitBtn
    Left = 280
    Top = 120
    Width = 33
    Height = 41
    Cursor = crHandPoint
    Caption = '-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = btnSubtrClick
  end
  object btnUm: TBitBtn
    Left = 40
    Top = 168
    Width = 81
    Height = 41
    Cursor = crHandPoint
    Caption = '1'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = btnNumeroClick
  end
  object btnDois: TBitBtn
    Left = 128
    Top = 168
    Width = 65
    Height = 41
    Cursor = crHandPoint
    Caption = '2'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = btnNumeroClick
  end
  object btnTres: TBitBtn
    Left = 200
    Top = 168
    Width = 65
    Height = 41
    Cursor = crHandPoint
    Caption = '3'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    OnClick = btnNumeroClick
  end
  object btnMult: TBitBtn
    Left = 280
    Top = 168
    Width = 33
    Height = 41
    Cursor = crHandPoint
    Caption = '*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnClick = btnMultClick
  end
  object btnLimpar: TBitBtn
    Left = 40
    Top = 216
    Width = 81
    Height = 41
    Cursor = crHandPoint
    Caption = 'C'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    OnClick = btnLimparClick
  end
  object btnZero: TBitBtn
    Left = 128
    Top = 216
    Width = 65
    Height = 41
    Cursor = crHandPoint
    Caption = '0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    OnClick = btnNumeroClick
  end
  object btnCalcular: TBitBtn
    Left = 200
    Top = 216
    Width = 65
    Height = 41
    Cursor = crHandPoint
    Caption = '='
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    OnClick = btnCalcularClick
  end
  object btnDiv: TBitBtn
    Left = 280
    Top = 216
    Width = 33
    Height = 41
    Cursor = crHandPoint
    Caption = '/'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    OnClick = btnDivClick
  end
  object edtResultado: TEdit
    Left = 40
    Top = 16
    Width = 313
    Height = 41
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 16
    Text = '0'
  end
  object btnImpA: TBitBtn
    Left = 320
    Top = 72
    Width = 49
    Height = 41
    Cursor = crHandPoint
    Caption = 'IMP_A'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 17
    OnClick = btnImpAClick
  end
  object btnImpB: TBitBtn
    Left = 320
    Top = 120
    Width = 49
    Height = 41
    Cursor = crHandPoint
    Caption = 'IMP_B'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 18
    OnClick = btnImpBClick
  end
  object btnImpC: TBitBtn
    Left = 320
    Top = 168
    Width = 49
    Height = 41
    Cursor = crHandPoint
    Caption = 'IMP_C'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 19
    OnClick = btnImpCClick
  end
end
