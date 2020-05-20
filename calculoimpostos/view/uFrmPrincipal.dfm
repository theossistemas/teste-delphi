object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = '.: C'#225'lculo Impostos :.'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = menu
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object menu: TMainMenu
    Left = 280
    Top = 96
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Funcionario: TMenuItem
        Caption = 'Funcion'#225'rio'
        OnClick = FuncionarioClick
      end
    end
    object Impostos1: TMenuItem
      Caption = 'Impostos'
      object ClculodeImpostos1: TMenuItem
        Caption = 'C'#225'lculo de Impostos'
        OnClick = ClculodeImpostos1Click
      end
    end
  end
end
