object dm: Tdm
  OldCreateOrder = False
  Height = 411
  Width = 832
  object dsFuncionario: TDataSource
    DataSet = qryFuncionario
    Left = 168
    Top = 224
  end
  object qryFuncionario: TFDQuery
    AfterEdit = qryFuncionarioAfterEdit
    AfterDelete = qryFuncionarioAfterDelete
    AfterScroll = qryFuncionarioAfterScroll
    AfterRefresh = qryFuncionarioAfterRefresh
    OnNewRecord = qryFuncionarioNewRecord
    Connection = FDConnection
    SQL.Strings = (
      'SELECT PESSOA.NOME,'
      '       PESSOA.CPF,'
      '       FUNCIONARIO.SALARIO,'
      '       FUNCIONARIO.IDFUNCIONARIO'
      '  FROM FUNCIONARIO FUNCIONARIO'
      '  JOIN PESSOA PESSOA'
      '    ON PESSOA.IDPESSOA = FUNCIONARIO.IDPESSOA'
      ' ORDER BY FUNCIONARIO.IDFUNCIONARIO')
    Left = 232
    Top = 224
    object qryFuncionarioCPF: TWideStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      EditMask = '000\.000\.000\-00;0;'
      Size = 11
    end
    object qryFuncionarioNOME: TWideStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 250
    end
    object qryFuncionarioSALARIO: TFloatField
      FieldName = 'SALARIO'
      DisplayFormat = ',0.00'
    end
    object qryFuncionarioIDFUNCIONARIO: TIntegerField
      FieldName = 'IDFUNCIONARIO'
    end
  end
  object dsDependente: TDataSource
    DataSet = qryDependente
    Left = 424
    Top = 256
  end
  object qryDependente: TFDQuery
    AfterEdit = qryDependenteAfterEdit
    OnNewRecord = qryDependenteNewRecord
    Connection = FDConnection
    SQL.Strings = (
      'SELECT PESSOA.NOME,'
      '       PESSOA.CPF,'
      '       DEPENDENTE.CALCULAIR,'
      '       DEPENDENTE.CALCULAINSS,'
      '       DEPENDENTE.IDDEPENDENTE,'
      '       DEPENDENTE.IDFUNCIONARIO'
      '  FROM DEPENDENTE DEPENDENTE'
      '  JOIN PESSOA PESSOA'
      '    ON PESSOA.IDPESSOA = DEPENDENTE.IDPESSOA'
      ' WHERE DEPENDENTE.IDFUNCIONARIO = :IDFUNCIONARIO'
      ' ORDER BY DEPENDENTE.IDDEPENDENTE')
    Left = 472
    Top = 256
    ParamData = <
      item
        Name = 'IDFUNCIONARIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryDependenteNOME: TWideStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 250
    end
    object qryDependenteCPF: TWideStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      EditMask = '000\.000\.000\-00;0;'
      Size = 11
    end
    object qryDependenteIDDEPENDENTE: TIntegerField
      FieldName = 'IDDEPENDENTE'
    end
    object qryDependenteIDFUNCIONARIO: TIntegerField
      FieldName = 'IDFUNCIONARIO'
    end
    object qryDependenteCALCULAIR: TWideStringField
      FieldName = 'CALCULAIR'
      Size = 3
    end
    object qryDependenteCALCULAINSS: TWideStringField
      FieldName = 'CALCULAINSS'
      Size = 3
    end
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 328
    Top = 104
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Matheus\Documents\GitHub\teste-delphi\ProvaThe' +
        'os\Banco de Dados\TESTETHEOS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 336
    Top = 32
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'C:\Windows\SysWOW64\gds32.dll'
    Left = 464
    Top = 56
  end
end
