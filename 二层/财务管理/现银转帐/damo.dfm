object DM: TDM
  OldCreateOrder = False
  Left = 340
  Top = 239
  Height = 380
  Width = 582
  object ADOConnection1: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 24
  end
  object aqd522: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT data0522.REF_NUMBER ,data0005.empl_code,'#13#10'      Data0005.' +
      'EMPLOYEE_NAME AS '#32463#21150#20154', data0522.check_114ptr,'#13#10'      Data0005_1.E' +
      'MPLOYEE_NAME AS '#21046#21333#20154', '#13#10'      Data0522.amount as '#36716#20986#37329#39069',data0522.em' +
      'pl_ptr, '#13#10'      Data0129.CHECK_NUMBER AS '#36716#20986#31080#25454#21495', '#13#10'      Data0114' +
      '.REFERENCE_NO AS '#36716#20837#31080#25454#21495', Data0128_1.GL_ACCT_PTR as gl_banktobe_pt' +
      'r,'#13#10'      Data0128.BANK_NAME AS '#36716#20986#24080#25143', Data0128_1.BANK_NAME AS '#36716#20837 +
      #24080#25143', '#13#10'      data0128.bal_amount,data0128_1.bal_amount as putout_' +
      'bal_amount,'#13#10'      Data0522.TDATE, dbo.Data0522.REMARK, Data0522' +
      '.sys_ptr,'#13#10'      Data0001.CURR_NAME AS '#36135#24065', data0001.curr_code,'#13#10 +
      '      Data0522.STATUS, data0105.rkey as rkey105,data0128.GL_ACCT' +
      '_PTR as gl_bankfrom_ptr,'#13#10'      Data0105.VOUCHER as '#20973#35777#32534#21495', dbo.Da' +
      'ta0522.RKEY,data0522.currency_ptr,'#13#10'case data0105.STATUS when 0 ' +
      'then '#39#26410#23457#26680#39' when 1 then '#39#20250#35745#24050#23457#39#13#10'when 2 then '#39#20027#31649#24050#23457#39' when 3 then '#39#24050 +
      #30331#24080#39' when 4 then '#39#20986#32435#24050#23457#39'  '#13#10'when 5 then '#39#34987#20316#24223#39' end as '#20973#35777#29366#24577',data0522' +
      '.exch_rate,data0522.warehouse_ptr,'#13#10'data0114.amount, data0015.WA' +
      'REHOUSE_CODE, data0015.ABBR_NAME as abbrname15'#13#10'FROM dbo.Data052' +
      '2 INNER JOIN'#13#10'      dbo.Data0005 ON dbo.Data0522.EMPL_PTR = dbo.' +
      'Data0005.RKEY INNER JOIN'#13#10'      dbo.Data0005 Data0005_1 ON '#13#10'   ' +
      '   dbo.Data0522.sys_ptr = Data0005_1.RKEY left outer JOIN'#13#10'     ' +
      ' dbo.Data0129 ON dbo.Data0522.check_129ptr = dbo.Data0129.RKEY l' +
      'eft outer JOIN'#13#10'      dbo.Data0114 ON dbo.Data0522.check_114ptr ' +
      '= dbo.Data0114.RKEY left outer JOIN'#13#10'      dbo.Data0128 ON dbo.D' +
      'ata0129.BANK_PTR = dbo.Data0128.RKEY left outer JOIN'#13#10'      dbo.' +
      'Data0128 Data0128_1 ON '#13#10'      dbo.Data0114.BANK_PTR = Data0128_' +
      '1.RKEY INNER JOIN'#13#10'      dbo.Data0001 ON '#13#10'      dbo.Data0522.cu' +
      'rrency_ptr = dbo.Data0001.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data01' +
      '05 ON dbo.Data0522.RKEY = dbo.Data0105.SOURCE_PTR AND '#13#10'      db' +
      'o.Data0105.VOU_TYPE = 3 left outer join'#13#10'      data0015 on data0' +
      '522.warehouse_ptr=data0015.rkey'#13#10'where data0522.tdate >= :dtpk1 ' +
      'and data0522.tdate <= :dtpk2 '
    EnableBCD = False
    IndexFieldNames = 'REF_NUMBER'
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38353d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39083d
      end>
    Prepared = True
    Left = 90
    Top = 96
    object aqd522REF_NUMBER: TStringField
      DisplayLabel = #36716#24080#32534#21495
      FieldName = 'REF_NUMBER'
      Size = 15
    end
    object aqd522DSDesigner: TStringField
      FieldName = #32463#21150#20154
      Size = 16
    end
    object aqd522DSDesigner2: TStringField
      FieldName = #21046#21333#20154
      Size = 16
    end
    object aqd522DSDesigner3: TBCDField
      FieldName = #36716#20986#37329#39069
      Precision = 11
      Size = 2
    end
    object aqd522DSDesigner4: TStringField
      FieldName = #36716#20986#31080#25454#21495
      Size = 10
    end
    object aqd522DSDesigner5: TStringField
      FieldName = #36716#20837#31080#25454#21495
      FixedChar = True
      Size = 10
    end
    object aqd522DSDesigner6: TStringField
      FieldName = #36716#20986#24080#25143
      Size = 30
    end
    object aqd522DSDesigner7: TStringField
      FieldName = #36716#20837#24080#25143
      Size = 30
    end
    object aqd522TDATE: TDateTimeField
      DisplayLabel = #36716#24080#26085#26399
      DisplayWidth = 10
      FieldName = 'TDATE'
    end
    object aqd522REMARK: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REMARK'
      FixedChar = True
      Size = 30
    end
    object aqd522STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object aqd522DSDesigner10: TStringField
      FieldName = #20973#35777#32534#21495
      FixedChar = True
      Size = 12
    end
    object aqd522RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aqd522DSDesigner11: TStringField
      FieldName = #20973#35777#29366#24577
      ReadOnly = True
      Size = 8
    end
    object aqd522rkey105: TIntegerField
      FieldName = 'rkey105'
      ReadOnly = True
    end
    object aqd522DSDesigner8: TStringField
      DisplayWidth = 10
      FieldName = #36135#24065
    end
    object aqd522curr_code: TStringField
      FieldName = 'curr_code'
      Size = 5
    end
    object aqd522empl_code: TStringField
      FieldName = 'empl_code'
      Size = 10
    end
    object aqd522bal_amount: TFloatField
      FieldName = 'bal_amount'
    end
    object aqd522putout_bal_amount: TFloatField
      FieldName = 'putout_bal_amount'
    end
    object aqd522empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object aqd522sys_ptr: TIntegerField
      FieldName = 'sys_ptr'
    end
    object aqd522amount: TFloatField
      FieldName = 'amount'
    end
    object aqd522WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object aqd522abbrname15: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'abbrname15'
      Size = 10
    end
    object aqd522warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object aqd522check_114ptr: TIntegerField
      FieldName = 'check_114ptr'
    end
    object aqd522exch_rate: TFloatField
      FieldName = 'exch_rate'
    end
    object aqd522gl_banktobe_ptr: TIntegerField
      FieldName = 'gl_banktobe_ptr'
    end
    object aqd522gl_bankfrom_ptr: TIntegerField
      FieldName = 'gl_bankfrom_ptr'
    end
    object aqd522currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
  end
  object DataSource1: TDataSource
    DataSet = aqd522
    Left = 24
    Top = 96
  end
  object ado522: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    EnableBCD = False
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
      'select * from data0522'
      'where rkey = :rkey')
    Left = 90
    Top = 152
    object ado522RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ado522REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      FixedChar = True
      Size = 15
    end
    object ado522TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object ado522EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ado522REMARK: TStringField
      FieldName = 'REMARK'
      FixedChar = True
      Size = 30
    end
    object ado522STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object ado522sys_ptr: TIntegerField
      FieldName = 'sys_ptr'
    end
    object ado522check_129ptr: TIntegerField
      FieldName = 'check_129ptr'
    end
    object ado522check_114ptr: TIntegerField
      FieldName = 'check_114ptr'
    end
    object ado522amount: TBCDField
      FieldName = 'amount'
      Precision = 11
      Size = 2
    end
    object ado522currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object ado522warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ado522exch_rate: TFloatField
      FieldName = 'exch_rate'
    end
  end
  object ado129: TADOQuery
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
      'select * from data0129'
      'where ttype=4 and'
      'srce_ptr=:rkey')
    Left = 150
    Top = 152
    object ado129RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ado129CHECK_NUMBER: TStringField
      FieldName = 'CHECK_NUMBER'
      Size = 10
    end
    object ado129BANK_PTR: TIntegerField
      FieldName = 'BANK_PTR'
    end
    object ado129TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object ado129STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object ado129TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object ado129SRCE_PTR: TIntegerField
      FieldName = 'SRCE_PTR'
    end
    object ado129EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ado129AMOUNT: TBCDField
      FieldName = 'AMOUNT'
      Precision = 19
    end
    object ado129PAY_TO: TStringField
      FieldName = 'PAY_TO'
      Size = 30
    end
    object ado129CURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
    object ado129EX_RATE: TFloatField
      FieldName = 'EX_RATE'
    end
    object ado129REMARK: TStringField
      FieldName = 'REMARK'
      Size = 60
    end
    object ado129warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
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
      'select * from data0114'
      'where ttype=4'
      'and srce_ptr=:rkey')
    Left = 206
    Top = 152
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
    object ado114STATUS: TWordField
      FieldName = 'STATUS'
    end
    object ado114EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ado114CSI_USER_PTR: TIntegerField
      FieldName = 'CSI_USER_PTR'
    end
    object ado114AMOUNT: TFloatField
      FieldName = 'AMOUNT'
    end
    object ado114EXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
    end
    object ado114ENTER_DATE: TDateTimeField
      FieldName = 'ENTER_DATE'
    end
    object ado114DEBIT_AMOUNT: TFloatField
      FieldName = 'DEBIT_AMOUNT'
    end
    object ado114CURRECY_PTR: TIntegerField
      FieldName = 'CURRECY_PTR'
    end
    object ado114BANK_PTR: TIntegerField
      FieldName = 'BANK_PTR'
    end
    object ado114warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
  end
  object ADO105: TADOQuery
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
      'select * from data0105'
      'where'
      'Data0105.rkey=:rkey '
      '      ')
    Left = 90
    Top = 209
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
    EnableBCD = False
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
    Left = 91
    Top = 259
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
    object ADO106SRCE_PTR: TIntegerField
      FieldName = 'SRCE_PTR'
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
    object ADO106FYEAR: TIntegerField
      FieldName = 'FYEAR'
    end
    object ADO106PERIOD: TSmallintField
      FieldName = 'PERIOD'
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
    object ADO106QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object ADO106EXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
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
      'R = dbo.Data0005.RKEY'#13#10'WHERE (dbo.Data0105.rkey = :rkey105) '
    Parameters = <
      item
        Name = 'rkey105'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 153
    Top = 209
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
    Left = 27
    Top = 213
    object Aqd508CURR_FYEAR: TIntegerField
      FieldName = 'CURR_FYEAR'
    end
    object Aqd508CURR_PERIOD: TSmallintField
      FieldName = 'CURR_PERIOD'
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 136
    Top = 24
  end
  object ADOsp04: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'ep120;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@v_rkey'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 62
      end>
    Left = 149
    Top = 96
    object ADOsp04CONTROL_NO_LENGTH: TSmallintField
      FieldName = 'CONTROL_NO_LENGTH'
    end
    object ADOsp04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object ADOsp04SEED_FLAG: TWordField
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
      '_desc, data0106.price,'#13#10'      Data0103_2.GL_DESCRIPTION AS grand' +
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
    Left = 153
    Top = 259
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
    object Aqd106price: TBCDField
      FieldName = 'price'
      Precision = 14
      Size = 2
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
    Left = 204
    Top = 95
    object ADO128bank_current_check: TStringField
      FieldName = 'bank_current_check'
      FixedChar = True
      Size = 10
    end
    object ADO128bal_amount: TFloatField
      FieldName = 'bal_amount'
    end
  end
  object ado104: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from data0104'#13#10'where rkey=10'
    Parameters = <>
    Left = 208
    Top = 264
    object ado104RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ado104JOURNAL_TITLE: TStringField
      FieldName = 'JOURNAL_TITLE'
      FixedChar = True
      Size = 30
    end
    object ado104DFLT_ACCT_01: TIntegerField
      FieldName = 'DFLT_ACCT_01'
    end
    object ado104DFLT_ACCT_02: TIntegerField
      FieldName = 'DFLT_ACCT_02'
    end
    object ado104DFLT_ACCT_03: TIntegerField
      FieldName = 'DFLT_ACCT_03'
    end
    object ado104DFLT_ACCT_04: TIntegerField
      FieldName = 'DFLT_ACCT_04'
    end
    object ado104DFLT_ACCT_05: TIntegerField
      FieldName = 'DFLT_ACCT_05'
    end
    object ado104DFLT_ACCT_06: TIntegerField
      FieldName = 'DFLT_ACCT_06'
    end
    object ado104DFLT_ACCT_07: TIntegerField
      FieldName = 'DFLT_ACCT_07'
    end
    object ado104DFLT_ACCT_08: TIntegerField
      FieldName = 'DFLT_ACCT_08'
    end
    object ado104DFLT_ACCT_09: TIntegerField
      FieldName = 'DFLT_ACCT_09'
    end
    object ado104DFLT_ACCT_10: TIntegerField
      FieldName = 'DFLT_ACCT_10'
    end
  end
end
