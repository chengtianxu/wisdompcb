object DM: TDM
  OldCreateOrder = False
  Left = 406
  Top = 239
  Height = 368
  Width = 503
  object ADOConnection1: TADOConnection
    ConnectionTimeout = 25
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 24
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 99
    Top = 23
  end
  object aqd116: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterOpen = aqd116AfterOpen
    CommandText = 
      'SELECT dbo.Data0116.MEMO_NUMBER, dbo.Data0105.VOUCHER, '#13#10'      d' +
      'bo.Data0001.CURR_CODE, dbo.Data0001.CURR_NAME, dbo.Data0116.EX_R' +
      'ATE, '#13#10'      Data0116.AMOUNT, dbo.Data0116.AVL_AMT, dbo.Data0116' +
      '.MEMO_DATE, '#13#10'      Data0116.RMA_DATE, Data0010.CUST_CODE, Data0' +
      '116.GL_HEADER_PTR, '#13#10'      dbo.Data0010.CUSTOMER_NAME, dbo.Data0' +
      '010.ABBR_NAME, Data0116.GLPTR_STATUS,'#13#10'      dbo.Data0005.EMPL_C' +
      'ODE, dbo.Data0005.EMPLOYEE_NAME, '#13#10'      dbo.Data0116.REF_NUMBER' +
      ', dbo.Data0105.STATUS,Data0116.EMPL_PTR,'#13#10'     case data0105.sta' +
      'tus when 0 then '#39#26410#23457#26680#39'  when 1  then '#39#20250#35745#24050#23457#39' when 2  then '#39#20027#31649#24050#23457#39#13#10 +
      '     when 3  then '#39#24050#30331#24080#39'  when 4  then '#39#20986#32435#24050#23457#39' when 5  then '#39#34987#20316#24223#39' ' +
      ' end as v_status,'#13#10'    case data0116.MEMO_TP  when 1  then '#39#39044#25910#22791#24536 +
      #39'  when 4 then '#39#36864#36135#22791#24536#39' '#13#10'    when 3 then '#39#26080#36864#36135#39' end as ttype_116,d' +
      'ata0116.memo_status,'#13#10'    case data0116.memo_status when 1 then ' +
      #39#26377#25928#30340#39' when 2 then '#39#24050#20351#29992#39' '#13#10'    when 3 then '#39#34987#21462#28040#39' end as '#22791#24536#29366#24577',data' +
      '0116.DESCRIPTION,'#13#10'    data0116.rkey, data0116.GOODS_AMT, data01' +
      '16.memo_tp,'#13#10'    data0116.TOOLING_CHARGE, data0116.SHIPPING, dat' +
      'a0116.FED_TAX,'#13#10'round(Data0116.AMOUNT*Data0116.EX_RATE,2) as sta' +
      'nd_amount,'#13#10'round(Data0116.AVL_AMT*Data0116.EX_RATE,2) as stand_' +
      'avlamount,'#13#10'data0015.warehouse_code,data0015.abbr_name as abbrna' +
      'me15'#13#10'FROM dbo.Data0116 INNER JOIN'#13#10'      dbo.Data0001 ON dbo.Da' +
      'ta0116.CURRENCY_PTR = dbo.Data0001.RKEY INNER JOIN'#13#10'      dbo.Da' +
      'ta0010 ON dbo.Data0116.CUST_PTR = dbo.Data0010.RKEY INNER JOIN'#13#10 +
      '      dbo.Data0005 ON '#13#10'      dbo.Data0116.EMPL_PTR = dbo.Data00' +
      '05.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0105 ON dbo.Data0116.RKEY' +
      ' = dbo.Data0105.SOURCE_PTR AND '#13#10'      dbo.Data0105.TRANS_TYPE =' +
      ' 7 left outer join data0015'#13#10'    on data0116.warehouse_ptr=data0' +
      '015.rkey'#13#10'WHERE'#13#10'               (Data0116.memo_DATE>= :dtpk1)  a' +
      'nd'#13#10'               (Data0116.memo_DATE<= :dtpk2) '#13#10
    IndexFieldNames = 'MEMO_NUMBER'
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38838d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39226d
      end>
    Prepared = True
    Left = 88
    Top = 88
    object aqd116MEMO_NUMBER: TStringField
      DisplayLabel = #22791#24536#32534#21495
      FieldName = 'MEMO_NUMBER'
      FixedChar = True
      Size = 10
    end
    object aqd116VOUCHER: TStringField
      DisplayLabel = #20973#35777#32534#21495
      FieldName = 'VOUCHER'
      FixedChar = True
      Size = 12
    end
    object aqd116CURR_CODE: TStringField
      DisplayLabel = #36135#24065#20195#30721
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object aqd116CURR_NAME: TStringField
      DisplayLabel = #36135#24065#21517#31216
      FieldName = 'CURR_NAME'
    end
    object aqd116EX_RATE: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'EX_RATE'
    end
    object aqd116AMOUNT: TBCDField
      DisplayLabel = #22791#24536#37329#39069
      FieldName = 'AMOUNT'
      Precision = 19
    end
    object aqd116AVL_AMT: TBCDField
      DisplayLabel = #21487#29992#37329#39069
      FieldName = 'AVL_AMT'
      Precision = 19
    end
    object aqd116MEMO_DATE: TDateTimeField
      DisplayLabel = #22791#24536#26085#26399
      FieldName = 'MEMO_DATE'
    end
    object aqd116RMA_DATE: TDateTimeField
      DisplayLabel = #20986#36135#26085#26399
      FieldName = 'RMA_DATE'
    end
    object aqd116CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object aqd116CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object aqd116ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object aqd116EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object aqd116EMPLOYEE_NAME: TStringField
      DisplayLabel = #25805#20316#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aqd116REF_NUMBER: TStringField
      DisplayLabel = #21442#32771#21495
      FieldName = 'REF_NUMBER'
    end
    object aqd116STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object aqd116v_status: TStringField
      DisplayLabel = #20973#35777#29366#24577
      FieldName = 'v_status'
      ReadOnly = True
      Size = 8
    end
    object aqd116ttype_116: TStringField
      DisplayLabel = #22791#24536#31867#21035
      FieldName = 'ttype_116'
      ReadOnly = True
      Size = 8
    end
    object aqd116rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aqd116GOODS_AMT: TBCDField
      FieldName = 'GOODS_AMT'
      Precision = 19
    end
    object aqd116TOOLING_CHARGE: TBCDField
      FieldName = 'TOOLING_CHARGE'
      Precision = 19
    end
    object aqd116SHIPPING: TBCDField
      FieldName = 'SHIPPING'
      Precision = 19
    end
    object aqd116FED_TAX: TBCDField
      FieldName = 'FED_TAX'
      Precision = 19
    end
    object aqd116memo_tp: TSmallintField
      FieldName = 'memo_tp'
    end
    object aqd116stand_amount: TFloatField
      FieldName = 'stand_amount'
      ReadOnly = True
    end
    object aqd116stand_avlamount: TFloatField
      FieldName = 'stand_avlamount'
      ReadOnly = True
    end
    object aqd116EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object aqd116DSDesigner: TStringField
      FieldName = #22791#24536#29366#24577
      ReadOnly = True
      Size = 6
    end
    object aqd116memo_status: TWordField
      FieldName = 'memo_status'
    end
    object aqd116DESCRIPTION: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 10
      FieldName = 'DESCRIPTION'
      Size = 60
    end
    object aqd116GL_HEADER_PTR: TIntegerField
      FieldName = 'GL_HEADER_PTR'
    end
    object aqd116GLPTR_STATUS: TBooleanField
      DisplayLabel = #24635#24080#26631#35782
      FieldName = 'GLPTR_STATUS'
    end
    object aqd116warehouse_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
    object aqd116abbrname15: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'abbrname15'
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = aqd116
    Left = 28
    Top = 88
  end
  object DataSource2: TDataSource
    DataSet = ado116
    Left = 29
    Top = 144
  end
  object ado116: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select *'
      'from data0116'
      'where rkey=:rkey')
    Left = 89
    Top = 146
    object ado116RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ado116MEMO_NUMBER: TStringField
      FieldName = 'MEMO_NUMBER'
      FixedChar = True
      Size = 10
    end
    object ado116CUST_PTR: TIntegerField
      FieldName = 'CUST_PTR'
    end
    object ado116SRCE_PTR: TIntegerField
      FieldName = 'SRCE_PTR'
    end
    object ado116MEMO_TP: TSmallintField
      FieldName = 'MEMO_TP'
    end
    object ado116EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ado116MEMO_DATE: TDateTimeField
      FieldName = 'MEMO_DATE'
    end
    object ado116AMOUNT: TBCDField
      FieldName = 'AMOUNT'
      Precision = 19
    end
    object ado116AVL_AMT: TBCDField
      FieldName = 'AVL_AMT'
      Precision = 19
    end
    object ado116GOODS_AMT: TBCDField
      FieldName = 'GOODS_AMT'
      Precision = 19
    end
    object ado116SHIPPING: TBCDField
      FieldName = 'SHIPPING'
      Precision = 19
    end
    object ado116TOOLING_CHARGE: TBCDField
      FieldName = 'TOOLING_CHARGE'
      Precision = 19
    end
    object ado116RUSH_CHARGE: TBCDField
      FieldName = 'RUSH_CHARGE'
      Precision = 19
    end
    object ado116FED_TAX: TBCDField
      FieldName = 'FED_TAX'
      Precision = 19
    end
    object ado116EX_RATE: TFloatField
      FieldName = 'EX_RATE'
    end
    object ado116REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
    end
    object ado116DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 60
    end
    object ado116CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object ado116RMA_DATE: TDateTimeField
      FieldName = 'RMA_DATE'
    end
    object ado116memo_status: TWordField
      FieldName = 'memo_status'
    end
    object ado116GL_HEADER_PTR: TIntegerField
      FieldName = 'GL_HEADER_PTR'
    end
    object ado116GLPTR_STATUS: TBooleanField
      FieldName = 'GLPTR_STATUS'
    end
    object ado116warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
  end
  object ADO104: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0104'
      'where rkey=7'
      '')
    Left = 144
    Top = 88
    object ADO104RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO104JOURNAL_TITLE: TStringField
      FieldName = 'JOURNAL_TITLE'
      FixedChar = True
      Size = 30
    end
    object ADO104DFLT_ACCT_01: TIntegerField
      FieldName = 'DFLT_ACCT_01'
    end
    object ADO104DFLT_ACCT_02: TIntegerField
      FieldName = 'DFLT_ACCT_02'
    end
    object ADO104DFLT_ACCT_03: TIntegerField
      FieldName = 'DFLT_ACCT_03'
    end
    object ADO104DFLT_ACCT_04: TIntegerField
      FieldName = 'DFLT_ACCT_04'
    end
    object ADO104DFLT_ACCT_05: TIntegerField
      FieldName = 'DFLT_ACCT_05'
    end
    object ADO104DFLT_ACCT_06: TIntegerField
      FieldName = 'DFLT_ACCT_06'
    end
    object ADO104DFLT_ACCT_07: TIntegerField
      FieldName = 'DFLT_ACCT_07'
    end
    object ADO104DFLT_ACCT_08: TIntegerField
      FieldName = 'DFLT_ACCT_08'
    end
    object ADO104DFLT_ACCT_09: TIntegerField
      FieldName = 'DFLT_ACCT_09'
    end
    object ADO104DFLT_ACCT_10: TIntegerField
      FieldName = 'DFLT_ACCT_10'
    end
  end
  object ADO105: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0105'
      'where Data0105.TRANS_TYPE = 7 and'
      'Data0105.SOURCE_PTR=:rkey '
      '      ')
    Left = 88
    Top = 200
    object ADO105RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO105VOUCHER: TStringField
      FieldName = 'VOUCHER'
      FixedChar = True
      Size = 12
    end
    object ADO105BATCH_NUMBER: TStringField
      FieldName = 'BATCH_NUMBER'
      FixedChar = True
      Size = 10
    end
    object ADO105STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object ADO105VOU_TYPE: TSmallintField
      FieldName = 'VOU_TYPE'
    end
    object ADO105TRANS_TYPE: TSmallintField
      FieldName = 'TRANS_TYPE'
    end
    object ADO105SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object ADO105ENTERED_BY_EMPL_PTR: TIntegerField
      FieldName = 'ENTERED_BY_EMPL_PTR'
    end
    object ADO105AUDITED_BY_EMPL_PTR: TIntegerField
      FieldName = 'AUDITED_BY_EMPL_PTR'
    end
    object ADO105POSTED_BY_EMPL_PTR: TIntegerField
      FieldName = 'POSTED_BY_EMPL_PTR'
    end
    object ADO105ENTERED_DT: TDateTimeField
      FieldName = 'ENTERED_DT'
    end
    object ADO105POSTED_DT: TDateTimeField
      FieldName = 'POSTED_DT'
    end
    object ADO105REOCCURING_TRANS_FLG: TStringField
      FieldName = 'REOCCURING_TRANS_FLG'
      FixedChar = True
      Size = 1
    end
    object ADO105REVERSE_TRANS_FLAG: TStringField
      FieldName = 'REVERSE_TRANS_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADO105DATA0105_PTR_REVERSE: TIntegerField
      FieldName = 'DATA0105_PTR_REVERSE'
    end
    object ADO105SPECIAL_POSTING: TStringField
      FieldName = 'SPECIAL_POSTING'
      FixedChar = True
      Size = 1
    end
    object ADO105ATTACHED: TSmallintField
      FieldName = 'ATTACHED'
    end
    object ADO105FYEAR: TIntegerField
      FieldName = 'FYEAR'
    end
    object ADO105PERIOD: TSmallintField
      FieldName = 'PERIOD'
    end
    object ADO105SUPP_PTR: TIntegerField
      FieldName = 'SUPP_PTR'
    end
    object ADO105CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
  end
  object ADO106: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0106'
      'where GL_HEADER_PTR=:rkey')
    Left = 88
    Top = 256
    object ADO106RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO106GL_HEADER_PTR: TIntegerField
      FieldName = 'GL_HEADER_PTR'
    end
    object ADO106GL_ACCT_NO_PTR: TIntegerField
      FieldName = 'GL_ACCT_NO_PTR'
    end
    object ADO106REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      Size = 10
    end
    object ADO106DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 100
    end
    object ADO106AMOUNT: TBCDField
      FieldName = 'AMOUNT'
      Precision = 18
      Size = 2
    end
    object ADO106D_C: TStringField
      FieldName = 'D_C'
      FixedChar = True
      Size = 1
    end
    object ADO106INV_PTR: TIntegerField
      FieldName = 'INV_PTR'
    end
    object ADO106UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object ADO106CURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
    object ADO106PRICE: TFloatField
      FieldName = 'PRICE'
    end
    object ADO106EXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
    end
    object ADO106QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
  end
  object ADO128: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select bank_current_check,bal_amount'
      'from data0128'
      'where rkey=:rkey')
    Left = 184
    Top = 25
    object ADO128bank_current_check: TStringField
      FieldName = 'bank_current_check'
      FixedChar = True
      Size = 10
    end
    object ADO128bal_amount: TFloatField
      FieldName = 'bal_amount'
    end
  end
  object Aqd105: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT data0105.rkey,Data0105.VOUCHER, dbo.Data0005.EMPLOYEE_NAM' +
      'E, dbo.Data0105.FYEAR, '#13#10'      dbo.Data0105.PERIOD, dbo.Data0105' +
      '.ATTACHED, dbo.Data0105.ENTERED_DT '#13#10'FROM dbo.Data0105 INNER JOI' +
      'N'#13#10'      dbo.Data0005 ON '#13#10'      dbo.Data0105.ENTERED_BY_EMPL_PT' +
      'R = dbo.Data0005.RKEY'#13#10'WHERE (dbo.Data0105.TRANS_TYPE = 7) and'#13#10 +
      '           Data0105.SOURCE_PTR=:rkey116'
    Parameters = <
      item
        Name = 'rkey116'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 144
    Top = 200
    object Aqd105rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Aqd105VOUCHER: TStringField
      FieldName = 'VOUCHER'
      FixedChar = True
      Size = 12
    end
    object Aqd105EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object Aqd105FYEAR: TIntegerField
      FieldName = 'FYEAR'
    end
    object Aqd105PERIOD: TSmallintField
      FieldName = 'PERIOD'
    end
    object Aqd105ATTACHED: TSmallintField
      FieldName = 'ATTACHED'
    end
    object Aqd105ENTERED_DT: TDateTimeField
      FieldName = 'ENTERED_DT'
    end
  end
  object Aqd508: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'select CURR_FYEAR, CURR_PERIOD'#13#10'from data0508'
    Parameters = <>
    Left = 144
    Top = 144
    object Aqd508CURR_FYEAR: TIntegerField
      FieldName = 'CURR_FYEAR'
    end
    object Aqd508CURR_PERIOD: TSmallintField
      FieldName = 'CURR_PERIOD'
    end
  end
  object ADO04: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select SEED_VALUE,SEED_FLAG'
      'from data0004'
      'where rkey=25')
    Left = 184
    Top = 144
    object ADO04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object ADO04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
  object Aqd106: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = Aqd106CalcFields
    CommandText = 
      'SELECT dbo.Data0106.DESCRIPTION, dbo.Data0106.AMOUNT, dbo.Data01' +
      '06.D_C, '#13#10'      dbo.Data0106.GL_ACCT_NO_PTR, dbo.Data0106.CURR_P' +
      'TR, '#13#10'      dbo.Data0106.EXCH_RATE, dbo.Data0001.CURR_CODE, dbo.' +
      'Data0001.CURR_NAME, '#13#10'      dbo.Data0103.GL_ACC_NUMBER, dbo.Data' +
      '0103.GL_DESCRIPTION, '#13#10'      Data0103_1.GL_DESCRIPTION AS father' +
      '_desc, data0106.PRICE,'#13#10'      Data0103_2.GL_DESCRIPTION AS grand' +
      'father_desc'#13#10'FROM dbo.Data0103 Data0103_2 RIGHT OUTER JOIN'#13#10'    ' +
      '  dbo.Data0103 Data0103_1 ON '#13#10'      Data0103_2.RKEY = Data0103_' +
      '1.PARENT_PTR RIGHT OUTER JOIN'#13#10'      dbo.Data0106 INNER JOIN'#13#10'  ' +
      '    dbo.Data0103 ON '#13#10'      dbo.Data0106.GL_ACCT_NO_PTR = dbo.Da' +
      'ta0103.RKEY INNER JOIN'#13#10'      dbo.Data0001 ON dbo.Data0106.CURR_' +
      'PTR = dbo.Data0001.RKEY ON '#13#10'      Data0103_1.RKEY = dbo.Data010' +
      '3.PARENT_PTR'#13#10'where data0106.GL_HEADER_PTR=:rkey105'
    Parameters = <
      item
        Name = 'rkey105'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 144
    Top = 256
    object Aqd106DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 100
    end
    object Aqd106AMOUNT: TBCDField
      FieldName = 'AMOUNT'
      Precision = 18
      Size = 2
    end
    object Aqd106D_C: TStringField
      FieldName = 'D_C'
      FixedChar = True
      Size = 1
    end
    object Aqd106gl_desc: TStringField
      FieldKind = fkCalculated
      FieldName = 'gl_desc'
      ReadOnly = True
      Size = 200
      Calculated = True
    end
    object Aqd106GL_ACCT_NO_PTR: TIntegerField
      FieldName = 'GL_ACCT_NO_PTR'
    end
    object Aqd106CURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
    object Aqd106EXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
    end
    object Aqd106CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object Aqd106CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object Aqd106GL_ACC_NUMBER: TStringField
      FieldName = 'GL_ACC_NUMBER'
      FixedChar = True
      Size = 18
    end
    object Aqd106GL_DESCRIPTION: TStringField
      FieldName = 'GL_DESCRIPTION'
      Size = 50
    end
    object Aqd106father_desc: TStringField
      FieldName = 'father_desc'
      Size = 50
    end
    object Aqd106grandfather_desc: TStringField
      FieldName = 'grandfather_desc'
      Size = 50
    end
    object Aqd106PRICE: TBCDField
      FieldName = 'PRICE'
      Precision = 14
      Size = 2
    end
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 312
    Top = 232
  end
end
