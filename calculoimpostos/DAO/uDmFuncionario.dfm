object DmFuncionario: TDmFuncionario
  OldCreateOrder = False
  Height = 150
  Width = 215
  object SQLInserir: TSQLDataSet
    CommandText = 
      'INSERT INTO '#13#10#9'FUNCIONARIO(ID, NOME, CPF, SALARIO)'#13#10'VALUES'#13#10#9'(:I' +
      'D, :NOME, :CPF, :SALARIO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CPF'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SALARIO'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.SQLConexao
    Left = 24
    Top = 24
  end
  object SQLAlterar: TSQLDataSet
    CommandText = 
      'UPDATE'#13#10#9'FUNCIONARIO'#13#10'SET'#13#10#9'NOME = :NOME,'#13#10#9'CPF = :CPF,'#13#10#9'SALARI' +
      'O = :SALARIO'#13#10'WHERE'#13#10#9'ID = :ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CPF'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SALARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.SQLConexao
    Left = 88
    Top = 24
  end
  object SQLExcluir: TSQLDataSet
    CommandText = 'DELETE FROM FUNCIONARIO'#13#10'WHERE ID = :ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.SQLConexao
    Left = 152
    Top = 24
  end
end
