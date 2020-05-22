object frmCalculoImpostos: TfrmCalculoImpostos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = '.: C'#225'lculo Impostos :.'
  ClientHeight = 191
  ClientWidth = 306
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 306
    Height = 150
    Align = alClient
    TabOrder = 0
    object lblFuncionario: TLabel
      Left = 8
      Top = 8
      Width = 55
      Height = 13
      Caption = 'Funcion'#225'rio'
    end
    object lblSalario: TLabel
      Left = 204
      Top = 10
      Width = 32
      Height = 13
      Caption = 'Sal'#225'rio'
    end
    object lblPercIR: TLabel
      Left = 106
      Top = 54
      Width = 25
      Height = 13
      Caption = '% IR'
    end
    object lblPercINSS: TLabel
      Left = 8
      Top = 54
      Width = 37
      Height = 13
      Caption = '% INSS'
    end
    object lblDescIR: TLabel
      Left = 204
      Top = 54
      Width = 59
      Height = 13
      Caption = 'Desconto IR'
    end
    object lblVlrIR: TLabel
      Left = 173
      Top = 100
      Width = 53
      Height = 13
      Caption = 'Valor do IR'
    end
    object lblVlrINSS: TLabel
      Left = 8
      Top = 100
      Width = 65
      Height = 13
      Caption = 'Valor do INSS'
    end
    object cbxFuncionario: TComboBox
      Left = 10
      Top = 27
      Width = 188
      Height = 21
      TabOrder = 0
      Text = 'cbxFuncionario'
      OnChange = cbxFuncionarioChange
    end
    object edtSalario: TEdit
      Left = 204
      Top = 27
      Width = 90
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 1
      Text = '0,00'
    end
    object edtPercentualIR: TEdit
      Left = 106
      Top = 70
      Width = 90
      Height = 21
      Alignment = taRightJustify
      TabOrder = 3
      Text = '15,00'
      OnChange = edtPercentualIRChange
    end
    object edtPercentualINSS: TEdit
      Left = 8
      Top = 70
      Width = 90
      Height = 21
      Alignment = taRightJustify
      TabOrder = 2
      Text = '8,00'
      OnChange = edtPercentualIRChange
    end
    object edtDctIR: TEdit
      Left = 204
      Top = 70
      Width = 90
      Height = 21
      Alignment = taRightJustify
      TabOrder = 4
      Text = '100,00'
      OnChange = edtPercentualIRChange
    end
    object edtValorIR: TEdit
      Left = 173
      Top = 116
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 6
      Text = '0,00'
    end
    object edtValorINSS: TEdit
      Left = 8
      Top = 116
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 5
      Text = '0,00'
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 150
    Width = 306
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnCalcular: TButton
      Left = 89
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Calcular'
      TabOrder = 1
      OnClick = btnCalcularClick
    end
    object btnLimpar: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Limpar'
      TabOrder = 0
      OnClick = btnLimparClick
    end
  end
end
