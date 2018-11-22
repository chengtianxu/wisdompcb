object DM: TDM
  OldCreateOrder = False
  Left = 445
  Top = 166
  Height = 563
  Width = 567
  object Conn: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdompcb1077;Persist Security Info' +
      '=True;User ID=sa;Initial Catalog=wisdompcb_bak;Data Source=172.1' +
      '6.8.8'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 16
  end
  object AQery704: TADOQuery
    Connection = Conn
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = AQery704CalcFields
    Parameters = <
      item
        Name = 'b_year'
        Size = -1
        Value = Null
      end
      item
        Name = 'e_year'
        Size = -1
        Value = Null
      end
      item
        Name = 'b_month'
        Size = -1
        Value = Null
      end
      item
        Name = 'e_month'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Data0005.EMPLOYEE_NAME,Data0005.EMPL_CODE,'
      'data0704.*,Data0034.DEPT_NAME, Data0034.DEPT_CODE'
      'FROM data0704 INNER JOIN'
      '      Data0005 ON data0704.CJRPTR = Data0005.RKEY INNER JOIN'
      '      Data0034 ON data0704.ZYRBM = Data0034.RKEY'
      'where  data0704.yjh >= :b_year and'
      '       data0704.yjh <= :e_year and'
      '       data0704.mjh >= :b_month and'
      '       data0704.mjh <= :e_month')
    Left = 104
    Top = 72
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
    Top = 120
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
    Top = 72
  end
  object DataSource2: TDataSource
    DataSet = ADS705
    Left = 48
    Top = 120
  end
  object DataSource3: TDataSource
    DataSet = ADS706
    Left = 48
    Top = 176
  end
  object DataSource4: TDataSource
    DataSet = ADS707
    Left = 48
    Top = 232
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
    Top = 176
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
    Top = 232
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
      
        'SELECT Data0005.RKEY, Data0005.EMPL_CODE, Data0005.EMPLOYEE_NAME' +
        ',Data0005.EMPLOYEE_ID, Data0005.popedom, '
      
        '      CASE WHEN Data0005.popedom = 0 THEN '#39#26080#39' WHEN Data0005.pope' +
        'dom = 1 THEN '#39#36319#21333#21592#39
      
        '       WHEN Data0005.popedom = 2 THEN '#39#19994#21153#21592#39' WHEN Data0005.popedo' +
        'm = 3 THEN '#39#33829#38144#32463#29702#39
      '       WHEN Data0005.popedom = 4 THEN '#39#24320#21457#21103#24635#39' END AS ZY, '
      '      Data0034.RKEY AS BMRKY'
      'FROM Data0005 INNER JOIN'
      '      Data0034 ON Data0005.EMPLOYEE_ID = Data0034.RKEY'
      'WHERE Data0005.RKEY =:rky')
    Left = 216
    Top = 176
  end
  object AQery: TADOQuery
    Connection = Conn
    Parameters = <>
    Left = 216
    Top = 72
  end
  object AQery708: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = AQery708CalcFields
    Parameters = <
      item
        Name = 'b_year'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'e_year'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'b_month'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'e_month'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT data0704.YJH, data0704.MJH, data0704.MJHJE, data0708.*, '
      '      Data0005.EMPLOYEE_NAME AS [user],Data0005.EMPL_CODE, '
      'Data0005_1.EMPLOYEE_NAME AS SHR, '
      '      data0704.YZNBL, data0704.YJHJE, '
      '      Data0034.DEPT_CODE, '
      '      Data0034.DEPT_NAME'
      'FROM data0708 INNER JOIN'
      '      Data0005 ON data0708.USEPTR = Data0005.RKEY INNER JOIN'
      '      data0704 ON data0708.PTR704 = data0704.RKEY INNER JOIN'
      '      Data0034 ON data0708.BMPTR = Data0034.RKEY LEFT OUTER JOIN'
      '      Data0005 Data0005_1 ON data0708.SHPTR = Data0005_1.RKEY'
      'where  data0704.yjh >= :b_year and'
      '       data0704.yjh <= :e_year and'
      '       data0704.mjh >= :b_month and'
      '       data0704.mjh <= :e_month')
    Left = 400
    Top = 56
    object AQery708RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQery708PTR704: TIntegerField
      FieldName = 'PTR704'
    end
    object AQery708RZID: TStringField
      DisplayLabel = #24037#20316#26085#24535#32534#21495
      FieldName = 'RZID'
      Size = 11
    end
    object AQery708YJH: TIntegerField
      DisplayLabel = #35745#21010#24180
      FieldName = 'YJH'
    end
    object AQery708MJH: TIntegerField
      DisplayLabel = #35745#21010#26376
      FieldName = 'MJH'
    end
    object AQery708MJHJE: TBCDField
      DisplayLabel = #26412#26376#35745#21010
      FieldName = 'MJHJE'
      Precision = 10
      Size = 2
    end
    object AQery708BRLJ: TBCDField
      DisplayLabel = #26412#26085#32047#35745
      FieldName = 'BRLJ'
      Precision = 12
      Size = 2
    end
    object AQery708RZYBL: TBCDField
      DisplayLabel = #26085#21344#26376#27604#20363
      FieldName = 'RZYBL'
      Precision = 5
      Size = 2
    end
    object AQery708YZNBL: TBCDField
      DisplayLabel = #26376#21344#24180#27604#20363
      FieldName = 'YZNBL'
      Precision = 5
      Size = 2
    end
    object AQery708YJHJE: TBCDField
      DisplayLabel = #20840#24180#35745#21010
      FieldName = 'YJHJE'
      Precision = 12
      Size = 2
    end
    object AQery708TJSTATUS: TIntegerField
      DisplayLabel = #29305#24613#20135#21697#26159#21542#33853#23454
      FieldName = 'TJSTATUS'
    end
    object AQery708YSSTATUS: TIntegerField
      DisplayLabel = #24212#25910#26159#21542#33853#23454
      FieldName = 'YSSTATUS'
    end
    object AQery708USEPTR: TIntegerField
      FieldName = 'USEPTR'
    end
    object AQery708STATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object AQery708SHPTR: TIntegerField
      FieldName = 'SHPTR'
    end
    object AQery708CJRQ: TDateTimeField
      DisplayLabel = #21019#24314#26085#26399
      FieldName = 'CJRQ'
    end
    object AQery708Note: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Note'
      Size = 200
    end
    object AQery708user: TStringField
      DisplayLabel = #21019#24314#20154
      FieldName = 'user'
      Size = 16
    end
    object AQery708SHR: TStringField
      DisplayLabel = #23457#26680#20154
      FieldName = 'SHR'
      Size = 16
    end
    object AQery708CSTATUS: TStringField
      DisplayLabel = #23457#26680
      FieldKind = fkCalculated
      FieldName = 'CSTATUS'
      Size = 4
      Calculated = True
    end
    object AQery708CTJSTATUS: TStringField
      DisplayLabel = #29305#24613#20135#21697#26159#21542#33853#23454
      FieldKind = fkCalculated
      FieldName = 'CTJSTATUS'
      Size = 2
      Calculated = True
    end
    object AQery708CYSSTATUS: TStringField
      DisplayLabel = #24212#25910#26159#21542#33853#23454
      FieldKind = fkCalculated
      FieldName = 'CYSSTATUS'
      Size = 2
      Calculated = True
    end
    object AQery708EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object AQery708BMPTR: TIntegerField
      FieldName = 'BMPTR'
    end
    object AQery708ZYStatus: TIntegerField
      FieldName = 'ZYStatus'
    end
    object AQery708DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object AQery708DEPT_NAME: TStringField
      DisplayLabel = #21019#24314#20154#37096#38376
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object AQery708CZYStatus: TStringField
      DisplayLabel = #21019#24314#20154#32844#20301
      FieldKind = fkCalculated
      FieldName = 'CZYStatus'
      Size = 12
      Calculated = True
    end
    object AQery708enter_date: TDateTimeField
      FieldName = 'enter_date'
    end
  end
  object ADS709: TADODataSet
    Connection = Conn
    LockType = ltReadOnly
    CommandText = 
      'SELECT data0709.RKEY, data0709.PTR708,Data0010.CUST_CODE, Data00' +
      '10.ABBR_NAME, data0709.PTR10, data0709.PTR50, '#13#10'      Data0025.M' +
      'ANU_PART_NUMBER, data0709.DDSL, data0709.JHSL, '#13#10'      data0709.' +
      'QHSL'#13#10'FROM data0709 INNER JOIN'#13#10'      Data0010 ON data0709.PTR10' +
      ' = Data0010.RKEY INNER JOIN'#13#10'      Data0025 ON data0709.PTR50 = ' +
      'Data0025.RKEY'#13#10' where ptr708=:rkey'
    DataSource = DataSource5
    IndexFieldNames = 'PTR708'
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
    Left = 400
    Top = 112
    object ADS709RKEY: TIntegerField
      FieldName = 'RKEY'
    end
    object ADS709PTR708: TIntegerField
      FieldName = 'PTR708'
    end
    object ADS709PTR10: TIntegerField
      FieldName = 'PTR10'
    end
    object ADS709PTR50: TIntegerField
      FieldName = 'PTR50'
    end
    object ADS709CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADS709ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADS709MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADS709DDSL: TBCDField
      DisplayLabel = #35746#21333#25968#37327
      FieldName = 'DDSL'
      Precision = 10
      Size = 2
    end
    object ADS709JHSL: TBCDField
      DisplayLabel = #20132#36135#25968#37327
      FieldName = 'JHSL'
      Precision = 10
      Size = 2
    end
    object ADS709QHSL: TBCDField
      DisplayLabel = #27424#36135#25968#37327
      FieldName = 'QHSL'
      Precision = 10
      Size = 2
    end
  end
  object ADS710: TADODataSet
    Connection = Conn
    LockType = ltReadOnly
    CommandText = 
      'SELECT data0710.rkey,data0710.PTR708,Data0010.CUSTOMER_NAME, Dat' +
      'a0025.MANU_PART_NUMBER,  data0710.SL, data0710.note, data0710.GJ' +
      'QK, '#13#10'data0710.JJBF, data0710.JJSX,data0710.PTR10, data0710.PTR5' +
      '0'#13#10'FROM data0710 INNER JOIN'#13#10'      Data0010 ON data0710.PTR10 = ' +
      'Data0010.RKEY INNER JOIN'#13#10'      Data0025 ON data0710.PTR50 = Dat' +
      'a0025.RKEY'#13#10' where ptr708=:rkey'
    DataSource = DataSource5
    IndexFieldNames = 'PTR708'
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
    Left = 400
    Top = 168
    object ADS710CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADS710MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADS710SL: TBCDField
      DisplayLabel = #25968#37327
      FieldName = 'SL'
      Precision = 10
      Size = 0
    end
    object ADS710note: TStringField
      DisplayLabel = #25237#35785'/'#36864#36135#21407#22240
      FieldName = 'note'
      Size = 100
    end
    object ADS710GJQK: TStringField
      DisplayLabel = #36319#36827#24773#20917
      FieldName = 'GJQK'
      Size = 100
    end
    object ADS710JJBF: TStringField
      DisplayLabel = #35299#20915#21150#27861
      FieldName = 'JJBF'
      Size = 100
    end
    object ADS710JJSX: TDateTimeField
      DisplayLabel = #35299#20915#26102#38480
      FieldName = 'JJSX'
    end
    object ADS710rkey: TIntegerField
      FieldName = 'rkey'
    end
    object ADS710PTR708: TIntegerField
      FieldName = 'PTR708'
    end
    object ADS710PTR10: TIntegerField
      FieldName = 'PTR10'
    end
    object ADS710PTR50: TIntegerField
      FieldName = 'PTR50'
    end
  end
  object ADS711: TADODataSet
    Connection = Conn
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = ADS711CalcFields
    CommandText = 'SELECT *'#13#10'FROM data0711'#13#10'where ptr708=:rkey'
    DataSource = DataSource5
    IndexFieldNames = 'PTR708'
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
    Left = 400
    Top = 216
    object ADS711RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS711PTR708: TIntegerField
      FieldName = 'PTR708'
    end
    object ADS711PTR10: TIntegerField
      FieldName = 'PTR10'
    end
    object ADS711KHMC: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'KHMC'
      Size = 15
    end
    object ADS711TXDZ: TStringField
      DisplayLabel = #32852#31995#22320#28857
      FieldName = 'TXDZ'
    end
    object ADS711TXDH: TStringField
      DisplayLabel = #32852#31995#30005#35805
      FieldName = 'TXDH'
      Size = 15
    end
    object ADS711TXRXM: TStringField
      DisplayLabel = #32852#31995#20154
      FieldName = 'TXRXM'
      Size = 10
    end
    object ADS711TXRZC: TStringField
      DisplayLabel = #32852#31995#32844#20301
      FieldName = 'TXRZC'
      Size = 15
    end
    object ADS711TXSJ: TDateTimeField
      DisplayLabel = #32852#31995#26102#38388
      FieldName = 'TXSJ'
    end
    object ADS711HDRR: TStringField
      DisplayLabel = #38754#35848'/'#30005#35805#20869#23481
      FieldName = 'HDRR'
      Size = 200
    end
    object ADS711HZYX: TIntegerField
      FieldName = 'HZYX'
    end
    object ADS711CHZYX: TStringField
      DisplayLabel = #21512#20316#24847#21521
      FieldKind = fkCalculated
      FieldName = 'CHZYX'
      Size = 10
      Calculated = True
    end
    object ADS711enter_date: TDateTimeField
      FieldName = 'enter_date'
    end
  end
  object DataSource5: TDataSource
    DataSet = AQery708
    Left = 344
    Top = 56
  end
  object DataSource6: TDataSource
    DataSet = ADS709
    Left = 344
    Top = 112
  end
  object DataSource7: TDataSource
    DataSet = ADS710
    Left = 344
    Top = 168
  end
  object DataSource8: TDataSource
    DataSet = ADS711
    Left = 344
    Top = 216
  end
  object AQery712: TADOQuery
    Connection = Conn
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = AQery712CalcFields
    Parameters = <
      item
        Name = 'b_year'
        Size = -1
        Value = Null
      end
      item
        Name = 'e_year'
        Size = -1
        Value = Null
      end
      item
        Name = 'b_month'
        Size = -1
        Value = Null
      end
      item
        Name = 'e_month'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT data0712.RKEY, data0712.ZJID, data0712.PTR704, data0712.B' +
        'QDD, data0712.BQSK, '
      
        '      data0712.BQTS, data0712.BQYP, data0712.YPZLC, data0712.YZL' +
        'BL, data0712.YPSF, '
      
        '      data0712.YPSFJE, data0712.YPMS, data0712.YPMSJE, data0712.' +
        'YPGZ, '
      
        '      data0712.YPGZJE, data0712.YPKZLC, data0712.BQKM, data0712.' +
        'KMZLC, '
      
        '      data0712.KMQR, data0712.KMSF, data0712.KMSFJE, data0712.KM' +
        'MS, '
      
        '      data0712.KMMSJE, data0712.KMGZ, data0712.KMGZJE, data0712.' +
        'BQCSJ, '
      
        '      data0712.CSJZLC, data0712.CSJQR, data0712.CSJSF, data0712.' +
        'CSJSFJE, '
      
        '      data0712.CSJMS, data0712.CSJMSJE, data0712.CSJGZ, data0712' +
        '.CSJGZJE, '
      
        '      data0712.CJRQ, data0712.USEPTR, data0712.Status, data0712.' +
        'SHPTR, '
      
        '      data0712.ZJQJ, data0712.QJStatus, data0712.Note, Data0005.' +
        'EMPL_CODE, '
      '      Data0005.EMPLOYEE_NAME, Data0005_1.EMPLOYEE_NAME AS SHR, '
      
        '      data0712.ZJND, data0712.ZWPJ, data0712.SSPJ, data0704.MJHJ' +
        'E, '
      'data0712.ZYStatus, data0712.BMPTR, Data0034.DEPT_NAME'
      'FROM data0712 INNER JOIN'
      '      Data0005 ON data0712.USEPTR = Data0005.RKEY INNER JOIN'
      '      data0704 ON data0712.PTR704 = data0704.RKEY INNER JOIN'
      '      Data0034 ON data0712.BMPTR = Data0034.RKEY LEFT OUTER JOIN'
      '      Data0005 Data0005_1 ON data0712.SHPTR = Data0005_1.RKEY'
      'where  data0712.ZJND >= :b_year and'
      '       data0712.ZJND <= :e_year and'
      '       data0712.ZJQJ >= :b_month and'
      '       data0712.ZJQJ <= :e_month')
    Left = 248
    Top = 304
    object AQery712RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQery712PTR704: TIntegerField
      FieldName = 'PTR704'
    end
    object AQery712ZJID: TStringField
      DisplayLabel = #24635#32467#32534#21495
      FieldName = 'ZJID'
      FixedChar = True
      Size = 9
    end
    object AQery712ZJND: TIntegerField
      DisplayLabel = #24635#32467#24180
      FieldName = 'ZJND'
    end
    object AQery712ZJQJ: TIntegerField
      DisplayLabel = #24635#32467#26376'('#21608')'
      FieldName = 'ZJQJ'
    end
    object AQery712CQJStatus: TStringField
      DisplayLabel = #26399#38388
      FieldKind = fkCalculated
      FieldName = 'CQJStatus'
      Size = 2
      Calculated = True
    end
    object AQery712BQDD: TBCDField
      DisplayLabel = #26412#26399#35746#21333
      FieldName = 'BQDD'
      Precision = 10
      Size = 2
    end
    object AQery712BQSK: TBCDField
      DisplayLabel = #26412#26399#25910#27454
      FieldName = 'BQSK'
      Precision = 10
      Size = 2
    end
    object AQery712BQTS: TIntegerField
      DisplayLabel = #26412#26399#25237#35785
      FieldName = 'BQTS'
    end
    object AQery712BQYP: TIntegerField
      DisplayLabel = #20570#26679#27454#25968
      FieldName = 'BQYP'
    end
    object AQery712YPZLC: TIntegerField
      DisplayLabel = #26679#36716#37327#20135
      FieldName = 'YPZLC'
    end
    object AQery712YZLBL: TBCDField
      DisplayLabel = #21344#27604#20363
      FieldName = 'YZLBL'
      Precision = 3
      Size = 2
    end
    object AQery712YPSF: TIntegerField
      DisplayLabel = #26679#21697#25910#36153#27454#25968
      FieldName = 'YPSF'
    end
    object AQery712YPSFJE: TBCDField
      DisplayLabel = #26679#21697#25910#36153#37329#39069
      FieldName = 'YPSFJE'
      Precision = 10
      Size = 2
    end
    object AQery712YPMS: TIntegerField
      DisplayLabel = #26679#21697#20813#25910#27454#25968
      FieldName = 'YPMS'
    end
    object AQery712YPMSJE: TBCDField
      DisplayLabel = #26679#21697#20813#25910#37329#39069
      FieldName = 'YPMSJE'
      Precision = 10
      Size = 2
    end
    object AQery712YPGZ: TIntegerField
      DisplayLabel = #26679#21697#25346#24080#27454#25968
      FieldName = 'YPGZ'
    end
    object AQery712YPGZJE: TBCDField
      DisplayLabel = #26679#21697#25346#24080#37329#39069
      FieldName = 'YPGZJE'
      Precision = 10
      Size = 2
    end
    object AQery712YPKZLC: TIntegerField
      DisplayLabel = #39044#35745#26679#21697#21487#36716#37327
      FieldName = 'YPKZLC'
    end
    object AQery712BQKM: TIntegerField
      DisplayLabel = #24320#27169#27454#25968
      FieldName = 'BQKM'
    end
    object AQery712KMZLC: TIntegerField
      DisplayLabel = #24320#27169#36716#37327#20135
      FieldName = 'KMZLC'
    end
    object AQery712KMQR: TIntegerField
      DisplayLabel = #30830#35748#24320#27169#25968
      FieldName = 'KMQR'
    end
    object AQery712KMSF: TIntegerField
      DisplayLabel = #24320#27169#25910#36153#27454#25968
      FieldName = 'KMSF'
    end
    object AQery712KMSFJE: TBCDField
      DisplayLabel = #24320#27169#25910#36153#37329#39069
      FieldName = 'KMSFJE'
      Precision = 10
      Size = 2
    end
    object AQery712KMMS: TIntegerField
      DisplayLabel = #24320#27169#20813#25910#27454#25968
      FieldName = 'KMMS'
    end
    object AQery712KMMSJE: TBCDField
      DisplayLabel = #24320#27169#20813#25910#37329#39069
      FieldName = 'KMMSJE'
      Precision = 10
      Size = 2
    end
    object AQery712KMGZ: TIntegerField
      DisplayLabel = #24320#27169#25346#24080#27454#25968
      FieldName = 'KMGZ'
    end
    object AQery712KMGZJE: TBCDField
      DisplayLabel = #24320#27169#25346#24080#37329#39069
      FieldName = 'KMGZJE'
      Precision = 10
      Size = 2
    end
    object AQery712BQCSJ: TIntegerField
      DisplayLabel = #27979#35797#26550#27454#25968
      FieldName = 'BQCSJ'
    end
    object AQery712CSJZLC: TIntegerField
      DisplayLabel = #27979#35797#26550#36716#37327#20135
      FieldName = 'CSJZLC'
    end
    object AQery712CSJQR: TIntegerField
      DisplayLabel = #27979#35797#26550#30830#35748
      FieldName = 'CSJQR'
    end
    object AQery712CSJSF: TIntegerField
      DisplayLabel = #27979#35797#26550#25910#36153#27454#25968
      FieldName = 'CSJSF'
    end
    object AQery712CSJSFJE: TBCDField
      DisplayLabel = #27979#35797#26550#25910#36153#37329#39069
      FieldName = 'CSJSFJE'
      Precision = 10
      Size = 2
    end
    object AQery712CSJMS: TIntegerField
      DisplayLabel = #27979#35797#26550#20813#25910#27454#25968
      FieldName = 'CSJMS'
    end
    object AQery712CSJMSJE: TBCDField
      DisplayLabel = #27979#35797#26550#20813#25910#37329#39069
      FieldName = 'CSJMSJE'
      Precision = 10
      Size = 2
    end
    object AQery712CSJGZ: TIntegerField
      DisplayLabel = #27979#35797#26550#25346#24080#27454#25968
      FieldName = 'CSJGZ'
    end
    object AQery712CSJGZJE: TBCDField
      DisplayLabel = #27979#35797#26550#25346#24080#37329#39069
      FieldName = 'CSJGZJE'
      Precision = 10
      Size = 2
    end
    object AQery712EMPLOYEE_NAME: TStringField
      DisplayLabel = #21019#24314#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object AQery712DEPT_NAME: TStringField
      DisplayLabel = #21019#24314#20154#37096#38376
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object AQery712CJRQ: TDateTimeField
      DisplayLabel = #21019#24314#26085#26399
      FieldName = 'CJRQ'
    end
    object AQery712SHR: TStringField
      DisplayLabel = #23457#26680#20154
      FieldName = 'SHR'
      Size = 16
    end
    object AQery712CStatus: TStringField
      DisplayLabel = #23457#26680#29366#24577
      FieldKind = fkCalculated
      FieldName = 'CStatus'
      Size = 5
      Calculated = True
    end
    object AQery712USEPTR: TIntegerField
      FieldName = 'USEPTR'
    end
    object AQery712Status: TIntegerField
      FieldName = 'Status'
    end
    object AQery712SHPTR: TIntegerField
      FieldName = 'SHPTR'
    end
    object AQery712QJStatus: TIntegerField
      FieldName = 'QJStatus'
    end
    object AQery712Note: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Note'
      Size = 100
    end
    object AQery712EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object AQery712ZWPJ: TIntegerField
      FieldName = 'ZWPJ'
    end
    object AQery712CZWPJ: TStringField
      FieldKind = fkCalculated
      FieldName = 'CZWPJ'
      Size = 10
      Calculated = True
    end
    object AQery712SSPJ: TIntegerField
      FieldName = 'SSPJ'
    end
    object AQery712CSSPJ: TStringField
      DisplayLabel = #19978#21496#35780#20215
      FieldKind = fkCalculated
      FieldName = 'CSSPJ'
      Size = 10
      Calculated = True
    end
    object AQery712MJHJE: TBCDField
      FieldName = 'MJHJE'
      Precision = 14
      Size = 2
    end
    object AQery712ZYStatus: TIntegerField
      FieldName = 'ZYStatus'
    end
    object AQery712BMPTR: TIntegerField
      FieldName = 'BMPTR'
    end
    object AQery712CZYStatus: TStringField
      DisplayLabel = #21019#24314#20154#32844#20301
      FieldKind = fkCalculated
      FieldName = 'CZYStatus'
      Size = 12
      Calculated = True
    end
  end
  object DataSource9: TDataSource
    DataSet = AQery712
    Left = 184
    Top = 304
  end
  object ADS714: TADODataSet
    Connection = Conn
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADS714CalcFields
    CommandText = 'SELECT data0714.*'#13#10'FROM data0714'#13#10' where ptr712=:rkey'
    DataSource = DataSource9
    IndexFieldNames = 'PTR712'
    MasterFields = 'RKEY'
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
    Top = 360
    object ADS714RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS714PTR10: TIntegerField
      FieldName = 'PTR10'
    end
    object ADS714KHMC: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'KHMC'
      Size = 50
    end
    object ADS714GMRS: TIntegerField
      DisplayLabel = #35268#26684#20154#25968
      FieldName = 'GMRS'
    end
    object ADS714ZYCP: TStringField
      DisplayLabel = #20027#35201#20135#21697
      FieldName = 'ZYCP'
      Size = 50
    end
    object ADS714PCBYL: TBCDField
      DisplayLabel = 'PCB'#26376#29992#37327
      FieldName = 'PCBYL'
      Precision = 10
      Size = 2
    end
    object ADS714TXDZ: TStringField
      DisplayLabel = #22320#22336
      FieldName = 'TXDZ'
      Size = 50
    end
    object ADS714TXDH: TStringField
      DisplayLabel = #32852#31995#30005#35805
      FieldName = 'TXDH'
      Size = 15
    end
    object ADS714TXRXM: TStringField
      DisplayLabel = #32852#31995#20154
      FieldName = 'TXRXM'
      Size = 10
    end
    object ADS714HZYX: TIntegerField
      DisplayLabel = #21512#20316#24847#21521
      FieldName = 'HZYX'
    end
    object ADS714CHZYX: TStringField
      DisplayLabel = #21512#20316#24847#21521
      DisplayWidth = 12
      FieldKind = fkCalculated
      FieldName = 'CHZYX'
      Size = 12
      Calculated = True
    end
    object ADS714PTR712: TIntegerField
      FieldName = 'PTR712'
    end
  end
  object DataSource10: TDataSource
    DataSet = ADS714
    Left = 184
    Top = 360
  end
  object ADS713: TADODataSet
    Connection = Conn
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADS713CalcFields
    CommandText = 
      'SELECT data0713.*, Data0010.ABBR_NAME'#13#10'FROM data0713 INNER JOIN'#13 +
      #10'      Data0010 ON data0713.PTR10 = Data0010.RKEY'#13#10' where ptr=:r' +
      'key'
    DataSource = DataSource9
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
    Left = 248
    Top = 416
    object ADS713RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS713PTR: TIntegerField
      FieldName = 'PTR'
    end
    object ADS713PTR10: TIntegerField
      FieldName = 'PTR10'
    end
    object ADS713ABBR_NAME: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADS713HJYS: TBCDField
      DisplayLabel = #24635#27424#36135#27454
      FieldName = 'HJYS'
      Precision = 10
      Size = 2
    end
    object ADS713DQYS: TBCDField
      DisplayLabel = #21040#26399#36135#27454
      FieldName = 'DQYS'
      Precision = 10
      Size = 2
    end
    object ADS713JHYS: TBCDField
      DisplayLabel = #25910#27454#37329#39069
      FieldName = 'YSJE'
      Precision = 10
      Size = 2
    end
    object ADS713JHRQ: TDateTimeField
      DisplayLabel = #25910#27454#26085#26399
      FieldName = 'SKRQ'
    end
    object ADS713CQTS: TBCDField
      DisplayLabel = #36229#26399#22825#25968
      FieldName = 'CQTS'
      Precision = 5
      Size = 2
    end
    object ADS713CQJE: TBCDField
      DisplayLabel = #36229#26399#37329#39069
      FieldName = 'CQJE'
      Precision = 10
      Size = 2
    end
    object ADS713HZSTATUS: TIntegerField
      FieldName = 'HZSTATUS'
    end
    object ADS713CHZSTATUS: TStringField
      DisplayLabel = #21512#20316#23545#31574
      FieldKind = fkCalculated
      FieldName = 'CHZSTATUS'
      Size = 10
      Calculated = True
    end
  end
  object DataSource11: TDataSource
    DataSet = ADS713
    Left = 184
    Top = 416
  end
end
