object DM: TDM
  OldCreateOrder = False
  Left = 406
  Top = 239
  Height = 368
  Width = 503
  object ADOConnection1: TADOConnection
    ConnectionTimeout = 20
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 24
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 112
    Top = 24
  end
  object aqd114: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterOpen = aqd114AfterOpen
    CommandText = 
      'SELECT dbo.Data0114.REFERENCE_NO, dbo.Data0105.VOUCHER, dbo.Data' +
      '0105.STATUS, '#13#10'      dbo.Data0114.RKEY, dbo.Data0114.TDATE, dbo.' +
      'Data0114.STATUS AS status114, '#13#10'      Data0005.EMPLOYEE_NAME, Da' +
      'ta0001.CURR_CODE, data0015.warehouse_code,'#13#10'      Data0001.CURR_' +
      'NAME, Data0114.EXCHANGE_RATE, data0015.ABBR_NAME as abbrname15,'#13 +
      #10'      Data0128.BANK_NAME, Data0114.AMOUNT,data0128.bal_amount,'#13 +
      #10'     case data0105.status'#13#10'      when 0 then '#39#26410#23457#26680#39'  when 1  the' +
      'n '#39#20250#35745#24050#23457#39' when 2  then '#39#20027#31649#24050#23457#39#13#10'      when 3 then '#39#24050#30331#24080#39'  when 4  t' +
      'hen '#39#20986#32435#24050#23457#39' when 5  then '#39#34987#20316#24223#39#13#10'     end as v_status,data0114.emp' +
      'l_ptr,'#13#10'    case data0114.status  when 1  then '#39#26377#25928#30340#39'  when 2 the' +
      'n '#39#24050#28165#31639#39'  when 3 then '#39#24050#21462#28040#39#13#10'    end as v_status114,Data0005_1.ab' +
      'br_name, '#13#10'  Data0005_1.EMPL_CODE, Data0005_1.EMPLOYEE_NAME AS e' +
      'mployee_skname,'#13#10'round(Data0114.AMOUNT*Data0114.EXCHANGE_RATE,2)' +
      ' as stand_amount'#13#10'FROM dbo.Data0005 INNER JOIN'#13#10'      dbo.Data01' +
      '14 ON dbo.Data0005.RKEY = dbo.Data0114.EMPL_PTR INNER JOIN'#13#10'    ' +
      '  dbo.Data0001 ON dbo.Data0114.CURRECY_PTR = dbo.Data0001.RKEY I' +
      'NNER JOIN'#13#10'      dbo.Data0005 Data0005_1 ON '#13#10'      dbo.Data0114' +
      '.SRCE_PTR = Data0005_1.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0105 ' +
      'ON dbo.Data0114.RKEY = dbo.Data0105.SOURCE_PTR AND '#13#10'      dbo.D' +
      'ata0105.TRANS_TYPE = 6 LEFT OUTER JOIN'#13#10'      dbo.Data0128 ON db' +
      'o.Data0114.BANK_PTR = dbo.Data0128.RKEY'#13#10'LEFT OUTER JOIN'#13#10'      ' +
      'dbo.Data0015 ON dbo.Data0114.warehouse_ptr = dbo.Data0015.RKEY'#13#10 +
      'WHERE (data0114.ttype = 3) and '#13#10'               (Data0114.TDATE>' +
      '= :dtpk1)  and'#13#10'               (Data0114.TDATE<= :dtpk2) '#13#10
    IndexFieldNames = 'REFERENCE_NO'
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38718d
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
    object aqd114REFERENCE_NO: TStringField
      DisplayLabel = #31080#25454#32534#21495
      FieldName = 'REFERENCE_NO'
      FixedChar = True
      Size = 10
    end
    object aqd114VOUCHER: TStringField
      DisplayLabel = #20973#35777#32534#21495
      FieldName = 'VOUCHER'
      FixedChar = True
      Size = 12
    end
    object aqd114STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object aqd114RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aqd114TDATE: TDateTimeField
      DisplayLabel = #31080#25454#26085#26399
      FieldName = 'TDATE'
    end
    object aqd114status114: TWordField
      FieldName = 'status114'
    end
    object aqd114EMPLOYEE_NAME: TStringField
      DisplayLabel = #25805#20316#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aqd114CURR_CODE: TStringField
      DisplayLabel = #36135#24065#20195#30721
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object aqd114CURR_NAME: TStringField
      DisplayLabel = #36135#24065#21517#31216
      DisplayWidth = 10
      FieldName = 'CURR_NAME'
    end
    object aqd114EXCHANGE_RATE: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'EXCHANGE_RATE'
    end
    object aqd114BANK_NAME: TStringField
      DisplayLabel = #29616#37329#38134#34892
      FieldName = 'BANK_NAME'
      Size = 30
    end
    object aqd114AMOUNT: TFloatField
      DisplayLabel = #31080#25454#37329#39069
      FieldName = 'AMOUNT'
    end
    object aqd114v_status: TStringField
      DisplayLabel = #20973#35777#29366#24577
      FieldName = 'v_status'
      ReadOnly = True
      Size = 8
    end
    object aqd114v_status114: TStringField
      DisplayLabel = #31080#25454#29366#24577
      FieldName = 'v_status114'
      ReadOnly = True
      Size = 6
    end
    object aqd114bal_amount: TFloatField
      FieldName = 'bal_amount'
    end
    object aqd114EMPL_CODE: TStringField
      DisplayLabel = #32463#21150#20154#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object aqd114employee_skname: TStringField
      DisplayLabel = #32463#21150#20154#21592
      FieldName = 'employee_skname'
      Size = 16
    end
    object aqd114abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
    object aqd114stand_amount: TFloatField
      FieldName = 'stand_amount'
      ReadOnly = True
    end
    object aqd114empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object aqd114warehouse_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
    object aqd114abbrname15: TStringField
      FieldName = 'abbrname15'
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = aqd114
    Left = 28
    Top = 88
  end
  object DataSource2: TDataSource
    DataSet = ado114
    Left = 29
    Top = 144
  end
  object ado114: TADOQuery
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
      'from data0114 '
      'where rkey=:rkey')
    Left = 87
    Top = 146
    object ado114RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ado114TTYPE: TWordField
      FieldName = 'TTYPE'
    end
    object ado114SRCE_PTR: TIntegerField
      FieldName = 'SRCE_PTR'
    end
    object ado114REFERENCE_NO: TStringField
      FieldName = 'REFERENCE_NO'
      FixedChar = True
      Size = 10
    end
    object ado114TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object ado114EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ado114CSI_USER_PTR: TIntegerField
      FieldName = 'CSI_USER_PTR'
    end
    object ado114AMOUNT: TFloatField
      FieldName = 'AMOUNT'
      DisplayFormat = '#,##0.00'#9
    end
    object ado114EXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
      DisplayFormat = '0.00000000'
      EditFormat = '0.000000'
    end
    object ado114ENTER_DATE: TDateTimeField
      FieldName = 'ENTER_DATE'
    end
    object ado114PERIOD_POSTED: TSmallintField
      FieldName = 'PERIOD_POSTED'
    end
    object ado114POSTED_DATE: TDateTimeField
      FieldName = 'POSTED_DATE'
    end
    object ado114DEBIT_AMOUNT: TFloatField
      FieldName = 'DEBIT_AMOUNT'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ado114CURRECY_PTR: TIntegerField
      FieldName = 'CURRECY_PTR'
    end
    object ado114BANK_PTR: TIntegerField
      FieldName = 'BANK_PTR'
    end
    object ado114STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object ado114REMARK: TStringField
      FieldName = 'REMARK'
      Size = 60
    end
    object ado114pay_to: TStringField
      FieldName = 'pay_to'
      Size = 10
    end
    object ado114warehouse_ptr: TIntegerField
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
      'where rkey=6')
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
      'where Data0105.TRANS_TYPE = 6 and'
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
    object ADO105casher_ptr: TIntegerField
      FieldName = 'casher_ptr'
    end
    object ADO105supervisor_ptr: TIntegerField
      FieldName = 'supervisor_ptr'
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
    Top = 32
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
      'R = dbo.Data0005.RKEY'#13#10'WHERE (dbo.Data0105.TRANS_TYPE = 6) and'#13#10 +
      '           Data0105.SOURCE_PTR=:rkey114'
    Parameters = <
      item
        Name = 'rkey114'
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
end
