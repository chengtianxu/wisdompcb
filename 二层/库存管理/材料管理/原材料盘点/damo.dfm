object DM: TDM
  OldCreateOrder = False
  Left = 472
  Top = 326
  Height = 399
  Width = 391
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\Ole DB\Data Links' +
      '\bak.udl'
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 216
    Top = 16
  end
  object ADO92: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADO92CalcFields
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
        Value = 39052d
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
      'select data0092.*,'
      '       data0005.employee_name,data0015.abbr_name,'
      '       data0015.warehouse_code,data0015.warehouse_name'
      'from   data0092 inner join data0005'
      '         on data0092.employee_ptr=data0005.rkey'
      '       inner join data0015  on data0092.whouse_ptr=data0015.rkey'
      'where data0092.tdate >= :dtpk1 and'
      '      data0092.tdate <= :dtpk2 and'
      '      data0092.STATUS <> :v1 and'
      '      data0092.STATUS <> :v2      '
      'order by'
      '     PHY_COUNT_NO')
    Left = 77
    Top = 22
    object ADO92RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO92PHY_COUNT_NO: TStringField
      FieldName = 'PHY_COUNT_NO'
      FixedChar = True
      Size = 10
    end
    object ADO92TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object ADO92EMPLOYEE_PTR: TIntegerField
      FieldName = 'EMPLOYEE_PTR'
    end
    object ADO92USER_PTR: TIntegerField
      FieldName = 'USER_PTR'
    end
    object ADO92WHOUSE_PTR: TIntegerField
      FieldName = 'WHOUSE_PTR'
    end
    object ADO92BEG_LOC_PTR: TIntegerField
      FieldName = 'BEG_LOC_PTR'
    end
    object ADO92END_LOC_PTR: TIntegerField
      FieldName = 'END_LOC_PTR'
    end
    object ADO92STATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object ADO92BEG_INVT_PTR: TIntegerField
      FieldName = 'BEG_INVT_PTR'
    end
    object ADO92END_INVT_PTR: TIntegerField
      FieldName = 'END_INVT_PTR'
    end
    object ADO92employee_name: TStringField
      DisplayWidth = 10
      FieldName = 'employee_name'
      Size = 16
    end
    object ADO92warehouse_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
    object ADO92warehouse_name: TStringField
      FieldName = 'warehouse_name'
      Size = 30
    end
    object ADO92BEG_CYCLE_ptr: TIntegerField
      FieldName = 'BEG_CYCLE_ptr'
    end
    object ADO92END_CYCLE_ptr: TIntegerField
      FieldName = 'END_CYCLE_ptr'
    end
    object ADO92v_status: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Size = 6
      Calculated = True
    end
    object ADO92abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADO92OVER_DATE: TDateTimeField
      DisplayLabel = #26356#26032#26102#38388
      FieldName = 'OVER_DATE'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO92
    Left = 23
    Top = 22
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Prepared = True
    Left = 221
    Top = 63
  end
  object ADO93: TADOQuery
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
    Prepared = True
    SQL.Strings = (
      'select * from data0093'
      'where (phy_list_ptr=:rkey) and'
      '      (status<>2)')
    Left = 22
    Top = 144
    object ADO93RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO93PHY_LIST_PTR: TIntegerField
      FieldName = 'PHY_LIST_PTR'
    end
    object ADO93INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ADO93INV_TRAN_PTR: TIntegerField
      FieldName = 'INV_TRAN_PTR'
    end
    object ADO93ENTERED_BY_EMPL_PTR: TIntegerField
      FieldName = 'ENTERED_BY_EMPL_PTR'
    end
    object ADO93USER_PTR: TIntegerField
      FieldName = 'USER_PTR'
    end
    object ADO93COUNTED_BY_EMPL_PTR: TIntegerField
      FieldName = 'COUNTED_BY_EMPL_PTR'
    end
    object ADO93LOCATION_PTR: TIntegerField
      FieldName = 'LOCATION_PTR'
    end
    object ADO93status: TWordField
      FieldName = 'status'
    end
    object ADO93check_no: TStringField
      FieldName = 'check_no'
      Size = 50
    end
    object ADO93QUANTITY: TBCDField
      FieldName = 'QUANTITY'
      Precision = 11
      Size = 3
    end
    object ADO93OLD_QUANTITY: TBCDField
      FieldName = 'OLD_QUANTITY'
      Precision = 11
      Size = 3
    end
  end
  object AQ22: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
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
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT dbo.Data0022.RKEY, dbo.Data0022.INVENTORY_PTR, '
      '      dbo.Data0022.LOCATION_PTR, dbo.Data0022.QUAN_ON_HAND'
      'FROM dbo.Data0022 INNER JOIN'
      
        '      dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY' +
        ' INNER JOIN'
      '      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY'
      'WHERE (dbo.Data0022.QUAN_ON_HAND > 0) and'
      '       data0016.code>=:edit_2 and'
      '       data0016.code<=:edit_3 and'
      '       data0456.warehouse_ptr=:rkey15'
      '       and data0496.rkey=3'
      '       and data0496.group_name>='#39'Ab'#39
      '       and data0496.group_name<='#39'G'#39)
    Left = 75
    Top = 86
    object AQ22RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQ22INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object AQ22LOCATION_PTR: TIntegerField
      FieldName = 'LOCATION_PTR'
    end
    object AQ22QUAN_ON_HAND: TFloatField
      FieldName = 'QUAN_ON_HAND'
    end
  end
  object AQ93: TADOQuery
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
    Prepared = True
    SQL.Strings = (
      
        'SELECT dbo.Data0093.RKEY, dbo.Data0093.check_no, dbo.Data0017.IN' +
        'V_PART_NUMBER, '
      
        '      dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0496.GROUP_NAME' +
        ', '
      '      dbo.Data0016.LOCATION, dbo.Data0022.RKEY AS rkey22, '
      '      dbo.Data0093.OLD_QUANTITY, dbo.Data0022.BARCODE_ID, '
      '      dbo.Data0005.EMPLOYEE_NAME, dbo.Data0093.QUANTITY, '
      
        '      dbo.Data0093.COUNTED_BY_EMPL_PTR, dbo.Data0093.LOCATION_PT' +
        'R, '
      
        '      dbo.Data0022.EXPIRE_DATE, dbo.Data0023.ABBR_NAME, dbo.Data' +
        '0023.CODE, '
      '      dbo.Data0002.UNIT_CODE, dbo.Data0002.UNIT_NAME'
      'FROM dbo.Data0022 INNER JOIN'
      '      dbo.Data0093 INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0093.INVENTORY_PTR = dbo.Data0017.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY' +
        ' ON '
      '      dbo.Data0022.RKEY = dbo.Data0093.INV_TRAN_PTR INNER JOIN'
      
        '      dbo.Data0016 ON dbo.Data0093.LOCATION_PTR = dbo.Data0016.R' +
        'KEY INNER JOIN'
      '      dbo.Data0002 ON '
      
        '      dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY INNER J' +
        'OIN'
      
        '      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY I' +
        'NNER JOIN'
      '      dbo.Data0023 ON '
      '      dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY LEFT OUTER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0093.COUNTED_BY_EMPL_PTR = dbo.Dat' +
        'a0005.RKEY'
      'where (data0093.phy_list_ptr=:rkey) and'
      '      (data0093.status<>2)'
      'ORDER BY Data0496.GROUP_NAME,Data0017.INV_PART_NUMBER')
    Left = 77
    Top = 142
    object AQ93INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#20195#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object AQ93GROUP_NAME: TStringField
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object AQ93OLD_QUANTITY: TFloatField
      FieldName = 'OLD_QUANTITY'
    end
    object AQ93LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 10
    end
    object AQ93BARCODE_ID: TStringField
      FieldName = 'BARCODE_ID'
      FixedChar = True
      Size = 12
    end
    object AQ93EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object AQ93RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQ93QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object AQ93COUNTED_BY_EMPL_PTR: TIntegerField
      FieldName = 'COUNTED_BY_EMPL_PTR'
    end
    object AQ93LOCATION_PTR: TIntegerField
      FieldName = 'LOCATION_PTR'
    end
    object AQ93rkey22: TIntegerField
      FieldName = 'rkey22'
      ReadOnly = True
    end
    object AQ93EXPIRE_DATE: TDateTimeField
      FieldName = 'EXPIRE_DATE'
    end
    object AQ93INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #21517#31216#35268#26684
      FieldName = 'INV_PART_DESCRIPTION'
      Size = 100
    end
    object AQ93UNIT_CODE: TStringField
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object AQ93ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object AQ93check_no: TStringField
      FieldName = 'check_no'
      Size = 50
    end
    object AQ93code: TStringField
      FieldName = 'code'
      Size = 10
    end
    object AQ93unit_name: TStringField
      FieldName = 'unit_name'
    end
  end
  object ADOupdate: TADOQuery
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
    Prepared = True
    SQL.Strings = (
      'SELECT Data0022.QUAN_ON_HAND,Data0093.QUANTITY,'
      '      Data0093.INVENTORY_PTR,Data0093.INV_TRAN_PTR,'
      '      Data0093.ENTERED_BY_EMPL_PTR,Data0093.USER_PTR,'
      '      Data0093.COUNTED_BY_EMPL_PTR,data0093.status,'
      '      Data0093.QUANTITY-data0022.quan_on_hand as divergent'
      'FROM Data0022 INNER JOIN'
      '      Data0093 ON Data0022.RKEY = Data0093.INV_TRAN_PTR'
      'WHERE (Data0093.status = 1) and'
      '      (data0093.phy_list_ptr=:rkey)')
    Left = 77
    Top = 196
    object ADOupdateQUAN_ON_HAND: TFloatField
      FieldName = 'QUAN_ON_HAND'
    end
    object ADOupdateQUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object ADOupdateINVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ADOupdateINV_TRAN_PTR: TIntegerField
      FieldName = 'INV_TRAN_PTR'
    end
    object ADOupdateENTERED_BY_EMPL_PTR: TIntegerField
      FieldName = 'ENTERED_BY_EMPL_PTR'
    end
    object ADOupdateUSER_PTR: TIntegerField
      FieldName = 'USER_PTR'
    end
    object ADOupdateCOUNTED_BY_EMPL_PTR: TIntegerField
      FieldName = 'COUNTED_BY_EMPL_PTR'
    end
    object ADOupdatedivergent: TFloatField
      FieldName = 'divergent'
      ReadOnly = True
    end
    object ADOupdatestatus: TWordField
      FieldName = 'status'
    end
  end
  object ado95: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'select * from data0095'
      'where rkey is null')
    Left = 23
    Top = 196
    object ado95RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ado95TRAN_TP: TSmallintField
      FieldName = 'TRAN_TP'
    end
    object ado95INVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object ado95SRCE_PTR: TIntegerField
      FieldName = 'SRCE_PTR'
    end
    object ado95TRAN_BY: TIntegerField
      FieldName = 'TRAN_BY'
    end
    object ado95USER_PTR: TIntegerField
      FieldName = 'USER_PTR'
    end
    object ado95REC_BY: TIntegerField
      FieldName = 'REC_BY'
    end
    object ado95STORAGE_MTHD_FLAG: TStringField
      FieldName = 'STORAGE_MTHD_FLAG'
      FixedChar = True
      Size = 1
    end
    object ado95TRAN_DATE: TDateTimeField
      FieldName = 'TRAN_DATE'
    end
    object ado95QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object ado95SHIPPING_METHOD: TStringField
      FieldName = 'SHIPPING_METHOD'
      FixedChar = True
    end
    object ado95REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      FixedChar = True
    end
    object ado95QTY_RETURNED: TFloatField
      FieldName = 'QTY_RETURNED'
    end
  end
  object ADOdivport: TADOQuery
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
    Prepared = True
    SQL.Strings = (
      'SELECT dbo.Data0093.OLD_QUANTITY, dbo.Data0093.QUANTITY, '
      
        '      dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRI' +
        'PTION, '
      
        '      dbo.Data0002.UNIT_CODE, dbo.Data0017.STD_COST, dbo.Data001' +
        '6.LOCATION, '
      
        '      dbo.Data0093.QUANTITY - dbo.Data0093.OLD_QUANTITY AS diver' +
        'gent, '
      '      (dbo.Data0093.QUANTITY - dbo.Data0093.OLD_QUANTITY) '
      
        '      * dbo.Data0017.STD_COST AS amount, dbo.Data0022.BARCODE_ID' +
        ', '
      '      dbo.Data0005.EMPLOYEE_NAME'
      'FROM dbo.Data0022 INNER JOIN'
      
        '      dbo.Data0093 ON dbo.Data0022.RKEY = dbo.Data0093.INV_TRAN_' +
        'PTR INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0093.INVENTORY_PTR = dbo.Data0017.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0016 ON dbo.Data0093.LOCATION_PTR = dbo.Data0016.R' +
        'KEY INNER JOIN'
      '      dbo.Data0002 ON '
      
        '      dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY LEFT OU' +
        'TER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0093.COUNTED_BY_EMPL_PTR = dbo.Dat' +
        'a0005.RKEY'
      'WHERE (Data0093.status <> 0) AND'
      '      (Data0093.QUANTITY - Data0093.OLD_QUANTITY <> 0) and'
      '      (data0093.phy_list_ptr=:rkey)')
    Left = 139
    Top = 252
    object ADOdivportINV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
    end
    object ADOdivportINV_PART_DESCRIPTION: TStringField
      DisplayLabel = #21517#31216#35268#26684
      FieldName = 'INV_PART_DESCRIPTION'
      Size = 40
    end
    object ADOdivportUNIT_CODE: TStringField
      DisplayLabel = #21333#20301#20195#30721
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object ADOdivportOLD_QUANTITY: TFloatField
      DisplayLabel = #24211#23384#25968#37327
      FieldName = 'OLD_QUANTITY'
    end
    object ADOdivportQUANTITY: TFloatField
      DisplayLabel = #30424#28857#25968#37327
      FieldName = 'QUANTITY'
    end
    object ADOdivportdivergent: TFloatField
      DisplayLabel = #25968#37327#24046#24322
      FieldName = 'divergent'
      ReadOnly = True
    end
    object ADOdivportSTD_COST: TFloatField
      DisplayLabel = #26631#20934#25104#26412
      FieldName = 'STD_COST'
    end
    object ADOdivportamount: TFloatField
      DisplayLabel = #37329#39069#24046#24322
      FieldName = 'amount'
      ReadOnly = True
    end
    object ADOdivportEMPLOYEE_NAME: TStringField
      DisplayLabel = #30424#28857#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOdivportLOCATION: TStringField
      DisplayLabel = #20179#24211
      FieldName = 'LOCATION'
      Size = 10
    end
    object ADOdivportbarcode_id: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'barcode_id'
      FixedChar = True
      Size = 12
    end
  end
  object ADO493: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 271
    Top = 161
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
  object aqdc93: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = aqdc93CalcFields
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
    Prepared = True
    SQL.Strings = (
      
        'SELECT     TOP (100) PERCENT dbo.Data0017.INV_PART_NUMBER, dbo.D' +
        'ata0017.INV_PART_DESCRIPTION, dbo.Data0496.GROUP_NAME,GROUP_DESC' +
        ', dbo.Data0016.LOCATION, '
      
        '                      dbo.Data0093.OLD_QUANTITY, dbo.Data0022.BA' +
        'RCODE_ID, dbo.Data0005.EMPLOYEE_NAME, dbo.Data0093.QUANTITY, '
      
        '                      ROUND((dbo.Data0022.tax_price * dbo.Data04' +
        '56.exch_rate) / (1 + dbo.Data0022.TAX_2 * 0.01), 6) AS std_cost,' +
        ' dbo.Data0022.EXPIRE_DATE, '
      
        '                      dbo.Data0023.ABBR_NAME, dbo.Data0002.UNIT_' +
        'CODE,  dbo.Data0093.check_no, dbo.Data0022.tax_price, dbo.Data00' +
        '22.TAX_2, '
      
        '                      dbo.Data0001.CURR_NAME, dbo.Data0456.exch_' +
        'rate,dbo.Data0093.STATUS,data0456.ship_DATE'
      'FROM         dbo.Data0022 INNER JOIN'
      '                      dbo.Data0093 INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.Data0093.INVENTORY_PTR' +
        ' = dbo.Data0017.RKEY INNER JOIN'
      
        '                      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = d' +
        'bo.Data0496.RKEY ON dbo.Data0022.RKEY = dbo.Data0093.INV_TRAN_PT' +
        'R INNER JOIN'
      
        '                      dbo.Data0016 ON dbo.Data0093.LOCATION_PTR ' +
        '= dbo.Data0016.RKEY INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_' +
        'FROM = dbo.Data0002.RKEY INNER JOIN'
      
        '                      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo' +
        '.Data0456.RKEY INNER JOIN'
      
        '                      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = db' +
        'o.Data0023.RKEY INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.Data0456.currency_ptr ' +
        '= dbo.Data0001.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0005 ON dbo.Data0093.COUNTED_BY_EM' +
        'PL_PTR = dbo.Data0005.RKEY'
      'where (data0093.phy_list_ptr=:rkey)'
      'ORDER BY dbo.Data0017.INV_PART_NUMBER')
    Left = 78
    Top = 251
    object aqdc93INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object aqdc93INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #21517#31216#35268#26684
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object aqdc93GROUP_NAME: TStringField
      DisplayLabel = #31867#21035
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object aqdc93GROUP_DESC: TStringField
      DisplayLabel = #31867#21035#21517#31216
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object aqdc93LOCATION: TStringField
      DisplayLabel = #20301#32622
      FieldName = 'LOCATION'
      Size = 10
    end
    object aqdc93ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object aqdc93UNIT_CODE: TStringField
      DisplayLabel = #23384#36135#21333#20301
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object aqdc93EMPLOYEE_NAME: TStringField
      DisplayLabel = #28165#28857#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aqdc93OLD_QUANTITY: TFloatField
      DisplayLabel = #24211#23384#25968#37327
      FieldName = 'OLD_QUANTITY'
    end
    object aqdc93QUANTITY: TFloatField
      DisplayLabel = #28165#28857#25968#37327
      FieldName = 'QUANTITY'
    end
    object aqdc93STD_COST: TFloatField
      DisplayLabel = #19981#21547#31246#21333#20215'('#26412#24065')'
      FieldName = 'STD_COST'
    end
    object aqdc93BARCODE_ID: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BARCODE_ID'
      FixedChar = True
      Size = 12
    end
    object aqdc93ship_DATE: TDateTimeField
      DisplayLabel = #36865#36135#26085#26399
      FieldName = 'ship_DATE'
    end
    object aqdc93EXPIRE_DATE: TDateTimeField
      DisplayLabel = #26377#25928#26399
      FieldName = 'EXPIRE_DATE'
    end
    object aqdc93v_status: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Size = 6
      Calculated = True
    end
    object aqdc93check_no: TStringField
      DisplayLabel = #30424#28857#33778#21495
      FieldName = 'check_no'
      Size = 50
    end
    object aqdc93tax_price: TBCDField
      DisplayLabel = #21547#31246#20215
      FieldName = 'tax_price'
      Precision = 12
      Size = 3
    end
    object aqdc93TAX_2: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object aqdc93CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object aqdc93exch_rate: TBCDField
      DisplayLabel = #27719#29575
      FieldName = 'exch_rate'
      Precision = 12
      Size = 8
    end
    object aqdc93STATUS: TWordField
      FieldName = 'STATUS'
    end
  end
  object DataSource2: TDataSource
    DataSet = ADO493
    Left = 216
    Top = 160
  end
end
