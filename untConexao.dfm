object udtConexao: TudtConexao
  OldCreateOrder = False
  Left = 638
  Top = 126
  Height = 203
  Width = 441
  object Conexao: TSQLConnection
    ConnectionName = 'DBPAIVATHEOS'
    DriverName = 'UIB FireBird15'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpUIBfire15.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=UIB FireBird15'
      'BlobSize=-1'
      'CommitRetain=False'
      'Database=localhost:C:\Paiva\DBTHEOS\DBPAIVATHEOS.FDB'
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
    Left = 8
    Top = 16
  end
  object dtsFuncionario: TDataSource
    Left = 72
    Top = 72
  end
  object dtsDependentes: TDataSource
    Left = 168
    Top = 72
  end
  object sdtFuncionario: TSimpleDataSet
    Aggregates = <>
    Connection = Conexao
    DataSet.CommandText = 'select * from FUNCIONARIOS'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 80
    Top = 16
    object sdtFuncionarioFUNCOD: TIntegerField
      FieldName = 'FUNCOD'
    end
    object sdtFuncionarioNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object sdtFuncionarioCPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object sdtFuncionarioSALARIO: TFMTBCDField
      FieldName = 'SALARIO'
      Precision = 18
      Size = 2
    end
  end
  object sdtDependentes: TSimpleDataSet
    Aggregates = <>
    Connection = Conexao
    DataSet.CommandText = 'select * from DEPENDENTES'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 168
    Top = 16
  end
end
