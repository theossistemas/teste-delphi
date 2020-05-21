object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 326
  Width = 397
  object FirebirdconnectionConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=FirebirdConnection')
    Connected = True
    LoginPrompt = False
    Left = 71
    Top = 29
  end
  object Tb_funcionarioTable: TFDQuery
    Active = True
    Connection = FirebirdconnectionConnection
    SQL.Strings = (
      'SELECT * FROM TB_FUNCIONARIO  ORDER BY ID')
    Left = 209
    Top = 29
    object Tb_funcionarioTableID: TLargeintField
      DisplayWidth = 15
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Tb_funcionarioTableNOME: TWideStringField
      DisplayWidth = 61
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 50
    end
    object Tb_funcionarioTableCPF: TWideStringField
      DisplayWidth = 14
      FieldName = 'CPF'
      Origin = 'CPF'
      Required = True
      Size = 14
    end
    object Tb_funcionarioTableSALARIO: TFMTBCDField
      DisplayWidth = 19
      FieldName = 'SALARIO'
      Origin = 'SALARIO'
      Precision = 18
      Size = 2
    end
  end
  object Tb_dependenteTable: TFDQuery
    Active = True
    MasterSource = dsFuncionario
    MasterFields = 'ID'
    DetailFields = 'ID'
    Connection = FirebirdconnectionConnection
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      
        'SELECT * FROM TB_DEPENDENTE WHERE ID_FUNCIONARIO = :ID ORDER BY ' +
        'ID')
    Left = 208
    Top = 86
    ParamData = <
      item
        Name = 'ID'
        DataType = ftLargeint
        ParamType = ptInput
        Value = 1
      end>
    object Tb_dependenteTableID: TLargeintField
      DisplayWidth = 15
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Tb_dependenteTableNOME: TWideStringField
      DisplayWidth = 44
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 50
    end
    object Tb_dependenteTableID_FUNCIONARIO: TLargeintField
      DisplayWidth = 17
      FieldName = 'ID_FUNCIONARIO'
      Origin = 'ID_FUNCIONARIO'
      Required = True
      Visible = False
    end
    object Tb_dependenteTableIS_CALCULA_INSS: TWideStringField
      DisplayLabel = 'Calcula INSS'
      DisplayWidth = 16
      FieldName = 'IS_CALCULA_INSS'
      Origin = 'IS_CALCULA_INSS'
      Required = True
      OnGetText = PegaFlagFormatada
      OnSetText = AtribuirValorFlag
      FixedChar = True
      Size = 1
    end
    object Tb_dependenteTableIS_CALCULA_IR: TWideStringField
      DisplayLabel = 'Calcula IR'
      DisplayWidth = 16
      FieldName = 'IS_CALCULA_IR'
      Origin = 'IS_CALCULA_IR'
      Required = True
      OnGetText = PegaFlagFormatada
      OnSetText = AtribuirValorFlag
      FixedChar = True
      Size = 1
    end
  end
  object dsFuncionario: TDataSource
    DataSet = Tb_funcionarioTable
    Left = 304
    Top = 32
  end
  object dsDependente: TDataSource
    DataSet = Tb_dependenteTable
    Left = 304
    Top = 86
  end
  object FDQuery: TFDQuery
    Connection = FirebirdconnectionConnection
    SQL.Strings = (
      '')
    Left = 208
    Top = 152
  end
end
