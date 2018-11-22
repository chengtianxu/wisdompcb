object DM: TDM
  OldCreateOrder = False
  Left = 586
  Top = 305
  Height = 418
  Width = 389
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 8
  end
  object AQ17: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltPessimistic
    AfterDelete = AQ17AfterDelete
    OnDeleteError = AQ17DeleteError
    OnPostError = AQ17PostError
    Parameters = <>
    SQL.Strings = (
      'select *  from data0017'
      ''
      'ORDER BY INV_PART_NUMBER')
    Left = 108
    Top = 70
    object AQ17RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQ17INV_PART_NUMBER: TStringField
      DisplayLabel = #29289#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object AQ17INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      Size = 100
    end
    object AQ17GROUP_PTR: TIntegerField
      FieldName = 'GROUP_PTR'
    end
    object AQ17MANUFACTURER_CODE: TStringField
      FieldName = 'MANUFACTURER_CODE'
      FixedChar = True
    end
    object AQ17MANUFACTURER_NAME: TStringField
      FieldName = 'MANUFACTURER_NAME'
      FixedChar = True
    end
    object AQ17CYCLE_CODE: TStringField
      FieldName = 'CYCLE_CODE'
      FixedChar = True
      Size = 2
    end
    object AQ17BATCH_SERIAL_CONTROL: TStringField
      FieldName = 'BATCH_SERIAL_CONTROL'
      FixedChar = True
    end
    object AQ17P_M: TStringField
      FieldName = 'P_M'
      FixedChar = True
      Size = 1
    end
    object AQ17S_B_N: TStringField
      FieldName = 'S_B_N'
      FixedChar = True
      Size = 1
    end
    object AQ17INSPECT: TStringField
      FieldName = 'INSPECT'
      FixedChar = True
      Size = 1
    end
    object AQ17STOP_PURCH: TStringField
      FieldName = 'STOP_PURCH'
      FixedChar = True
      Size = 1
    end
    object AQ17MIX_PARTS: TStringField
      FieldName = 'MIX_PARTS'
      FixedChar = True
      Size = 1
    end
    object AQ17PHY_COUNT_METHOD: TWordField
      FieldName = 'PHY_COUNT_METHOD'
    end
    object AQ17BOM_FLAG: TStringField
      FieldName = 'BOM_FLAG'
      FixedChar = True
      Size = 1
    end
    object AQ17COST_METHOD: TStringField
      FieldName = 'COST_METHOD'
      FixedChar = True
      Size = 1
    end
    object AQ17MODIFY_ENGG_RTE_CODE: TStringField
      FieldName = 'MODIFY_ENGG_RTE_CODE'
      FixedChar = True
      Size = 1
    end
    object AQ17G_L_CODE_SELL_PTR: TIntegerField
      FieldName = 'G_L_CODE_SELL_PTR'
    end
    object AQ17G_L_CODE_BUY_PTR: TIntegerField
      FieldName = 'G_L_CODE_BUY_PTR'
    end
    object AQ17ENGG_ROUTE_PTR: TIntegerField
      FieldName = 'ENGG_ROUTE_PTR'
    end
    object AQ17NOTE_PAD_PTR: TIntegerField
      FieldName = 'NOTE_PAD_PTR'
    end
    object AQ17ALTERNATE_PART_PTR: TIntegerField
      FieldName = 'ALTERNATE_PART_PTR'
    end
    object AQ17AUTHORIZED_BUYER_PTR: TIntegerField
      FieldName = 'AUTHORIZED_BUYER_PTR'
    end
    object AQ17STOCK_UNIT_PTR: TIntegerField
      FieldName = 'STOCK_UNIT_PTR'
    end
    object AQ17PURCH_UNIT_PTR: TIntegerField
      FieldName = 'PURCH_UNIT_PTR'
    end
    object AQ17PREF_SUPPLIER_PTR: TIntegerField
      FieldName = 'PREF_SUPPLIER_PTR'
    end
    object AQ17STOCK_PURCH: TFloatField
      Alignment = taLeftJustify
      FieldName = 'STOCK_PURCH'
      DisplayFormat = '0.0000'
      EditFormat = '0.0000'
    end
    object AQ17STOCK_QUOTE: TFloatField
      FieldName = 'STOCK_QUOTE'
    end
    object AQ17STOCK_SELL: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #21333#20301#38754#31215
      FieldName = 'STOCK_SELL'
    end
    object AQ17STOCK_BASE: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #21333#20301#37325#37327
      FieldName = 'STOCK_BASE'
    end
    object AQ17STD_COST: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #26631#20934#25104#26412
      FieldName = 'STD_COST'
      DisplayFormat = '0.0000'
      EditFormat = '0.0000'
    end
    object AQ17ACTUAL_COST: TFloatField
      FieldName = 'ACTUAL_COST'
    end
    object AQ17FAILURE_RATE: TFloatField
      FieldName = 'FAILURE_RATE'
    end
    object AQ17SHELF_LIFE: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'SHELF_LIFE'
    end
    object AQ17COUNT_INTERVAL_TRANS: TSmallintField
      FieldName = 'COUNT_INTERVAL_TRANS'
    end
    object AQ17EST_SCRAP: TFloatField
      FieldName = 'EST_SCRAP'
    end
    object AQ17FIXED_SCRAP_RATE: TFloatField
      FieldName = 'FIXED_SCRAP_RATE'
    end
    object AQ17NEW_STD_COST: TFloatField
      Alignment = taLeftJustify
      FieldName = 'NEW_STD_COST'
      DisplayFormat = '0.0000'
      EditFormat = '0.0000'
    end
    object AQ17CATALOG_NUM: TStringField
      FieldName = 'CATALOG_NUM'
      FixedChar = True
      Size = 10
    end
    object AQ17OPT_LOT_SIZE: TIntegerField
      FieldName = 'OPT_LOT_SIZE'
    end
    object AQ17AVL_FLAG: TStringField
      FieldName = 'AVL_FLAG'
      FixedChar = True
      Size = 1
    end
    object AQ17CURRENT_ACT_ACTIVITY: TFloatField
      FieldName = 'CURRENT_ACT_ACTIVITY'
    end
    object AQ17CURRENT_ACT_MATERIAL: TFloatField
      FieldName = 'CURRENT_ACT_MATERIAL'
    end
    object AQ17LAST_CURNT_COST_UPDT: TDateTimeField
      FieldName = 'LAST_CURNT_COST_UPDT'
    end
    object AQ17LAST_STD_COST_UPDT: TDateTimeField
      FieldName = 'LAST_STD_COST_UPDT'
    end
    object AQ17ALLOW_EDIT_FLAG: TStringField
      FieldName = 'ALLOW_EDIT_FLAG'
      FixedChar = True
      Size = 1
    end
    object AQ17STORAGE_COND_PTR: TIntegerField
      FieldName = 'STORAGE_COND_PTR'
    end
    object AQ17SHELF_LIFE_PTR: TIntegerField
      FieldName = 'SHELF_LIFE_PTR'
    end
    object AQ17STORG_PRECATION_PTR: TIntegerField
      FieldName = 'STORG_PRECATION_PTR'
    end
    object AQ17CONSIGN_ONHAND_QTY: TFloatField
      FieldName = 'CONSIGN_ONHAND_QTY'
    end
    object AQ17CONSIGN_QTY_IN_INSP: TFloatField
      FieldName = 'CONSIGN_QTY_IN_INSP'
    end
    object AQ17REPORT_VALUE1: TFloatField
      FieldName = 'REPORT_VALUE1'
    end
    object AQ17REPORT_VALUE2: TFloatField
      FieldName = 'REPORT_VALUE2'
    end
    object AQ17REPORT_VALUE3: TFloatField
      FieldName = 'REPORT_VALUE3'
    end
    object AQ17MIN_LOT_SIZE_AUTOREL: TFloatField
      FieldName = 'MIN_LOT_SIZE_AUTOREL'
    end
    object AQ17AUTO_RELEASE_FLAG: TWordField
      FieldName = 'AUTO_RELEASE_FLAG'
    end
    object AQ17AUTO_PURCHASE_FLAG: TWordField
      FieldName = 'AUTO_PURCHASE_FLAG'
    end
    object AQ17CRITICAL_MATL_FLAG: TWordField
      FieldName = 'CRITICAL_MATL_FLAG'
    end
    object AQ17AUTO_RELEASE_HOLDFLG: TSmallintField
      FieldName = 'AUTO_RELEASE_HOLDFLG'
    end
    object AQ17HOLD_BY_EMPL_PTR: TIntegerField
      FieldName = 'HOLD_BY_EMPL_PTR'
    end
    object AQ17ONHOLD_DATE: TDateTimeField
      FieldName = 'ONHOLD_DATE'
    end
    object AQ17CUR_MONTH_OPEN_BAL: TFloatField
      FieldName = 'CUR_MONTH_OPEN_BAL'
    end
    object AQ17CONSIGNMENT_FLAG: TStringField
      FieldName = 'CONSIGNMENT_FLAG'
      FixedChar = True
      Size = 1
    end
    object AQ17ACTIVE_FLAG: TStringField
      FieldName = 'ACTIVE_FLAG'
      FixedChar = True
      Size = 1
    end
    object AQ17LOT_NUMBER_COUNT: TIntegerField
      FieldName = 'LOT_NUMBER_COUNT'
    end
    object AQ17ANALYSIS_CODE1: TStringField
      FieldName = 'ANALYSIS_CODE1'
      FixedChar = True
    end
    object AQ17ANALYSIS_CODE2: TStringField
      FieldName = 'ANALYSIS_CODE2'
      FixedChar = True
    end
    object AQ17ANALYSIS_CODE3: TStringField
      FieldName = 'ANALYSIS_CODE3'
      FixedChar = True
    end
    object AQ17ANALYSIS_CODE4: TStringField
      FieldName = 'ANALYSIS_CODE4'
      FixedChar = True
    end
    object AQ17ANALYSIS_CODE5: TStringField
      FieldName = 'ANALYSIS_CODE5'
      FixedChar = True
    end
    object AQ17IES_PARAMETER_VALUE1: TStringField
      FieldName = 'IES_PARAMETER_VALUE1'
      FixedChar = True
      Size = 30
    end
    object AQ17IES_PARAMETER_VALUE2: TStringField
      FieldName = 'IES_PARAMETER_VALUE2'
      FixedChar = True
      Size = 30
    end
    object AQ17IES_PARAMETER_VALUE3: TStringField
      FieldName = 'IES_PARAMETER_VALUE3'
      FixedChar = True
      Size = 30
    end
    object AQ17IES_PARAMETER_VALUE4: TStringField
      FieldName = 'IES_PARAMETER_VALUE4'
      FixedChar = True
      Size = 30
    end
    object AQ17IES_PARAMETER_VALUE5: TStringField
      FieldName = 'IES_PARAMETER_VALUE5'
      FixedChar = True
      Size = 30
    end
    object AQ17IES_PARAMETER_VALUE6: TStringField
      FieldName = 'IES_PARAMETER_VALUE6'
      FixedChar = True
      Size = 30
    end
    object AQ17IES_PARAMETER_VALUE7: TStringField
      FieldName = 'IES_PARAMETER_VALUE7'
      FixedChar = True
      Size = 30
    end
    object AQ17IES_PARAMETER_VALUE8: TStringField
      FieldName = 'IES_PARAMETER_VALUE8'
      FixedChar = True
      Size = 30
    end
    object AQ17IES_PARAMETER_VALUE9: TStringField
      FieldName = 'IES_PARAMETER_VALUE9'
      FixedChar = True
      Size = 30
    end
    object AQ17IES_PARAMETER_VALUE10: TStringField
      FieldName = 'IES_PARAMETER_VALUE10'
      FixedChar = True
      Size = 30
    end
    object AQ17INV_NAME: TStringField
      DisplayLabel = #29289#26009#21517#31216
      DisplayWidth = 10
      FieldName = 'INV_NAME'
      Size = 30
    end
    object AQ17INV_DESCRIPTION: TStringField
      DisplayLabel = #29289#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object AQ17QUAN_ON_HAND: TFloatField
      FieldName = 'QUAN_ON_HAND'
    end
  end
  object DataSource1: TDataSource
    DataSet = AQ17
    Left = 40
    Top = 70
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    ParamCheck = False
    Parameters = <>
    Left = 122
    Top = 8
  end
  object AQ18: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
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
      
        'select rkey,whouse_ptr,invent_ptr,min_stock,max_stock,reorder_po' +
        'int,'
      
        '          location_ptr1,location_ptr2,location_ptr3,location_ptr' +
        '4,location_ptr5'
      ' from data0018 '
      'where invent_ptr=:rkey')
    Left = 109
    Top = 190
    object AQ18rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ18whouse_ptr: TIntegerField
      FieldName = 'whouse_ptr'
    end
    object AQ18invent_ptr: TIntegerField
      FieldName = 'invent_ptr'
    end
    object AQ18min_stock: TFloatField
      Alignment = taLeftJustify
      FieldName = 'min_stock'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object AQ18max_stock: TFloatField
      Alignment = taLeftJustify
      FieldName = 'max_stock'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object AQ18reorder_point: TFloatField
      Alignment = taLeftJustify
      FieldName = 'reorder_point'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object AQ18location_ptr1: TIntegerField
      FieldName = 'location_ptr1'
    end
    object AQ18location_ptr2: TIntegerField
      FieldName = 'location_ptr2'
    end
    object AQ18location_ptr3: TIntegerField
      FieldName = 'location_ptr3'
    end
    object AQ18location_ptr4: TIntegerField
      FieldName = 'location_ptr4'
    end
    object AQ18location_ptr5: TIntegerField
      FieldName = 'location_ptr5'
    end
  end
  object AQ1711: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'rkey'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0011'
      'where source_type=17 and'
      '      file_pointer=:rkey')
    Left = 41
    Top = 126
  end
  object DataSource2: TDataSource
    DataSet = AQ18
    Left = 40
    Top = 191
  end
  object AQ15: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'select rkey,warehouse_code,warehouse_name from data0015'
      'order by warehouse_code')
    Left = 166
    Top = 190
  end
  object AQ0499: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'group_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end>
    SQL.Strings = (
      
        'select data0499.PARAMETER_PTR,data0499.DEF_VALUE,data0499.SEQ_NO' +
        ','
      '       data0278.PARAMETER_NAME,data0278.PARAMETER_DESC'
      ' from data0499 inner join data0278'
      ' on data0499.PARAMETER_PTR=data0278.rkey'
      'where data0499.inv_group_ptr = :group_ptr'
      'order by data0499.seq_no')
    Left = 299
    Top = 130
    object AQ0499PARAMETER_PTR: TIntegerField
      FieldName = 'PARAMETER_PTR'
    end
    object AQ0499DEF_VALUE: TStringField
      FieldName = 'DEF_VALUE'
    end
    object AQ0499SEQ_NO: TSmallintField
      FieldName = 'SEQ_NO'
    end
    object AQ0499PARAMETER_NAME: TStringField
      FieldName = 'PARAMETER_NAME'
      FixedChar = True
      Size = 10
    end
    object AQ0499PARAMETER_DESC: TStringField
      FieldName = 'PARAMETER_DESC'
      FixedChar = True
    end
  end
  object DataSource3: TDataSource
    DataSet = AQ0499
    Left = 235
    Top = 130
  end
  object ADO20: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'rkey'
        DataType = ftString
        Size = 1
        Value = '1'
      end>
    SQL.Strings = (
      'select * from data0020'
      'where source_ptr=:rkey')
    Left = 110
    Top = 252
    object ADO20RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO20SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object ADO20PICTURE: TBlobField
      FieldName = 'PICTURE'
    end
  end
  object DataSource4: TDataSource
    DataSet = ADO20
    Left = 40
    Top = 252
  end
  object ado496: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltPessimistic
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'group_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 2
      end>
    SQL.Strings = (
      'select group_name,group_desc,mask_inv_number,'
      'Data0019.inv_group_name,Data0019.inv_group_desc,'
      'data0496.if_flag'
      'from data0496 inner join data0019 on'
      '     Data0019.rkey = Data0496.group_ptr'
      'where data0496.rkey=:group_ptr')
    Left = 295
    Top = 23
    object ado496group_name: TStringField
      FieldName = 'group_name'
      Size = 10
    end
    object ado496group_desc: TStringField
      FieldName = 'group_desc'
      Size = 30
    end
    object ado496inv_group_name: TStringField
      FieldName = 'inv_group_name'
    end
    object ado496inv_group_desc: TStringField
      FieldName = 'inv_group_desc'
      Size = 40
    end
    object ado496mask_inv_number: TStringField
      FieldName = 'mask_inv_number'
      Size = 25
    end
    object ado496if_flag: TWordField
      FieldName = 'if_flag'
    end
  end
  object DataSource5: TDataSource
    DataSet = ado496
    Left = 234
    Top = 23
  end
  object ADO0017: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select inv_part_number,INV_NAME,INV_DESCRIPTION'
      'from data0017'
      'where rkey=:rkey')
    Left = 109
    Top = 125
    object ADO0017inv_part_number: TStringField
      FieldName = 'inv_part_number'
      Size = 25
    end
    object ADO0017INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADO0017INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
  end
  object Aq0002: TADOQuery
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
      'SELECT Data0002.UNIT_CODE, Data0002.UNIT_NAME,'
      
        '      Data0002_1.UNIT_CODE AS Expr1, Data0002_1.UNIT_NAME AS Exp' +
        'r2'
      'FROM Data0002 INNER JOIN'
      '      Data0017 ON'
      '      Data0002.RKEY = Data0017.STOCK_UNIT_PTR INNER JOIN'
      
        '      Data0002 Data0002_1 ON Data0017.PURCH_UNIT_PTR = Data0002_' +
        '1.RKEY'
      'where data0017.rkey=:rkey')
    Left = 297
    Top = 76
  end
  object DataSource6: TDataSource
    DataSet = Aq0002
    Left = 233
    Top = 76
  end
  object DataSource7: TDataSource
    DataSet = Aq0023
    Left = 192
    Top = 304
  end
  object Aq0023: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
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
      
        'SELECT dbo.Data0023.CODE, dbo.Data0023.SUPPLIER_NAME, dbo.Data00' +
        '28.LEAD_TIME, '
      '      dbo.Data0028.PRICE_1'
      'FROM dbo.Data0023 INNER JOIN'
      
        '      dbo.Data0028 ON dbo.Data0023.RKEY = dbo.Data0028.SUPPLIER_' +
        'PTR'
      'where data0028.INVENTORY_PTR=:rkey')
    Left = 256
    Top = 304
  end
end
