object ConnectionDMF: TConnectionDMF
  OldCreateOrder = False
  Left = 192
  Top = 125
  Height = 511
  Width = 944
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
    Active = True
    AutoSave = True
    FileName = 'C:\WladSoft\teste-delphi\SQL.SQL'
    SQLConnection = SQLConn
    Left = 67
    Top = 1
  end
  object qrFuncionario: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM FUNCIONARIO')
    SQLConnection = SQLConn
    Left = 384
    Top = 32
    object qrFuncionarioID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrFuncionarioNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object qrFuncionarioCPF: TStringField
      FieldName = 'CPF'
      Size = 15
    end
    object qrFuncionarioVL_SALARIO: TFloatField
      FieldName = 'VL_SALARIO'
    end
  end
  object dspFuncionario: TDataSetProvider
    DataSet = qrFuncionario
    Options = [poCascadeDeletes]
    UpdateMode = upWhereKeyOnly
    Left = 422
    Top = 32
  end
  object dsFuncionario: TDataSource
    DataSet = qrFuncionario
    Left = 464
    Top = 32
  end
  object qrDependente: TSQLQuery
    DataSource = dsFuncionario
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_FUNCIONARIO'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'SELECT * FROM DEPENDENTE WHERE ID_FUNCIONARIO = :ID_FUNCIONARIO')
    SQLConnection = SQLConn
    Left = 512
    Top = 32
    object qrDependenteID_DEPENDENTE: TIntegerField
      FieldName = 'ID_DEPENDENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrDependenteNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object qrDependenteBO_CALCULA_IR: TStringField
      FieldName = 'BO_CALCULA_IR'
      FixedChar = True
      Size = 3
    end
    object qrDependenteBO_CALCULA_INSS: TStringField
      FieldName = 'BO_CALCULA_INSS'
      FixedChar = True
      Size = 3
    end
    object qrDependenteID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
end
