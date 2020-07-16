inherited FrmExercicio2: TFrmExercicio2
  Caption = 'Exerc'#237'cio 2 - Entidades de C'#225'lculo'
  ClientHeight = 455
  ClientWidth = 731
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 737
  ExplicitHeight = 484
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMestre: TPanel
    Left = 0
    Top = 0
    Width = 731
    Height = 207
    Align = alTop
    TabOrder = 0
    object lblID_FUNCIONARIO: TLabel
      Left = 16
      Top = 25
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object lblNOME_Funcionario: TLabel
      Left = 100
      Top = 25
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object lblCPF: TLabel
      Left = 487
      Top = 25
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object lblSALARIO: TLabel
      Left = 607
      Top = 25
      Width = 32
      Height = 13
      Caption = 'Sal'#225'rio'
    end
    object lblINSS: TLabel
      Left = 487
      Top = 68
      Width = 23
      Height = 13
      Caption = 'INSS'
    end
    object lblIR: TLabel
      Left = 607
      Top = 68
      Width = 11
      Height = 13
      Caption = 'IR'
    end
    object dbgFuncionario: TDBGrid
      Left = 1
      Top = 111
      Width = 729
      Height = 95
      Align = alBottom
      DataSource = dtmExercicio2.dtsCADFUNCIONARIO
      ReadOnly = True
      TabOrder = 12
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_FUNCIONARIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Width = 400
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CPF'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SALARIO'
          Width = 117
          Visible = True
        end>
    end
    object pnlTituloCadFuncionario: TPanel
      Left = 1
      Top = 1
      Width = 729
      Height = 17
      Align = alTop
      Color = clGradientActiveCaption
      ParentBackground = False
      TabOrder = 11
      ExplicitLeft = 248
      ExplicitTop = 32
      ExplicitWidth = 185
      object lblFuncionario: TLabel
        Left = 1
        Top = 1
        Width = 727
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'Funcion'#225'rio'
        ExplicitWidth = 55
      end
    end
    object edtID_FUNCIONARIO: TDBEdit
      Left = 16
      Top = 41
      Width = 78
      Height = 21
      DataField = 'ID_FUNCIONARIO'
      DataSource = dtmExercicio2.dtsCADFUNCIONARIO
      Enabled = False
      TabOrder = 0
    end
    object edtNOME_Funcionario: TDBEdit
      Left = 100
      Top = 41
      Width = 381
      Height = 21
      DataField = 'NOME'
      DataSource = dtmExercicio2.dtsCADFUNCIONARIO
      TabOrder = 1
    end
    object edtCPF: TDBEdit
      Left = 487
      Top = 41
      Width = 114
      Height = 21
      DataField = 'CPF'
      DataSource = dtmExercicio2.dtsCADFUNCIONARIO
      TabOrder = 2
    end
    object edtSALARIO: TDBEdit
      Left = 607
      Top = 41
      Width = 114
      Height = 21
      DataField = 'SALARIO'
      DataSource = dtmExercicio2.dtsCADFUNCIONARIO
      TabOrder = 3
    end
    object btnNovoFuncionario: TButton
      Left = 16
      Top = 79
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 4
      OnClick = btnNovoFuncionarioClick
    end
    object btnExcluirFuncionario: TButton
      Left = 97
      Top = 79
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 5
      OnClick = btnExcluirFuncionarioClick
    end
    object btnCancelarFuncionario: TButton
      Left = 178
      Top = 79
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 6
      OnClick = btnCancelarFuncionarioClick
    end
    object btnSalvarFuncionario: TButton
      Left = 259
      Top = 79
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 7
      OnClick = btnSalvarFuncionarioClick
    end
    object btnCalcularImpostos: TButton
      Left = 340
      Top = 79
      Width = 141
      Height = 25
      Caption = 'Calcular Impostos'
      TabOrder = 8
      OnClick = btnCalcularImpostosClick
    end
    object edtINSS: TEdit
      Left = 487
      Top = 83
      Width = 114
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 9
      Text = 'edtINSS'
    end
    object edtIR: TEdit
      Left = 607
      Top = 83
      Width = 114
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 10
      Text = 'edtIR'
    end
  end
  object pnlDetalhe: TPanel
    Left = 0
    Top = 207
    Width = 731
    Height = 248
    Align = alClient
    TabOrder = 1
    ExplicitLeft = -1
    ExplicitTop = 212
    object lblID_DEPENDENTE: TLabel
      Left = 13
      Top = 23
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object lblNOME_Dependente: TLabel
      Left = 97
      Top = 23
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object lblISCALCULAINSS: TLabel
      Left = 487
      Top = 23
      Width = 60
      Height = 13
      Caption = 'Calcula INSS'
    end
    object lblISCALCULAIR: TLabel
      Left = 607
      Top = 23
      Width = 48
      Height = 13
      Caption = 'Calcula IR'
    end
    object dbgDependentes: TDBGrid
      Left = 1
      Top = 94
      Width = 729
      Height = 153
      Align = alBottom
      DataSource = dtmExercicio2.dtsCADDEPENDENTE
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_DEPENDENTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Width = 495
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ISCALCULAIR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ISCALCULAINSS'
          Visible = True
        end>
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 729
      Height = 17
      Align = alTop
      Color = clGradientActiveCaption
      ParentBackground = False
      TabOrder = 1
      ExplicitLeft = 2
      ExplicitTop = 22
      ExplicitWidth = 801
      object lblDependentes: TLabel
        Left = 1
        Top = 1
        Width = 727
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'Dependentes'
        ExplicitWidth = 64
      end
    end
    object edtID_DEPENDENTE: TDBEdit
      Left = 13
      Top = 39
      Width = 78
      Height = 21
      DataField = 'ID_DEPENDENTE'
      DataSource = dtmExercicio2.dtsCADDEPENDENTE
      Enabled = False
      TabOrder = 2
    end
    object edtNOME_Dependente: TDBEdit
      Left = 97
      Top = 39
      Width = 384
      Height = 21
      DataField = 'NOME'
      DataSource = dtmExercicio2.dtsCADDEPENDENTE
      TabOrder = 3
    end
    object cmbISCALCULAINSS: TDBComboBox
      Left = 487
      Top = 39
      Width = 114
      Height = 21
      DataField = 'ISCALCULAINSS'
      DataSource = dtmExercicio2.dtsCADDEPENDENTE
      Items.Strings = (
        'SIM'
        'N'#195'O')
      TabOrder = 4
    end
    object cmbISCALCULAIR: TDBComboBox
      Left = 607
      Top = 39
      Width = 114
      Height = 21
      DataField = 'ISCALCULAIR'
      DataSource = dtmExercicio2.dtsCADDEPENDENTE
      Items.Strings = (
        'SIM'
        'N'#195'O')
      TabOrder = 5
    end
    object btnNovoDependente: TButton
      Left = 16
      Top = 66
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 6
      OnClick = btnNovoDependenteClick
    end
    object btnExcluirDependente: TButton
      Left = 97
      Top = 66
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 7
      OnClick = btnExcluirDependenteClick
    end
    object btnCancelarDependente: TButton
      Left = 178
      Top = 66
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 8
      OnClick = btnCancelarDependenteClick
    end
    object btnSalvarDependente: TButton
      Left = 259
      Top = 66
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 9
      OnClick = btnSalvarDependenteClick
    end
  end
end
