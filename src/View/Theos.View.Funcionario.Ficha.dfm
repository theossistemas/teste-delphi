object ViewFuncionarioFicha: TViewFuncionarioFicha
  Left = 0
  Top = 0
  Caption = 'ViewFuncionarioFicha'
  ClientHeight = 230
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 20
    Top = 10
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel
    Left = 20
    Top = 50
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label3: TLabel
    Left = 20
    Top = 90
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object Label4: TLabel
    Left = 20
    Top = 130
    Width = 32
    Height = 13
    Caption = 'Sal'#225'rio'
  end
  object Label5: TLabel
    Left = 473
    Top = 90
    Width = 50
    Height = 13
    Caption = 'Valor INSS'
  end
  object Label6: TLabel
    Left = 473
    Top = 130
    Width = 38
    Height = 13
    Caption = 'Valor IR'
  end
  object Label7: TLabel
    Left = 367
    Top = 130
    Width = 37
    Height = 13
    Caption = 'Base IR'
  end
  object Panel1: TPanel
    Left = 0
    Top = 189
    Width = 584
    Height = 41
    Align = alBottom
    TabOrder = 4
    DesignSize = (
      584
      41)
    object BtnSalvar: TButton
      Left = 417
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Salvar'
      TabOrder = 0
    end
    object BtnCancelar: TButton
      Left = 498
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Cancelar'
      TabOrder = 1
    end
    object BtnListaDependentes: TButton
      Left = 24
      Top = 9
      Width = 206
      Height = 25
      Caption = 'Lista de Dependentes'
      TabOrder = 2
      TabStop = False
    end
  end
  object EdtCodigo: TEdit
    Left = 20
    Top = 25
    Width = 100
    Height = 21
    TabStop = False
    Alignment = taRightJustify
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 0
    Text = 'EDTCODIGO'
  end
  object EdtNome: TEdit
    Left = 20
    Top = 65
    Width = 553
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
    Text = 'EDTNOME'
  end
  object EdtCPF: TMaskEdit
    Left = 20
    Top = 105
    Width = 97
    Height = 21
    CharCase = ecUpperCase
    EditMask = '999\.999\.999\-99;0;_'
    MaxLength = 14
    TabOrder = 2
    Text = ''
  end
  object EdtSalario: TEdit
    Left = 20
    Top = 145
    Width = 100
    Height = 21
    Alignment = taRightJustify
    CharCase = ecUpperCase
    TabOrder = 3
    Text = 'EDTSALARIO'
  end
  object EdtValorINSS: TEdit
    Left = 473
    Top = 105
    Width = 100
    Height = 21
    TabStop = False
    Alignment = taRightJustify
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
    Text = 'EDTVALORINSS'
  end
  object EdtValorIR: TEdit
    Left = 473
    Top = 145
    Width = 100
    Height = 21
    TabStop = False
    Alignment = taRightJustify
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
    Text = 'EDTVALORIR'
  end
  object EdtBaseIR: TEdit
    Left = 367
    Top = 145
    Width = 100
    Height = 21
    TabStop = False
    Alignment = taRightJustify
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 7
    Text = 'EDTBASEIR'
  end
end
