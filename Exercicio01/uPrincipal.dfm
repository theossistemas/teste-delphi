object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  ActiveControl = EdtVlr01
  BorderStyle = bsSingle
  Caption = 'Calculadora'
  ClientHeight = 380
  ClientWidth = 667
  Color = clBtnFace
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 59
    Top = 27
    Width = 33
    Height = 13
    Caption = 'Valor 1'
  end
  object lblVlr2: TLabel
    Left = 59
    Top = 54
    Width = 33
    Height = 13
    Caption = 'Valor 2'
  end
  object Label2: TLabel
    Left = 45
    Top = 83
    Width = 47
    Height = 13
    Caption = 'Opera'#231#227'o'
  end
  object Label3: TLabel
    Left = 44
    Top = 112
    Width = 48
    Height = 13
    Caption = 'Resultado'
  end
  object Label4: TLabel
    Left = 17
    Top = 184
    Width = 75
    Height = 13
    Caption = 'Base de C'#225'lculo'
  end
  object MmoHistorico: TMemo
    Left = 232
    Top = 24
    Width = 417
    Height = 259
    TabStop = False
    Color = cl3DLight
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object EdtVlr01: TEdit
    Left = 98
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object EdtVlr02: TEdit
    Left = 98
    Top = 51
    Width = 121
    Height = 21
    Hint = 'Pressione Enter para realizar a '#250'ltima opera'#231#227'o'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object EdtResultado: TEdit
    Left = 98
    Top = 109
    Width = 121
    Height = 21
    TabStop = False
    Color = clMoneyGreen
    ReadOnly = True
    TabOrder = 3
  end
  object BtnSomar: TButton
    Left = 96
    Top = 78
    Width = 17
    Height = 25
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = BtnSomarClick
  end
  object BtnSubtrair: TButton
    Left = 119
    Top = 78
    Width = 17
    Height = 25
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = BtnSubtrairClick
  end
  object BtnDividir: TButton
    Left = 142
    Top = 78
    Width = 17
    Height = 25
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = BtnDividirClick
  end
  object BtnMultiplicar: TButton
    Left = 165
    Top = 78
    Width = 17
    Height = 25
    Caption = 'x'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = BtnMultiplicarClick
  end
  object BtnIgual: TButton
    Left = 188
    Top = 78
    Width = 31
    Height = 25
    Hint = 'Repete a '#250'ltima opera'#231#227'o realizada'
    Caption = '='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = BtnIgualClick
  end
  object BtnLimpar: TButton
    Left = 98
    Top = 136
    Width = 121
    Height = 25
    Caption = 'Limpar'
    TabOrder = 9
    OnClick = BtnLimparClick
  end
  object EdtImpA: TEdit
    Left = 98
    Top = 208
    Width = 121
    Height = 21
    TabStop = False
    Color = clMoneyGreen
    ReadOnly = True
    TabOrder = 10
  end
  object EdtImpB: TEdit
    Left = 98
    Top = 235
    Width = 121
    Height = 21
    TabStop = False
    Color = clMoneyGreen
    ReadOnly = True
    TabOrder = 11
  end
  object EdtImpC: TEdit
    Left = 98
    Top = 262
    Width = 121
    Height = 21
    TabStop = False
    Color = clMoneyGreen
    ReadOnly = True
    TabOrder = 12
  end
  object EdtBaseCalc: TEdit
    Left = 98
    Top = 181
    Width = 121
    Height = 21
    TabOrder = 13
    OnExit = EdtBaseCalcExit
  end
  object BtnImpA: TButton
    Left = 17
    Top = 208
    Width = 75
    Height = 21
    Caption = 'Imposto A'
    TabOrder = 14
    OnClick = BtnImpAClick
  end
  object BtnImpB: TButton
    Left = 17
    Top = 235
    Width = 75
    Height = 21
    Caption = 'Imposto B'
    TabOrder = 15
    OnClick = BtnImpBClick
  end
  object BtnImpC: TButton
    Left = 17
    Top = 262
    Width = 75
    Height = 21
    Caption = 'Imposto C'
    TabOrder = 16
    OnClick = BtnImpCClick
  end
  object BtnLimparHistorico: TButton
    Left = 574
    Top = 297
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 18
    OnClick = BtnLimparHistoricoClick
  end
  object BtnCalcularImpostos: TButton
    Left = 98
    Top = 289
    Width = 121
    Height = 25
    Caption = 'Calcular Impostos'
    TabOrder = 17
    OnClick = BtnCalcularImpostosClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 339
    Width = 667
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 19
    object BtnSair: TButton
      Left = 574
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 0
      OnClick = BtnSairClick
    end
  end
end
