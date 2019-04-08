inherited frmFuncionario: TfrmFuncionario
  Align = alClient
  Caption = 'frmFuncionario'
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  inherited panHeader: TPanel
    inherited lblTitle: TLabel
      Width = 148
      Caption = 'FUNCION'#193'RIO'
      ExplicitWidth = 148
    end
  end
  inherited panBody: TPanel
    ExplicitTop = 63
    object Label1: TLabel [0]
      Left = 32
      Top = 6
      Width = 21
      Height = 17
      Caption = 'CPF'
    end
    object Label2: TLabel [1]
      Left = 32
      Top = 65
      Width = 36
      Height = 17
      Caption = 'Nome'
    end
    object Label3: TLabel [2]
      Left = 32
      Top = 127
      Width = 40
      Height = 17
      Caption = 'Sal'#225'rio'
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
      Top = 88
      Width = 473
      Height = 25
      TabOrder = 2
    end
    object edtCPF: TMaskEdit
      Left = 32
      Top = 32
      Width = 121
      Height = 25
      EditMask = '000.000.000-00;1;_'
      MaxLength = 14
      TabOrder = 1
      Text = '   .   .   -  '
    end
    object edtSalario: TEdit
      Left = 32
      Top = 150
      Width = 121
      Height = 25
      NumbersOnly = True
      TabOrder = 3
    end
  end
  inherited actionList: TActionList
    Left = 536
    Top = 209
    object actConfirmar: TAction
      Category = 'Template'
      Caption = 'Confirmar'
      OnExecute = actConfirmarExecute
    end
  end
end
