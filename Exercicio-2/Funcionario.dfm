object FrmFuncionario: TFrmFuncionario
  Left = 0
  Top = 0
  Caption = 'Funcion'#225'rio'
  ClientHeight = 353
  ClientWidth = 568
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GbFunc: TGroupBox
    Left = 8
    Top = 8
    Width = 457
    Height = 185
    Caption = 'Funcion'#225'rio'
    TabOrder = 0
    object LbNome: TLabel
      Left = 24
      Top = 41
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object LbSalarioBruto: TLabel
      Left = 24
      Top = 72
      Width = 61
      Height = 13
      Caption = 'Sal'#225'rio Bruto'
    end
    object LbCPF: TLabel
      Left = 24
      Top = 15
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object LbLstDepedentes: TLabel
      Left = 24
      Top = 109
      Width = 98
      Height = 13
      Caption = 'Lista de Dependetes'
    end
    object LbSalarioLiqui: TLabel
      Left = 256
      Top = 72
      Width = 68
      Height = 13
      Caption = 'Sal'#225'rio Liqu'#237'do'
    end
    object EdNome: TEdit
      Left = 73
      Top = 38
      Width = 368
      Height = 21
      TabOrder = 0
    end
    object EdSalarioBruto: TEdit
      Left = 105
      Top = 69
      Width = 96
      Height = 21
      TabOrder = 1
      Text = '0'
    end
    object deMskFunCpf: TMaskEdit
      Left = 73
      Top = 12
      Width = 105
      Height = 21
      Hint = '10001'
      EditMask = '!999\.999\.999\-99;1;_'
      MaxLength = 14
      TabOrder = 2
      Text = '   .   .   -  '
      OnExit = deMskFunCpfExit
    end
    object CmBListaDep: TComboBox
      Left = 139
      Top = 106
      Width = 185
      Height = 21
      TabOrder = 3
    end
    object EdSalarioLiquido: TEdit
      Left = 345
      Top = 65
      Width = 96
      Height = 21
      Enabled = False
      TabOrder = 4
      Text = '0'
    end
  end
  object GbDependentes: TGroupBox
    Left = 8
    Top = 207
    Width = 457
    Height = 138
    Caption = 'Dependentes'
    TabOrder = 1
    object LbNomeDep: TLabel
      Left = 24
      Top = 50
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object LbDepCpf: TLabel
      Left = 24
      Top = 23
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object EdtNomeDep: TEdit
      Left = 73
      Top = 47
      Width = 264
      Height = 21
      TabOrder = 0
      OnExit = EdtNomeDepExit
    end
    object ButCalcularIR: TButton
      Left = 24
      Top = 88
      Width = 81
      Height = 25
      Caption = 'Calcular IR'
      Enabled = False
      TabOrder = 1
      OnClick = ButCalcularIRClick
    end
    object ButCalcularINSS: TButton
      Left = 152
      Top = 88
      Width = 81
      Height = 25
      Caption = 'Calcular INSS'
      Enabled = False
      TabOrder = 2
      OnClick = ButCalcularINSSClick
    end
    object deMskDepCpf: TMaskEdit
      Left = 73
      Top = 20
      Width = 105
      Height = 21
      Hint = '10001'
      EditMask = '!999\.999\.999\-99;1;_'
      MaxLength = 14
      TabOrder = 3
      Text = '   .   .   -  '
    end
  end
  object BtSalvar: TButton
    Left = 485
    Top = 13
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 2
    OnClick = BtSalvarClick
  end
  object BtAlterar: TButton
    Left = 485
    Top = 44
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 3
    OnClick = BtAlterarClick
  end
  object BtDeletar: TButton
    Left = 485
    Top = 106
    Width = 75
    Height = 25
    Caption = 'Deletar'
    TabOrder = 4
    OnClick = BtDeletarClick
  end
  object BtLimpar: TButton
    Left = 485
    Top = 75
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 5
    OnClick = BtLimparClick
  end
end
