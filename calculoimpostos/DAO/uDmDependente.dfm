object DmDependente: TDmDependente
  OldCreateOrder = False
  Height = 150
  Width = 380
  object SQLInserir: TSQLDataSet
    CommandText = 
      'INSERT INTO DEPENDENTE (ID, NOME, CALCULAINSS, CALCULAIR)'#13#10'VALUE' +
      'S (:ID, :NOME, :CALCULAINSS, :CALCULAIR)'
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
        Name = 'CALCULAINSS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CALCULAIR'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.SQLConexao
    Left = 32
    Top = 16
  end
  object SQLAtualizar: TSQLDataSet
    CommandText = 
      'UPDATE'#13#10#9'DEPENDENTE'#13#10'SET'#13#10#9'NOME = :NOME,'#13#10#9'CALCULAINSS = :CALCUL' +
      'AINSS,'#13#10#9'CALCULAIR = :CALCULAIR'#13#10'WHERE '#13#10#9'ID = :ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CALCULAINSS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CALCULAIR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.SQLConexao
    Left = 112
    Top = 16
  end
  object SQLExcluir: TSQLDataSet
    CommandText = 'DELETE FROM DEPENDENTE'#13#10'WHERE ID = :ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.SQLConexao
    Left = 192
    Top = 24
  end
end
