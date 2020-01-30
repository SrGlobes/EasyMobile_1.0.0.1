object ClientModule1: TClientModule1
  OldCreateOrder = False
  Height = 339
  Width = 540
  object DSRestConnection1: TDSRestConnection
    Host = '10.0.0.101'
    Port = 80
    UserName = 'Maicon Globes'
    LoginPrompt = False
    Left = 424
    Top = 8
    UniqueId = '{02FCF5EB-6F94-414A-8662-0F62E69A1E5D}'
  end
  object FDMemP0ES: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'PRODUTO'
        DataType = ftString
        Size = 55
      end
      item
        Name = 'CODIGOFABRICA'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'QTDDISPONIVEL'
        DataType = ftFloat
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 56
    Top = 16
    object FDMemP0ESID: TIntegerField
      FieldName = 'ID'
      DisplayFormat = '#00;'
    end
    object FDMemP0ESPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 55
    end
    object FDMemP0ESCODIGOFABRICA: TStringField
      FieldName = 'CODIGOFABRICA'
      Size = 25
    end
    object FDMemP0ESQTDDISPONIVEL: TFloatField
      FieldName = 'QTDDISPONIVEL'
    end
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 424
    Top = 72
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 424
    Top = 120
  end
  object FDMemSumTOTALP0ES: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'TOTAL'
        DataType = ftFloat
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 56
    Top = 72
    object FDMemSumTOTALP0ESTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = 'R$ #0,0.00;'
    end
  end
  object FDMemCLI: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'APELIDO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RZSOCIAL'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'TELEFONE'
        DataType = ftString
        Size = 11
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 144
    Top = 16
    object FDMemCLIID: TIntegerField
      FieldName = 'ID'
    end
    object FDMemCLIAPELIDO: TStringField
      FieldName = 'APELIDO'
      Size = 30
    end
    object FDMemCLIRZSOCIAL: TStringField
      FieldName = 'RZSOCIAL'
      Size = 80
    end
    object FDMemCLITELEFONE: TStringField
      FieldName = 'TELEFONE'
      EditMask = '!\(99\) 0000-0000;0;_'
      Size = 11
    end
  end
end
