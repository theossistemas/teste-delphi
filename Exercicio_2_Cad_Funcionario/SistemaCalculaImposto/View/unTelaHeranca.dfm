inherited frmTelaHeranca: TfrmTelaHeranca
  BorderStyle = bsDialog
  Caption = 'Informe aqui o T'#237'tulo'
  ClientHeight = 321
  ClientWidth = 719
  Constraints.MinHeight = 350
  Constraints.MinWidth = 725
  Position = poScreenCenter
  OnShow = FormShow
  ExplicitWidth = 725
  ExplicitHeight = 350
  PixelsPerInch = 96
  TextHeight = 16
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 719
    Height = 272
    ActivePage = tabListagem
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object tabListagem: TTabSheet
      Caption = 'Listagem'
      object pnlListagemTopo: TPanel
        Left = 0
        Top = 0
        Width = 711
        Height = 52
        Align = alTop
        Color = 16774870
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          711
          52)
        object lblIndice: TLabel
          Left = 13
          Top = 0
          Width = 50
          Height = 16
          Caption = 'Pesquisa'
        end
        object mskPequisar: TMaskEdit
          Left = 13
          Top = 19
          Width = 321
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Text = ''
          TextHint = 'Digite Sua Pesquisa'
          OnChange = mskPequisarChange
        end
        object btnPesquisar: TBitBtn
          Left = 340
          Top = 17
          Width = 117
          Height = 30
          Hint = 'Pesquisar'
          Anchors = [akTop, akRight]
          Caption = '&Pesquisar'
          HotImageIndex = 18
          ImageIndex = 18
          Images = dmGeral.imgBarraCon
          TabOrder = 1
          Visible = False
        end
      end
      object grdListagem: TDBGrid
        Left = 0
        Top = 52
        Width = 711
        Height = 189
        Align = alClient
        DataSource = dtsListagem
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = grdListagemDrawColumnCell
        OnDblClick = grdListagemDblClick
        OnTitleClick = grdListagemTitleClick
      end
    end
    object tabManutencao: TTabSheet
      Caption = 'Manuten'#231#227'o'
      ImageIndex = 1
      object pnlManutencao: TPanel
        Left = 0
        Top = 0
        Width = 711
        Height = 241
        Align = alClient
        BevelOuter = bvNone
        Color = 16774870
        Ctl3D = True
        ParentBackground = False
        ParentCtl3D = False
        TabOrder = 0
      end
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 272
    Width = 719
    Height = 49
    Align = alBottom
    BevelEdges = []
    BevelOuter = bvNone
    Color = 16774870
    ParentBackground = False
    TabOrder = 1
    object btnAlterar: TBitBtn
      Left = 92
      Top = 0
      Width = 92
      Height = 49
      Hint = 'Altera'#231#227'o de Cadastro'
      Align = alLeft
      Caption = '&Alterar'
      HotImageIndex = 1
      ImageIndex = 1
      Images = dmGeral.imgBarraCon
      TabOrder = 0
      OnClick = btnAlterarClick
    end
    object btnApagar: TBitBtn
      Left = 368
      Top = 0
      Width = 92
      Height = 49
      Hint = 'Excluir Registro do Banco de Dados'
      Align = alLeft
      Caption = 'Apaga&r'
      HotImageIndex = 2
      ImageIndex = 2
      Images = dmGeral.imgBarraCon
      PressedImageIndex = 4
      SelectedImageIndex = 4
      TabOrder = 1
      OnClick = btnApagarClick
    end
    object btnCancelar: TBitBtn
      Left = 184
      Top = 0
      Width = 92
      Height = 49
      Hint = 'Cancelar Altera'#231#227'o'
      Align = alLeft
      Caption = '&Cancelar'
      HotImageIndex = 14
      ImageIndex = 14
      Images = dmGeral.imgBarraCon
      TabOrder = 2
      OnClick = btnCancelarClick
    end
    object btnFechar: TBitBtn
      Left = 637
      Top = 0
      Width = 82
      Height = 49
      Hint = 'Fechar Tela'
      Align = alRight
      Caption = '&Fechar'
      HotImageIndex = 5
      ImageIndex = 5
      Images = dmGeral.imgBarraCon
      TabOrder = 3
      OnClick = btnFecharClick
    end
    object btnGravar: TBitBtn
      Left = 276
      Top = 0
      Width = 92
      Height = 49
      Hint = 'Salvar no Banco de Dados'
      Align = alLeft
      Caption = '&Gravar'
      HotImageIndex = 13
      ImageIndex = 13
      Images = dmGeral.imgBarraCon
      TabOrder = 4
      OnClick = btnGravarClick
    end
    object btnNovo: TBitBtn
      Left = 0
      Top = 0
      Width = 92
      Height = 49
      Hint = 'Novo Cadastro'
      Align = alLeft
      Caption = '&Novo'
      HotImageIndex = 0
      ImageIndex = 0
      Images = dmGeral.imgBarraCon
      TabOrder = 5
      OnClick = btnNovoClick
    end
  end
  object dtsListagem: TDataSource
    Left = 532
    Top = 24
  end
  object cdsListagem: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 476
    Top = 24
  end
end
