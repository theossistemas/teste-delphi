object FPrincipal: TFPrincipal
  Left = 230
  Top = 173
  Width = 928
  Height = 480
  Caption = 'Teste The'#242's '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 120
    Top = 48
    object Exerccios1: TMenuItem
      Caption = 'Exerc'#237'cios'
      object Exerccio11: TMenuItem
        Caption = 'Exerc'#237'cio 1'
        OnClick = Exerccio11Click
      end
      object Exerccio21: TMenuItem
        Caption = 'Exerc'#237'cio 2'
        OnClick = Exerccio21Click
      end
    end
  end
end
