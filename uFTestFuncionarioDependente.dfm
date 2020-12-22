object FTestFuncionarioDependente: TFTestFuncionarioDependente
  Left = 0
  Top = 0
  Caption = 'FTestFuncionarioDependente'
  ClientHeight = 495
  ClientWidth = 964
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 23
  object ednome: TLabeledEdit
    Left = 88
    Top = 136
    Width = 329
    Height = 31
    EditLabel.Width = 49
    EditLabel.Height = 23
    EditLabel.Caption = 'Nome'
    TabOrder = 0
  end
  object edsalario: TLabeledEdit
    Left = 88
    Top = 200
    Width = 105
    Height = 31
    EditLabel.Width = 56
    EditLabel.Height = 23
    EditLabel.Caption = 'Sal'#225'rio'
    TabOrder = 1
  end
  object eddependente: TLabeledEdit
    Left = 88
    Top = 296
    Width = 329
    Height = 31
    EditLabel.Width = 49
    EditLabel.Height = 23
    EditLabel.Caption = 'Nome'
    TabOrder = 2
  end
  object edcpf: TLabeledEdit
    Left = 88
    Top = 72
    Width = 185
    Height = 31
    EditLabel.Width = 31
    EditLabel.Height = 23
    EditLabel.Caption = 'CPF'
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 224
    Top = 184
    Width = 97
    Height = 47
    Caption = 'Classe'
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 327
    Top = 184
    Width = 90
    Height = 47
    Caption = 'Banco'
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object cbir: TCheckBox
    Left = 88
    Top = 344
    Width = 97
    Height = 17
    Caption = 'IR'
    TabOrder = 6
  end
  object cbinss: TCheckBox
    Left = 88
    Top = 367
    Width = 97
    Height = 17
    Caption = 'INSS'
    TabOrder = 7
  end
  object Button1: TButton
    Left = 216
    Top = 344
    Width = 97
    Height = 57
    Caption = 'Classe'
    TabOrder = 8
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 319
    Top = 344
    Width = 97
    Height = 57
    Caption = 'Banco'
    TabOrder = 9
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 440
    Top = 14
    Width = 505
    Height = 473
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 10
  end
  object btIR: TButton
    Left = 88
    Top = 424
    Width = 105
    Height = 57
    Caption = 'Calc IR'
    TabOrder = 11
    OnClick = btIRClick
  end
  object BitBtn3: TBitBtn
    Left = 223
    Top = 237
    Width = 90
    Height = 47
    Caption = 'Delete'
    TabOrder = 12
    OnClick = BitBtn3Click
  end
  object Button4: TButton
    Left = 327
    Top = 407
    Width = 97
    Height = 57
    Caption = 'Delete'
    TabOrder = 13
    OnClick = Button4Click
  end
end
