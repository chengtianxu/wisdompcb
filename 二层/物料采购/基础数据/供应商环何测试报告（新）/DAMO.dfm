object DM: TDM
  OldCreateOrder = False
  Left = 537
  Top = 219
  Height = 340
  Width = 392
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 160
    Top = 32
  end
  object adoMain: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    AfterScroll = adoMainAfterScroll
    CommandText = 
      'SELECT     dbo.data0805.rkey, dbo.data0805.D023_ptr, dbo.data080' +
      '5.INV_Type, dbo.data0805.TestDate, dbo.data0805.Model, dbo.data0' +
      '805.EffeDate, '#13#10#9'case when datediff(day,getdate(),effedate)>=30 ' +
      'then '#39#26377#25928#26399#20869#39#13#10#9'when datediff(day,getdate(),effedate)>=1 and dated' +
      'iff(day,getdate(),effedate)<30 then '#39#38656#35201#26356#26032#39#13#10#9'when datediff(day,g' +
      'etdate(),effedate)<1 then '#39#24050#36807#26399#39'  end as reportstatus,'#13#10'         ' +
      '             dbo.data0805.Status,case data0805.status when 1 the' +
      'n '#39#26410#25552#20132#39' when 2 then '#39#24050#25552#20132#39' when 3 then '#39#24050#23457#26680#39' when 4 then '#39#24453#37325#20570#39' wh' +
      'en 5 then '#39#24050#36864#22238#39' when 6 then '#39#24050#22833#25928#39' end as strstatus,'#13#10'           ' +
      '      dbo.data0805.TemporBy, case temporby when 0 then '#39#21542#39' when ' +
      '1 then '#39#26159#39' end as tempby,dbo.data0805.TemporTo, dbo.data0805.D07' +
      '3_ptr, dbo.data0805.EntrTime, dbo.data0805.Remarks, '#13#10'          ' +
      '            dbo.data0805.INV_Name, dbo.data0805.RoHsFree, dbo.da' +
      'ta0805.SGS_NO, dbo.Data0023.CODE, dbo.Data0023.abbr_name, d73.us' +
      'er_full_name as audiuser,'#13#10'                      dbo.Data0073.US' +
      'ER_FULL_NAME,case  dbo.Data0023.status when 0 then '#39#26377#25928#39' else '#39#26080#25928 +
      #39' end as supstatus'#13#10'FROM         dbo.data0805 INNER JOIN'#13#10'      ' +
      '                dbo.Data0073 ON dbo.data0805.D073_ptr = dbo.Data' +
      '0073.RKEY INNER JOIN'#13#10'                      dbo.Data0023 ON dbo.' +
      'data0805.D023_ptr = dbo.Data0023.RKEY LEFT JOIN'#13#10'               ' +
      '       dbo.data0073 as D73 ON dbo.data0805.Audi_ptr = d73.RKEY'#13#10 +
      #13#10'where 1=1'#13#10
    IndexFieldNames = 'CODE'
    Parameters = <>
    Left = 40
    Top = 96
    object adoMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adoMainD023_ptr: TIntegerField
      FieldName = 'D023_ptr'
    end
    object adoMainCODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object adoMainabbr_name: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'abbr_name'
      Size = 16
    end
    object adoMainINV_Type: TStringField
      DisplayLabel = #29289#26009#31867#21035
      FieldName = 'INV_Type'
    end
    object adoMainTestDate: TDateTimeField
      DisplayLabel = #27979#35797#26085#26399
      FieldName = 'TestDate'
    end
    object adoMainModel: TStringField
      DisplayLabel = #22411#21495
      FieldName = 'Model'
    end
    object adoMainEffeDate: TDateTimeField
      DisplayLabel = #26377#25928#26085#26399
      FieldName = 'EffeDate'
    end
    object adoMainreportstatus: TStringField
      DisplayLabel = #25253#21578#29366#24577
      FieldName = 'reportstatus'
      ReadOnly = True
      Size = 8
    end
    object adoMainStatus: TWordField
      FieldName = 'Status'
    end
    object adoMainTemporBy: TBooleanField
      DisplayLabel = #26242#26102#36890#36807
      FieldName = 'TemporBy'
    end
    object adoMainTemporTo: TDateTimeField
      DisplayLabel = #26242#26102#33267
      FieldName = 'TemporTo'
    end
    object adoMainD073_ptr: TIntegerField
      FieldName = 'D073_ptr'
    end
    object adoMainEntrTime: TDateTimeField
      DisplayLabel = #24405#20837#26102#38388
      FieldName = 'EntrTime'
    end
    object adoMainRemarks: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Remarks'
      Size = 200
    end
    object adoMainINV_Name: TStringField
      DisplayLabel = #29289#26009#21517#31216
      FieldName = 'INV_Name'
    end
    object adoMainRoHsFree: TStringField
      DisplayLabel = 'RoHS/'#26080#21348
      FieldName = 'RoHsFree'
    end
    object adoMainSGS_NO: TStringField
      DisplayLabel = 'SGS'#32534#21495
      FieldName = 'SGS_NO'
      Size = 25
    end
    object adoMainUSER_FULL_NAME: TStringField
      DisplayLabel = #24405#20837#20154
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object adoMainstrstatus: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'strstatus'
      ReadOnly = True
      Size = 6
    end
    object adoMaintempby: TStringField
      DisplayLabel = #26242#26102#36890#36807
      FieldName = 'tempby'
      ReadOnly = True
      Size = 2
    end
    object adoMainsupstatus: TStringField
      DisplayLabel = #20379#24212#21830#29366#24577
      FieldName = 'supstatus'
      ReadOnly = True
      Size = 4
    end
    object adoMainaudiuser: TStringField
      DisplayLabel = #23457#26680#20154
      FieldName = 'audiuser'
      Size = 30
    end
  end
  object adoTmp: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 288
    Top = 96
  end
  object adoTime: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 288
    Top = 168
  end
  object DataSource1: TDataSource
    DataSet = adoMain
    Left = 104
    Top = 96
  end
  object adoAux: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select rkey,D805_ptr, FileType,'#13#10'case filetype when 1 then '#39'SGS'#25991 +
      #20214#39' when 2 then '#39'MSDS'#25991#20214#39' when 3 then '#39#29615#20445#21327#35758#39' when 4 then '#39#29289#26009#35797#29992#25253#21578#39' ' +
      'end as strFileType,'#13#10' FileName, Remarks from data0806      '#13#10'whe' +
      're D805_ptr=:rkey'#13#10
    DataSource = DataSource1
    IndexFieldNames = 'D805_ptr'
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 40
    Top = 160
    object adoAuxrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adoAuxD805_ptr: TIntegerField
      FieldName = 'D805_ptr'
    end
    object adoAuxFileType: TWordField
      FieldName = 'FileType'
    end
    object adoAuxstrFileType: TStringField
      DisplayLabel = #25991#20214#31867#22411
      FieldName = 'strFileType'
      ReadOnly = True
      Size = 12
    end
    object adoAuxFileName: TStringField
      DisplayLabel = #25991#20214#21517
      FieldName = 'FileName'
      Size = 100
    end
    object adoAuxRemarks: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Remarks'
      Size = 200
    end
  end
  object DataSource2: TDataSource
    DataSet = adoAux
    Left = 104
    Top = 152
  end
  object DataSource3: TDataSource
    DataSet = adoField
    Left = 104
    Top = 224
  end
  object adoField: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    BeforeInsert = adoFieldBeforeInsert
    BeforeDelete = adoFieldBeforeDelete
    Parameters = <
      item
        Name = 'key419'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey73'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select Rkey, D419_ptr, D073_ptr, FieldName, FieldCaption, FieldO' +
        'rder, FieldWidth, IsDisplay'
      ' from data0849 '
      'where D419_ptr= :key419  and D073_ptr=:rkey73')
    Left = 40
    Top = 224
    object adoFieldRkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object adoFieldD419_ptr: TIntegerField
      FieldName = 'D419_ptr'
    end
    object adoFieldD073_ptr: TIntegerField
      FieldName = 'D073_ptr'
    end
    object adoFieldFieldName: TStringField
      FieldName = 'FieldName'
      Size = 50
    end
    object adoFieldFieldCaption: TStringField
      DisplayLabel = #23383#27573#21517#31216
      FieldName = 'FieldCaption'
      Size = 100
    end
    object adoFieldFieldOrder: TIntegerField
      DisplayLabel = #39034#24207
      FieldName = 'FieldOrder'
    end
    object adoFieldFieldWidth: TIntegerField
      DisplayLabel = #21015#23485
      FieldName = 'FieldWidth'
    end
    object adoFieldIsDisplay: TBooleanField
      DisplayLabel = #26159#21542#26174#31034
      FieldName = 'IsDisplay'
    end
  end
end
