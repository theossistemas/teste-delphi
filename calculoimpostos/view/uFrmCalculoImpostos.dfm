object frmCalculoImpostos: TfrmCalculoImpostos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = '.: C'#225'lculo Impostos :.'
  ClientHeight = 188
  ClientWidth = 314
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 314
    Height = 147
    Align = alClient
    TabOrder = 0
    ExplicitTop = 2
    ExplicitWidth = 447
    ExplicitHeight = 160
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
      Left = 8
      Top = 54
      Width = 25
      Height = 13
      Caption = '% IR'
    end
    object lblPercINSS: TLabel
      Left = 106
      Top = 54
      Width = 37
      Height = 13
      Caption = '% INSS'
    end
    object lblDescINSS: TLabel
      Left = 204
      Top = 54
      Width = 71
      Height = 13
      Caption = 'Desconto INSS'
    end
    object lblVlrIR: TLabel
      Left = 10
      Top = 97
      Width = 53
      Height = 13
      Caption = 'Valor do IR'
    end
    object lblVlrINSS: TLabel
      Left = 173
      Top = 97
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
      Left = 8
      Top = 70
      Width = 90
      Height = 21
      Alignment = taRightJustify
      TabOrder = 2
      Text = '8,00'
    end
    object edtPercentualINSS: TEdit
      Left = 106
      Top = 70
      Width = 90
      Height = 21
      Alignment = taRightJustify
      TabOrder = 3
      Text = '15,00'
    end
    object edtDctINSS: TEdit
      Left = 204
      Top = 70
      Width = 90
      Height = 21
      Alignment = taRightJustify
      TabOrder = 4
      Text = '100,00'
    end
    object edtValorIR: TEdit
      Left = 8
      Top = 116
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 5
      Text = '0,00'
    end
    object edtValorINSS: TEdit
      Left = 173
      Top = 116
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 6
      Text = '0,00'
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 147
    Width = 314
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 288
    ExplicitTop = 128
    ExplicitWidth = 185
    object btnCalcular: TButton
      Left = 89
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Calcular'
      TabOrder = 1
    end
    object btnLimpar: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Limpar'
      TabOrder = 0
    end
  end
end
