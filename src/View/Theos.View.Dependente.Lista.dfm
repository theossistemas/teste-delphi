object ViewDependenteLista: TViewDependenteLista
  Left = 0
  Top = 0
  Caption = 'ViewDependenteLista'
  ClientHeight = 275
  ClientWidth = 520
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 520
    Height = 24
    Align = alTop
    Caption = 'Dependentes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 133
  end
  object PnlBotton: TPanel
    Left = 0
    Top = 234
    Width = 520
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      520
      41)
    object BtnInserir: TSpeedButton
      Left = 271
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Inserir'
      ExplicitLeft = 360
    end
    object BtnAlterar: TSpeedButton
      Left = 352
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Alterar'
      ExplicitLeft = 441
    end
    object BtnExcluir: TSpeedButton
      Left = 433
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Excluir'
      ExplicitLeft = 522
    end
  end
  object DBGridPrincipal: TDBGrid
    Left = 0
    Top = 24
    Width = 520
    Height = 210
    Align = alClient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_CALCULA_IR'
        Title.Alignment = taCenter
        Title.Caption = 'Calcula IR'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_CALCULA_INSS'
        Title.Alignment = taCenter
        Title.Caption = 'Calcula INSS'
        Width = 100
        Visible = True
      end>
  end
  object CbCalculaIR: TDBCheckBox
    Left = 283
    Top = 67
    Width = 95
    Height = 16
    DataField = 'IS_CALCULA_IR'
    ReadOnly = True
    TabOrder = 2
    ValueChecked = 'Sim'
    ValueUnchecked = 'N'#227'o'
    Visible = False
  end
  object CbCalculaINSS: TDBCheckBox
    Left = 384
    Top = 67
    Width = 95
    Height = 16
    DataField = 'IS_CALCULA_INSS'
    ReadOnly = True
    TabOrder = 3
    ValueChecked = 'Sim'
    ValueUnchecked = 'N'#227'o'
    Visible = False
  end
end
