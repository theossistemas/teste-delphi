inherited frmFuncionarios: TfrmFuncionarios
  BorderStyle = bsSizeable
  Caption = 'Theos - Cadastro de Funcion'#225'rios'
  ClientHeight = 511
  ClientWidth = 829
  Constraints.MinHeight = 550
  Constraints.MinWidth = 845
  ExplicitWidth = 845
  ExplicitHeight = 550
  PixelsPerInch = 96
  TextHeight = 16
  inherited pgcPrincipal: TPageControl
    Width = 829
    Height = 462
    ActivePage = tabManutencao
    ExplicitWidth = 829
    ExplicitHeight = 462
    inherited tabListagem: TTabSheet
      ExplicitWidth = 821
      ExplicitHeight = 431
      inherited pnlListagemTopo: TPanel
        Width = 821
        ExplicitWidth = 821
        inherited mskPequisar: TMaskEdit
          Width = 391
          ExplicitWidth = 391
        end
        inherited btnPesquisar: TBitBtn
          Left = 410
          Visible = True
          OnClick = btnPesquisarClick
          ExplicitLeft = 410
        end
      end
      inherited grdListagem: TDBGrid
        Width = 821
        Height = 379
        Hint = 'Duplo Click Para Editar Funcion'#225'rios'
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome'
            Width = 329
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SALARIO'
            Title.Caption = 'Sal'#225'rio'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INSS'
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IR'
            Width = 73
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitWidth = 821
      ExplicitHeight = 431
      inherited pnlManutencao: TPanel
        Width = 821
        Height = 431
        ExplicitWidth = 821
        ExplicitHeight = 431
        object pnlDependentes: TPanel
          Left = 0
          Top = 128
          Width = 821
          Height = 303
          Align = alClient
          TabOrder = 0
          object pnlCadastroDependentes: TPanel
            Left = 1
            Top = 1
            Width = 819
            Height = 113
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              819
              113)
            object Label7: TLabel
              Left = 6
              Top = 26
              Width = 33
              Height = 16
              Caption = 'Nome'
              FocusControl = edtDependenteNome
            end
            object btnDependenteGravar: TButton
              Left = 724
              Top = 73
              Width = 86
              Height = 32
              Hint = 'Grava Altera'#231#245'es de Dependentes no Banco'
              Anchors = [akTop, akRight]
              Caption = 'Gravar'
              HotImageIndex = 13
              ImageIndex = 13
              Images = dmGeral.imgBarraCon
              TabOrder = 7
              OnClick = btnDependenteGravarClick
            end
            object btnDependenteApagar: TButton
              Left = 635
              Top = 73
              Width = 86
              Height = 32
              Hint = 'Deleta Dependente'
              Anchors = [akTop, akRight]
              Caption = 'Apagar'
              HotImageIndex = 2
              ImageIndex = 2
              Images = dmGeral.imgBarraCon
              TabOrder = 6
              OnClick = btnDependenteApagarClick
            end
            object Panel4: TPanel
              Left = 0
              Top = 0
              Width = 819
              Height = 22
              Align = alTop
              BevelOuter = bvNone
              Caption = 'Dependentes'
              Color = 16771481
              ParentBackground = False
              TabOrder = 8
            end
            object edtDependenteNome: TDBEdit
              Left = 6
              Top = 44
              Width = 804
              Height = 24
              Anchors = [akLeft, akTop, akRight]
              CharCase = ecUpperCase
              DataField = 'NOME'
              DataSource = dtsDependentes
              TabOrder = 0
            end
            object btnDependenteNovo: TButton
              Left = 369
              Top = 73
              Width = 86
              Height = 32
              Hint = 'Cadastra Novo Dependente'
              Anchors = [akTop, akRight]
              Caption = 'Novo'
              HotImageIndex = 0
              ImageIndex = 0
              Images = dmGeral.imgBarraCon
              TabOrder = 3
              OnClick = btnDependenteNovoClick
            end
            object btnDependenteAlterar: TButton
              Left = 458
              Top = 73
              Width = 86
              Height = 32
              Hint = 'Altera Dependente'
              Anchors = [akTop, akRight]
              Caption = 'Alterar'
              HotImageIndex = 1
              ImageIndex = 1
              Images = dmGeral.imgBarraCon
              TabOrder = 4
              OnClick = btnDependenteAlterarClick
            end
            object chkDependenteINSS: TDBCheckBox
              Left = 6
              Top = 80
              Width = 97
              Height = 17
              Caption = 'Calcular INSS'
              DataField = 'CALCULARINSS'
              DataSource = dtsDependentes
              TabOrder = 1
              OnClick = chkDependenteINSSClick
            end
            object chkDependenteIR: TDBCheckBox
              Left = 138
              Top = 80
              Width = 97
              Height = 17
              Caption = 'Calcular IR'
              DataField = 'CALCULARIR'
              DataSource = dtsDependentes
              TabOrder = 2
              OnClick = chkDependenteIRClick
            end
            object btnDependenteCancelar: TButton
              Left = 546
              Top = 73
              Width = 86
              Height = 32
              Hint = 'Cancela Altera'#231'oes Dependente'
              Anchors = [akTop, akRight]
              Caption = 'Cancelar'
              HotImageIndex = 14
              ImageIndex = 14
              Images = dmGeral.imgBarraCon
              TabOrder = 5
              OnClick = btnDependenteCancelarClick
            end
          end
          object pnlGridDependentes: TPanel
            Left = 1
            Top = 114
            Width = 819
            Height = 188
            Align = alClient
            TabOrder = 1
            object grdDependentes: TDBGrid
              Left = 1
              Top = 1
              Width = 817
              Height = 186
              Hint = 'Duplo Click Para Editar Dependentes'
              Align = alClient
              DataSource = dtsDependentes
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -13
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnColEnter = grdDependentesColEnter
              OnDrawColumnCell = grdDependentesDrawColumnCell
              OnDblClick = grdDependentesDblClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CODIGO'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'NOME'
                  Width = 464
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CALCULARINSS'
                  Title.Caption = 'CALCULAR INSS'
                  Width = 103
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CALCULARIR'
                  Title.Caption = 'CALCULAR IR'
                  Width = 85
                  Visible = True
                end>
            end
          end
        end
        object pnlDadosFuncionario: TPanel
          Left = 0
          Top = 0
          Width = 821
          Height = 128
          Align = alTop
          TabOrder = 1
          DesignSize = (
            821
            128)
          object Label1: TLabel
            Left = 7
            Top = 27
            Width = 44
            Height = 16
            Caption = 'C'#243'digo:'
          end
          object Label2: TLabel
            Left = 132
            Top = 27
            Width = 38
            Height = 16
            Caption = 'Nome:'
          end
          object Label3: TLabel
            Left = 7
            Top = 78
            Width = 27
            Height = 16
            Caption = 'CPF:'
          end
          object Label4: TLabel
            Left = 135
            Top = 78
            Width = 45
            Height = 16
            Caption = 'Sal'#225'rio:'
          end
          object Label5: TLabel
            Left = 265
            Top = 78
            Width = 33
            Height = 16
            Caption = 'INSS:'
          end
          object Label6: TLabel
            Left = 388
            Top = 78
            Width = 17
            Height = 16
            Caption = 'IR:'
          end
          object DBEdit1: TDBEdit
            Left = 7
            Top = 45
            Width = 121
            Height = 24
            DataField = 'Codigo'
            DataSource = dtsListagem
            Enabled = False
            ReadOnly = True
            TabOrder = 0
          end
          object dbeNome: TDBEdit
            Left = 132
            Top = 45
            Width = 679
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            DataField = 'Nome'
            DataSource = dtsListagem
            TabOrder = 1
          end
          object dbeCPF: TDBEdit
            Left = 7
            Top = 93
            Width = 121
            Height = 24
            DataField = 'CPF'
            DataSource = dtsListagem
            TabOrder = 2
          end
          object dbeSalario: TDBEdit
            Left = 132
            Top = 93
            Width = 121
            Height = 24
            DataField = 'Salario'
            DataSource = dtsListagem
            TabOrder = 3
          end
          object dbeINSS: TDBEdit
            Left = 261
            Top = 93
            Width = 121
            Height = 24
            DataField = 'INSS'
            DataSource = dtsListagem
            Enabled = False
            ReadOnly = True
            TabOrder = 4
          end
          object dbeIR: TDBEdit
            Left = 388
            Top = 93
            Width = 121
            Height = 24
            DataField = 'IR'
            DataSource = dtsListagem
            Enabled = False
            ReadOnly = True
            TabOrder = 5
          end
          object Panel1: TPanel
            Left = 1
            Top = 1
            Width = 819
            Height = 22
            Align = alTop
            BevelOuter = bvNone
            Caption = 'Funcion'#225'rios'
            Color = 16771481
            ParentBackground = False
            TabOrder = 6
          end
        end
      end
    end
  end
  inherited pnlRodape: TPanel
    Top = 462
    Width = 829
    ExplicitTop = 462
    ExplicitWidth = 829
    inherited btnAlterar: TBitBtn
      Left = 99
      Width = 99
      ExplicitLeft = 99
      ExplicitWidth = 99
    end
    inherited btnApagar: TBitBtn
      Left = 396
      Width = 99
      ExplicitLeft = 396
      ExplicitWidth = 99
    end
    inherited btnCancelar: TBitBtn
      Left = 198
      Width = 99
      ExplicitLeft = 198
      ExplicitWidth = 99
    end
    inherited btnFechar: TBitBtn
      Left = 747
      ExplicitLeft = 747
    end
    inherited btnGravar: TBitBtn
      Left = 297
      Width = 99
      ExplicitLeft = 297
      ExplicitWidth = 99
    end
    inherited btnNovo: TBitBtn
      Width = 99
      ExplicitWidth = 99
    end
  end
  inherited dtsListagem: TDataSource
    DataSet = cdsListagem
    Left = 580
    Top = 40
  end
  inherited cdsListagem: TClientDataSet
    AfterOpen = cdsListagemAfterOpen
    AfterScroll = cdsListagemAfterScroll
    Left = 468
    Top = 40
  end
  object cdsDependente: TClientDataSet
    Aggregates = <>
    Params = <>
    OnNewRecord = cdsDependenteNewRecord
    Left = 672
    Top = 325
  end
  object dtsDependentes: TDataSource
    DataSet = cdsDependente
    OnStateChange = dtsDependentesStateChange
    OnDataChange = dtsDependentesDataChange
    Left = 747
    Top = 325
  end
end
