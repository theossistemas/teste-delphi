object frmEntidadesDeCalculo: TfrmEntidadesDeCalculo
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Entidades de c'#225'lculo'
  ClientHeight = 434
  ClientWidth = 758
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblCodigoFuncionario: TLabel
    Left = 24
    Top = 8
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object lblNomeFuncionario: TLabel
    Left = 120
    Top = 8
    Width = 55
    Height = 13
    Caption = 'Funcion'#225'rio'
  end
  object lblCpfFuncionario: TLabel
    Left = 488
    Top = 8
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object lblSalarioFuncionario: TLabel
    Left = 592
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Sal'#225'rio'
  end
  object lblCodigoDependente: TLabel
    Left = 24
    Top = 224
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object lblNomeDependente: TLabel
    Left = 120
    Top = 224
    Width = 59
    Height = 13
    Caption = 'Dependente'
  end
  object lblINSS: TLabel
    Left = 488
    Top = 224
    Width = 60
    Height = 13
    Caption = 'Calcula INSS'
  end
  object lblIR: TLabel
    Left = 592
    Top = 224
    Width = 48
    Height = 13
    Caption = 'Calcula IR'
  end
  object dbgFuncionario: TDBGrid
    Left = 8
    Top = 56
    Width = 742
    Height = 120
    DataSource = DataModule1.dsFuncionario
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object dbgDependente: TDBGrid
    Left = 8
    Top = 272
    Width = 742
    Height = 120
    DataSource = DataModule1.dsDependente
    ReadOnly = True
    TabOrder = 14
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnNovoFuncionario: TButton
    Left = 8
    Top = 182
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 4
    OnClick = btnNovoFuncionarioClick
  end
  object btnExcluirFuncionario: TButton
    Left = 89
    Top = 182
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 5
    OnClick = btnExcluirFuncionarioClick
  end
  object btnCancelarFuncionario: TButton
    Left = 170
    Top = 182
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 6
    OnClick = btnCancelarFuncionarioClick
  end
  object btnSalvarFuncionario: TButton
    Left = 251
    Top = 182
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 7
    OnClick = btnSalvarFuncionarioClick
  end
  object btnNovoDependente: TButton
    Left = 8
    Top = 398
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 15
    OnClick = btnNovoDependenteClick
  end
  object btnExcluirDependente: TButton
    Left = 89
    Top = 398
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 16
    OnClick = btnExcluirDependenteClick
  end
  object btnCancelarDependente: TButton
    Left = 170
    Top = 398
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 17
    OnClick = btnCancelarDependenteClick
  end
  object btnSalvarDependente: TButton
    Left = 251
    Top = 398
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 18
    OnClick = btnSalvarDependenteClick
  end
  object dbeCodigoFuncionario: TDBEdit
    Left = 24
    Top = 27
    Width = 90
    Height = 21
    DataField = 'ID'
    DataSource = DataModule1.dsFuncionario
    Enabled = False
    ReadOnly = True
    TabOrder = 19
  end
  object dbeNomeFuncionario: TDBEdit
    Left = 120
    Top = 27
    Width = 362
    Height = 21
    DataField = 'NOME'
    DataSource = DataModule1.dsFuncionario
    TabOrder = 1
  end
  object dbeCPF: TDBEdit
    Left = 488
    Top = 27
    Width = 98
    Height = 21
    DataField = 'CPF'
    DataSource = DataModule1.dsFuncionario
    TabOrder = 2
  end
  object dbeSalario: TDBEdit
    Left = 592
    Top = 27
    Width = 121
    Height = 21
    DataField = 'SALARIO'
    DataSource = DataModule1.dsFuncionario
    TabOrder = 3
    OnKeyPress = dbeSalarioKeyPress
  end
  object dbeCodigoDependente: TDBEdit
    Left = 24
    Top = 243
    Width = 90
    Height = 21
    DataField = 'ID'
    DataSource = DataModule1.dsDependente
    DragCursor = crHandPoint
    Enabled = False
    ReadOnly = True
    TabOrder = 10
  end
  object dbeNomeDependente: TDBEdit
    Left = 120
    Top = 243
    Width = 362
    Height = 21
    DataField = 'NOME'
    DataSource = DataModule1.dsDependente
    DragCursor = crHandPoint
    TabOrder = 11
  end
  object dbcCalculaINSS: TDBComboBox
    Left = 488
    Top = 243
    Width = 98
    Height = 21
    DataField = 'IS_CALCULA_INSS'
    DataSource = DataModule1.dsDependente
    DragCursor = crHandPoint
    Items.Strings = (
      'N'#195'O'
      'SIM')
    TabOrder = 12
  end
  object dbcCalculaIR: TDBComboBox
    Left = 592
    Top = 243
    Width = 98
    Height = 21
    DataField = 'IS_CALCULA_IR'
    DataSource = DataModule1.dsDependente
    DragCursor = crHandPoint
    Items.Strings = (
      'N'#195'O'
      'SIM')
    TabOrder = 13
  end
  object btnINSS: TButton
    Left = 332
    Top = 182
    Width = 75
    Height = 25
    Caption = 'Calcular INSS'
    TabOrder = 8
    OnClick = btnINSSClick
  end
  object btnIR: TButton
    Left = 413
    Top = 182
    Width = 75
    Height = 25
    Caption = 'Calcular IR'
    TabOrder = 9
    OnClick = btnIRClick
  end
end
