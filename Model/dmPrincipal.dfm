object dmConexoes: TdmConexoes
  OldCreateOrder = False
  Height = 150
  Width = 215
  object qryClientes: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select * from clientes')
    Left = 40
    Top = 64
  end
  object conexao: TFDConnection
    Params.Strings = (
      'Database=wksistema'
      'Password=97874697'
      'User_Name=root'
      'UseSSL=True'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 48
    Top = 16
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'libmariadb.dll'
    Left = 152
    Top = 88
  end
end
