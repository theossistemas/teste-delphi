object Frm_TelaExercicio2: TFrm_TelaExercicio2
  Left = 610
  Top = 331
  Width = 365
  Height = 373
  Caption = 'Exerc'#237'cio 2 - Entidades de c'#225'lculo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 9
    Top = 14
    Width = 89
    Height = 13
    Caption = 'Nome Funcion'#225'rio:'
  end
  object Label2: TLabel
    Left = 74
    Top = 41
    Width = 23
    Height = 13
    Caption = 'CPF:'
  end
  object Label3: TLabel
    Left = 228
    Top = 40
    Width = 35
    Height = 13
    Caption = 'Sal'#225'rio:'
  end
  object edtNomeFuncionario: TEdit
    Left = 100
    Top = 11
    Width = 232
    Height = 21
    TabOrder = 0
  end
  object edtCPF: TEdit
    Left = 100
    Top = 37
    Width = 90
    Height = 21
    MaxLength = 11
    TabOrder = 1
    OnKeyPress = edtCPFKeyPress
  end
  object edtSalario: TEdit
    Left = 266
    Top = 37
    Width = 66
    Height = 21
    TabOrder = 2
    OnKeyPress = edtSalarioKeyPress
  end
  object btnSalvar: TButton
    Left = 133
    Top = 174
    Width = 84
    Height = 35
    Caption = 'Salvar'
    TabOrder = 4
    OnClick = btnSalvarClick
  end
  object gbDependente: TGroupBox
    Left = 19
    Top = 69
    Width = 313
    Height = 97
    Caption = 'Dependente'
    TabOrder = 3
    object Label4: TLabel
      Left = 20
      Top = 27
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object edtNomeDependente: TEdit
      Left = 56
      Top = 24
      Width = 232
      Height = 21
      TabOrder = 0
    end
    object cbxCalculaINSS: TCheckBox
      Left = 18
      Top = 59
      Width = 97
      Height = 17
      Caption = 'Calcula INSS'
      TabOrder = 1
    end
    object cbxCalculaIR: TCheckBox
      Left = 122
      Top = 59
      Width = 97
      Height = 17
      Caption = 'Calcula IR'
      TabOrder = 2
    end
    object btAdicionar: TButton
      Left = 213
      Top = 54
      Width = 75
      Height = 25
      Caption = 'Adicionar'
      TabOrder = 3
      OnClick = btAdicionarClick
    end
  end
  object gbImpostos: TGroupBox
    Left = 30
    Top = 233
    Width = 289
    Height = 81
    Caption = 'Impostos'
    Enabled = False
    TabOrder = 5
    object Label5: TLabel
      Left = 11
      Top = 25
      Width = 45
      Height = 13
      Caption = 'INSS R$:'
    end
    object Label6: TLabel
      Left = 25
      Top = 48
      Width = 31
      Height = 13
      Caption = 'IR R$:'
    end
    object edtINSS: TEdit
      Left = 59
      Top = 21
      Width = 94
      Height = 21
      TabOrder = 0
    end
    object edtIR: TEdit
      Left = 59
      Top = 45
      Width = 94
      Height = 21
      TabOrder = 1
    end
    object btnCalcular: TButton
      Left = 170
      Top = 27
      Width = 105
      Height = 35
      Caption = 'Calcular Impostos'
      Enabled = False
      TabOrder = 2
      OnClick = btnCalcularClick
    end
  end
end
