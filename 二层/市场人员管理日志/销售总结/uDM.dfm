object DM: TDM
  OldCreateOrder = False
  Left = 495
  Top = 308
  Height = 419
  Width = 297
  object Conn: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=koimy1234;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=WISDOMPCB;Data Source=W001057'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 16
  end
  object AQery712: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = AQery712CalcFields
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
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'e_month'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
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
        'KMZLC,'
      
        '      data0712.KMQR, data0712.KMSF, data0712.KMSFJE, data0712.KM' +
        'MS,'
      
        '      data0712.KMMSJE, data0712.KMGZ, data0712.KMGZJE, data0712.' +
        'BQCSJ,'
      
        '      data0712.CSJZLC, data0712.CSJQR, data0712.CSJSF, data0712.' +
        'CSJSFJE, '
      
        '      data0712.CSJMS, data0712.CSJMSJE, data0712.CSJGZ, data0712' +
        '.CSJGZJE, '
      
        '      data0712.CJRQ, data0712.USEPTR, data0712.Status, data0712.' +
        'SHPTR,'
      
        '      data0712.ZJQJ, data0712.QJStatus, data0712.Note, Data0005.' +
        'EMPL_CODE,'
      '      Data0005.EMPLOYEE_NAME, Data0005_1.EMPLOYEE_NAME AS SHR,'
      
        '      data0712.ZJND, data0712.ZWPJ, data0712.SSPJ, data0704.MJHJ' +
        'E,'
      
        'data0712.ZYStatus, data0712.BMPTR, Data0034.DEPT_NAME,data0712.w' +
        'eek_of'
      'FROM data0712 INNER JOIN'
      '      Data0005 ON data0712.USEPTR = Data0005.RKEY INNER JOIN'
      '      data0704 ON data0712.PTR704 = data0704.RKEY INNER JOIN'
      '      Data0034 ON data0712.BMPTR = Data0034.RKEY LEFT OUTER JOIN'
      '      Data0005 Data0005_1 ON data0712.SHPTR = Data0005_1.RKEY'
      'where  data0712.USEPTR = :rkey05 and'
      '       data0712.ZJND >= :b_year and'
      '       data0712.ZJND <= :e_year and'
      '       data0712.ZJQJ >= :b_month and'
      '       data0712.ZJQJ <= :e_month')
    Left = 120
    Top = 64
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
      DisplayLabel = #24635#32467#26376
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
    object AQery712week_of: TSmallintField
      FieldName = 'week_of'
    end
  end
  object DataSource1: TDataSource
    DataSet = AQery712
    Left = 56
    Top = 64
  end
  object AQery: TADOQuery
    Connection = Conn
    Parameters = <>
    Left = 216
    Top = 64
  end
  object ADS714: TADODataSet
    Connection = Conn
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADS714CalcFields
    CommandText = 'SELECT data0714.*'#13#10'FROM data0714'#13#10' where ptr712=:rkey'
    DataSource = DataSource1
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
    Left = 120
    Top = 120
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
  object DataSource2: TDataSource
    DataSet = ADS714
    Left = 56
    Top = 120
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
    Left = 120
    Top = 176
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
  object DataSource3: TDataSource
    DataSet = ADS713
    Left = 56
    Top = 176
  end
  object AQery4: TADOQuery
    Connection = Conn
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM Data0004'
      'WHERE (SEED_MEAN = '#39#38144#21806#24635#32467#20195#30721#39')')
    Left = 216
    Top = 128
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
