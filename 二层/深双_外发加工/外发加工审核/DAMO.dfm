object DM: TDM
  OldCreateOrder = False
  Left = 499
  Top = 234
  Height = 351
  Width = 361
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security In' +
      'fo=True;User ID=wzsa;Initial Catalog=sj_v20_live;Data Source=172' +
      '.16.68.8'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 36
    Top = 14
  end
  object wzdata300: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltPessimistic
    OnCalcFields = wzdata300CalcFields
    Parameters = <
      item
        Name = 'rkey73'
        DataType = ftInteger
        Size = -1
        Value = 72
      end>
    SQL.Strings = (
      
        'SELECT WZDATA300.rkey, WZDATA300.epiboly_number, WZDATA300.statu' +
        's,WZDATA300.type,'
      '      Data0034.DEPT_NAME, Data0034.DEPT_CODE, Data0023.CODE,'
      '      Data0023.SUPPLIER_NAME, Data0023.ABBR_NAME,'
      '      Data0015.WAREHOUSE_CODE, Data0015.WAREHOUSE_NAME,'
      
        '      Data0015.ABBR_NAME AS warehouse_abbname, WZDATA300.ent_dat' +
        'a,'
      '      Data0005.EMPL_CODE, Data0005.EMPLOYEE_NAME,'
      
        '      WZDATA300.auth_ptr, Data0001.CURR_CODE, Data0001.CURR_NAME' +
        ','
      '      WZDATA300.refer_date, Data0094.CODE AS auth_code,'
      '      Data0094.PURCHASE_APPROV_DESC,wzdata302.ranking,'
      '      WZDATA302.auth_date,WZDATA302.remark,WZDATA302.auth_flag'
      'FROM Data0023 INNER JOIN'
      '      WZDATA300 ON Data0023.RKEY = WZDATA300.supp_ptr LEFT JOIN'
      '      Data0034 ON WZDATA300.dept_ptr = Data0034.RKEY INNER JOIN'
      '      Data0015 ON'
      '      WZDATA300.warehouse_ptr = Data0015.RKEY INNER JOIN'
      '      Data0005 ON WZDATA300.empl_ptr = Data0005.RKEY INNER JOIN'
      
        '      Data0001 ON WZDATA300.currency_ptr = Data0001.RKEY INNER J' +
        'OIN'
      '      Data0094 ON WZDATA300.auth_ptr = Data0094.RKEY INNER JOIN'
      '      WZDATA302 ON WZDATA300.rkey = WZDATA302.epiboly_ptr'
      
        'where (wzdata302.user_ptr IN (SELECT rkey FROM data0073 WHERE ep' +
        'iboly_ptr= :rkey73))'
      '       and (wzdata302.auth_flag='#39'Y'#39')'
      '       and (WZDATA300.status=2)'
      ''
      ''
      'order by WZDATA300.epiboly_number')
    Left = 187
    Top = 10
    object wzdata300rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object wzdata300epiboly_number: TStringField
      DisplayLabel = #22806#21457#32534#21495
      FieldName = 'epiboly_number'
      Size = 15
    end
    object wzdata300status: TWordField
      FieldName = 'status'
    end
    object wzdata300type: TWordField
      FieldName = 'type'
    end
    object wzdata300DEPT_NAME: TStringField
      DisplayLabel = #24037#24207#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object wzdata300DEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object wzdata300CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object wzdata300SUPPLIER_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'SUPPLIER_NAME'
      Size = 40
    end
    object wzdata300ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object wzdata300WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object wzdata300WAREHOUSE_NAME: TStringField
      DisplayLabel = #24037#21378#21517#31216
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object wzdata300warehouse_abbname: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'warehouse_abbname'
      Size = 10
    end
    object wzdata300ent_data: TDateTimeField
      DisplayLabel = #36755#20837#26085#26399
      FieldName = 'ent_data'
    end
    object wzdata300EMPL_CODE: TStringField
      DisplayLabel = #21592#24037#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object wzdata300EMPLOYEE_NAME: TStringField
      DisplayLabel = #30003#35831#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object wzdata300CURR_CODE: TStringField
      DisplayLabel = #36135#24065#20195#30721
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object wzdata300CURR_NAME: TStringField
      DisplayLabel = #36135#24065#21517#31216
      FieldName = 'CURR_NAME'
    end
    object wzdata300auth_code: TStringField
      DisplayLabel = #23457#25209#20195#30721
      FieldName = 'auth_code'
      Size = 5
    end
    object wzdata300PURCHASE_APPROV_DESC: TStringField
      DisplayLabel = #23457#25209#21517#31216
      FieldName = 'PURCHASE_APPROV_DESC'
      Size = 40
    end
    object wzdata300v_status: TStringField
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Size = 6
      Calculated = True
    end
    object wzdata300refer_date: TDateTimeField
      FieldName = 'refer_date'
    end
    object wzdata300AUTH_ptr: TIntegerField
      FieldName = 'AUTH_ptr'
    end
    object wzdata300auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object wzdata300remark: TStringField
      FieldName = 'remark'
      Size = 50
    end
    object wzdata300auth_flag: TStringField
      FieldName = 'auth_flag'
      FixedChar = True
      Size = 1
    end
    object wzdata300ranking: TWordField
      FieldName = 'ranking'
    end
  end
  object DataSource1: TDataSource
    DataSet = wzdata300
    Left = 123
    Top = 10
  end
  object adowz300: TADOQuery
    Connection = ADOConnection1
    CursorType = ctDynamic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'key'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select *  from WZDATA300'
      'where '
      ' rkey=:key')
    Left = 187
    Top = 63
    object adowz300rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adowz300epiboly_number: TStringField
      FieldName = 'epiboly_number'
      Size = 15
    end
    object adowz300status: TWordField
      FieldName = 'status'
    end
    object adowz300supp_ptr: TIntegerField
      FieldName = 'supp_ptr'
    end
    object adowz300dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object adowz300type: TWordField
      FieldName = 'type'
    end
    object adowz300empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object adowz300ent_data: TDateTimeField
      FieldName = 'ent_data'
    end
    object adowz300refer_date: TDateTimeField
      FieldName = 'refer_date'
    end
    object adowz300warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object adowz300auth_ptr: TIntegerField
      FieldName = 'auth_ptr'
    end
    object adowz300currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object adowz300exch_rate: TBCDField
      FieldName = 'exch_rate'
      Precision = 10
      Size = 8
    end
    object adowz300CONTACT_NAME: TStringField
      FieldName = 'CONTACT_NAME'
    end
    object adowz300CONT_PHONE: TStringField
      FieldName = 'CONT_PHONE'
    end
    object adowz300TAX_cate: TStringField
      FieldName = 'TAX_cate'
    end
    object adowz300pay_method: TStringField
      FieldName = 'pay_method'
      Size = 50
    end
    object adowz300deli_address: TStringField
      FieldName = 'deli_address'
      Size = 50
    end
    object adowz300SHIPPING_METHOD: TStringField
      FieldName = 'SHIPPING_METHOD'
      Size = 50
    end
    object adowz300remark: TStringField
      FieldName = 'remark'
      Size = 100
    end
  end
  object DataSource2: TDataSource
    DataSet = adowz300
    Left = 124
    Top = 63
  end
  object ADO301: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADO301CalcFields
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 7
      end>
    SQL.Strings = (
      'select wzdata301.*,'
      'data0025.MANU_PART_NUMBER,'
      'data0025.MANU_PART_DESC'
      'from wzdata301 inner join data0025'
      'on wzdata301.CUSTPART_PTR=data0025.rkey'
      'where  (wzdata301.EPIBOLY_PTR=:rkey)')
    Left = 187
    Top = 119
    object ADO301RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO301EPIBOLY_PTR: TIntegerField
      FieldName = 'EPIBOLY_PTR'
    end
    object ADO301CUSTPART_PTR: TIntegerField
      FieldName = 'CUSTPART_PTR'
    end
    object ADO301QUANTITY: TIntegerField
      DisplayLabel = #25968#37327
      FieldName = 'QUANTITY'
    end
    object ADO301PRICE: TBCDField
      DisplayLabel = #21333#20215
      FieldName = 'PRICE'
      Precision = 10
      Size = 3
    end
    object ADO301AMOUNT: TBCDField
      DisplayLabel = #37329#39069
      FieldKind = fkCalculated
      FieldName = 'AMOUNT'
      LookupCache = True
      Calculated = True
    end
    object ADO301RECEVIED_QTY: TIntegerField
      FieldName = 'RECEVIED_QTY'
    end
    object ADO301UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
      Size = 10
    end
    object ADO301STANDARD: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'STANDARD'
      Size = 30
    end
    object ADO301AREA_SQM: TBCDField
      FieldName = 'AREA_SQM'
      Precision = 6
    end
    object ADO301AREA_SQF: TBCDField
      FieldName = 'AREA_SQF'
      Precision = 6
    end
    object ADO301LAYER: TWordField
      DisplayLabel = #23618#25968
      FieldName = 'LAYER'
    end
    object ADO301THINK: TBCDField
      FieldName = 'THINK'
      Precision = 4
      Size = 2
    end
    object ADO301MIN_aperture: TBCDField
      FieldName = 'MIN_aperture'
      Precision = 5
      Size = 3
    end
    object ADO301REQ_DATE: TDateTimeField
      DisplayLabel = #21040#36135#26085#26399
      FieldName = 'REQ_DATE'
    end
    object ADO301REMARTK: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 10
      FieldName = 'REMARTK'
      Size = 50
    end
    object ADO301RETURN_QTY: TIntegerField
      FieldName = 'RETURN_QTY'
    end
    object ADO301MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADO301MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
  end
  object DataSource3: TDataSource
    DataSet = ADO301
    Left = 124
    Top = 117
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 29
    Top = 80
  end
  object ADOwz302: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltPessimistic
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'ranking'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'select ranking,auth_flag,auth_date,remark'
      'from wzdata302'
      'where'
      '    ranking-1=:ranking and'
      '    epiboly_ptr=:rkey')
    Left = 186
    Top = 173
    object ADOwz302ranking: TWordField
      FieldName = 'ranking'
    end
    object ADOwz302auth_flag: TStringField
      FieldName = 'auth_flag'
      FixedChar = True
      Size = 1
    end
    object ADOwz302auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object ADOwz302remark: TStringField
      FieldName = 'remark'
      Size = 50
    end
  end
  object Aqwz302: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DataSource1
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
      
        'select data0073.user_login_name as user_id,data0073.user_full_na' +
        'me,'
      'wzdata302.auth_date,wzdata302.ranking,'
      'wzdata302.remark,'
      #39'auth_flag'#39'= case'
      ' when wzdata302.auth_date is null then '#39#26410#23457#25209#39
      ' else '#39#24050#23457#25209#39
      ' end'
      'from wzdata302 inner join data0073'
      'on wzdata302.user_ptr=data0073.rkey'
      'where wzdata302.epiboly_ptr=:rkey'
      'order by wzdata302.ranking')
    Left = 187
    Top = 228
    object Aqwz302user_id: TStringField
      DisplayLabel = #31995#32479#29992#25143#20195#30721
      FieldName = 'user_id'
      Size = 10
    end
    object Aqwz302user_full_name: TStringField
      DisplayLabel = #23457#25209#20154#21592
      FieldName = 'user_full_name'
      Size = 30
    end
    object Aqwz302auth_date: TDateTimeField
      DisplayLabel = #23457#25209#26085#26399
      FieldName = 'auth_date'
    end
    object Aqwz302ranking: TWordField
      DisplayLabel = #23457#25209#39034#24207
      FieldName = 'ranking'
    end
    object Aqwz302remark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 50
    end
    object Aqwz302auth_flag: TStringField
      DisplayLabel = #23457#25209#29366#24577
      FieldName = 'auth_flag'
      ReadOnly = True
      Size = 6
    end
  end
  object DataSource4: TDataSource
    DataSet = Aqwz302
    Left = 131
    Top = 231
  end
end
