object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 387
  Width = 625
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Public\Documents\Aplicativos\Vexor Tecnologia\' +
        'EasyADS\Database\EASYADS.add'
      'User_Name=AdsSys'
      'Alias=DADOS'
      'ServerTypes=Remote'
      'Port=80'
      'Password=18857'
      'DriverID=ADS')
    Connected = True
    LoginPrompt = False
    Left = 536
    Top = 24
  end
  object FDPhysADSDriverLink1: TFDPhysADSDriverLink
    VendorLib = 
      'C:\Users\Public\Documents\Aplicativos\Vexor Tecnologia\EasyADS\D' +
      'atabase\ace32.dll'
    Left = 536
    Top = 72
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 536
    Top = 120
  end
  object FDQP0ES: TFDQuery
    Active = True
    ConstraintsEnabled = True
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evMode, evRecsSkip, evRecsMax, evRowsetSize]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT ID,PRODUTO, CODIGOFABRICA, QTDDISPONIVEL FROM P0ES '
      'ORDER BY ID ASC')
    Left = 48
    Top = 16
    object FDQP0ESID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object FDQP0ESPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      FixedChar = True
      Size = 55
    end
    object FDQP0ESCODIGOFABRICA: TStringField
      FieldName = 'CODIGOFABRICA'
      Origin = 'CODIGOFABRICA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 25
    end
    object FDQP0ESQTDDISPONIVEL: TFloatField
      FieldName = 'QTDDISPONIVEL'
      Origin = 'QTDDISPONIVEL'
    end
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 536
    Top = 176
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 536
    Top = 224
  end
  object FDQSumTOTALP0ES: TFDQuery
    Active = True
    ConstraintsEnabled = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT SUM(TOTAL) AS TOTAL FROM P0ES')
    Left = 48
    Top = 64
    object FDQSumTOTALP0ESTOTAL: TFloatField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
    end
  end
  object FDQCLI: TFDQuery
    Active = True
    ConstraintsEnabled = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT ID,APELIDO,RZSOCIAL,TELEFONE FROM P0CLI'
      'ORDER BY ID ASC')
    Left = 48
    Top = 120
    object FDQCLIID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object FDQCLIAPELIDO: TStringField
      FieldName = 'APELIDO'
      Origin = 'APELIDO'
      FixedChar = True
      Size = 30
    end
    object FDQCLIRZSOCIAL: TStringField
      FieldName = 'RZSOCIAL'
      Origin = 'RZSOCIAL'
      FixedChar = True
      Size = 80
    end
    object FDQCLITELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      FixedChar = True
      Size = 11
    end
  end
end
