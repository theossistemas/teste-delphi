object DMCadastro: TDMCadastro
  OldCreateOrder = False
  Left = 653
  Top = 311
  Height = 399
  Width = 538
  object Connection: TSQLConnection
    ConnectionName = 'AvaliacaoTheos'
    DriverName = 'UIB FireBird15'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpUIBfire15.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=UIB FireBird15'
      'BlobSize=-1'
      'CommitRetain=False'
      
        'Database=localhost:D:\Desenvolvimento\Prova Theos\Exerc'#237'cio 2 En' +
        'tidades de Calc\DATABASE.FDB'
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
    Connected = True
    Left = 56
    Top = 64
  end
  object SQLFuncionario: TSQLDataSet
    CommandText = 
      'select'#13#10'  f.codigo,'#13#10'  f.nome,'#13#10'  f.cpf,'#13#10'  f.salario  '#13#10'from FU' +
      'NCIONARIO f'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Connection
    Left = 128
    Top = 64
    object SQLFuncionarioCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SQLFuncionarioNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object SQLFuncionarioCPF: TStringField
      FieldName = 'CPF'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SQLFuncionarioSALARIO: TFloatField
      FieldName = 'SALARIO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object SQLDependente: TSQLDataSet
    CommandText = 
      'select'#13#10'  d.codigo,'#13#10'  d.nome,'#13#10'  d.funcionario,'#13#10'  d.iscalculai' +
      'r,'#13#10'  d.iscalculainss  '#13#10'from DEPENDENTE d'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Connection
    Left = 128
    Top = 127
    object IntegerField3: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField3: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object SQLDependenteFUNCIONARIO: TIntegerField
      FieldName = 'FUNCIONARIO'
    end
    object SQLDependenteISCALCULAIR: TStringField
      FieldName = 'ISCALCULAIR'
      Size = 1
    end
    object SQLDependenteISCALCULAINSS: TStringField
      FieldName = 'ISCALCULAINSS'
      Size = 1
    end
  end
  object GeneratorFuncionario: TSQLDataSet
    CommandText = 'select gen_id(SEQFUNCIONARIO,1) from rdb$database'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Connection
    Left = 226
    Top = 65
  end
  object GeneratorDependente: TSQLDataSet
    CommandText = 'select gen_id(SEQDEPENDENTE,1) from rdb$database'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Connection
    Left = 226
    Top = 128
  end
end
