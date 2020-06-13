object frmFuncionario: TfrmFuncionario
  Left = 0
  Top = 0
  Caption = 'Entidade de Calculo'
  ClientHeight = 545
  ClientWidth = 832
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnExecutar: TButton
    Left = 621
    Top = 8
    Width = 204
    Height = 43
    Caption = 'Executar fun'#231#245'es'
    TabOrder = 0
    OnClick = btnExecutarClick
  end
  object memObs: TMemo
    Left = 8
    Top = 8
    Width = 607
    Height = 529
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Courier'
    Font.Style = []
    Lines.Strings = (
      'memObs')
    ParentFont = False
    TabOrder = 1
  end
end
