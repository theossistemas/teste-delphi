object Form_Funcionario: TForm_Funcionario
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Funcionario'
  ClientHeight = 211
  ClientWidth = 474
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 474
    Height = 211
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 10
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 204
      Top = 10
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object Label3: TLabel
      Left = 10
      Top = 53
      Width = 32
      Height = 13
      Caption = 'Sal'#225'rio'
    end
    object Label_Impostos: TLabel
      Left = 116
      Top = 70
      Width = 114
      Height = 19
      Caption = 'IR: 00 INSS: 00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Edit_Nome: TEdit
      Left = 10
      Top = 24
      Width = 185
      Height = 21
      TabOrder = 0
    end
    object Edit_Cpf: TEdit
      Left = 204
      Top = 24
      Width = 150
      Height = 21
      NumbersOnly = True
      TabOrder = 1
    end
    object Edit_Salario: TEdit
      Left = 10
      Top = 68
      Width = 100
      Height = 21
      NumbersOnly = True
      TabOrder = 2
    end
    object Btn_Cadastrar: TButton
      Left = 388
      Top = 167
      Width = 75
      Height = 25
      Caption = 'Cadastrar'
      Enabled = False
      TabOrder = 4
      OnClick = Btn_CadastrarClick
    end
    object GroupBox1: TGroupBox
      Left = 10
      Top = 95
      Width = 453
      Height = 63
      Caption = 'Dependentes '
      TabOrder = 3
      object Label4: TLabel
        Left = 10
        Top = 15
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object Edit_nomeDependente: TEdit
        Left = 10
        Top = 29
        Width = 127
        Height = 21
        TabOrder = 0
      end
      object Btn_IncluirDependente: TButton
        Left = 368
        Top = 27
        Width = 75
        Height = 25
        Caption = 'Incluir'
        TabOrder = 3
        OnClick = Btn_IncluirDependenteClick
      end
      object Ch_CalculaIR: TCheckBox
        Left = 144
        Top = 33
        Width = 74
        Height = 17
        Caption = 'Calcula IR'
        TabOrder = 1
      end
      object Ch_CalculaInss: TCheckBox
        Left = 219
        Top = 33
        Width = 92
        Height = 17
        Caption = 'Calcula INSS'
        TabOrder = 2
      end
    end
    object Btn_CalcularImpostos: TButton
      Left = 282
      Top = 167
      Width = 100
      Height = 25
      Caption = 'Calcular Impostos'
      TabOrder = 5
      OnClick = Btn_CalcularImpostosClick
    end
  end
end
