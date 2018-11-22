object DM: TDM
  OldCreateOrder = False
  Left = 558
  Top = 227
  Height = 410
  Width = 606
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 64
    Top = 16
  end
  object adsMain: TADODataSet
    Connection = con1
    LockType = ltReadOnly
    CommandText = 
      'SELECT      dbo.Data0622.rkey, dbo.Data0622.rkey23, dbo.Data0622' +
      '.rkey496'#13#10', dbo.Data0622.Model, dbo.Data0622.rkey391, dbo.Data06' +
      '22.CheckCycle'#13#10', dbo.Data0622.CreateTime, dbo.Data0622.CreateUse' +
      'r, dbo.Data0622.status'#13#10', dbo.Data0023.CODE, dbo.Data0023.ABBR_N' +
      'AME, dbo.Data0496.GROUP_NAME'#13#10', dbo.Data0496.GROUP_DESC, dbo.Dat' +
      'a0073.USER_LOGIN_NAME, dbo.DATA0391.iqc_number'#13#10', dbo.DATA0391.b' +
      'arch_no, CASE dbo.Data0622.CheckCycle WHEN 1 then '#39#21608#39' when 2 the' +
      'n '#39#26376#39' end as strCycle'#13#10', case dbo.Data0622.status when 0 then '#39#26410 +
      #29983#25928#39' when 1 then '#39#24050#29983#25928#39' end as strstatus'#13#10'FROM         dbo.Data062' +
      '2 INNER JOIN'#13#10'                      dbo.Data0023 ON dbo.Data0622' +
      '.rkey23 = dbo.Data0023.RKEY INNER JOIN'#13#10'                      db' +
      'o.Data0496 ON dbo.Data0622.rkey496 = dbo.Data0496.RKEY INNER JOI' +
      'N'#13#10'                      dbo.DATA0391 ON dbo.Data0622.rkey391 = ' +
      'dbo.DATA0391.rkey INNER JOIN'#13#10'                      dbo.Data0073' +
      ' ON dbo.Data0622.CreateUser = dbo.Data0073.RKEY '#13#10'where dbo.Data' +
      '0622.CreateTime between :d1 and :d2'
    IndexFieldNames = 'CreateTime'
    Parameters = <
      item
        Name = 'd1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 43191d
      end
      item
        Name = 'd2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 43221d
      end>
    Left = 136
    Top = 16
    object adsMainrkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adsMainrkey23: TIntegerField
      FieldName = 'rkey23'
    end
    object adsMainrkey496: TIntegerField
      FieldName = 'rkey496'
    end
    object adsMainModel: TStringField
      DisplayLabel = #22411#21495
      FieldName = 'Model'
    end
    object adsMainrkey391: TIntegerField
      FieldName = 'rkey391'
    end
    object adsMainCheckCycle: TWordField
      DisplayLabel = #26816#27979#21608#26399
      FieldName = 'CheckCycle'
    end
    object adsMainCreateTime: TDateTimeField
      DisplayLabel = #21019#24314#26102#38388
      FieldName = 'CreateTime'
    end
    object adsMainCreateUser: TIntegerField
      DisplayLabel = #21019#24314#20154#21592
      FieldName = 'CreateUser'
    end
    object adsMainstatus: TBooleanField
      FieldName = 'status'
    end
    object adsMainCODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object adsMainABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object adsMainGROUP_NAME: TStringField
      DisplayLabel = #31867#21035#20195#30721
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object adsMainGROUP_DESC: TStringField
      DisplayLabel = #31867#21035#21517#31216
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object adsMainUSER_LOGIN_NAME: TStringField
      DisplayLabel = #21019#24314#20154#21592
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object adsMainiqc_number: TStringField
      DisplayLabel = 'IQC'#32534#21495
      FieldName = 'iqc_number'
      Size = 10
    end
    object adsMainbarch_no: TStringField
      DisplayLabel = #25209#21495
      FieldName = 'barch_no'
      Size = 100
    end
    object adsMainstrCycle: TStringField
      DisplayLabel = #26816#27979#21608#26399
      FieldName = 'strCycle'
      ReadOnly = True
      Size = 2
    end
    object adsMainstrstatus: TStringField
      DisplayLabel = #26159#21542#29983#25928
      FieldName = 'strstatus'
      ReadOnly = True
      Size = 6
    end
  end
  object adsDetail: TADODataSet
    Connection = con1
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT Tier3_CustomerFiles.[FileName],Data0005.EMPLOYEE_NAME,Tie' +
      'r3_CustomerFiles.UploadTime'#13#10#9#9',Tier3_CustomerFiles.IDKey,Tier3_' +
      'CustomerFiles.Ftp_fileName,Data0623.rkey622'#13#10' FROM Data0623'#13#10#9#9#9 +
      'inner join  Tier3_CustomerFiles on Data0623.FtpIDKey = Tier3_Cus' +
      'tomerFiles.IDKey'#13#10#9#9#9'INNER join Data0005 on Data0005.RKEY = Tier' +
      '3_CustomerFiles.UploadUser_d05ptr'#13#10'WHERE Data0623.rkey622 = :rke' +
      'y'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 136
    Top = 72
    object adsDetailFileName: TStringField
      DisplayLabel = #25991#20214#21517#31216
      FieldName = 'FileName'
      Size = 512
    end
    object adsDetailEMPLOYEE_NAME: TStringField
      DisplayLabel = #19978#20256#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object adsDetailUploadTime: TDateTimeField
      DisplayLabel = #19978#20256#26102#38388
      FieldName = 'UploadTime'
    end
    object adsDetailIDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object adsDetailFtp_fileName: TStringField
      FieldName = 'Ftp_fileName'
      FixedChar = True
      Size = 38
    end
    object adsDetailrkey622: TIntegerField
      FieldName = 'rkey622'
    end
  end
  object dsMain: TDataSource
    DataSet = adsMain
    Left = 192
    Top = 16
  end
  object dsDetail: TDataSource
    DataSet = adsDetail
    Left = 192
    Top = 72
  end
  object qryFtp: TADOQuery
    Connection = con1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'IDKey'
        DataType = ftString
        Size = 2
        Value = #39#39
      end>
    SQL.Strings = (
      
        'SELECT IDKey, FileName, Ftp_Ptr, FtpDir, Ftp_fileName, UploadTim' +
        'e, UploadUser_d05ptr, GroupIDKey, BEnable from Tier3_CustomerFil' +
        'es'
      'where IDkey=:IDKey')
    Left = 248
    Top = 72
    object qryFtpIDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object qryFtpFileName: TStringField
      DisplayLabel = #25991#20214#21517
      FieldName = 'FileName'
      Size = 512
    end
    object qryFtpFtp_Ptr: TIntegerField
      FieldName = 'Ftp_Ptr'
    end
    object qryFtpFtpDir: TStringField
      FieldName = 'FtpDir'
      Size = 1024
    end
    object qryFtpFtp_fileName: TStringField
      FieldName = 'Ftp_fileName'
      FixedChar = True
      Size = 38
    end
    object qryFtpUploadTime: TDateTimeField
      DisplayLabel = #19978#20256#26102#38388
      FieldName = 'UploadTime'
    end
    object qryFtpUploadUser_d05ptr: TIntegerField
      FieldName = 'UploadUser_d05ptr'
    end
    object qryFtpGroupIDKey: TStringField
      FieldName = 'GroupIDKey'
      FixedChar = True
      Size = 38
    end
    object qryFtpBEnable: TBooleanField
      FieldName = 'BEnable'
    end
  end
  object qryFileList: TADOQuery
    Connection = con1
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select rkey622,FtpIDKey from Data0623'
      'where  rkey622=:rkey')
    Left = 304
    Top = 72
  end
  object qrytmp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 152
    Top = 208
  end
  object qryCylce: TADOQuery
    Connection = con1
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT data0621.rkey496, data0621.Cycle ,case data0621.Cycle whe' +
        'n 1 then '#39#21608#39' when 2 then '#39#26376#39' end as strCycle'
      #9',data0496.GROUP_NAME,Data0496.GROUP_DESC'
      'from Data0621 '
      #9'inner join data0496 on data0496.RKEY = Data0621.rkey496')
    Left = 32
    Top = 160
    object qryCylcerkey496: TIntegerField
      FieldName = 'rkey496'
    end
    object qryCylceCycle: TWordField
      FieldName = 'Cycle'
    end
    object qryCylceGROUP_NAME: TStringField
      DisplayLabel = #26448#26009#31867#21035#20195#30721
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object qryCylceGROUP_DESC: TStringField
      DisplayLabel = #26448#26009#31867#21035#21517#31216
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object qryCylcestrCycle: TStringField
      DisplayLabel = #26816#27979#21608#26399
      FieldName = 'strCycle'
      ReadOnly = True
      Size = 2
    end
  end
  object dsCycle: TDataSource
    DataSet = qryCylce
    Left = 80
    Top = 160
  end
  object adsCell: TADODataSet
    Connection = con1
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT Tier3_CustomerFiles.[FileName],Data0005.EMPLOYEE_NAME,Tie' +
      'r3_CustomerFiles.UploadTime'#13#10#9#9',Tier3_CustomerFiles.IDKey,Tier3_' +
      'CustomerFiles.Ftp_fileName,Data0623.rkey622'#13#10' FROM Data0623'#13#10#9#9#9 +
      'inner join  Tier3_CustomerFiles on Data0623.FtpIDKey = Tier3_Cus' +
      'tomerFiles.IDKey'#13#10#9#9#9'INNER join Data0005 on Data0005.RKEY = Tier' +
      '3_CustomerFiles.UploadUser_d05ptr'#13#10'WHERE Data0623.rkey622 = :rke' +
      'y'
    DataSource = dsMain
    IndexFieldNames = 'rkey622'
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
    Left = 248
    Top = 16
    object StringField1: TStringField
      DisplayLabel = #25991#20214#21517#31216
      FieldName = 'FileName'
      Size = 512
    end
    object StringField2: TStringField
      DisplayLabel = #19978#20256#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = #19978#20256#26102#38388
      FieldName = 'UploadTime'
    end
    object StringField3: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object StringField4: TStringField
      FieldName = 'Ftp_fileName'
      FixedChar = True
      Size = 38
    end
    object IntegerField1: TIntegerField
      FieldName = 'rkey622'
    end
  end
  object dsCell: TDataSource
    DataSet = adsCell
    Left = 304
    Top = 24
  end
end
