object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Teste The'#243's'
  ClientHeight = 690
  ClientWidth = 1018
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mmnPrincipal
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object mmnPrincipal: TMainMenu
    Left = 24
    Top = 16
    object mnuExercicios: TMenuItem
      Caption = '&Exerc'#237'cios'
      object mniExercicio1: TMenuItem
        Caption = 'Exerc'#237'cio 1 - Calculadora'
        OnClick = mniExercicio1Click
      end
      object mniExercicio2: TMenuItem
        Caption = 'Exerc'#237'cio 2 - Entidades de C'#225'lculo'
        OnClick = mniExercicio2Click
      end
    end
  end
end
