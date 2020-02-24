object dm: Tdm
  OldCreateOrder = False
  Height = 150
  Width = 215
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Zanardo\Desktop\Theos Sistemas\Banco de Dados\' +
        'THEOSISTEMAS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    Left = 16
    Top = 16
  end
  object dsFuncionario: TDataSource
    DataSet = qryFuncionario
    Left = 112
    Top = 16
  end
  object qryFuncionario: TFDQuery
    AfterEdit = qryFuncionarioAfterEdit
    AfterDelete = qryFuncionarioAfterDelete
    AfterScroll = qryFuncionarioAfterScroll
    AfterRefresh = qryFuncionarioAfterRefresh
    OnNewRecord = qryFuncionarioNewRecord
    Connection = FDConnection
    SQL.Strings = (
      'SELECT PESSOA.NOME'
      '     , PESSOA.CPF'
      '     , FUNCIONARIO.SALARIO'
      '     , FUNCIONARIO.ID'
      '  FROM FUNCIONARIO FUNCIONARIO'
      '  JOIN PESSOA PESSOA'
      '    ON PESSOA.ID = FUNCIONARIO.ID_PESSOA'
      ' ORDER BY FUNCIONARIO.ID')
    Left = 152
    Top = 16
    object qryFuncionarioCPF: TWideStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      EditMask = '000\.000\.000\-00;0;'
      Size = 11
    end
    object qryFuncionarioID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
  end
  object dsDependente: TDataSource
    DataSet = qryDependente
    Left = 112
    Top = 64
  end
  object qryDependente: TFDQuery
    AfterEdit = qryDependenteAfterEdit
    OnNewRecord = qryDependenteNewRecord
    Connection = FDConnection
    SQL.Strings = (
      'SELECT PESSOA.NOME'
      '     , PESSOA.CPF'
      '     , DEPENDENTE.CALCULA_IR'
      '     , DEPENDENTE.CALCULA_INSS'
      '     , DEPENDENTE.ID'
      '     , DEPENDENTE.ID_FUNCIONARIO'
      '  FROM DEPENDENTE DEPENDENTE'
      '  JOIN PESSOA PESSOA'
      '    ON PESSOA.ID = DEPENDENTE.ID_PESSOA'
      ' WHERE DEPENDENTE.ID_FUNCIONARIO = :ID_FUNCIONARIO'
      ' ORDER BY DEPENDENTE.ID')
    Left = 152
    Top = 64
    ParamData = <
      item
        Name = 'ID_FUNCIONARIO'
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
    object qryDependenteCALCULA_IR: TWideStringField
      FieldName = 'CALCULA_IR'
      Origin = 'CALCULA_IR'
      Size = 1
    end
    object qryDependenteCALCULA_INSS: TWideStringField
      FieldName = 'CALCULA_INSS'
      Origin = 'CALCULA_INSS'
      Size = 1
    end
    object qryDependenteID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryDependenteID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
      Origin = 'ID_FUNCIONARIO'
    end
  end
end
