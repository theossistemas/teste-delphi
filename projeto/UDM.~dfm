object DM: TDM
  OldCreateOrder = False
  Left = 228
  Top = 175
  Height = 317
  Width = 473
  object DBSQLConnection: TSQLConnection
    ConnectionName = 'AvaliacaoDB1'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=database.fdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=1'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'gds32.dll'
    Connected = True
    Left = 40
    Top = 16
  end
  object dsInserirDependente: TSQLDataSet
    CommandText = 
      'insert into dependente('#13#10'  iddependente,'#13#10'  idfuncionario,'#13#10'  no' +
      'me,'#13#10'  iscalculair,'#13#10'  iscalculainss)'#13#10'values('#13#10'  :iddependente,' +
      #13#10'  :idfuncionario,'#13#10'  :nome,'#13#10'  :iscalculair,'#13#10'  :iscalculainss' +
      ')'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'iddependente'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idfuncionario'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'nome'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'iscalculair'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'iscalculainss'
        ParamType = ptInput
      end>
    SQLConnection = DBSQLConnection
    Left = 272
    Top = 16
    object dsInserirDependenteNOME: TIntegerField
      FieldName = 'NOME'
      Required = True
    end
    object dsInserirDependenteISCALCULAIR: TIntegerField
      FieldName = 'ISCALCULAIR'
    end
    object dsInserirDependenteISCALCULAINSS: TIntegerField
      FieldName = 'ISCALCULAINSS'
    end
  end
  object dsInserirFuncionario: TSQLDataSet
    CommandText = 
      'insert into funcionario('#13#10'  idfuncionario,'#13#10'  nome,'#13#10'  cpf,'#13#10'  s' +
      'alario,'#13#10'  inss,'#13#10'  ir)'#13#10'values('#13#10'  :idfuncionario,'#13#10'  :nome,'#13#10' ' +
      ' :cpf,'#13#10'  :salario,'#13#10'  :inss,'#13#10'  :ir)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'idfuncionario'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'nome'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'cpf'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'salario'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'inss'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ir'
        ParamType = ptInput
      end>
    SQLConnection = DBSQLConnection
    Left = 168
    Top = 16
    object IntegerField1: TIntegerField
      FieldName = 'IDFUNCIONARIO'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object StringField2: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object FloatField1: TFloatField
      FieldName = 'SALARIO'
    end
  end
end
