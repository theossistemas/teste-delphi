object dmBaseDados: TdmBaseDados
  OldCreateOrder = False
  Height = 150
  Width = 215
  object Conexao: TFDConnection
    ConnectionName = 'Firebird'
    Params.Strings = (
      'Database=C:\Users\george.silva\Documents\George\DB\BANCO.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 16
    Top = 16
  end
  object FDQuery: TFDQuery
    Connection = Conexao
    Left = 72
    Top = 16
  end
end
