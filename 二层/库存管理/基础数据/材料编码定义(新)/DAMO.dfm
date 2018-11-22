object DM: TDM
  OldCreateOrder = False
  Left = 550
  Top = 312
  Height = 377
  Width = 346
  object ADOConnection1: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 12
  end
  object AQ17: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    AfterDelete = AQ17AfterDelete
    OnDeleteError = AQ17DeleteError
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'select ISNULL(z_t.zaitu, 0) AS zaitu, '
      'ISNULL(vmi.vmi_quantotal, 0) AS vmi_quantotal,'
      
        'data0017 .*,data0496.group_name, data0496.group_desc,data0002.un' +
        'it_code , '
      
        'data0017.QUAN_ON_HAND-data0017.QUAN_ASSIGN as quan_alloc, Data04' +
        '96.IF_FLAG as flag496,data0496.Rkey595,data0496.SHELF_LIFE as sh' +
        'elf2'
      ' from '
      
        ' data0017  inner join data0496 on  data0017.group_ptr=data0496.r' +
        'key '
      
        '                  inner join data0002 on data0017.PURCH_UNIT_PTR' +
        '=data0002.rkey'
      
        'left join  (SELECT     Data0071.INVT_PTR, SUM(Data0071.QUAN_ORD ' +
        '- Data0071.QUAN_RECD) AS zaitu'
      
        '                            FROM          dbo.Data0071  INNER JO' +
        'IN'
      
        '                                                   dbo.Data0070 ' +
        'AS Data0070 ON Data0071.PO_PTR = Data0070.RKEY'
      
        '                            WHERE      (Data0070.STATUS = 5) AND' +
        ' (Data0071.QUAN_ORD - Data0071.QUAN_RECD > 0)'
      
        '                            GROUP BY Data0071.INVT_PTR) AS z_t O' +
        'N dbo.Data0017.rkey = z_t.INVT_PTR '
      
        'left join       (SELECT     TOP (100) PERCENT INVENTORY_PTR, SUM' +
        '(QUAN_ON_HAND) AS vmi_quantotal'
      '                            FROM          dbo.DATA0134'
      '                            WHERE      (QUAN_ON_HAND > 0)'
      
        '                            GROUP BY INVENTORY_PTR) AS vmi ON db' +
        'o.Data0017.rkey = vmi.INVENTORY_PTR  ')
    Left = 99
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
      DisplayLabel = #21407#26448#26009#25551#36848
      FieldName = 'INV_PART_DESCRIPTION'
      Size = 100
    end
    object AQ17GROUP_PTR: TIntegerField
      FieldName = 'GROUP_PTR'
    end
    object AQ17MANUFACTURER_CODE: TStringField
      DisplayLabel = #21046#36896#21830#20195#30721
      FieldName = 'MANUFACTURER_CODE'
      FixedChar = True
    end
    object AQ17MANUFACTURER_NAME: TStringField
      DisplayLabel = #29305#21029#35201#27714
      FieldName = 'MANUFACTURER_NAME'
      FixedChar = True
    end
    object AQ17CYCLE_CODE: TStringField
      DisplayLabel = #35745#25968#30721'/'#38388#38548
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
      DisplayLabel = #20648#23384#26041#27861
      FieldName = 'S_B_N'
      FixedChar = True
      Size = 1
    end
    object AQ17INSPECT: TStringField
      DisplayLabel = #26816#39564'(Y,N)'
      FieldName = 'INSPECT'
      FixedChar = True
      Size = 1
    end
    object AQ17STOP_PURCH: TStringField
      DisplayLabel = #20572#27490#37319#36141'(Y,N)'
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
      DisplayLabel = #23433#20840#24211#23384
      FieldName = 'CONSIGN_ONHAND_QTY'
    end
    object AQ17CONSIGN_QTY_IN_INSP: TFloatField
      DisplayLabel = #20877#35746#36141#28857
      FieldName = 'CONSIGN_QTY_IN_INSP'
    end
    object AQ17REPORT_VALUE1: TFloatField
      DisplayLabel = #26631#20934#20135#20986
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
      Size = 100
    end
    object AQ17ANALYSIS_CODE2: TStringField
      FieldName = 'ANALYSIS_CODE2'
      FixedChar = True
      Size = 100
    end
    object AQ17ANALYSIS_CODE3: TStringField
      FieldName = 'ANALYSIS_CODE3'
      FixedChar = True
      Size = 100
    end
    object AQ17ANALYSIS_CODE4: TStringField
      FieldName = 'ANALYSIS_CODE4'
      FixedChar = True
      Size = 100
    end
    object AQ17ANALYSIS_CODE5: TStringField
      FieldName = 'ANALYSIS_CODE5'
      FixedChar = True
      Size = 100
    end
    object AQ17IES_PARAMETER_VALUE1: TStringField
      DisplayLabel = 'IES'#21442#25968'1'
      FieldName = 'IES_PARAMETER_VALUE1'
      FixedChar = True
      Size = 30
    end
    object AQ17IES_PARAMETER_VALUE2: TStringField
      DisplayLabel = 'IES'#21442#25968'2'
      FieldName = 'IES_PARAMETER_VALUE2'
      FixedChar = True
      Size = 30
    end
    object AQ17IES_PARAMETER_VALUE3: TStringField
      DisplayLabel = 'IES'#21442#25968'3'
      FieldName = 'IES_PARAMETER_VALUE3'
      FixedChar = True
      Size = 30
    end
    object AQ17IES_PARAMETER_VALUE4: TStringField
      DisplayLabel = 'IES'#21442#25968'4'
      FieldName = 'IES_PARAMETER_VALUE4'
      FixedChar = True
      Size = 30
    end
    object AQ17IES_PARAMETER_VALUE5: TStringField
      DisplayLabel = 'IES'#21442#25968'5'
      FieldName = 'IES_PARAMETER_VALUE5'
      FixedChar = True
      Size = 30
    end
    object AQ17IES_PARAMETER_VALUE6: TStringField
      DisplayLabel = 'IES'#21442#25968'6'
      FieldName = 'IES_PARAMETER_VALUE6'
      FixedChar = True
      Size = 30
    end
    object AQ17IES_PARAMETER_VALUE7: TStringField
      DisplayLabel = 'IES'#21442#25968'7'
      FieldName = 'IES_PARAMETER_VALUE7'
      FixedChar = True
      Size = 30
    end
    object AQ17IES_PARAMETER_VALUE8: TStringField
      DisplayLabel = 'IES'#21442#25968'8'
      FieldName = 'IES_PARAMETER_VALUE8'
      FixedChar = True
      Size = 30
    end
    object AQ17IES_PARAMETER_VALUE9: TStringField
      DisplayLabel = 'IES'#21442#25968'9'
      FieldName = 'IES_PARAMETER_VALUE9'
      FixedChar = True
      Size = 30
    end
    object AQ17IES_PARAMETER_VALUE10: TStringField
      DisplayLabel = 'IES'#21442#25968'10'
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
    object AQ17QUAN_ASSIGN: TBCDField
      FieldName = 'QUAN_ASSIGN'
      Precision = 10
      Size = 2
    end
    object AQ17quan_alloc: TBCDField
      DisplayLabel = #26377#25928#24211#23384
      FieldName = 'quan_alloc'
      ReadOnly = True
      Precision = 20
    end
    object AQ17group_name: TStringField
      DisplayLabel = #31867#21035#20195#30721
      FieldName = 'group_name'
      Size = 10
    end
    object AQ17vmi_quantotal: TBCDField
      DisplayLabel = 'VMI'#24211#23384
      FieldName = 'vmi_quantotal'
      ReadOnly = True
      Precision = 32
    end
    object AQ17group_desc: TStringField
      DisplayLabel = #31867#21035#21517
      FieldName = 'group_desc'
      Size = 30
    end
    object AQ17unit_code: TStringField
      DisplayLabel = #37319#36141#21333#20301
      FieldName = 'unit_code'
      Size = 5
    end
    object AQ17zaitu: TBCDField
      DisplayLabel = #22312#36884#25968#37327
      FieldName = 'zaitu'
      ReadOnly = True
      Precision = 32
    end
    object AQ17Rkey595: TIntegerField
      FieldName = 'Rkey595'
    end
    object AQ17flag496: TWordField
      FieldName = 'flag496'
    end
    object AQ17shelf2: TSmallintField
      FieldName = 'shelf2'
    end
  end
  object DataSource1: TDataSource
    DataSet = AQ17
    Left = 40
    Top = 70
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    ParamCheck = False
    Parameters = <>
    Left = 274
    Top = 272
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
      
        'select rkey,INVENT_PTR,alterINVENT_PTR_PTR,min_stock,max_stock,r' +
        'eorder_point,'
      
        '          location_ptr1,location_ptr2,location_ptr3,location_ptr' +
        '4,location_ptr5'
      ' from data0018 '
      'where invent_ptr=:rkey')
    Left = 101
    Top = 142
    object AQ18rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ18invent_ptr: TIntegerField
      FieldName = 'invent_ptr'
    end
    object AQ18alterINVENT_PTR_PTR: TIntegerField
      FieldName = 'alterINVENT_PTR_PTR'
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
    Left = 153
    Top = 70
  end
  object DataSource2: TDataSource
    DataSet = AQ18
    Left = 32
    Top = 143
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
    Left = 158
    Top = 142
  end
  object DataSource7: TDataSource
    DataSet = Aq0023
    Left = 32
    Top = 264
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
      
        'SELECT dbo.Data0023.CODE, dbo.Data0023.SUPPLIER_NAME,dbo.Data002' +
        '8.SUPPLIER_PART_NO, dbo.Data0028.LEAD_TIME, '
      '      dbo.Data0028.PRICE_1'
      'FROM dbo.Data0023 INNER JOIN'
      
        '      dbo.Data0028 ON dbo.Data0023.RKEY = dbo.Data0028.SUPPLIER_' +
        'PTR'
      'where data0028.INVENTORY_PTR=:rkey')
    Left = 103
    Top = 264
  end
  object DataSource3: TDataSource
    DataSet = AQ0499
    Left = 27
    Top = 202
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
        Size = 4
        Value = 1
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0499.PARAMETER_PTR, dbo.Data0499.DEF_VALUE, d' +
        'bo.Data0499.SEQ_NO, dbo.Data0278.PARAMETER_NAME, '
      
        '                      dbo.Data0278.PARAMETER_DESC, dbo.Data0002.' +
        'UNIT_NAME'
      'FROM         dbo.Data0499 INNER JOIN'
      
        '                      dbo.Data0278 ON dbo.Data0499.PARAMETER_PTR' +
        ' = dbo.Data0278.RKEY INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.Data0278.UNIT_PTR = db' +
        'o.Data0002.RKEY'
      'where  data0499.ttype=0 and'
      '             data0499.inv_group_ptr = :group_ptr'
      'order by data0499.seq_no')
    Left = 100
    Top = 202
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
    object AQ0499UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
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
      
        'select data0496.rkey, group_name,group_desc,mask_inv_number,SHEL' +
        'F_LIFE,'
      'Data0019.inv_group_name,Data0019.inv_group_desc,'
      'data0496.if_flag'
      'from data0496 inner join data0019 on'
      '     Data0019.rkey = Data0496.group_ptr'
      'where data0496.rkey=:group_ptr')
    Left = 271
    Top = 23
    object ado496rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
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
    object ado496SHELF_LIFE: TSmallintField
      FieldName = 'SHELF_LIFE'
    end
  end
  object aq17_1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    AfterDelete = AQ17AfterDelete
    OnDeleteError = AQ17DeleteError
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      
        'select data0017 .*,data0496.group_name, data0496.group_desc,data' +
        '0002.unit_code ,'
      'data0017.QUAN_ON_HAND-data0017.QUAN_ASSIGN as quan_alloc'
      ' from '
      
        ' data0017  inner join data0496 on  data0017.group_ptr=data0496.r' +
        'key '
      
        '                  inner join data0002 on data0017.PURCH_UNIT_PTR' +
        '=data0002.rkey')
    Left = 219
    Top = 30
    object AutoIncField1: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object StringField1: TStringField
      DisplayLabel = #29289#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object StringField2: TStringField
      DisplayLabel = #21407#26448#26009#25551#36848
      FieldName = 'INV_PART_DESCRIPTION'
      Size = 100
    end
    object IntegerField1: TIntegerField
      FieldName = 'GROUP_PTR'
    end
    object StringField3: TStringField
      DisplayLabel = #21046#36896#21830#20195#30721
      FieldName = 'MANUFACTURER_CODE'
      FixedChar = True
    end
    object StringField4: TStringField
      DisplayLabel = #29305#21029#35201#27714
      FieldName = 'MANUFACTURER_NAME'
      FixedChar = True
    end
    object StringField5: TStringField
      DisplayLabel = #35745#25968#30721'/'#38388#38548
      FieldName = 'CYCLE_CODE'
      FixedChar = True
      Size = 2
    end
    object StringField6: TStringField
      FieldName = 'BATCH_SERIAL_CONTROL'
      FixedChar = True
    end
    object StringField7: TStringField
      FieldName = 'P_M'
      FixedChar = True
      Size = 1
    end
    object StringField8: TStringField
      DisplayLabel = #20648#23384#26041#27861
      FieldName = 'S_B_N'
      FixedChar = True
      Size = 1
    end
    object StringField9: TStringField
      DisplayLabel = #26816#39564'(Y,N)'
      FieldName = 'INSPECT'
      FixedChar = True
      Size = 1
    end
    object StringField10: TStringField
      DisplayLabel = #20572#27490#37319#36141'(Y,N)'
      FieldName = 'STOP_PURCH'
      FixedChar = True
      Size = 1
    end
    object StringField11: TStringField
      FieldName = 'MIX_PARTS'
      FixedChar = True
      Size = 1
    end
    object WordField1: TWordField
      FieldName = 'PHY_COUNT_METHOD'
    end
    object StringField12: TStringField
      FieldName = 'BOM_FLAG'
      FixedChar = True
      Size = 1
    end
    object StringField13: TStringField
      FieldName = 'COST_METHOD'
      FixedChar = True
      Size = 1
    end
    object StringField14: TStringField
      FieldName = 'MODIFY_ENGG_RTE_CODE'
      FixedChar = True
      Size = 1
    end
    object IntegerField2: TIntegerField
      FieldName = 'G_L_CODE_SELL_PTR'
    end
    object IntegerField3: TIntegerField
      FieldName = 'G_L_CODE_BUY_PTR'
    end
    object IntegerField4: TIntegerField
      FieldName = 'ENGG_ROUTE_PTR'
    end
    object IntegerField5: TIntegerField
      FieldName = 'NOTE_PAD_PTR'
    end
    object IntegerField6: TIntegerField
      FieldName = 'ALTERNATE_PART_PTR'
    end
    object IntegerField7: TIntegerField
      FieldName = 'AUTHORIZED_BUYER_PTR'
    end
    object IntegerField8: TIntegerField
      FieldName = 'STOCK_UNIT_PTR'
    end
    object IntegerField9: TIntegerField
      FieldName = 'PURCH_UNIT_PTR'
    end
    object IntegerField10: TIntegerField
      FieldName = 'PREF_SUPPLIER_PTR'
    end
    object FloatField1: TFloatField
      Alignment = taLeftJustify
      FieldName = 'STOCK_PURCH'
      DisplayFormat = '0.0000'
      EditFormat = '0.0000'
    end
    object FloatField2: TFloatField
      FieldName = 'STOCK_QUOTE'
    end
    object FloatField3: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #21333#20301#38754#31215
      FieldName = 'STOCK_SELL'
    end
    object FloatField4: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #21333#20301#37325#37327
      FieldName = 'STOCK_BASE'
    end
    object FloatField5: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #26631#20934#25104#26412
      FieldName = 'STD_COST'
      DisplayFormat = '0.0000'
      EditFormat = '0.0000'
    end
    object FloatField6: TFloatField
      FieldName = 'ACTUAL_COST'
    end
    object FloatField7: TFloatField
      FieldName = 'FAILURE_RATE'
    end
    object SmallintField1: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'SHELF_LIFE'
    end
    object SmallintField2: TSmallintField
      FieldName = 'COUNT_INTERVAL_TRANS'
    end
    object FloatField8: TFloatField
      FieldName = 'EST_SCRAP'
    end
    object FloatField9: TFloatField
      FieldName = 'FIXED_SCRAP_RATE'
    end
    object FloatField10: TFloatField
      Alignment = taLeftJustify
      FieldName = 'NEW_STD_COST'
      DisplayFormat = '0.0000'
      EditFormat = '0.0000'
    end
    object StringField15: TStringField
      FieldName = 'CATALOG_NUM'
      FixedChar = True
      Size = 10
    end
    object IntegerField11: TIntegerField
      FieldName = 'OPT_LOT_SIZE'
    end
    object StringField16: TStringField
      FieldName = 'AVL_FLAG'
      FixedChar = True
      Size = 1
    end
    object FloatField11: TFloatField
      FieldName = 'CURRENT_ACT_ACTIVITY'
    end
    object FloatField12: TFloatField
      FieldName = 'CURRENT_ACT_MATERIAL'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'LAST_CURNT_COST_UPDT'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'LAST_STD_COST_UPDT'
    end
    object StringField17: TStringField
      FieldName = 'ALLOW_EDIT_FLAG'
      FixedChar = True
      Size = 1
    end
    object IntegerField12: TIntegerField
      FieldName = 'STORAGE_COND_PTR'
    end
    object IntegerField13: TIntegerField
      FieldName = 'SHELF_LIFE_PTR'
    end
    object IntegerField14: TIntegerField
      FieldName = 'STORG_PRECATION_PTR'
    end
    object FloatField13: TFloatField
      DisplayLabel = #23433#20840#24211#23384
      FieldName = 'CONSIGN_ONHAND_QTY'
    end
    object FloatField14: TFloatField
      DisplayLabel = #20877#35746#36141#28857
      FieldName = 'CONSIGN_QTY_IN_INSP'
    end
    object FloatField15: TFloatField
      DisplayLabel = #26631#20934#20135#20986
      FieldName = 'REPORT_VALUE1'
    end
    object FloatField16: TFloatField
      FieldName = 'REPORT_VALUE2'
    end
    object FloatField17: TFloatField
      FieldName = 'REPORT_VALUE3'
    end
    object FloatField18: TFloatField
      FieldName = 'MIN_LOT_SIZE_AUTOREL'
    end
    object WordField2: TWordField
      FieldName = 'AUTO_RELEASE_FLAG'
    end
    object WordField3: TWordField
      FieldName = 'AUTO_PURCHASE_FLAG'
    end
    object WordField4: TWordField
      FieldName = 'CRITICAL_MATL_FLAG'
    end
    object SmallintField3: TSmallintField
      FieldName = 'AUTO_RELEASE_HOLDFLG'
    end
    object IntegerField15: TIntegerField
      FieldName = 'HOLD_BY_EMPL_PTR'
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'ONHOLD_DATE'
    end
    object FloatField19: TFloatField
      FieldName = 'CUR_MONTH_OPEN_BAL'
    end
    object StringField18: TStringField
      FieldName = 'CONSIGNMENT_FLAG'
      FixedChar = True
      Size = 1
    end
    object StringField19: TStringField
      FieldName = 'ACTIVE_FLAG'
      FixedChar = True
      Size = 1
    end
    object IntegerField16: TIntegerField
      FieldName = 'LOT_NUMBER_COUNT'
    end
    object StringField20: TStringField
      FieldName = 'ANALYSIS_CODE1'
      FixedChar = True
      Size = 100
    end
    object StringField21: TStringField
      FieldName = 'ANALYSIS_CODE2'
      FixedChar = True
      Size = 100
    end
    object StringField22: TStringField
      FieldName = 'ANALYSIS_CODE3'
      FixedChar = True
      Size = 100
    end
    object StringField23: TStringField
      FieldName = 'ANALYSIS_CODE4'
      FixedChar = True
      Size = 100
    end
    object StringField24: TStringField
      FieldName = 'ANALYSIS_CODE5'
      FixedChar = True
      Size = 100
    end
    object StringField25: TStringField
      DisplayLabel = 'IES'#21442#25968'1'
      FieldName = 'IES_PARAMETER_VALUE1'
      FixedChar = True
      Size = 30
    end
    object StringField26: TStringField
      DisplayLabel = 'IES'#21442#25968'2'
      FieldName = 'IES_PARAMETER_VALUE2'
      FixedChar = True
      Size = 30
    end
    object StringField27: TStringField
      DisplayLabel = 'IES'#21442#25968'3'
      FieldName = 'IES_PARAMETER_VALUE3'
      FixedChar = True
      Size = 30
    end
    object StringField28: TStringField
      DisplayLabel = 'IES'#21442#25968'4'
      FieldName = 'IES_PARAMETER_VALUE4'
      FixedChar = True
      Size = 30
    end
    object StringField29: TStringField
      DisplayLabel = 'IES'#21442#25968'5'
      FieldName = 'IES_PARAMETER_VALUE5'
      FixedChar = True
      Size = 30
    end
    object StringField30: TStringField
      DisplayLabel = 'IES'#21442#25968'6'
      FieldName = 'IES_PARAMETER_VALUE6'
      FixedChar = True
      Size = 30
    end
    object StringField31: TStringField
      DisplayLabel = 'IES'#21442#25968'7'
      FieldName = 'IES_PARAMETER_VALUE7'
      FixedChar = True
      Size = 30
    end
    object StringField32: TStringField
      DisplayLabel = 'IES'#21442#25968'8'
      FieldName = 'IES_PARAMETER_VALUE8'
      FixedChar = True
      Size = 30
    end
    object StringField33: TStringField
      DisplayLabel = 'IES'#21442#25968'9'
      FieldName = 'IES_PARAMETER_VALUE9'
      FixedChar = True
      Size = 30
    end
    object StringField34: TStringField
      DisplayLabel = 'IES'#21442#25968'10'
      FieldName = 'IES_PARAMETER_VALUE10'
      FixedChar = True
      Size = 30
    end
    object StringField35: TStringField
      DisplayLabel = #29289#26009#21517#31216
      DisplayWidth = 10
      FieldName = 'INV_NAME'
      Size = 30
    end
    object StringField36: TStringField
      DisplayLabel = #29289#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object FloatField20: TFloatField
      FieldName = 'QUAN_ON_HAND'
    end
    object BCDField1: TBCDField
      FieldName = 'QUAN_ASSIGN'
      Precision = 10
      Size = 2
    end
    object BCDField2: TBCDField
      DisplayLabel = #26377#25928#24211#23384
      FieldName = 'quan_alloc'
      ReadOnly = True
      Precision = 20
    end
    object StringField37: TStringField
      DisplayLabel = #31867#21035#20195#30721
      FieldName = 'group_name'
      Size = 10
    end
    object StringField38: TStringField
      DisplayLabel = #31867#21035#21517
      FieldName = 'group_desc'
      Size = 30
    end
    object StringField39: TStringField
      DisplayLabel = #37319#36141#21333#20301
      FieldName = 'unit_code'
      Size = 5
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 208
    Top = 216
  end
  object tmpAdo: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 256
    Top = 152
  end
end
