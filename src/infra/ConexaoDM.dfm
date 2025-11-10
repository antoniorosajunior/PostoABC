object dmConexao: TdmConexao
  Height = 240
  Width = 320
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'Protocol=TCPIP'
      'Port=3050'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Database=D:\Sistemas\Fortes Tecnologia\PostoABC\db\POSTOABC.FDB'
      'Server=localhost')
    Left = 48
    Top = 32
  end
  object FBDriverLink: TFDPhysFBDriverLink
    Left = 248
    Top = 32
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 152
    Top = 32
  end
end
