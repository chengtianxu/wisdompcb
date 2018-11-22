object DM: TDM
  OldCreateOrder = False
  Left = 416
  Top = 245
  Height = 352
  Width = 259
  object Conn: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=koimy1234;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=WISDOMPCB;Data Source=W001057'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 8
  end
  object AQery708: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = AQery708CalcFields
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
      'SELECT data0704.YJH, data0704.MJH, data0704.MJHJE, data0708.*,'
      
        '      Data0005.EMPLOYEE_NAME AS [user],Data0005.EMPL_CODE, Data0' +
        '005_1.EMPLOYEE_NAME AS SHR, '
      '      data0704.YZNBL, data0704.YJHJE, '
      '      Data0034.DEPT_CODE, '
      '      Data0034.DEPT_NAME'
      'FROM data0708 INNER JOIN'
      '      Data0005 ON data0708.USEPTR = Data0005.RKEY INNER JOIN'
      '      data0704 ON data0708.PTR704 = data0704.RKEY INNER JOIN'
      '      Data0034 ON data0708.BMPTR = Data0034.RKEY LEFT OUTER JOIN'
      '      Data0005 Data0005_1 ON data0708.SHPTR = Data0005_1.RKEY'
      'where  data0708.USEPTR  = :rkey05 and'
      '       data0704.yjh >= :b_year and'
      '       data0704.yjh <= :e_year and'
      '       data0704.mjh >= :b_month and'
      '       data0704.mjh <= :e_month')
    Left = 112
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
      DisplayLabel = #29305#24613#33853#23454
      FieldName = 'TJSTATUS'
    end
    object AQery708YSSTATUS: TIntegerField
      DisplayLabel = #24212#25910#33853#23454
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
      DisplayLabel = #29305#24613#33853#23454
      FieldKind = fkCalculated
      FieldName = 'CTJSTATUS'
      Size = 2
      Calculated = True
    end
    object AQery708CYSSTATUS: TStringField
      DisplayLabel = #24212#25910#33853#23454
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
  end
  object ADS709: TADODataSet
    Connection = Conn
    CommandText = 
      'SELECT data0709.RKEY, data0709.PTR708,Data0010.CUST_CODE, Data00' +
      '10.ABBR_NAME, data0709.PTR10, data0709.PTR50, '#13#10'      Data0025.m' +
      'anu_PART_NUMBER, data0709.DDSL, data0709.JHSL, '#13#10'      data0709.' +
      'QHSL'#13#10'FROM data0709 INNER JOIN'#13#10'      Data0010 ON data0709.PTR10' +
      ' = Data0010.RKEY INNER JOIN'#13#10'      Data0025 ON data0709.PTR50 = ' +
      'Data0025.RKEY'#13#10' where ptr708=:rkey'
    DataSource = DataSource1
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
    Left = 112
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
    object ADS709manu_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'manu_PART_NUMBER'
    end
  end
  object ADS710: TADODataSet
    Connection = Conn
    LockType = ltReadOnly
    CommandText = 
      'SELECT data0710.rkey,data0710.PTR708,Data0010.CUSTOMER_NAME, Dat' +
      'a0025.MANU_PART_NUMBER, '#13#10'      data0710.SL, data0710.note, data' +
      '0710.GJQK, data0710.JJBF, data0710.JJSX,data0710.PTR10, data0710' +
      '.PTR50'#13#10'FROM data0710 INNER JOIN'#13#10'      Data0010 ON data0710.PTR' +
      '10 = Data0010.RKEY INNER JOIN'#13#10'      Data0025 ON data0710.PTR50 ' +
      '= Data0025.RKEY'#13#10' where ptr708=:rkey'
    DataSource = DataSource1
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
    Left = 112
    Top = 168
    object ADS710CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADS710CUSTOMER_PART_NUMBER: TStringField
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
    OnCalcFields = ADS711CalcFields
    CommandText = 'SELECT *'#13#10'FROM data0711'#13#10'where ptr708=:rkey'
    DataSource = DataSource1
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
    Left = 112
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
  end
  object DataSource1: TDataSource
    DataSet = AQery708
    Left = 56
    Top = 56
  end
  object DataSource2: TDataSource
    DataSet = ADS709
    Left = 56
    Top = 112
  end
  object DataSource3: TDataSource
    DataSet = ADS710
    Left = 56
    Top = 168
  end
  object DataSource4: TDataSource
    DataSet = ADS711
    Left = 56
    Top = 216
  end
  object AQery: TADOQuery
    Connection = Conn
    Parameters = <>
    Left = 192
    Top = 56
  end
  object AQery4: TADOQuery
    Connection = Conn
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM Data0004'
      'WHERE rkey=68')
    Left = 192
    Top = 112
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
    Left = 192
    Top = 168
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
