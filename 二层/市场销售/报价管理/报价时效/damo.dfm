object dm: Tdm
  OldCreateOrder = False
  Left = 243
  Top = 103
  Height = 352
  Width = 411
  object ADOConn: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
  end
  object aqTmp: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 327
    Top = 4
  end
  object dsBrowse: TDataSource
    DataSet = adsBrowse
    Left = 32
    Top = 160
  end
  object adsBrowse: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT t242.*,CASE t242.Status WHEN 0 THEN '#39#24453#25552#20132#39' WHEN 1 THEN '#39#24050#25552 +
      #20132#39' WHEN 255 THEN '#39#24050#21462#28040#39' ELSE '#39#39' END AS TStatus,'#13#10'CASE t242.Quote_' +
      'Status WHEN 0 THEN '#39#24453#25253#20215#39' WHEN 1 THEN '#39#25253#20215#20013#39' WHEN 2 THEN '#39#25253#20215#23436#25104#39' WH' +
      'EN 3 THEN '#39#35810#38382#20013#39' WHEN 4 THEN '#39#24050#22238#22797#39' WHEN 255 THEN '#39#24050#21462#28040#39' ELSE '#39#39' EN' +
      'D AS TQuote_Status,'#13#10#9't242.CUSTOMER_NAME,ISNULL(t10.ABBR_NAME,'#39#39 +
      ') AS ABBR_NAME,ISNULL(CUST_CODE,'#39#39') AS CUST_CODE,'#13#10#9'ISNULL(t241.' +
      'Code,'#39#39') AS Code,ISNULL(t241.Name,'#39#39') AS Name,ISNULL(t241.Time,0' +
      ') AS Time,'#13#10#9'ISNULL(t243.SeqNO,0) AS SeqNO,ISNULL(t243.FileName,' +
      #39#39') AS FileName,'#13#10#9't243.UploadTime,t243.DownloadTime,t243.AskTim' +
      'e,t243.AskInfo,t243.AnswerTime,t243.AnswerInfo,'#13#10#9'ISNULL(t5.EMPL' +
      'OYEE_NAME,'#39#39') AS CreateBy,ISNULL(t5_1.EMPLOYEE_NAME,'#39#39') AS Uploa' +
      'dBy,ISNULL(t5_2.EMPLOYEE_NAME,'#39#39') AS FirstDownloadBy, Case IsNew' +
      'CustQuote When 0 Then '#39#21542#39' else '#39#26159#39' End as NewCustQuote'#13#10'FROM Dat' +
      'a0242 t242 LEFT JOIN Data0241 t241 ON t242.Type_PTR=t241.RKEY'#13#10'L' +
      'EFT JOIN Data0010 t10 ON t242.CUST_PTR=t10.RKEY'#13#10'LEFT JOIN Data0' +
      '005 t5 ON t242.CreateBy_PTR=t5.RKEY'#13#10'LEFT JOIN (SELECT D1.* FROM' +
      ' Data0243 D1'#13#10#9#9#9'INNER JOIN (SELECT tmp2.PTR_242,MAX(ISNULL(tmp2' +
      '.SeqNO,0)) AS SeqNO'#13#10#9#9#9#9#9#9'FROM Data0242 tmp1 LEFT JOIN Data0243' +
      ' tmp2 ON tmp1.RKEY = tmp2.PTR_242'#13#10#9#9#9#9#9#9'WHERE tmp1.CreateTime >' +
      '= :dtpk1 AND tmp1.CreateTime < :dtpk2'#13#10#9#9#9#9#9#9'GROUP BY tmp2.PTR_2' +
      '42) AS D2 ON D2.PTR_242 = D1.PTR_242 AND D2.SeqNO = D1.SeqNO) t2' +
      '43 ON t242.RKEY = t243.PTR_242'#13#10'LEFT JOIN Data0005 t5_1 ON t243.' +
      'UploadBy_PTR=t5_1.RKEY'#13#10'LEFT JOIN Data0005 t5_2 ON t243.FirstDow' +
      'nloadBy_PTR=t5_2.RKEY'#13#10'WHERE t242.CreateTime >= :dtpk1 AND t242.' +
      'CreateTime < :dtpk2'
    IndexFieldNames = 'PaperNO'
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    Prepared = True
    Left = 32
    Top = 104
    object adsBrowseRKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object adsBrowsePaperNO: TStringField
      DisplayLabel = #21333#25454#32534#21495
      DisplayWidth = 15
      FieldName = 'PaperNO'
      Size = 18
    end
    object adsBrowseCUST_PTR: TIntegerField
      FieldName = 'CUST_PTR'
      Visible = False
    end
    object adsBrowseMANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      DisplayWidth = 25
      FieldName = 'MANU_PART_DESC'
      Size = 50
    end
    object adsBrowseType_PTR: TIntegerField
      FieldName = 'Type_PTR'
      Visible = False
    end
    object adsBrowseCreateBy_PTR: TIntegerField
      FieldName = 'CreateBy_PTR'
      Visible = False
    end
    object adsBrowseCreateTime: TDateTimeField
      DisplayLabel = #21019#24314#26085#26399
      FieldName = 'CreateTime'
    end
    object adsBrowseStatus: TSmallintField
      FieldName = 'Status'
      Visible = False
    end
    object adsBrowseFinishTime: TDateTimeField
      DisplayLabel = #25552#20132#26085#26399
      FieldName = 'FinishTime'
    end
    object adsBrowseTStatus: TStringField
      DisplayLabel = #21333#25454#29366#24577
      DisplayWidth = 10
      FieldName = 'TStatus'
      ReadOnly = True
      Size = 8
    end
    object adsBrowseCUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      ReadOnly = True
      Size = 10
    end
    object adsBrowseABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      ReadOnly = True
      Size = 10
    end
    object adsBrowseCUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      DisplayWidth = 20
      FieldName = 'CUSTOMER_NAME'
      ReadOnly = True
      Size = 100
    end
    object adsBrowseCode: TStringField
      DisplayLabel = #20135#21697#31867#21035#20195#30721
      FieldName = 'Code'
      ReadOnly = True
      Size = 10
    end
    object adsBrowseName: TStringField
      DisplayLabel = #20135#21697#31867#21035
      DisplayWidth = 15
      FieldName = 'Name'
      ReadOnly = True
      Size = 30
    end
    object adsBrowseTime: TIntegerField
      DisplayLabel = #26631#20934#26102#38388'('#20998#38047')'
      FieldName = 'Time'
      ReadOnly = True
    end
    object adsBrowseSeqNO: TSmallintField
      DisplayLabel = #24207#21495
      FieldName = 'SeqNO'
      ReadOnly = True
    end
    object adsBrowseFileName: TStringField
      DisplayLabel = #25991#20214#21517
      DisplayWidth = 20
      FieldName = 'FileName'
      ReadOnly = True
      Size = 100
    end
    object adsBrowseUploadTime: TDateTimeField
      DisplayLabel = #19978#20256#26085#26399
      FieldName = 'UploadTime'
    end
    object adsBrowseDownloadTime: TDateTimeField
      DisplayLabel = #39318#27425#19979#36733#26085#26399
      FieldName = 'DownloadTime'
    end
    object adsBrowseAskTime: TDateTimeField
      DisplayLabel = #35810#38382#26085#26399
      FieldName = 'AskTime'
    end
    object adsBrowseAskInfo: TStringField
      DisplayLabel = #35810#38382#20869#23481
      DisplayWidth = 50
      FieldName = 'AskInfo'
      Size = 254
    end
    object adsBrowseAnswerTime: TDateTimeField
      DisplayLabel = #22238#22797#26085#26399
      FieldName = 'AnswerTime'
    end
    object adsBrowseAnswerInfo: TStringField
      DisplayLabel = #22238#22797#20869#23481
      DisplayWidth = 50
      FieldName = 'AnswerInfo'
      Size = 254
    end
    object adsBrowseCreateBy: TStringField
      DisplayLabel = #21019#24314#32773
      DisplayWidth = 10
      FieldName = 'CreateBy'
      ReadOnly = True
      Size = 16
    end
    object adsBrowseUploadBy: TStringField
      DisplayLabel = #19978#20256#32773
      DisplayWidth = 10
      FieldName = 'UploadBy'
      ReadOnly = True
      Size = 16
    end
    object adsBrowseFirstDownloadBy: TStringField
      DisplayLabel = #39318#27425#19979#36733#32773
      DisplayWidth = 12
      FieldName = 'FirstDownloadBy'
      ReadOnly = True
      Size = 16
    end
    object adsBrowseQuote_Status: TSmallintField
      FieldName = 'Quote_Status'
      Visible = False
    end
    object adsBrowseTQuote_Status: TStringField
      DisplayLabel = #25253#20215#29366#24577
      DisplayWidth = 10
      FieldName = 'TQuote_Status'
      ReadOnly = True
      Size = 8
    end
    object adsBrowseQuote_FinishTime: TDateTimeField
      DisplayLabel = #25253#20215#23436#25104#26085#26399
      FieldName = 'Quote_FinishTime'
    end
    object adsBrowseNewCustQuote: TStringField
      DisplayLabel = #26032#23458#25143#25253#20215
      DisplayWidth = 10
      FieldName = 'NewCustQuote'
      ReadOnly = True
      Size = 2
    end
    object adsBrowseCancelReason: TStringField
      DisplayLabel = #21462#28040#21407#22240
      DisplayWidth = 20
      FieldName = 'CancelReason'
      Size = 255
    end
    object adsBrowseRemark: TStringField
      DisplayLabel = #20135#21697#29992#36884
      FieldName = 'Remark'
      Size = 255
    end
  end
  object aqGetDate: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 32
    Top = 48
  end
  object dsMain: TDataSource
    DataSet = aqMain
    Left = 87
    Top = 160
  end
  object aqMain: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeClose = aqMainBeforeClose
    AfterScroll = aqMainAfterScroll
    OnCalcFields = aqMainCalcFields
    OnNewRecord = aqMainNewRecord
    Parameters = <
      item
        Name = 'RKEY'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Select * From Data0242'
      'Where RKEY = :RKEY')
    Left = 87
    Top = 104
    object aqMainRKEY: TAutoIncField
      FieldName = 'RKEY'
    end
    object aqMainPaperNO: TStringField
      FieldName = 'PaperNO'
      Size = 18
    end
    object aqMainCUST_PTR: TIntegerField
      FieldName = 'CUST_PTR'
    end
    object aqMainCUST_CODE2: TStringField
      FieldKind = fkCalculated
      FieldName = 'CUST_CODE'
      Size = 10
      Calculated = True
    end
    object aqMainABBR_NAME2: TStringField
      FieldKind = fkCalculated
      FieldName = 'ABBR_NAME'
      Size = 10
      Calculated = True
    end
    object aqMainCUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object aqMainMANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 50
    end
    object aqMainType_PTR: TIntegerField
      FieldName = 'Type_PTR'
    end
    object aqMainTypeCode: TStringField
      FieldKind = fkLookup
      FieldName = 'TypeCode'
      LookupDataSet = at241
      LookupKeyFields = 'RKEY'
      LookupResultField = 'Code'
      KeyFields = 'Type_PTR'
      LookupCache = True
      Size = 10
      Lookup = True
    end
    object aqMainTypeName: TStringField
      FieldKind = fkLookup
      FieldName = 'TypeName'
      LookupDataSet = at241
      LookupKeyFields = 'RKEY'
      LookupResultField = 'Name'
      KeyFields = 'Type_PTR'
      LookupCache = True
      Size = 30
      Lookup = True
    end
    object aqMainCreateBy_PTR: TIntegerField
      FieldName = 'CreateBy_PTR'
    end
    object aqMainCreateTime: TDateTimeField
      FieldName = 'CreateTime'
    end
    object aqMainStatus: TSmallintField
      FieldName = 'Status'
    end
    object aqMainFinishTime: TDateTimeField
      FieldName = 'FinishTime'
    end
    object aqMainIsGerberData: TBooleanField
      FieldName = 'IsGerberData'
    end
    object aqMainIsProdNotesData: TBooleanField
      FieldName = 'IsProdNotesData'
    end
    object aqMainIsPbData: TBooleanField
      FieldName = 'IsPbData'
    end
    object aqMainOtherData: TBooleanField
      FieldName = 'OtherData'
    end
    object aqMainIsNewCustQuote: TBooleanField
      FieldName = 'IsNewCustQuote'
    end
    object aqMainOtherDataInfo: TStringField
      FieldName = 'OtherDataInfo'
      Size = 30
    end
    object aqMainQuote_Status: TSmallintField
      FieldName = 'Quote_Status'
    end
    object aqMainQuote_FinishTime: TDateTimeField
      FieldName = 'Quote_FinishTime'
    end
    object aqMainSales_Ptr: TIntegerField
      FieldName = 'Sales_Ptr'
    end
    object aqMainCreateBy1: TStringField
      FieldKind = fkCalculated
      FieldName = 'Sales'
      Size = 16
      Calculated = True
    end
    object aqMainCancelReason: TStringField
      FieldName = 'CancelReason'
      Size = 255
    end
    object aqMainCurr_Ptr: TIntegerField
      FieldName = 'Curr_Ptr'
    end
    object aqMainCURR_CODE: TStringField
      FieldKind = fkLookup
      FieldName = 'CURR_CODE'
      LookupDataSet = at1
      LookupKeyFields = 'RKEY'
      LookupResultField = 'CURR_CODE'
      KeyFields = 'Curr_Ptr'
      LookupCache = True
      Size = 5
      Lookup = True
    end
    object aqMainCURR_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'CURR_NAME'
      LookupDataSet = at1
      LookupKeyFields = 'RKEY'
      LookupResultField = 'CURR_NAME'
      KeyFields = 'Curr_Ptr'
      LookupCache = True
      Lookup = True
    end
    object aqMainRemark: TStringField
      FieldName = 'Remark'
      Size = 255
    end
    object aqMainNote: TStringField
      FieldName = 'Note'
      Size = 255
    end
  end
  object at10: TADOTable
    Connection = ADOConn
    CursorType = ctStatic
    LockType = ltReadOnly
    TableName = 'Data0010'
    Left = 136
    Top = 240
    object at10RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object at10CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object at10CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object at10ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
  end
  object at5: TADOTable
    Connection = ADOConn
    CursorType = ctStatic
    LockType = ltReadOnly
    TableName = 'Data0005'
    Left = 184
    Top = 240
    object at5RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object at5EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object at5EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object at241: TADOTable
    Connection = ADOConn
    CursorType = ctStatic
    LockType = ltReadOnly
    TableName = 'Data0241'
    Left = 88
    Top = 240
    object at241RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object at241Code: TStringField
      FieldName = 'Code'
      Size = 10
    end
    object at241Name: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object at241Time: TIntegerField
      FieldName = 'Time'
    end
  end
  object aqDetail: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'RKEY242'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Select * From Data0243'
      'Where PTR_242 = :RKEY242'
      'Order By SeqNO')
    Left = 134
    Top = 104
    object aqDetailRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aqDetailPTR_242: TIntegerField
      FieldName = 'PTR_242'
    end
    object aqDetailSeqNO: TSmallintField
      DisplayLabel = #24207#21495
      DisplayWidth = 5
      FieldName = 'SeqNO'
    end
    object aqDetailFileName: TStringField
      DisplayLabel = #25991#20214#21517
      DisplayWidth = 25
      FieldName = 'FileName'
      Size = 100
    end
    object aqDetailUploadTime: TDateTimeField
      DisplayLabel = #19978#20256#26085#26399
      FieldName = 'UploadTime'
    end
    object aqDetailDownloadTime: TDateTimeField
      DisplayLabel = #39318#27425#19979#36733#26085#26399
      FieldName = 'DownloadTime'
    end
    object aqDetailAskTime: TDateTimeField
      DisplayLabel = #35810#38382#26085#26399
      FieldName = 'AskTime'
    end
    object aqDetailAskInfo: TStringField
      DisplayLabel = #35810#38382#22791#27880
      DisplayWidth = 30
      FieldName = 'AskInfo'
      Size = 254
    end
    object aqDetailAnswerTime: TDateTimeField
      DisplayLabel = #22238#22797#26085#26399
      FieldName = 'AnswerTime'
    end
    object aqDetailAnswerInfo: TStringField
      DisplayLabel = #22238#22797#22791#27880
      DisplayWidth = 30
      FieldName = 'AnswerInfo'
      Size = 254
    end
    object aqDetailUploadBy_PTR: TIntegerField
      FieldName = 'UploadBy_PTR'
    end
    object aqDetailUploadBy: TStringField
      DisplayLabel = #19978#20256#32773
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'UploadBy'
      LookupDataSet = at5
      LookupKeyFields = 'RKEY'
      LookupResultField = 'EMPLOYEE_NAME'
      KeyFields = 'UploadBy_PTR'
      LookupCache = True
      Size = 16
      Lookup = True
    end
    object aqDetailFirstDownloadBy_PTR: TIntegerField
      FieldName = 'FirstDownloadBy_PTR'
    end
    object aqDetailFirstDownloadBy: TStringField
      DisplayLabel = #39318#27425#19979#36733#32773
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'FirstDownloadBy'
      LookupDataSet = at5
      LookupKeyFields = 'RKEY'
      LookupResultField = 'EMPLOYEE_NAME'
      KeyFields = 'FirstDownloadBy_PTR'
      LookupCache = True
      Size = 16
      Lookup = True
    end
    object aqDetailAnswerRecveTime: TDateTimeField
      FieldName = 'AnswerRecveTime'
    end
    object aqDetailAnswerRecvePeople: TIntegerField
      FieldName = 'AnswerRecvePeople'
    end
  end
  object dsDetail: TDataSource
    DataSet = aqDetail
    Left = 134
    Top = 160
  end
  object dsSetItem: TDataSource
    DataSet = aqSetItem
    Left = 257
    Top = 162
  end
  object aqSetItem: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'Select * From Data0241'
      'order by code')
    Left = 257
    Top = 106
    object aqSetItemRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aqSetItemCode: TStringField
      FieldName = 'Code'
      Size = 10
    end
    object aqSetItemName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object aqSetItemTime: TIntegerField
      FieldName = 'Time'
    end
  end
  object aq244: TADOQuery
    Connection = ADOConn
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * from data0244')
    Left = 309
    Top = 106
    object aq244RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq244PTR_73: TIntegerField
      FieldName = 'PTR_73'
    end
    object aq244USER_FULL_NAME: TStringField
      DisplayLabel = #29992#25143
      FieldKind = fkLookup
      FieldName = 'USER_FULL_NAME'
      LookupDataSet = at73
      LookupKeyFields = 'RKEY'
      LookupResultField = 'USER_FULL_NAME'
      KeyFields = 'PTR_73'
      LookupCache = True
      Size = 30
      Lookup = True
    end
  end
  object ds244: TDataSource
    DataSet = aq244
    Left = 311
    Top = 162
  end
  object at73: TADOTable
    Connection = ADOConn
    CursorType = ctStatic
    LockType = ltReadOnly
    TableName = 'Data0073'
    Left = 232
    Top = 241
    object at73RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object at73USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
  end
  object at1: TADOTable
    Connection = ADOConn
    CursorType = ctStatic
    LockType = ltReadOnly
    TableName = 'Data0001'
    Left = 280
    Top = 241
    object AutoIncField1: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object at1CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object at1CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
  end
  object ds247: TDataSource
    DataSet = aq247
    Left = 359
    Top = 162
  end
  object aq247: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * from data0247')
    Left = 357
    Top = 106
    object aq247RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq247ProdUsageID: TStringField
      FieldName = 'ProdUsageID'
      Size = 10
    end
    object aq247ProdUsageName: TStringField
      FieldName = 'ProdUsageName'
      Size = 30
    end
  end
end
