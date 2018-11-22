object DM: TDM
  OldCreateOrder = False
  Left = 457
  Top = 246
  Height = 332
  Width = 409
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 40
  end
  object adoMain: TADODataSet
    Connection = con1
    CursorType = ctStatic
    CommandText = 
      'SELECT    Y1408.Rkey , dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT' +
      '_NAME, dbo.Y1417.FASSET_DESC'#13#10#9#9', dbo.Y1417.FASSET_NAME, dbo.Dat' +
      'a0015.abbr_NAME, dbo.Data0015.WAREHOUSE_CODE'#13#10#9#9', dbo.Y1408.pane' +
      'l_id, dbo.Y1408.ccd_code, dbo.Y1408.T_DATE, dbo.Y1408.COMPUTER_I' +
      'P'#13#10#9#9', dbo.Y1406.WORK_ORDER_NUMBER,dbo.Y1406.MANU_PART_NUMBER,db' +
      'o.Y1417.IsDouble'#13#10'FROM         dbo.Data0015 INNER JOIN'#13#10'        ' +
      '              dbo.Y1408 INNER JOIN'#13#10'                      dbo.Y1' +
      '417 ON dbo.Y1408.Y1417_RKEY = dbo.Y1417.RKEY ON dbo.Data0015.RKE' +
      'Y = dbo.Y1417.warehouse_ptr INNER JOIN'#13#10'                      db' +
      'o.Data0034 ON dbo.Y1417.DEPT_PTR = dbo.Data0034.RKEY LEFT OUTER ' +
      'JOIN'#13#10'                      dbo.Y1406 ON dbo.Y1408.Y1406_RKEY = ' +
      'dbo.Y1406.rkey'#13#10'WHERE 1=1'
    Parameters = <>
    Left = 40
    Top = 96
    object adoMainDEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object adoMainDEPT_NAME: TStringField
      DisplayLabel = #24037#24207#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object adoMainFASSET_DESC: TStringField
      DisplayLabel = #35774#22791#32452#21035
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object adoMainFASSET_NAME: TStringField
      DisplayLabel = #35774#22791#32447#21035
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object adoMainabbr_NAME: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'abbr_NAME'
      Size = 10
    end
    object adoMainWAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object adoMainpanel_id: TStringField
      DisplayLabel = 'ID'#30721
      FieldName = 'panel_id'
      Size = 12
    end
    object adoMainccd_code: TStringField
      DisplayLabel = 'CCD'#30721
      FieldName = 'ccd_code'
      Size = 17
    end
    object adoMainT_DATE: TDateTimeField
      DisplayLabel = #37319#38598#26102#38388
      FieldName = 'T_DATE'
    end
    object adoMainCOMPUTER_IP: TStringField
      DisplayLabel = #30005#33041'IP'
      FieldName = 'COMPUTER_IP'
    end
    object adoMainWORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object adoMainRkey: TLargeintField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object adoMainMANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object adoMainIsDouble: TWordField
      DisplayLabel = #24207#21495
      FieldName = 'IsDouble'
    end
  end
  object dsMain: TDataSource
    DataSet = adoMain
    Left = 40
    Top = 152
  end
  object adotmp: TADOQuery
    Connection = con1
    LockType = ltReadOnly
    Parameters = <>
    Left = 232
    Top = 96
  end
end
