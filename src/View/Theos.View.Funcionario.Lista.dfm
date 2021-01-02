object ViewFuncionarioLista: TViewFuncionarioLista
  Left = 0
  Top = 0
  Caption = 'ViewFuncionarioLista'
  ClientHeight = 326
  ClientWidth = 609
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 609
    Height = 326
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 152
    ExplicitTop = 112
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 609
      Height = 24
      Align = alTop
      Caption = 'Funcion'#225'rios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 129
    end
    object DBGridPrincipal: TDBGrid
      Left = 0
      Top = 24
      Width = 609
      Height = 261
      Align = alClient
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
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
          FieldName = 'CPF'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SALARIO'
          Title.Alignment = taRightJustify
          Title.Caption = 'Sal'#225'rio'
          Width = 100
          Visible = True
        end>
    end
    object PnlBotton: TPanel
      Left = 0
      Top = 285
      Width = 609
      Height = 41
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 541
      DesignSize = (
        609
        41)
      object BtnInserir: TSpeedButton
        Left = 360
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&Inserir'
      end
      object BtnAlterar: TSpeedButton
        Left = 441
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&Alterar'
      end
      object BtnExcluir: TSpeedButton
        Left = 522
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&Excluir'
      end
    end
  end
end
