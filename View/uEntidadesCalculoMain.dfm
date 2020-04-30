object frmEntidadesCalculoMain: TfrmEntidadesCalculoMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro de Funcion'#225'rio'
  ClientHeight = 294
  ClientWidth = 443
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCadastro: TPanel
    Left = 0
    Top = 0
    Width = 363
    Height = 294
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 56
      Width = 32
      Height = 13
      Caption = 'Sal'#225'rio'
    end
    object LogradouroLabel: TLabel
      Left = 21
      Top = 32
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object Nome: TLabel
      Left = 13
      Top = 8
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label3: TLabel
      Left = 190
      Top = 32
      Width = 23
      Height = 13
      Caption = 'INSS'
    end
    object Label4: TLabel
      Left = 199
      Top = 56
      Width = 11
      Height = 13
      Caption = 'IR'
    end
    object edtSalario: TMaskEdit
      Left = 46
      Top = 53
      Width = 115
      Height = 21
      TabOrder = 2
      Text = ''
    end
    object edtCPF: TMaskEdit
      Left = 46
      Top = 29
      Width = 115
      Height = 21
      TabOrder = 1
      Text = ''
    end
    object edtNomeFuncionario: TMaskEdit
      Left = 46
      Top = 5
      Width = 246
      Height = 21
      TabOrder = 0
      Text = ''
    end
    object groupDependentes: TGroupBox
      Left = 1
      Top = 76
      Width = 361
      Height = 217
      Align = alBottom
      Caption = 'Dependentes '
      TabOrder = 3
      object Label2: TLabel
        Left = 12
        Top = 19
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object edtNomeDependente: TMaskEdit
        Left = 45
        Top = 16
        Width = 246
        Height = 21
        TabOrder = 0
        Text = ''
      end
      object cbINSS: TCheckBox
        Left = 45
        Top = 39
        Width = 97
        Height = 17
        Caption = 'Calcular INSS'
        TabOrder = 1
      end
      object cbIR: TCheckBox
        Left = 132
        Top = 39
        Width = 70
        Height = 17
        Caption = 'Calcular IR'
        TabOrder = 2
      end
      object btnAdicionarDependente: TButton
        Left = 292
        Top = 14
        Width = 65
        Height = 25
        Caption = 'Adicionar'
        TabOrder = 3
        OnClick = btnAdicionarDependenteClick
      end
      object listDependente: TListBox
        Left = 45
        Top = 60
        Width = 246
        Height = 146
        TabStop = False
        ItemHeight = 13
        TabOrder = 4
      end
    end
    object edtINSS: TMaskEdit
      Left = 216
      Top = 29
      Width = 76
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 4
      Text = ''
    end
    object edtIR: TMaskEdit
      Left = 216
      Top = 53
      Width = 76
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 5
      Text = ''
    end
  end
  object Panel2: TPanel
    Left = 363
    Top = 0
    Width = 80
    Height = 294
    Align = alRight
    TabOrder = 1
    object btnCancelar: TButton
      Left = 2
      Top = 29
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
    object btnSalvar: TButton
      Left = 2
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 2
      OnClick = btnSalvarClick
    end
    object btnNovo: TButton
      Left = 2
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnINSS: TButton
      Left = 2
      Top = 83
      Width = 75
      Height = 25
      Caption = 'Calcular INSS'
      TabOrder = 3
      OnClick = btnINSSClick
    end
    object btnIR: TButton
      Left = 2
      Top = 110
      Width = 75
      Height = 25
      Caption = 'Calcular IR'
      TabOrder = 4
      OnClick = btnIRClick
    end
  end
end
