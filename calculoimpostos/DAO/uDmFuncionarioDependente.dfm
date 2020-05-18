object DmFuncionarioDependente: TDmFuncionarioDependente
  OldCreateOrder = False
  Height = 150
  Width = 326
  object SQLInserir: TSQLDataSet
    CommandText = 
      'INSERT INTO FUNCIONARIO_DEPENDENTE (IDFUNCIONARIO, IDDEPENDENTE)' +
      #13#10'VALUES (:IDFUNCIONARIO, :IDDEPENDENTE)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'IDFUNCIONARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDDEPENDENTE'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.SQLConexao
    Left = 40
    Top = 32
  end
  object SQLExcluir: TSQLDataSet
    CommandText = 
      'DELETE FROM FUNCIONARIO_DEPENDENTE'#13#10'WHERE IDFUNCIONARIO = :IDFUN' +
      'CIONARIO AND IDDEPENDENTE = :IDDEPENDENTE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'IDFUNCIONARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDDEPENDENTE'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.SQLConexao
    Left = 112
    Top = 32
  end
  object SQLExcluirTodos: TSQLDataSet
    CommandText = 
      'DELETE FROM FUNCIONARIO_DEPENDENTE'#13#10'WHERE IDFUNCIONARIO = :IDFUN' +
      'CIONARIO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'IDFUNCIONARIO'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.SQLConexao
    Left = 208
    Top = 32
  end
end
