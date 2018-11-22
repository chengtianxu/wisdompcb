object DM: TDM
  OldCreateOrder = False
  Left = 540
  Top = 230
  Height = 496
  Width = 503
  object ADOConnection1: TADOConnection
    ConnectionTimeout = 20
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 32
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
      'SELECT Data0114.REFERENCE_NO,Data0105.VOUCHER,Data0105.STATUS, '#13 +
      #10'       Data0114.RKEY,Data0114.TDATE,data0114.remark,Data0114.ST' +
      'ATUS AS status114, '#13#10'       Data0005.EMPLOYEE_NAME,Data0001.CURR' +
      '_CODE, '#13#10'       Data0001.CURR_NAME,Data0114.EXCHANGE_RATE, '#13#10'   ' +
      '    Data0128.BANK_NAME,Data0010.CUST_CODE, data0010.ANALYSIS_COD' +
      'E4,data0010.ANALYSIS_CODE5,'#13#10'       Data0010.CUSTOMER_NAME,Data0' +
      '010.ABBR_NAME,Data0010.FED_TAX_ID_NO,'#13#10'       Data0114.TTYPE,Dat' +
      'a0114.AMOUNT,data0128.bal_amount,'#13#10'       Data0114.AMOUNT-data01' +
      '14.DEBIT_AMOUNT as dz_amount,'#13#10'       data0015.warehouse_code,da' +
      'ta0015.ABBR_NAME as abbrname15,'#13#10'       case data0114.ttype '#13#10'  ' +
      '     when 1 then '#39#29616#38134#25910#27454#39'  when 2 then '#39#39044#25910#24080#27454#39'   when 5 then '#39#36716#24080#25910#27454#39 +
      #13#10'       end as v_ttype,   case data0105.status'#13#10'       when 0 t' +
      'hen '#39#26410#23457#26680#39'  when 1  then '#39#20250#35745#24050#23457#39' when 2  then '#39#20027#31649#24050#23457#39#13#10'       when ' +
      '3  then '#39#24050#30331#24080#39'  when 4  then '#39#20986#32435#24050#23457#39' when 5 then '#39#34987#20316#24223#39' '#13#10'       en' +
      'd as v_status, case data0114.status  when 1  then '#39#26377#25928#30340#39'  when 2 ' +
      'then '#39#24050#28165#31639#39' '#13#10'       when 3 then '#39#24050#21462#28040#39' end as v_status114,data011' +
      '4.empl_ptr,data0114.DEBIT_AMOUNT,'#13#10'       round(Data0114.AMOUNT*' +
      'Data0114.EXCHANGE_RATE,2) as stand_amount,'#13#10'       data0114.PO_N' +
      'UMBER,Data0114.MANU_PART_NUMBER,Data0114.all_shipqty,d05_2.emplo' +
      'yee_name as sales_rep_name'#13#10'FROM   Data0005 INNER JOIN'#13#10'       D' +
      'ata0114 ON Data0005.RKEY = Data0114.EMPL_PTR INNER JOIN'#13#10'       ' +
      'Data0001 ON Data0114.CURRECY_PTR = Data0001.RKEY INNER JOIN'#13#10'   ' +
      '    Data0010 ON Data0114.SRCE_PTR = Data0010.RKEY INNER JOIN'#13#10'  ' +
      '     Data0005 as d05_2 ON Data0010.SALES_REP_PTR = d05_2.RKEY LE' +
      'FT OUTER JOIN'#13#10'       Data0105 ON Data0114.RKEY = Data0105.SOURC' +
      'E_PTR AND '#13#10'       Data0105.TRANS_TYPE = 6 LEFT OUTER JOIN'#13#10'    ' +
      '   Data0128 ON Data0114.BANK_PTR = Data0128.RKEY left outer join' +
      ' '#13#10'       data0015 on data0114.warehouse_ptr=data0015.rkey'#13#10'WHER' +
      'E (data0114.ttype <> 3) and '#13#10'      (data0114.ttype <> 4) and'#13#10' ' +
      '     (Data0114.TDATE>= :dtpk1)  and'#13#10'      (Data0114.TDATE<= :dt' +
      'pk2) '#13#10
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
        Value = 38861d
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
    object aqd114CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object aqd114CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      DisplayWidth = 50
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object aqd114ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object aqd114TTYPE: TWordField
      FieldName = 'TTYPE'
    end
    object aqd114AMOUNT: TFloatField
      DisplayLabel = #31080#25454#37329#39069
      FieldName = 'AMOUNT'
    end
    object aqd114v_ttype: TStringField
      DisplayLabel = #31080#25454#31867#22411
      FieldName = 'v_ttype'
      ReadOnly = True
      Size = 8
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
    object aqd114stand_amount: TFloatField
      FieldName = 'stand_amount'
      ReadOnly = True
    end
    object aqd114empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object aqd114PO_NUMBER: TStringField
      DisplayLabel = #23458#25143#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object aqd114MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object aqd114all_shipqty: TIntegerField
      DisplayLabel = #20801#35768#20986#36135#25968
      FieldName = 'all_shipqty'
    end
    object aqd114remark: TStringField
      FieldName = 'remark'
      Size = 60
    end
    object aqd114DEBIT_AMOUNT: TFloatField
      DisplayLabel = #25163#32493#36153
      FieldName = 'DEBIT_AMOUNT'
    end
    object aqd114dz_amount: TFloatField
      DisplayLabel = #21040#24080#37329#39069
      FieldName = 'dz_amount'
      ReadOnly = True
    end
    object aqd114warehouse_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
    object aqd114abbrname15: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'abbrname15'
      Size = 10
    end
    object aqd114sales_rep_name: TStringField
      DisplayLabel = #19994#21153#21592
      FieldName = 'sales_rep_name'
    end
    object aqd114FED_TAX_ID_NO: TStringField
      DisplayLabel = #20184#27454#26041#24335
      FieldName = 'FED_TAX_ID_NO'
      Size = 50
    end
    object aqd114ANALYSIS_CODE4: TStringField
      FieldName = 'ANALYSIS_CODE4'
    end
    object aqd114ANALYSIS_CODE5: TStringField
      FieldName = 'ANALYSIS_CODE5'
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
    Left = 85
    Top = 144
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
    object ado114trans_pl: TWordField
      FieldName = 'trans_pl'
    end
    object ado114PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ado114MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ado114all_shipqty: TIntegerField
      FieldName = 'all_shipqty'
    end
    object ado114warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ado114IF_VOUCHER: TBooleanField
      FieldName = 'IF_VOUCHER'
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
  object ADO04: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select SEED_VALUE,SEED_FLAG'
      'from data0004'
      'where rkey=25')
    Left = 144
    Top = 144
    object ADO04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object ADO04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
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
      'select * from data0116'
      'where  '
      '    memo_tp=1 and'
      '    srce_ptr=:rkey')
    Left = 31
    Top = 198
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
    object ado116AMOUNT: TFloatField
      FieldName = 'AMOUNT'
    end
    object ado116AVL_AMT: TFloatField
      FieldName = 'AVL_AMT'
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
      FixedChar = True
    end
    object ado116DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      FixedChar = True
      Size = 40
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
    Top = 208
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
    object Aqd106price: TBCDField
      FieldName = 'price'
      Precision = 14
      Size = 2
    end
  end
  object aqd115_112: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT Data0112.invoice_number, Data0112.INVOICE_TOTAL,'#13#10'      D' +
      'ata0112.RKEY, Data0112.EXCHANGE_RATE, '#13#10'      Data0112.amount_pa' +
      'id + Data0112.CASH_DISC - Data0115.AMOUNT - '#13#10'     Data0115.APPL' +
      '_CASH_DISC   AS yisou,'#13#10'      Data0112.INVOICE_TOTAL - Data0112.' +
      'amount_paid - Data0112.CASH_DISC'#13#10'       + Data0115.AMOUNT + Dat' +
      'a0115.APPL_CASH_DISC AS yinsou,'#13#10'      Data0115.AMOUNT, Data0115' +
      '.APPL_CASH_DISC,data0112.INVOICE_DATE'#13#10'FROM Data0115 INNER JOIN'#13 +
      #10'      Data0112 ON Data0115.INV_PTR = Data0112.RKEY'#13#10'where data0' +
      '115.srce_ptr=:rkey114'#13#10'ORDER BY Data0112.due_date'#13#10
    Parameters = <
      item
        Name = 'rkey114'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 200
    Top = 206
    object aqd115_112invoice_number: TStringField
      FieldName = 'invoice_number'
      FixedChar = True
      Size = 12
    end
    object aqd115_112INVOICE_TOTAL: TBCDField
      FieldName = 'INVOICE_TOTAL'
      Precision = 19
    end
    object aqd115_112RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aqd115_112EXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
    end
    object aqd115_112yisou: TFloatField
      FieldName = 'yisou'
      ReadOnly = True
    end
    object aqd115_112yinsou: TFloatField
      FieldName = 'yinsou'
      ReadOnly = True
    end
    object aqd115_112AMOUNT: TFloatField
      FieldName = 'AMOUNT'
    end
    object aqd115_112APPL_CASH_DISC: TFloatField
      FieldName = 'APPL_CASH_DISC'
    end
    object aqd115_112INVOICE_DATE: TDateTimeField
      FieldName = 'INVOICE_DATE'
    end
  end
  object aqd115_116: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT Data0116.MEMO_NUMBER, '#13#10'       case data0116.memo_tp when' +
      ' 1 then '#39#39044#25910#39#13#10'      when 3 then '#39#25187#27454#39' when 4 then '#39#36864#36135#39' end as typ' +
      'e,'#13#10'      dbo.Data0116.REF_NUMBER, dbo.Data0116.RMA_DATE, dbo.Da' +
      'ta0116.AMOUNT, '#13#10'      dbo.Data0116.AVL_AMT + ISNULL(dbo.Data011' +
      '5.AMOUNT, 0) AS avl_amount, '#13#10'      dbo.Data0116.EX_RATE, ISNULL' +
      '(dbo.Data0115.AMOUNT, 0) AS amount_115, '#13#10'      dbo.Data0116.RKE' +
      'Y'#13#10'FROM dbo.Data0115 RIGHT OUTER JOIN'#13#10'           Data0116 ON db' +
      'o.Data0115.CRE_MEMO_PTR = dbo.Data0116.RKEY'#13#10'          and data0' +
      '115.srce_ptr=:rkey114'#13#10'WHERE (dbo.Data0116.AVL_AMT + ISNULL(dbo.' +
      'Data0115.AMOUNT, 0) > 0)'#13#10'and data0116.cust_ptr=:rkey10'#13#10'and dat' +
      'a0116.currency_ptr=:rkey01'#13#10'ORDER BY dbo.Data0116.MEMO_NUMBER'
    Parameters = <
      item
        Name = 'rkey114'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey10'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 200
    Top = 253
    object aqd115_116MEMO_NUMBER: TStringField
      FieldName = 'MEMO_NUMBER'
      FixedChar = True
      Size = 10
    end
    object aqd115_116REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
    end
    object aqd115_116RMA_DATE: TDateTimeField
      FieldName = 'RMA_DATE'
    end
    object aqd115_116AMOUNT: TBCDField
      FieldName = 'AMOUNT'
      Precision = 19
    end
    object aqd115_116avl_amount: TFloatField
      FieldName = 'avl_amount'
      ReadOnly = True
    end
    object aqd115_116EX_RATE: TFloatField
      FieldName = 'EX_RATE'
    end
    object aqd115_116amount_115: TFloatField
      FieldName = 'amount_115'
    end
    object aqd115_116RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aqd115_116type: TStringField
      FieldName = 'type'
      ReadOnly = True
      Size = 4
    end
  end
  object Aqd508: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'select CURR_FYEAR, CURR_PERIOD'#13#10'from data0508'
    Parameters = <>
    Left = 192
    Top = 144
    object Aqd508CURR_FYEAR: TIntegerField
      FieldName = 'CURR_FYEAR'
    end
    object Aqd508CURR_PERIOD: TSmallintField
      FieldName = 'CURR_PERIOD'
    end
  end
end
