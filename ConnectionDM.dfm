object ConnectionDMF: TConnectionDMF
  OldCreateOrder = False
  Left = 192
  Top = 125
  Height = 308
  Width = 408
  object SQLConn: TSQLConnection
    ConnectionName = 'IBConnection'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=database.fdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=wlworksys'
      'ServerCharSet='
      'SQLDialect=1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'gds32.dll'
    BeforeConnect = SQLConnBeforeConnect
    Left = 16
    Top = 8
  end
  object Localconnection: TLocalConnection
    Left = 104
  end
  object qrAux: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConn
    Left = 8
    Top = 40
  end
  object dspAux: TDataSetProvider
    DataSet = qrAux
    Options = [poIncFieldProps, poAllowCommandText]
    Left = 38
    Top = 40
  end
  object dsAux: TDataSource
    DataSet = qrAux
    Left = 70
    Top = 40
  end
  object sqlMonitor: TSQLMonitor
    FileName = 'c:\'
    SQLConnection = SQLConn
    Left = 67
    Top = 1
  end
end
