object dmView: TdmView
  OldCreateOrder = False
  Height = 440
  Width = 522
  object qryListFuncionarios: TFDQuery
    AfterOpen = qryListFuncionariosAfterOpen
    AfterClose = qryListFuncionariosAfterClose
    Connection = dmServer.FDConnection
    SQL.Strings = (
      'SELECT'
      '    *'
      'FROM'
      '    FUNCIONARIO'
      'ORDER BY'
      '    NOME')
    Left = 112
    Top = 40
    object qryListFuncionariosFUNCIONARIO_ID: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'FUNCIONARIO_ID'
      Origin = 'FUNCIONARIO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryListFuncionariosCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Required = True
      Size = 14
    end
    object qryListFuncionariosNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 50
    end
    object qryListFuncionariosSALARIO: TBCDField
      DisplayLabel = 'Sal'#225'rio'
      FieldName = 'SALARIO'
      Origin = 'SALARIO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object qryListDependentes: TFDQuery
    MasterSource = dsListFuncionarios
    MasterFields = 'FUNCIONARIO_ID'
    DetailFields = 'FUNCIONARIO_ID'
    Connection = dmServer.FDConnection
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '   DEPENDENTE'
      'WHERE'
      '   FUNCIONARIO_ID = :FUNCIONARIO_ID'
      'ORDER BY'
      '   NOME')
    Left = 112
    Top = 168
    ParamData = <
      item
        Name = 'FUNCIONARIO_ID'
        DataType = ftLargeint
        ParamType = ptInput
        Value = 1
      end>
    object qryListDependentesDEPENDENTE_ID: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'DEPENDENTE_ID'
      Origin = 'DEPENDENTE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryListDependentesFUNCIONARIO_ID: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'FUNCIONARIO_ID'
      Origin = 'FUNCIONARIO_ID'
      Required = True
      Visible = False
    end
    object qryListDependentesNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
    object qryListDependentesIS_CALCULA_IR: TSmallintField
      DisplayLabel = 'IR'
      FieldName = 'IS_CALCULA_IR'
      Origin = 'IS_CALCULA_IR'
      OnGetText = qryListDependentesIS_CALCULA_IRGetText
    end
    object qryListDependentesIS_CALCULA_INSS: TSmallintField
      DisplayLabel = 'INSS'
      FieldName = 'IS_CALCULA_INSS'
      Origin = 'IS_CALCULA_INSS'
      OnGetText = qryListDependentesIS_CALCULA_IRGetText
    end
  end
  object dsListFuncionarios: TDataSource
    DataSet = qryListFuncionarios
    Left = 216
    Top = 104
  end
end
