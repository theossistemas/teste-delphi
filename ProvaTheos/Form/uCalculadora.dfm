object fmr_Calculadora: Tfmr_Calculadora
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Calculadora'
  ClientHeight = 343
  ClientWidth = 286
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
    Width = 286
    Height = 343
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 322
    ExplicitHeight = 409
    object btnSete: TSpeedButton
      Left = 8
      Top = 117
      Width = 49
      Height = 49
      Caption = '7'
      OnClick = btnUmClick
    end
    object btnOito: TSpeedButton
      Left = 63
      Top = 117
      Width = 49
      Height = 49
      Caption = '8'
      OnClick = btnUmClick
    end
    object btnNove: TSpeedButton
      Left = 118
      Top = 117
      Width = 49
      Height = 49
      Caption = '9'
      OnClick = btnUmClick
    end
    object btnQuatro: TSpeedButton
      Left = 8
      Top = 172
      Width = 49
      Height = 49
      Caption = '4'
      OnClick = btnUmClick
    end
    object btnCinco: TSpeedButton
      Left = 63
      Top = 172
      Width = 49
      Height = 49
      Caption = '5'
      OnClick = btnUmClick
    end
    object btnSeis: TSpeedButton
      Left = 118
      Top = 172
      Width = 49
      Height = 49
      Caption = '6'
      OnClick = btnUmClick
    end
    object btnUm: TSpeedButton
      Left = 8
      Top = 227
      Width = 49
      Height = 49
      Caption = '1'
      OnClick = btnUmClick
    end
    object btnDois: TSpeedButton
      Left = 63
      Top = 227
      Width = 49
      Height = 49
      Caption = '2'
      OnClick = btnUmClick
    end
    object btnTres: TSpeedButton
      Left = 118
      Top = 227
      Width = 49
      Height = 49
      Caption = '3'
      OnClick = btnUmClick
    end
    object btnZero: TSpeedButton
      Left = 63
      Top = 282
      Width = 104
      Height = 49
      Caption = '0'
      OnClick = btnUmClick
    end
    object btnVirgula: TSpeedButton
      Left = 8
      Top = 282
      Width = 49
      Height = 49
      Caption = ','
      OnClick = btnUmClick
    end
    object btnAdicao: TSpeedButton
      Left = 230
      Top = 227
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
      Left = 175
      Top = 227
      Width = 49
      Height = 49
      Caption = '-'
      OnClick = btnAdicaoClick
    end
    object btnMultiplicacao: TSpeedButton
      Left = 175
      Top = 172
      Width = 49
      Height = 49
      Caption = '*'
      OnClick = btnAdicaoClick
    end
    object btnDivisao: TSpeedButton
      Left = 230
      Top = 172
      Width = 49
      Height = 49
      Caption = '/'
      OnClick = btnAdicaoClick
    end
    object btnIgual: TSpeedButton
      Left = 175
      Top = 282
      Width = 104
      Height = 49
      Caption = '='
      OnClick = btnIgualClick
    end
    object btnCE: TSpeedButton
      Left = 175
      Top = 117
      Width = 49
      Height = 49
      Caption = 'CE'
      OnClick = btnCEClick
    end
    object btnC: TSpeedButton
      Left = 230
      Top = 117
      Width = 49
      Height = 49
      Caption = 'C'
      OnClick = btnCClick
    end
    object btnImpostoA: TSpeedButton
      Left = 8
      Top = 88
      Width = 81
      Height = 25
      Caption = 'Imposto A'
      OnClick = btnImpostoAClick
    end
    object btnImpostoB: TSpeedButton
      Left = 103
      Top = 88
      Width = 76
      Height = 25
      Caption = 'Imposto B'
      OnClick = btnImpostoAClick
    end
    object btnImpostoC: TSpeedButton
      Left = 206
      Top = 88
      Width = 73
      Height = 25
      Caption = 'Imposto C'
      OnClick = btnImpostoAClick
    end
    object edtResult: TEdit
      Left = 8
      Top = 8
      Width = 271
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
      Left = 250
      Top = 55
      Width = 29
      Height = 27
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object edtPrimeiroValor: TEdit
      Left = 8
      Top = 55
      Width = 202
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
