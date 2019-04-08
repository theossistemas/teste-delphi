object frmTemplate: TfrmTemplate
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 532
  ClientWidth = 773
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 17
  object panHeader: TPanel
    Left = 0
    Top = 0
    Width = 773
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Color = 15395562
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      773
      57)
    object lblTitle: TLabel
      Left = 32
      Top = 15
      Width = 133
      Height = 30
      Caption = 'DEPENDENTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblBack: TLabel
      Left = 727
      Top = 23
      Width = 34
      Height = 17
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Voltar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16744448
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = lblBackClick
    end
  end
  object panBody: TPanel
    Left = 0
    Top = 57
    Width = 773
    Height = 475
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object panBottom: TPanel
      Left = 0
      Top = 425
      Width = 773
      Height = 50
      Align = alBottom
      BevelOuter = bvNone
      Color = 4868682
      ParentBackground = False
      TabOrder = 0
    end
  end
  object actionList: TActionList
    Left = 440
    Top = 153
    object actBack: TAction
      Category = 'Template'
      Caption = 'Voltar'
      OnExecute = actBackExecute
    end
  end
end
