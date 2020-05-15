object DMCadastro: TDMCadastro
  OldCreateOrder = False
  Left = 774
  Top = 279
  Height = 353
  Width = 472
  object ConexaoBanco: TSQLConnection
    ConnectionName = 'AvaliacaoTheos'
    DriverName = 'UIB FireBird15'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpUIBfire15.dll'
    Params.Strings = (
      'DriverName=UIB FireBird15'
      'BlobSize=-1'
      'CommitRetain=False'
      'Database=localhost:D:\Desenvolvimento\Prova Theos 2\DATABASE.FDB'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Password=masterkey'
      'RoleName=RoleName'
      'ServerCharSet='
      'SQLDialect=3'
      'Interbase TransIsolation=ReadCommited'
      'User_Name=SYSDBA'
      'WaitOnLocks=True')
    VendorLib = 'fbclient.dll'
    Left = 56
    Top = 72
  end
  object GeneratorFuncionario: TSQLDataSet
    CommandText = 'select gen_id(SEQFUNCIONARIO,1) from rdb$database'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = ConexaoBanco
    Left = 226
    Top = 65
  end
  object GeneratorDependente: TSQLDataSet
    CommandText = 'select gen_id(SEQDEPENDENTE,1) from rdb$database'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = ConexaoBanco
    Left = 226
    Top = 128
  end
end
