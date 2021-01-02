object ViewDependenteFicha: TViewDependenteFicha
  Left = 0
  Top = 0
  Caption = 'ViewDependenteFicha'
  ClientHeight = 223
  ClientWidth = 586
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
    Left = 20
    Top = 10
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel
    Left = 20
    Top = 50
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Panel1: TPanel
    Left = 0
    Top = 182
    Width = 586
    Height = 41
    Align = alBottom
    TabOrder = 4
    DesignSize = (
      586
      41)
    object BtnSalvar: TButton
      Left = 419
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Salvar'
      TabOrder = 0
    end
    object BtnCancelar: TButton
      Left = 500
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Cancelar'
      TabOrder = 1
    end
  end
  object EdtCodigo: TEdit
    Left = 20
    Top = 23
    Width = 100
    Height = 21
    TabStop = False
    Alignment = taRightJustify
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 0
    Text = 'EDTCODIGO'
  end
  object EdtNome: TEdit
    Left = 20
    Top = 65
    Width = 553
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
    Text = 'EDTNOME'
  end
  object CbCalculaIR: TCheckBox
    Left = 20
    Top = 104
    Width = 97
    Height = 17
    Caption = 'Calcula IR'
    TabOrder = 2
  end
  object CbCalculaINSS: TCheckBox
    Left = 20
    Top = 144
    Width = 97
    Height = 17
    Caption = 'Calcula INSS'
    TabOrder = 3
  end
end
