object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 692
  ClientWidth = 889
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
  object panHeader: TPanel
    Left = 0
    Top = 0
    Width = 889
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    Color = 4868682
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 137
      Top = 5
      Width = 328
      Height = 30
      Caption = 'Exerc'#237'cio 2 - Entidades de C'#225'lculo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblVersao: TLabel
      Left = 137
      Top = 40
      Width = 43
      Height = 17
      Caption = 'v0.0.0.1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 14211288
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object panBody: TPanel
    Left = 0
    Top = 73
    Width = 889
    Height = 619
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object panGeral: TPanel
      Left = 0
      Top = 0
      Width = 889
      Height = 619
      Align = alClient
      TabOrder = 0
      ExplicitTop = 6
      object lbl3: TLabel
        Left = 32
        Top = 6
        Width = 98
        Height = 21
        Caption = 'Funcion'#225'rios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl4: TLabel
        Left = 32
        Top = 239
        Width = 101
        Height = 21
        Caption = 'Dependentes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 32
        Top = 422
        Width = 110
        Height = 21
        Caption = 'Configura'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 72
        Top = 457
        Width = 86
        Height = 17
        Caption = 'Al'#237'quota IR (%)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 192
        Top = 457
        Width = 83
        Height = 17
        Caption = 'Dedu'#231#227'o Dep.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 312
        Top = 457
        Width = 79
        Height = 17
        Caption = 'Al'#237'quota INSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object btn1: TButton
        AlignWithMargins = True
        Left = 767
        Top = 33
        Width = 110
        Height = 40
        Cursor = crHandPoint
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 10
        Margins.Bottom = 5
        Action = actIncluirFunc
        TabOrder = 0
      end
      object Button1: TButton
        AlignWithMargins = True
        Left = 767
        Top = 83
        Width = 110
        Height = 40
        Cursor = crHandPoint
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 10
        Margins.Bottom = 5
        Action = actEditarFunc
        TabOrder = 1
      end
      object Button2: TButton
        AlignWithMargins = True
        Left = 767
        Top = 133
        Width = 110
        Height = 40
        Cursor = crHandPoint
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 10
        Margins.Bottom = 5
        Action = actExcluirFunc
        TabOrder = 2
      end
      object Button3: TButton
        AlignWithMargins = True
        Left = 767
        Top = 266
        Width = 110
        Height = 40
        Cursor = crHandPoint
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 10
        Margins.Bottom = 5
        Action = actIncluirDep
        TabOrder = 3
      end
      object Button4: TButton
        AlignWithMargins = True
        Left = 767
        Top = 316
        Width = 110
        Height = 40
        Cursor = crHandPoint
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 10
        Margins.Bottom = 5
        Action = actEditarDep
        TabOrder = 4
      end
      object Button5: TButton
        AlignWithMargins = True
        Left = 767
        Top = 366
        Width = 110
        Height = 40
        Cursor = crHandPoint
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 10
        Margins.Bottom = 5
        Action = actExcluirDep
        TabOrder = 5
      end
      object Button6: TButton
        AlignWithMargins = True
        Left = 767
        Top = 186
        Width = 110
        Height = 40
        Cursor = crHandPoint
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 10
        Margins.Bottom = 5
        Action = actCalcularFunc
        TabOrder = 6
      end
      object gridDependentes: TDBGrid
        AlignWithMargins = True
        Left = 72
        Top = 266
        Width = 657
        Height = 140
        Cursor = crHandPoint
        Margins.Left = 32
        Margins.Right = 20
        Margins.Bottom = 10
        DataSource = dsListDependentes
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 7
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'DEPENDENTE_ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FUNCIONARIO_ID'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IS_CALCULA_IR'
            Width = 117
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IS_CALCULA_INSS'
            Width = 109
            Visible = True
          end>
      end
      object gridFuncionarios: TDBGrid
        AlignWithMargins = True
        Left = 72
        Top = 33
        Width = 657
        Height = 193
        Cursor = crHandPoint
        Margins.Left = 32
        Margins.Right = 20
        Margins.Bottom = 10
        DataSource = dsListFuncionarios
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 8
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'FUNCIONARIO_ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SALARIO'
            Visible = True
          end>
      end
      object pnl1: TPanel
        Left = 1
        Top = 568
        Width = 887
        Height = 50
        Align = alBottom
        BevelOuter = bvNone
        Color = 4868682
        ParentBackground = False
        TabOrder = 9
        ExplicitLeft = 0
        ExplicitTop = 569
        ExplicitWidth = 889
        object btn5: TButton
          AlignWithMargins = True
          Left = 767
          Top = 5
          Width = 110
          Height = 40
          Cursor = crHandPoint
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 10
          Margins.Bottom = 5
          Action = actClose
          Align = alRight
          TabOrder = 0
          ExplicitLeft = 769
        end
      end
      object edtAliqIR: TEdit
        Left = 72
        Top = 480
        Width = 95
        Height = 21
        Alignment = taRightJustify
        MaxLength = 50
        NumbersOnly = True
        TabOrder = 10
        Text = '15'
      end
      object edtDedIR: TEdit
        Left = 192
        Top = 480
        Width = 95
        Height = 21
        Alignment = taRightJustify
        MaxLength = 50
        NumbersOnly = True
        TabOrder = 11
        Text = '100'
      end
      object edtAliqINSS: TEdit
        Left = 312
        Top = 480
        Width = 95
        Height = 21
        Alignment = taRightJustify
        MaxLength = 50
        NumbersOnly = True
        TabOrder = 12
        Text = '8'
      end
    end
  end
  object ActionList: TActionList
    Left = 272
    Top = 193
    object actIncluirFunc: TAction
      Category = 'Funcion'#225'rios'
      Caption = 'Incluir'
      OnExecute = actIncluirFuncExecute
    end
    object actExcluirFunc: TAction
      Category = 'Funcion'#225'rios'
      Caption = 'Excluir'
      OnExecute = actExcluirFuncExecute
    end
    object actEditarFunc: TAction
      Category = 'Funcion'#225'rios'
      Caption = 'Editar'
      OnExecute = actEditarFuncExecute
    end
    object actCalcularFunc: TAction
      Category = 'Funcion'#225'rios'
      Caption = 'Calcular'
      OnExecute = actCalcularFuncExecute
    end
    object actIncluirDep: TAction
      Category = 'Dependentes'
      Caption = 'Incluir'
      OnExecute = actIncluirDepExecute
    end
    object actEditarDep: TAction
      Category = 'Dependentes'
      Caption = 'Editar'
      OnExecute = actEditarDepExecute
    end
    object actExcluirDep: TAction
      Category = 'Dependentes'
      Caption = 'Excluir'
      OnExecute = actExcluirDepExecute
    end
    object actClose: TAction
      Caption = 'Sair'
      OnExecute = actCloseExecute
    end
  end
  object dsListFuncionarios: TDataSource
    DataSet = dmView.qryListFuncionarios
    Left = 440
    Top = 201
  end
  object dsListDependentes: TDataSource
    DataSet = dmView.qryListDependentes
    Left = 440
    Top = 265
  end
end
