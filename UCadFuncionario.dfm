object FrmFuncionario: TFrmFuncionario
  Left = 0
  Top = 0
  Caption = 'Cadastro de Funcionario'
  ClientHeight = 534
  ClientWidth = 746
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 29
    Width = 147
    Height = 35
    Caption = 'Funcion'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 242
    Width = 154
    Height = 35
    Caption = 'Dependente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton
    Left = 135
    Top = 117
    Width = 23
    Height = 22
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000120B0000120B00000000000000000000FF00FF0481BF
      0082C10082C1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FF0082C169BBDE75D0F329A3DD0082C10082C10082C10082C10082C1FF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF0082C1219ACEB1E7FB56CBFA5DCCFA5CCBF854C5F333
      ABE228A3D90082C10082C10082C10082C10082C1FF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0082C10386C29AD8ED66CFF855C7
      F658C7F659CAF65CCBF75ECEFA5ECCFA59C7F64EC0EF2DA6DD229CD50082C100
      82C10082C10082C1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0082C124ADE1
      34A5D397E1FB52C6F657C7F657C7F657C7F657C7F658C7F658C9F65CCBF75ECC
      FA5FCEFA5DCBF858C9F435ADE32CA5DC0082C1FF00FFFF00FFFF00FFFF00FFFF
      00FF0082C144C6F30C8CC6BCEBFA57CBF75ACBF65ACBF65ACBF65ACBF65ACBF6
      5ACBF65ACBF65ACBF65BCBF65BCBF65DCEF662CFF844BBED5AC7F20082C1FF00
      FFFF00FFFF00FFFF00FF0082C149CCF70082C18BD3EB7EDCFB5DD0F660D0F660
      D0F660D0F660D0F660D0F660D0F660D0F660D0F65FD0F65FD0F760D1F741BAE9
      68D4F80082C1FF00FFFF00FFFF00FFFF00FF0082C14BCEF82AA4D71C97CCADED
      FC60D3F666D5F666D5F666D5F666D5F666D5F666D5F666D5F666D5F666D5F666
      D7F767D7F744BDE777E1FA51C2E90082C1FF00FFFF00FFFF00FF0082C14DCFFC
      44B1E10284C2C2F0FB6EDDF86ADAF76BDCF76BDCF76BDCF76BDCF76ADCF76ADC
      F76ADCF76ADCF76BDCF76BDDF848C2E77AE5FA6DDAF40082C1FF00FFFF00FFFF
      00FF0082C14FD3FF48B4E60082C179CCE79EEFFC6AE0F76DE0F76DE0F76EE0F7
      6EE0F76FE1F76FE1F76FE1F76FE1F76FE2F770E2F84DC7E97DE7FA81EDFB0082
      C1FF00FFFF00FFFF00FF0082C157D5FF4CB7EB2CA6DC088AC5C9F6FC7FEBFB7D
      EAFA7DEAFA79EAFA76E7F873E5F874E6F874E6F874E6F875E6F876E7F852CEE9
      81EEF88AF4FC68D9EE0082C1FF00FFFF00FF0082C175DDFF4FBAEF49B5EB0082
      C1ADE0F0C0EDF7BDEEF7C1F0F8C2F3FA8EEEF884EFFA7BEBF87DEAF87DEBF87D
      EBF87EEDFA59D3E989F3FA8FF7FB89F2FA0082C1FF00FFFF00FF0082C193E5FF
      52BDF44FBAF24DB6EF36A7E10082C10082C10082C10082C17BCBE7BAF0F8A6F6
      FC95EFFA91EEF892EEF895EFFA6ED5E9A5F6FAA4F6FAB1FEFE0082C1FF00FFFF
      00FF0082C1A6EFFF5AC6F456C2F256C2F356C1F253BFF054BFF054C0F031AAE0
      0284C22EA3D1CAEFF7CAF7FCBDF4FEB6F3FBB5F3FB8BD8EBC9FAFBC7FAFAD8FF
      FEA5E7F20082C1FF00FF0082C1A7F0FF63CFF65ECBF35ECBF35ECBF35ECBF25E
      CBF25ECBF25DCBF25CC9F232ACE0098BC687CFE7D3F2F8CCF4FBC9F4FCA3DDED
      F2FFFFF0FFFEFAFFFFF6FFFF0082C1FF00FF0082C1B2F6FF6AD8F666D4F366D4
      F366D4F366D4F366D4F366D4F366D4F366D4F365D3F33CB7E30082C11693CA86
      CEE9B0E1F097D1E7CEEAF4CFEAF3D4EDF4E0F0F70082C1FF00FF0082C1B4F8FF
      72E0F76DDCF46DDCF46DDCF46DDCF46DDCF66DDCF46BDCF46BDCF46CDCF46CDA
      F469D8F335B1DC0082C10082C10082C10082C10082C10082C10082C10082C1FF
      00FF0082C1CAFFFF76E7F876E3F776E3F776E3F776E3F775E3F679E7F87EEBFB
      7BEBFA7AEAFA79E9F877E9F876E6F877E7F780EEFB0082C1FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF0082C1D8FEFF95F7FC75EAF77AEDF77AEDF77AEDF77D
      EDF789EBF69FE7F4A0EBF6A3EDF7A5EFF7A4F0F89DF0FA96F0FB95F8FF0082C1
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0082C1D0FFFF8EFAFC89F8
      FB86F6FA84F6FB83F3F85CC4E00082C10082C10082C10082C10082C10082C100
      82C10082C10082C1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      0082C1AAEAF3A6EBF3AAEEF6B1F7FA9DEAF30082C1FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF0082C10082C10082C10082C10082C1FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    OnClick = SpeedButton1Click
  end
  object lbledtnomefunc: TLabeledEdit
    Left = 184
    Top = 121
    Width = 385
    Height = 21
    EditLabel.Width = 27
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome'
    TabOrder = 0
  end
  object lblcpf: TLabeledEdit
    Left = 8
    Top = 118
    Width = 121
    Height = 21
    EditLabel.Width = 17
    EditLabel.Height = 13
    EditLabel.Caption = 'Cpf'
    TabOrder = 1
  end
  object lbledtsalario: TLabeledEdit
    Left = 575
    Top = 121
    Width = 155
    Height = 21
    EditLabel.Width = 32
    EditLabel.Height = 13
    EditLabel.Caption = 'Sal'#225'rio'
    TabOrder = 2
  end
  object btnincluir: TButton
    Left = 8
    Top = 70
    Width = 121
    Height = 25
    Caption = 'Incluir'
    TabOrder = 3
    OnClick = btnincluirClick
  end
  object lbledtnomedependente: TLabeledEdit
    Left = 8
    Top = 299
    Width = 385
    Height = 21
    EditLabel.Width = 27
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome'
    TabOrder = 4
  end
  object chkboxiscalculair: TCheckBox
    Left = 408
    Top = 296
    Width = 161
    Height = 25
    Caption = 'Calcula IR ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object chkboxiscalculainss: TCheckBox
    Left = 575
    Top = 296
    Width = 161
    Height = 25
    Caption = 'Calcula INSS ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 366
    Width = 722
    Height = 161
    DataSource = DSDependente
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'cpf'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'iscalculoir'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'iscalculoinss'
        Visible = True
      end>
  end
  object btnincluirdependente: TButton
    Left = 8
    Top = 332
    Width = 121
    Height = 25
    Caption = 'Incluir Dependente'
    TabOrder = 8
    OnClick = btnincluirdependenteClick
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 148
    Width = 722
    Height = 88
    DataSource = DSFuncionario
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'cpf'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'salario'
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 8
    Top = 2
    Width = 425
    Height = 25
    Caption = 'Persistir Dados no Banco de Dados SqlServer'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    OnClick = Button1Click
  end
  object BtnEncerrar: TButton
    Left = 445
    Top = 2
    Width = 75
    Height = 25
    Caption = 'Encerrar'
    TabOrder = 11
    OnClick = BtnEncerrarClick
  end
  object CDSFuncionario: TClientDataSet
    PersistDataPacket.Data = {
      5B0000009619E0BD0100000018000000030000000000030000005B0003637066
      0100490000000100055749445448020002000B00046E6F6D6501004900000001
      000557494454480200020028000773616C6172696F08000400000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 48
    object CDSFuncionariocpf: TStringField
      FieldName = 'cpf'
      Size = 11
    end
    object CDSFuncionarionome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object CDSFuncionariosalario: TFloatField
      FieldName = 'salario'
    end
  end
  object DSFuncionario: TDataSource
    DataSet = CDSFuncionario
    Left = 472
    Top = 48
  end
  object CDSDependente: TClientDataSet
    PersistDataPacket.Data = {
      750000009619E0BD010000001800000004000000000003000000750003637066
      0100490000000100055749445448020002000B00046E6F6D6501004900000001
      000557494454480200020028000B697363616C63756C6F697202000300000000
      000D697363616C63756C6F696E737302000300000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 456
    Top = 248
    object CDSDependentecpf: TStringField
      FieldName = 'cpf'
      Size = 11
    end
    object CDSDependentenome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object CDSDependenteiscalculoir: TBooleanField
      FieldName = 'iscalculoir'
    end
    object CDSDependenteiscalculoinss: TBooleanField
      FieldName = 'iscalculoinss'
    end
  end
  object DSDependente: TDataSource
    DataSet = CDSDependente
    Left = 568
    Top = 248
  end
end
