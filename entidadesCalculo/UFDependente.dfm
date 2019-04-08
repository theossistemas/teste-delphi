inherited frmDependente: TfrmDependente
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  inherited panBody: TPanel
    ExplicitTop = 63
    object Label1: TLabel [0]
      Left = 32
      Top = 25
      Width = 36
      Height = 17
      Caption = 'Nome'
    end
    inherited panBottom: TPanel
      object btn5: TButton
        AlignWithMargins = True
        Left = 653
        Top = 5
        Width = 110
        Height = 40
        Cursor = crHandPoint
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 10
        Margins.Bottom = 5
        Action = actConfirmar
        Align = alRight
        TabOrder = 0
      end
    end
    object edtNome: TEdit
      Left = 32
      Top = 48
      Width = 473
      Height = 25
      TabOrder = 1
    end
    object chkIR: TCheckBox
      Left = 32
      Top = 96
      Width = 113
      Height = 17
      Cursor = crHandPoint
      Caption = 'Calcular IR'
      TabOrder = 2
    end
    object chkINSS: TCheckBox
      Left = 32
      Top = 119
      Width = 113
      Height = 26
      Cursor = crHandPoint
      Caption = 'Calcular INSS'
      TabOrder = 3
    end
  end
  inherited actionList: TActionList
    object actConfirmar: TAction
      Caption = 'Confirmar'
      OnExecute = actConfirmarExecute
    end
  end
end
