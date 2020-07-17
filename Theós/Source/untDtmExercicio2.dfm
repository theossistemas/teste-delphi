object dtmExercicio2: TdtmExercicio2
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 172
  Width = 369
  object fdCnx: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=ISO8859_1'
      'Protocol=TCPIP'
      'Port=3052'
      
        'Database=D:\NILSON\Projetos\teste-delphi\The'#243's\Database\EXERCICI' +
        'O2_ENTIDADES_CALCULO.FDB'
      'DriverID=FB')
    LoginPrompt = False
    Left = 96
    Top = 8
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 152
    Top = 8
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 240
    Top = 8
  end
  object qryCADFUNCIONARIO: TFDQuery
    Connection = fdCnx
    SQL.Strings = (
      'SELECT CADFUNCIONARIO.ID_FUNCIONARIO,'
      '       CADFUNCIONARIO.NOME,'
      '       CADFUNCIONARIO.CPF,'
      '       CADFUNCIONARIO.SALARIO'
      '  FROM CADFUNCIONARIO'
      ' ORDER BY CADFUNCIONARIO.ID_FUNCIONARIO')
    Left = 112
    Top = 64
    object qryCADFUNCIONARIOID_FUNCIONARIO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID_FUNCIONARIO'
      KeyFields = 'ID_FUNCIONARIO'
      Origin = 'ID_FUNCIONARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryCADFUNCIONARIONOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object qryCADFUNCIONARIOCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Required = True
      EditMask = '000.000.000-00;0;_'
      Size = 11
    end
    object qryCADFUNCIONARIOSALARIO: TFMTBCDField
      DisplayLabel = 'Sal'#225'rio'
      FieldName = 'SALARIO'
      Origin = 'SALARIO'
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object dtsCADFUNCIONARIO: TDataSource
    DataSet = qryCADFUNCIONARIO
    Left = 80
    Top = 64
  end
  object qryCADDEPENDENTE: TFDQuery
    IndexFieldNames = 'ID_FUNCIONARIO'
    MasterSource = dtsCADFUNCIONARIO
    MasterFields = 'ID_FUNCIONARIO'
    DetailFields = 'ID_FUNCIONARIO'
    Connection = fdCnx
    SQL.Strings = (
      'SELECT CADDEPENDENTE.ID_DEPENDENTE,'
      '       CADDEPENDENTE.NOME,'
      '       CADDEPENDENTE.ISCALCULAIR,'
      '       CADDEPENDENTE.ISCALCULAINSS,'
      '       CADDEPENDENTE.ID_FUNCIONARIO'
      '  FROM CADDEPENDENTE'
      ' WHERE CADDEPENDENTE.ID_FUNCIONARIO = :ID_FUNCIONARIO'
      ' ORDER BY CADDEPENDENTE.ID_DEPENDENTE')
    Left = 112
    Top = 112
    ParamData = <
      item
        Name = 'ID_FUNCIONARIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryCADDEPENDENTEID_DEPENDENTE: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID_DEPENDENTE'
      Origin = 'ID_DEPENDENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryCADDEPENDENTENOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object qryCADDEPENDENTEISCALCULAIR: TSmallintField
      DisplayLabel = 'Calcular IR'
      FieldName = 'ISCALCULAIR'
      Origin = 'ISCALCULAIR'
      Required = True
      OnGetText = GetFlag
      OnSetText = SetFlag
    end
    object qryCADDEPENDENTEISCALCULAINSS: TSmallintField
      DisplayLabel = 'Calcular INSS'
      FieldName = 'ISCALCULAINSS'
      Origin = 'ISCALCULAINSS'
      Required = True
      OnGetText = GetFlag
      OnSetText = SetFlag
    end
    object qryCADDEPENDENTEID_FUNCIONARIO: TIntegerField
      DisplayLabel = 'C'#243'digo Funcion'#225'rio'
      FieldName = 'ID_FUNCIONARIO'
      Origin = 'ID_FUNCIONARIO'
      Required = True
      Visible = False
    end
  end
  object qryAuxiliar: TFDQuery
    Connection = fdCnx
    Left = 240
    Top = 72
  end
end
