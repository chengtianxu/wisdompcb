object DM: TDM
  OldCreateOrder = False
  Left = 786
  Top = 227
  Height = 437
  Width = 374
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 165
    Top = 6
  end
  object DataSource1: TDataSource
    DataSet = ADO214
    Left = 25
    Top = 62
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    AfterDelete = ADOQuery1AfterDelete
    Parameters = <>
    Prepared = True
    Left = 24
    Top = 7
  end
  object ADO215: TADOQuery
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
      'select * from data0215'
      'where (fg_list_ptr=:rkey) and'
      '      (status<>2)')
    Left = 84
    Top = 161
    object ADO215RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO215FG_LIST_PTR: TIntegerField
      FieldName = 'FG_LIST_PTR'
    end
    object ADO215CUSTPART_PTR: TIntegerField
      FieldName = 'CUSTPART_PTR'
    end
    object ADO215CUSTPART_BATCH_PTR: TIntegerField
      FieldName = 'CUSTPART_BATCH_PTR'
    end
    object ADO215location_ptr: TIntegerField
      FieldName = 'location_ptr'
    end
    object ADO215QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object ADO215ENTERED_BY_PTR: TIntegerField
      FieldName = 'ENTERED_BY_PTR'
    end
    object ADO215ENTERED_BY_USER_PTR: TIntegerField
      FieldName = 'ENTERED_BY_USER_PTR'
    end
    object ADO215COUNTED_BY_EMPL_PTR: TIntegerField
      FieldName = 'COUNTED_BY_EMPL_PTR'
    end
    object ADO215status: TWordField
      FieldName = 'status'
    end
    object ADO215check_no: TStringField
      FieldName = 'check_no'
      Size = 50
    end
    object ADO215old_quantity: TFloatField
      FieldName = 'old_quantity'
    end
  end
  object aq53: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'edit_2'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 5
        Value = Null
      end
      item
        Name = 'edit_3'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 5
        Value = Null
      end
      item
        Name = 'rkey15'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select data0053.rkey,'
      '       data0053.loc_ptr,'
      '       data0053.cust_part_ptr,'
      '       data0053.QTY_ON_HAND'
      'from'
      '  data0053,data0016,data0025,data0010'
      ''
      'where'
      '    data0053.loc_ptr=data0016.rkey and'
      '    data0016.code>=:edit_2 and'
      '    data0016.code<=:edit_3 and'
      '    data0053.whse_ptr=:rkey15 and'
      '    data0053.cust_part_ptr=data0025.rkey and'
      '    data0025.customer_ptr=data0010.rkey and'
      '    data0053.qty_on_hand>0'
      '    and data0010.rkey=3'
      '    and data0010.cust_code>='#39'BA'#39
      '    and data0010.cust_code<='#39'FG'#39)
    Left = 26
    Top = 162
  end
  object ADOupdate1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltPessimistic
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
      'select data0215.rkey,data0215.custpart_batch_ptr,'
      '       data0215.quantity,data0215.custpart_ptr,'
      '       data0215.entered_by_ptr,data0215.entered_by_user_ptr,'
      '       data0053.qty_on_hand,data0053.quantity as quantity53,'
      '       data0215.quantity-data0053.qty_on_hand as divergent,'
      '       data0215.status'
      'from   data0215,data0053'
      'where data0215.custpart_batch_ptr = data0053.rkey and'
      '      data0215.status = 1 and'
      '      data0215.fg_list_ptr = :rkey')
    Left = 27
    Top = 218
    object ADOupdate1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOupdate1custpart_batch_ptr: TIntegerField
      FieldName = 'custpart_batch_ptr'
    end
    object ADOupdate1quantity: TFloatField
      FieldName = 'quantity'
    end
    object ADOupdate1quantity53: TFloatField
      FieldName = 'quantity53'
    end
    object ADOupdate1qty_on_hand: TFloatField
      FieldName = 'qty_on_hand'
    end
    object ADOupdate1divergent: TFloatField
      FieldName = 'divergent'
      ReadOnly = True
    end
    object ADOupdate1entered_by_ptr: TIntegerField
      FieldName = 'entered_by_ptr'
    end
    object ADOupdate1entered_by_user_ptr: TIntegerField
      FieldName = 'entered_by_user_ptr'
    end
    object ADOupdate1custpart_ptr: TIntegerField
      FieldName = 'custpart_ptr'
    end
    object ADOupdate1status: TWordField
      FieldName = 'status'
    end
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 84
    Top = 7
  end
  object ADO493: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 168
    Top = 111
    object ADO493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object ADO493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object ADO493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object ADO493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object ADO493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object ADO493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object ADO493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object ADOdivergent: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
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
      'SELECT Data0025.manu_part_number,'
      '      data0025.manu_part_desc,'
      '      Data0010.CUST_CODE,data0025.LATEST_PRICE,'
      '      Data0006.WORK_ORDER_NUMBER,'
      '      data0215.old_quantity,'
      '      Data0005.EMPLOYEE_NAME,'
      '      Data0215.QUANTITY,'
      '      data0016.code,Data0016.LOCATION,'
      '      data0215.quantity-data0215.old_quantity as divergent,'
      
        '      (data0215.quantity-data0215.old_quantity)*data0025.LATEST_' +
        'PRICE as totaldiver'
      'FROM  Data0006 RIGHT OUTER JOIN'
      '      Data0005 RIGHT OUTER JOIN'
      '      Data0215 INNER JOIN'
      
        '      Data0025 ON Data0215.CUSTPART_PTR = Data0025.RKEY INNER JO' +
        'IN'
      
        '      Data0010 ON Data0025.CUSTOMER_PTR = Data0010.RKEY INNER JO' +
        'IN'
      
        '      Data0016 ON Data0215.location_ptr = Data0016.RKEY INNER JO' +
        'IN'
      '      Data0053 ON Data0215.CUSTPART_BATCH_PTR = Data0053.RKEY ON'
      '      Data0005.RKEY = Data0215.COUNTED_BY_EMPL_PTR ON'
      '      Data0006.RKEY = Data0053.WORK_ORDER_PTR'
      'WHERE (Data0215.FG_LIST_PTR = :rkey) and'
      '      (data0215.quantity-data0215.old_quantity<>0) and'
      '      (data0215.status<>0)'
      'ORDER BY Data0025.MANU_PART_NUMBER'
      '')
    Left = 169
    Top = 217
    object ADOdivergentMANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'manu_part_number'
    end
    object ADOdivergentmanu_part_desc: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'manu_part_desc'
      Size = 40
    end
    object ADOdivergentCUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 5
    end
    object ADOdivergentSTANDARD_COST: TFloatField
      DisplayLabel = #26368#26032#21333#20215
      FieldName = 'LATEST_PRICE'
      DisplayFormat = '0.0000'
    end
    object ADOdivergentWORK_ORDER_NUMBER: TStringField
      DisplayLabel = #24037#20316#23450#21333
      FieldName = 'WORK_ORDER_NUMBER'
      FixedChar = True
      Size = 16
    end
    object ADOdivergentQTY_ON_HAND: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #24211#23384#25968#37327
      FieldName = 'old_quantity'
    end
    object ADOdivergentQUANTITY: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #28165#21333#25968#37327
      FieldName = 'QUANTITY'
    end
    object ADOdivergentdivergent: TFloatField
      DisplayLabel = #25968#37327#24046#24322
      FieldName = 'divergent'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object ADOdivergenttotaldiver: TFloatField
      DisplayLabel = #24046#24322#37329#39069
      FieldName = 'totaldiver'
      ReadOnly = True
      DisplayFormat = '0.0000'
    end
    object ADOdivergentEMPLOYEE_NAME: TStringField
      DisplayLabel = #28165#21333#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOdivergentcode: TStringField
      DisplayLabel = #20179#24211#20195#30721
      FieldName = 'code'
      FixedChar = True
      Size = 5
    end
    object ADOdivergentLOCATION: TStringField
      DisplayLabel = #20179#24211#21517#31216
      FieldName = 'LOCATION'
      Size = 10
    end
  end
  object aq215: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'ep066;2'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@rkey'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 2
      end>
    Left = 88
    Top = 217
    object aq215RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq215CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object aq215WORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      FixedChar = True
      Size = 16
    end
    object aq215QTY_ON_HAND: TFloatField
      FieldName = 'QTY_ON_HAND'
    end
    object aq215EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aq215COUNTED_BY_EMPL_PTR: TIntegerField
      FieldName = 'COUNTED_BY_EMPL_PTR'
    end
    object aq215QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object aq215code: TStringField
      FieldName = 'code'
      FixedChar = True
      Size = 5
    end
    object aq215LOCATION: TStringField
      FieldName = 'LOCATION'
    end
    object aq215REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      FixedChar = True
    end
    object aq215custpart_ptr: TIntegerField
      FieldName = 'custpart_ptr'
    end
    object aq215location_ptr: TIntegerField
      FieldName = 'location_ptr'
    end
    object aq215check_no: TStringField
      FieldName = 'check_no'
      Size = 50
    end
    object aq215LATEST_PRICE: TFloatField
      FieldName = 'LATEST_PRICE'
    end
    object aq215unit_sq: TFloatField
      FieldName = 'unit_sq'
      ReadOnly = True
    end
    object aq215mianji: TFloatField
      FieldName = 'mianji'
      ReadOnly = True
    end
    object aq215MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object aq215manu_part_desc: TStringField
      FieldName = 'manu_part_desc'
      Size = 40
    end
    object aq215old_quantity: TFloatField
      FieldName = 'old_quantity'
    end
  end
  object adosum215: TADOQuery
    Connection = ADOConnection1
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
      'SELECT Data0025.MANU_PART_NUMBER,data0025.analysis_code_2,'
      'Data0025.MANU_PART_DESC,'
      'Data0215.CUSTPART_PTR,Data0010.ABBR_NAME,'
      'SUM(Data0053.QTY_ON_HAND) AS total_qty,'
      ' case data0025.ttype'
      ' when 0 then '#39#25209#37327#39' when 1 then '#39#26679#26495#39
      ' end as bath_former'
      'FROM   Data0215 INNER JOIN Data0025 ON'
      '       Data0215.CUSTPART_PTR = Data0025.RKEY INNER JOIN'
      '       Data0010 ON'
      '       Data0025.CUSTOMER_PTR = Data0010.RKEY INNER JOIN'
      '       Data0053 ON'
      '       Data0215.CUSTPART_BATCH_PTR = Data0053.RKEY'
      'where data0215.fg_list_ptr=:rkey'
      'GROUP BY  Data0025.MANU_PART_NUMBER,data0025.analysis_code_2,'
      '          Data0025.MANU_PART_DESC,data0025.ttype,'
      '          Data0215.CUSTPART_PTR,Data0010.ABBR_NAME'
      'ORDER BY  Data0025.MANU_PART_NUMBER')
    Left = 169
    Top = 162
    object adosum215CUSTPART_PTR: TIntegerField
      FieldName = 'CUSTPART_PTR'
    end
    object adosum215ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object adosum215total_qty: TFloatField
      FieldName = 'total_qty'
    end
    object adosum215MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object adosum215analysis_code_2: TStringField
      FieldName = 'analysis_code_2'
      Size = 50
    end
    object adosum215MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object adosum215bath_former: TStringField
      FieldName = 'bath_former'
      ReadOnly = True
      Size = 4
    end
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = ADOQuery3CalcFields
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
      'SELECT '
      '      Data0025.MANU_PART_NUMBER,'
      '      data0025.manu_part_desc,'
      
        '      Data0010.abbr_name as CUST_CODE,Data0006.WORK_ORDER_NUMBER' +
        ','
      '      Data0005.EMPLOYEE_NAME,data0215.status,'
      '      Data0215.QUANTITY,Data0215.old_quantity,'
      '      Data0016.LOCATION,data0053.REFERENCE_NUMBER,'
      '      data0215.check_no,data0025.LATEST_PRICE,'
      '      Data0215.QUANTITY*data0025.unit_sq as '#30424#28857#38754#31215
      'FROM  Data0006 RIGHT OUTER JOIN'
      '      Data0005 RIGHT OUTER JOIN'
      '      Data0215 INNER JOIN'
      
        '      Data0025 ON Data0215.CUSTPART_PTR = Data0025.RKEY INNER JO' +
        'IN'
      
        '      Data0010 ON Data0025.CUSTOMER_PTR = Data0010.RKEY INNER JO' +
        'IN'
      
        '      Data0016 ON Data0215.location_ptr = Data0016.RKEY INNER JO' +
        'IN'
      '      Data0053 ON Data0215.CUSTPART_BATCH_PTR = Data0053.RKEY ON'
      '      Data0005.RKEY = Data0215.COUNTED_BY_EMPL_PTR ON'
      '      Data0006.RKEY = Data0053.WORK_ORDER_PTR'
      'WHERE (Data0215.FG_LIST_PTR = :rkey)'
      'ORDER BY Data0025.MANU_PART_NUMBER,data0053.mfg_date')
    Left = 170
    Top = 70
    object ADOQuery3MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQuery3manu_part_desc: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'manu_part_desc'
      Size = 40
    end
    object ADOQuery3CUST_CODE: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADOQuery3WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #24037#20316#35746#21333
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ADOQuery3QTY_ON_HAND: TFloatField
      DisplayLabel = #21407#24211#23384#25968#37327
      FieldName = 'old_quantity'
    end
    object ADOQuery3QUANTITY: TFloatField
      DisplayLabel = #30424#28857#25968#37327
      FieldName = 'QUANTITY'
    end
    object ADOQuery3LATEST_PRICE: TFloatField
      DisplayLabel = #26368#26032#21333#20215
      FieldName = 'LATEST_PRICE'
    end
    object ADOQuery3DSDesigner: TFloatField
      FieldName = #30424#28857#38754#31215
      ReadOnly = True
    end
    object ADOQuery3EMPLOYEE_NAME: TStringField
      DisplayLabel = #28165#28857#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQuery3LOCATION: TStringField
      DisplayLabel = #20179#24211
      FieldName = 'LOCATION'
    end
    object ADOQuery3REFERENCE_NUMBER: TStringField
      DisplayLabel = #20301#32622
      FieldName = 'REFERENCE_NUMBER'
      FixedChar = True
    end
    object ADOQuery3v_status: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Size = 6
      Calculated = True
    end
    object ADOQuery3check_no: TStringField
      DisplayLabel = #30424#28857#33778#21495
      FieldName = 'check_no'
      Size = 50
    end
    object ADOQuery3status: TWordField
      FieldName = 'status'
    end
  end
  object ado25: TADOCommand
    CommandText = 
      'update data0025'#13#10'set qty_on_hand = qty_on_hand + :divergent'#13#10'whe' +
      're rkey=:custpart_ptr'#13#10
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'divergent'
        Attributes = [paSigned]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end
      item
        Name = 'custpart_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 168
    Top = 272
  end
  object ADO214: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADO214CalcFields
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
        Value = 39082d
      end
      item
        Name = 'v1'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 1
        Value = '9'
      end
      item
        Name = 'v2'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 1
        Value = '9'
      end>
    Prepared = True
    SQL.Strings = (
      'select data0214.*,'
      '    data0005.empl_code,data0005.employee_name,'
      
        '    data0015.warehouse_code,data0015.warehouse_name,data0015.abb' +
        'r_name'
      
        'from   data0214 inner join data0005 on data0214.employee_ptr=dat' +
        'a0005.rkey'
      
        '                          inner join data0015  on data0214.wareh' +
        'ouse_ptr=data0015.rkey'
      'where  data0214.DATE_CREATED >= :dtpk1 and'
      '           data0214.DATE_CREATED <= :dtpk2 and'
      '           data0214.status<>:v1 and '
      '           data0214.status<>:v2'
      'order by'
      '    fg_count_code')
    Left = 88
    Top = 64
    object ADO214RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO214FG_COUNT_CODE: TStringField
      FieldName = 'FG_COUNT_CODE'
      Size = 10
    end
    object ADO214DATE_CREATED: TDateTimeField
      FieldName = 'DATE_CREATED'
    end
    object ADO214EMPLOYEE_PTR: TIntegerField
      FieldName = 'EMPLOYEE_PTR'
    end
    object ADO214USER_PTR: TIntegerField
      FieldName = 'USER_PTR'
    end
    object ADO214WAREHOUSE_PTR: TIntegerField
      FieldName = 'WAREHOUSE_PTR'
    end
    object ADO214BEG_LOCCODE_PTR: TIntegerField
      FieldName = 'BEG_LOCCODE_PTR'
    end
    object ADO214END_LOCCODE_PTR: TIntegerField
      FieldName = 'END_LOCCODE_PTR'
    end
    object ADO214BEG_CUST_PTR: TIntegerField
      FieldName = 'BEG_CUST_PTR'
    end
    object ADO214END_CUST_PTR: TIntegerField
      FieldName = 'END_CUST_PTR'
    end
    object ADO214BEG_CUSTPART_PTR: TIntegerField
      FieldName = 'BEG_CUSTPART_PTR'
    end
    object ADO214END_CUSTPART_PTR: TIntegerField
      FieldName = 'END_CUSTPART_PTR'
    end
    object ADO214STATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object ADO214OVER_DATE: TDateTimeField
      FieldName = 'OVER_DATE'
    end
    object ADO214v_status: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Calculated = True
    end
    object ADO214empl_code: TStringField
      FieldName = 'empl_code'
      Size = 10
    end
    object ADO214employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADO214warehouse_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
    object ADO214warehouse_name: TStringField
      FieldName = 'warehouse_name'
      Size = 70
    end
    object ADO214abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
  end
end
