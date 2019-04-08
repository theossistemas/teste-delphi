object dmServer: TdmServer
  OldCreateOrder = False
  Height = 242
  Width = 372
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\desenvolvimento\projects\xe\teste\theos\teste-delphi' +
        '\entidadesCalculo\database\THEOS_DB.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 104
    Top = 40
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    VendorLib = 
      'C:\desenvolvimento\projects\xe\teste\theos\teste-delphi\entidade' +
      'sCalculo\database\fbclient.dll'
    Left = 104
    Top = 104
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 240
    Top = 40
  end
  object FDTransaction: TFDTransaction
    Options.DisconnectAction = xdRollback
    Connection = FDConnection
    Left = 232
    Top = 106
  end
end
