object fmr_Calculadora: Tfmr_Calculadora
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Calculadora'
  ClientHeight = 363
  ClientWidth = 322
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBase: TPanel
    Left = 0
    Top = 0
    Width = 322
    Height = 363
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object btnSete: TSpeedButton
      Left = 8
      Top = 88
      Width = 49
      Height = 49
      Caption = '7'
      OnClick = btnUmClick
    end
    object btnOito: TSpeedButton
      Left = 63
      Top = 88
      Width = 49
      Height = 49
      Caption = '8'
      OnClick = btnUmClick
    end
    object btnNove: TSpeedButton
      Left = 118
      Top = 88
      Width = 49
      Height = 49
      Caption = '9'
      OnClick = btnUmClick
    end
    object btnQuatro: TSpeedButton
      Left = 8
      Top = 143
      Width = 49
      Height = 49
      Caption = '4'
      OnClick = btnUmClick
    end
    object btnCinco: TSpeedButton
      Left = 63
      Top = 143
      Width = 49
      Height = 49
      Caption = '5'
      OnClick = btnUmClick
    end
    object btnSeis: TSpeedButton
      Left = 118
      Top = 143
      Width = 49
      Height = 49
      Caption = '6'
      OnClick = btnUmClick
    end
    object btnUm: TSpeedButton
      Left = 8
      Top = 198
      Width = 49
      Height = 49
      Caption = '1'
      OnClick = btnUmClick
    end
    object btnDois: TSpeedButton
      Left = 63
      Top = 198
      Width = 49
      Height = 49
      Caption = '2'
      OnClick = btnUmClick
    end
    object btnTres: TSpeedButton
      Left = 118
      Top = 198
      Width = 49
      Height = 49
      Caption = '3'
      OnClick = btnUmClick
    end
    object btnZero: TSpeedButton
      Left = 63
      Top = 253
      Width = 104
      Height = 49
      Caption = '0'
      OnClick = btnUmClick
    end
    object btnVirgula: TSpeedButton
      Left = 8
      Top = 253
      Width = 49
      Height = 49
      Caption = ','
      OnClick = btnUmClick
    end
    object btnAdicao: TSpeedButton
      Left = 264
      Top = 198
      Width = 49
      Height = 49
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnAdicaoClick
    end
    object btnSubtracao: TSpeedButton
      Left = 209
      Top = 198
      Width = 49
      Height = 49
      Caption = '-'
      OnClick = btnAdicaoClick
    end
    object btnMultiplicacao: TSpeedButton
      Left = 209
      Top = 143
      Width = 49
      Height = 49
      Caption = '*'
      OnClick = btnAdicaoClick
    end
    object btnDivisao: TSpeedButton
      Left = 264
      Top = 143
      Width = 49
      Height = 49
      Caption = '/'
      OnClick = btnAdicaoClick
    end
    object btnIgual: TSpeedButton
      Left = 209
      Top = 253
      Width = 104
      Height = 49
      Caption = '='
      OnClick = btnIgualClick
    end
    object btnCE: TSpeedButton
      Left = 209
      Top = 88
      Width = 49
      Height = 49
      Caption = 'CE'
      OnClick = btnCEClick
    end
    object btnC: TSpeedButton
      Left = 264
      Top = 88
      Width = 49
      Height = 49
      Caption = 'C'
      OnClick = btnCClick
    end
    object btnImpostoA: TSpeedButton
      Left = 8
      Top = 308
      Width = 101
      Height = 49
      Caption = 'Imposto A'
      OnClick = btnImpostoAClick
    end
    object btnImpostoB: TSpeedButton
      Left = 111
      Top = 308
      Width = 101
      Height = 49
      Caption = 'Imposto B'
      OnClick = btnImpostoAClick
    end
    object btnImpostoC: TSpeedButton
      Left = 214
      Top = 308
      Width = 99
      Height = 49
      Caption = 'Imposto C'
      OnClick = btnImpostoAClick
    end
    object edtResultado: TEdit
      Left = 8
      Top = 8
      Width = 305
      Height = 41
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 0
    end
    object edtOperacao: TEdit
      Left = 264
      Top = 55
      Width = 49
      Height = 27
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnKeyDown = edtOperacaoKeyDown
      OnKeyUp = edtOperacaoKeyUp
    end
    object edtPrimeiroValor: TEdit
      Left = 8
      Top = 55
      Width = 159
      Height = 27
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
end
