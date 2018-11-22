object DM: TDM
  OldCreateOrder = False
  Left = 646
  Top = 380
  Height = 343
  Width = 340
  object Conn: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=koimy1234;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=WISDOMPCB;Data Source=W001057'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 8
  end
  object AQery704: TADOQuery
    Connection = Conn
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = AQery704CalcFields
    Parameters = <
      item
        Name = 'rkey05'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'b_year'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'e_year'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'b_month'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'e_month'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Data0005.EMPLOYEE_NAME,Data0005.EMPL_CODE, '
      'data0704.*,Data0034.DEPT_NAME, Data0034.DEPT_CODE'
      'FROM data0704 INNER JOIN'
      '      Data0005 ON data0704.CJRPTR = Data0005.RKEY INNER JOIN'
      '      Data0034 ON data0704.ZYRBM = Data0034.RKEY'
      'where  data0704.CJRPTR = :rkey05 and'
      '       data0704.yjh >= :b_year and'
      '       data0704.yjh <= :e_year and'
      '       data0704.mjh >= :b_month and'
      '       data0704.mjh <= :e_month')
    Left = 104
    Top = 56
    object AQery704RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQery704YJH: TIntegerField
      DisplayLabel = #35745#21010#24180
      FieldName = 'YJH'
    end
    object AQery704MJH: TIntegerField
      DisplayLabel = #35745#21010#26376
      FieldName = 'MJH'
    end
    object AQery704MJHJE: TBCDField
      DisplayLabel = #26376#35745#21010#37329#39069
      FieldName = 'MJHJE'
      Precision = 10
      Size = 2
    end
    object AQery704YJHJE: TBCDField
      DisplayLabel = #24180#35745#21010#37329#39069
      FieldName = 'YJHJE'
      Precision = 10
      Size = 2
    end
    object AQery704LJJE: TBCDField
      DisplayLabel = #32047#35745#37329#39069
      FieldName = 'LJJE'
      Precision = 10
      Size = 2
    end
    object AQery704SQJHJE: TBCDField
      DisplayLabel = #19978#26399#35745#21010#37329#39069
      FieldName = 'SQJHJE'
      Precision = 10
      Size = 2
    end
    object AQery704SQWCJE: TBCDField
      DisplayLabel = #19978#26399#23436#25104#37329#39069
      FieldName = 'SQWCJE'
      Precision = 10
      Size = 2
    end
    object AQery704BQMBJE: TBCDField
      DisplayLabel = #26412#26399#30446#26631#37329#39069
      FieldName = 'BQMBJE'
      Precision = 10
      Size = 2
    end
    object AQery704BQJHJE: TBCDField
      DisplayLabel = #26412#26399#35745#21010#37329#39069
      FieldName = 'BQJHJE'
      Precision = 10
      Size = 2
    end
    object AQery704status: TIntegerField
      DisplayLabel = #33258#25105#37492#23450
      FieldName = 'status'
    end
    object AQery704CJRPTR: TIntegerField
      DisplayLabel = #21019#24314#20154
      FieldName = 'CJRPTR'
    end
    object AQery704CJRQ: TDateTimeField
      DisplayLabel = #21019#24314#26085#26399
      FieldName = 'CJRQ'
    end
    object AQery704CZYStatus: TStringField
      DisplayLabel = #35745#21010#20154#32844#20301
      FieldKind = fkCalculated
      FieldName = 'CZYStatus'
      Size = 12
      Calculated = True
    end
    object AQery704Note: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Note'
      Size = 100
    end
    object AQery704CStatus: TStringField
      DisplayLabel = #33258#25105#37492#23450
      FieldKind = fkCalculated
      FieldName = 'CStatus'
      Size = 5
      Calculated = True
    end
    object AQery704EMPLOYEE_NAME: TStringField
      DisplayLabel = #21019#24314#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object AQery704DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object AQery704DEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object AQery704YZNBL: TBCDField
      FieldName = 'YZNBL'
      Precision = 5
      Size = 2
    end
    object AQery704YWWJE: TBCDField
      FieldName = 'YWWJE'
      Precision = 12
      Size = 2
    end
    object AQery704WWZNBL: TBCDField
      FieldName = 'WWZNBL'
      Precision = 5
      Size = 2
    end
    object AQery704SQXCJE: TBCDField
      FieldName = 'SQXCJE'
      Precision = 10
      Size = 2
    end
    object AQery704SQWCBL: TBCDField
      FieldName = 'SQWCBL'
      Precision = 5
      Size = 2
    end
    object AQery704BQXCJE: TBCDField
      FieldName = 'BQXCJE'
      Precision = 10
      Size = 2
    end
    object AQery704BQJHBL: TBCDField
      FieldName = 'BQJHBL'
      Precision = 5
      Size = 2
    end
    object AQery704EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object AQery704JHID: TStringField
      DisplayLabel = #38144#21806#30446#26631'ID'
      FieldName = 'JHID'
      Size = 12
    end
    object AQery704ZYStatus: TIntegerField
      FieldName = 'ZYStatus'
    end
    object AQery704ZYRBM: TIntegerField
      FieldName = 'ZYRBM'
    end
  end
  object ADS705: TADODataSet
    Connection = Conn
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADS705CalcFields
    CommandText = 
      'SELECT data0705.RKEY, data0705.PTR704, data0705.PTR10, data0705.' +
      'BQJHDD, '#13#10'      data0705.BQJHYP, data0705.CPStatus, data0705.BQJ' +
      'HJE, data0705.ZYCL,data0705.CPSL, data0705.PTR5, '#13#10'      data070' +
      '5.XYSTATUS, Data0010.ABBR_NAME'#13#10'FROM data0705 INNER JOIN'#13#10'      ' +
      'Data0010 ON data0705.PTR10 = Data0010.RKEY'#13#10' where ptr704=:rkey'
    DataSource = DataSource1
    IndexFieldNames = 'ptr704'
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
    Left = 104
    Top = 104
    object ADS705RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS705ptr704: TIntegerField
      FieldName = 'ptr704'
    end
    object ADS705PTR10: TIntegerField
      FieldName = 'PTR10'
    end
    object ADS705ABBR_NAME: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADS705BQJHDD: TBCDField
      DisplayLabel = #26412#26399#35745#21010#35746#21333
      FieldName = 'BQJHDD'
      Precision = 10
      Size = 2
    end
    object ADS705BQJHYP: TIntegerField
      DisplayLabel = #26412#26399#35745#21010#26679#21697
      FieldName = 'BQJHYP'
    end
    object ADS705CCPStatus: TStringField
      DisplayLabel = #20135#21697#31867#22411
      FieldKind = fkCalculated
      FieldName = 'CCPStatus'
      Size = 6
      Calculated = True
    end
    object ADS705BQJHJE: TBCDField
      DisplayLabel = #26412#26399#39044#27979#37329#39069
      FieldName = 'BQJHJE'
      Precision = 10
      Size = 2
    end
    object ADS705ZYCL: TStringField
      DisplayLabel = #20027#35201#26448#26009
      FieldName = 'ZYCL'
      Size = 50
    end
    object ADS705XYSTATUS: TIntegerField
      DisplayLabel = #20449#35465#29366#20917
      FieldName = 'XYSTATUS'
    end
    object ADS705CXYSTATUS: TStringField
      DisplayLabel = #20449#35465#29366#20917
      FieldKind = fkCalculated
      FieldName = 'CXYSTATUS'
      Size = 5
      Calculated = True
    end
    object ADS705CPSL: TBCDField
      FieldName = 'CPSL'
      Precision = 18
      Size = 2
    end
    object ADS705PTR5: TIntegerField
      FieldName = 'PTR5'
    end
    object ADS705CPStatus: TIntegerField
      FieldName = 'CPStatus'
    end
  end
  object DataSource1: TDataSource
    DataSet = AQery704
    Left = 48
    Top = 56
  end
  object DataSource2: TDataSource
    DataSet = ADS705
    Left = 48
    Top = 104
  end
  object DataSource3: TDataSource
    DataSet = ADS706
    Left = 48
    Top = 160
  end
  object DataSource4: TDataSource
    DataSet = ADS707
    Left = 48
    Top = 216
  end
  object ADS706: TADODataSet
    Connection = Conn
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADS706CalcFields
    CommandText = 'SELECT data0706.*'#13#10'FROM data0706'#13#10' where ptr704=:rkey'
    DataSource = DataSource1
    IndexFieldNames = 'ptr704'
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
    Left = 104
    Top = 160
    object ADS706RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS706PTR704: TIntegerField
      FieldName = 'PTR704'
    end
    object ADS706PTR10: TIntegerField
      FieldName = 'PTR10'
    end
    object ADS706KHMC: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'KHMC'
      Size = 50
    end
    object ADS706GMRS: TIntegerField
      DisplayLabel = #35268#26684#20154#25968
      FieldName = 'GMRS'
    end
    object ADS706ZYCP: TStringField
      DisplayLabel = #20027#35201#20135#21697
      FieldName = 'ZYCP'
      Size = 50
    end
    object ADS706PCBYL: TBCDField
      DisplayLabel = 'PCB'#26376#29992#37327
      FieldName = 'PCBYL'
      Precision = 10
      Size = 2
    end
    object ADS706TXDZ: TStringField
      DisplayLabel = #22320#22336
      FieldName = 'TXDZ'
      Size = 50
    end
    object ADS706TXDH: TStringField
      DisplayLabel = #32852#31995#30005#35805
      FieldName = 'TXDH'
      Size = 15
    end
    object ADS706TXRXM: TStringField
      DisplayLabel = #32852#31995#20154
      FieldName = 'TXRXM'
      Size = 10
    end
    object ADS706HZYX: TIntegerField
      DisplayLabel = #21512#20316#24847#21521
      FieldName = 'HZYX'
    end
    object ADS706CHZYX: TStringField
      DisplayLabel = #21512#20316#24847#21521
      DisplayWidth = 12
      FieldKind = fkCalculated
      FieldName = 'CHZYX'
      Size = 12
      Calculated = True
    end
  end
  object ADS707: TADODataSet
    Connection = Conn
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADS707CalcFields
    CommandText = 
      'SELECT data0707.*, Data0010.ABBR_NAME'#13#10'FROM data0707 INNER JOIN'#13 +
      #10'      Data0010 ON data0707.PTR10 = Data0010.RKEY'#13#10' where ptr=:r' +
      'key'
    DataSource = DataSource1
    IndexFieldNames = 'PTR'
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
    Left = 104
    Top = 216
    object ADS707RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS707PTR: TIntegerField
      FieldName = 'PTR'
    end
    object ADS707PTR10: TIntegerField
      FieldName = 'PTR10'
    end
    object ADS707ABBR_NAME: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADS707HJYS: TBCDField
      DisplayLabel = #24635#27424#36135#27454
      FieldName = 'HJYS'
      Precision = 10
      Size = 2
    end
    object ADS707DQYS: TBCDField
      DisplayLabel = #21040#26399#36135#27454
      FieldName = 'DQYS'
      Precision = 10
      Size = 2
    end
    object ADS707JHYS: TBCDField
      DisplayLabel = #35745#21010#25910#27454
      FieldName = 'JHYS'
      Precision = 10
      Size = 2
    end
    object ADS707JHRQ: TDateTimeField
      DisplayLabel = #35745#21010#26085#26399
      FieldName = 'JHRQ'
    end
    object ADS707CQTS: TBCDField
      DisplayLabel = #36229#26399#22825#25968
      FieldName = 'CQTS'
      Precision = 5
      Size = 2
    end
    object ADS707HZSTATUS: TIntegerField
      FieldName = 'HZSTATUS'
    end
    object ADS707CHZSTATUS: TStringField
      DisplayLabel = #21512#20316#23545#31574
      FieldKind = fkCalculated
      FieldName = 'CHZSTATUS'
      Size = 10
      Calculated = True
    end
  end
  object AQery: TADOQuery
    Connection = Conn
    Parameters = <>
    Left = 216
    Top = 56
  end
  object AQery4: TADOQuery
    Connection = Conn
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM Data0004'
      'WHERE rkey=67')
    Left = 216
    Top = 120
  end
  object AQery5: TADOQuery
    Connection = Conn
    Parameters = <
      item
        Name = 'rky'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Data0005.RKEY, Data0005.EMPL_CODE,'
      'Data0005.EMPLOYEE_NAME,Data0005.EMPLOYEE_ID, Data0005.popedom,'
      '      CASE WHEN Data0005.popedom = 0 THEN '#39#26080#39
      '      WHEN Data0005.popedom = 1 THEN '#39#36319#21333#21592#39
      '       WHEN Data0005.popedom = 2 THEN '#39#19994#21153#21592#39
      '        WHEN Data0005.popedom = 3 THEN '#39#33829#38144#32463#29702#39
      '       WHEN Data0005.popedom = 4 THEN '#39#24320#21457#21103#24635#39' END AS ZY, '
      '      Data0034.RKEY AS BMRKY'
      'FROM Data0005 INNER JOIN'
      '      Data0034 ON Data0005.EMPLOYEE_ID = Data0034.RKEY'
      'WHERE Data0005.RKEY =:rky')
    Left = 216
    Top = 176
    object AQery5RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQery5EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object AQery5EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object AQery5EMPLOYEE_ID: TIntegerField
      FieldName = 'EMPLOYEE_ID'
    end
    object AQery5popedom: TWordField
      FieldName = 'popedom'
    end
    object AQery5ZY: TStringField
      FieldName = 'ZY'
      ReadOnly = True
      Size = 8
    end
    object AQery5BMRKY: TAutoIncField
      FieldName = 'BMRKY'
      ReadOnly = True
    end
  end
end
