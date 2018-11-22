object DM: TDM
  OldCreateOrder = False
  Left = 601
  Top = 247
  Height = 298
  Width = 339
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=koimy1234;Persist Security Info=Tru' +
      'e;User ID=SA;Initial Catalog=SJ_V20_SAMPLE;Data Source=W18'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 183
    Top = 99
  end
  object aq0028: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      
        'select inv_part_number,inv_part_description,data0017.stock_unit_' +
        'ptr,'
      
        '          data0023.code,data0023.supplier_name,data0028.lead_tim' +
        'e,'
      '          data0028.supplier_part_no,data0028.sugg_reorder_qty,'
      '          data0001.curr_name,data0001.curr_code,data0028.rkey,'
      
        '          data0002.unit_code,data0002.unit_name,data0028.PRICE_1' +
        ','
      '          data0023.abbr_name,data0017.inv_name'
      'from data0017,data0023,data0028,data0001,data0002'
      'where data0028.inventory_ptr=data0017.rkey and'
      '      data0028.supplier_ptr=data0023.rkey  and'
      '      data0028.currency_ptr=data0001.rkey and'
      '      data0028.purchase_unit_ptr=data0002.rkey and'
      'data0028.supplier_ptr =1'
      'order by inv_part_number')
    Left = 32
    Top = 88
    object aq0028inv_part_number: TStringField
      DisplayLabel = #26448#26009#20195#30721
      FieldName = 'inv_part_number'
      Size = 25
    end
    object aq0028inv_part_description: TStringField
      DisplayLabel = #26448#26009#21517#31216#35268#26684
      FieldName = 'inv_part_description'
      ReadOnly = True
      Size = 100
    end
    object aq0028stock_unit_ptr: TIntegerField
      FieldName = 'stock_unit_ptr'
    end
    object aq0028code: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'code'
      Size = 10
    end
    object aq0028supplier_name: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'supplier_name'
      Size = 100
    end
    object aq0028lead_time: TSmallintField
      FieldName = 'lead_time'
    end
    object aq0028supplier_part_no: TStringField
      FieldName = 'supplier_part_no'
    end
    object aq0028sugg_reorder_qty: TFloatField
      FieldName = 'sugg_reorder_qty'
    end
    object aq0028curr_name: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'curr_name'
    end
    object aq0028curr_code: TStringField
      FieldName = 'curr_code'
      Size = 5
    end
    object aq0028rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aq0028unit_code: TStringField
      DisplayLabel = #37319#36141#21333#20301
      FieldName = 'unit_code'
      Size = 5
    end
    object aq0028unit_name: TStringField
      FieldName = 'unit_name'
    end
    object aq0028PRICE_1: TFloatField
      DisplayLabel = #21333#20215
      FieldName = 'PRICE_1'
    end
    object aq0028abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
    object aq0028inv_name: TStringField
      FieldName = 'inv_name'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = aq0028
    Left = 31
    Top = 138
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    ParamCheck = False
    Parameters = <>
    Left = 32
    Top = 31
  end
  object ADO28: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterDelete = ADO28AfterDelete
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
      'select * from data0028 where rkey=:rkey')
    Left = 95
    Top = 87
    object ADO28RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO28SUPPLIER_PTR: TIntegerField
      FieldName = 'SUPPLIER_PTR'
    end
    object ADO28INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ADO28EMPLOYEE_PTR: TIntegerField
      FieldName = 'EMPLOYEE_PTR'
    end
    object ADO28CSI_USER_PTR: TIntegerField
      FieldName = 'CSI_USER_PTR'
    end
    object ADO28TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object ADO28SUPPLIER_PART_NO: TStringField
      FieldName = 'SUPPLIER_PART_NO'
      FixedChar = True
    end
    object ADO28SUGG_REORDER_QTY: TFloatField
      Alignment = taLeftJustify
      FieldName = 'SUGG_REORDER_QTY'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object ADO28LEAD_TIME: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'LEAD_TIME'
    end
    object ADO28AMT_QUAN_FLAG: TWordField
      FieldName = 'AMT_QUAN_FLAG'
    end
    object ADO28MIN_ORDER_QTY: TFloatField
      FieldName = 'MIN_ORDER_QTY'
    end
    object ADO28MIN_ORDER_AMT: TFloatField
      FieldName = 'MIN_ORDER_AMT'
    end
    object ADO28TAX_1: TFloatField
      FieldName = 'TAX_1'
    end
    object ADO28TAX_2: TFloatField
      Alignment = taLeftJustify
      FieldName = 'TAX_2'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ADO28PRICE_1: TFloatField
      FieldName = 'PRICE_1'
    end
    object ADO28PRICE_2: TFloatField
      FieldName = 'PRICE_2'
    end
    object ADO28PRICE_3: TFloatField
      FieldName = 'PRICE_3'
    end
    object ADO28PRICE_4: TFloatField
      FieldName = 'PRICE_4'
    end
    object ADO28PRICE_5: TFloatField
      FieldName = 'PRICE_5'
    end
    object ADO28PRICE_6: TFloatField
      FieldName = 'PRICE_6'
    end
    object ADO28QUAN_VOL_1: TFloatField
      FieldName = 'QUAN_VOL_1'
    end
    object ADO28QUAN_VOL_2: TFloatField
      FieldName = 'QUAN_VOL_2'
    end
    object ADO28QUAN_VOL_3: TFloatField
      FieldName = 'QUAN_VOL_3'
    end
    object ADO28QUAN_VOL_4: TFloatField
      FieldName = 'QUAN_VOL_4'
    end
    object ADO28QUAN_VOL_5: TFloatField
      FieldName = 'QUAN_VOL_5'
    end
    object ADO28DISC_1: TFloatField
      FieldName = 'DISC_1'
    end
    object ADO28DISC_2: TFloatField
      FieldName = 'DISC_2'
    end
    object ADO28DISC_3: TFloatField
      FieldName = 'DISC_3'
    end
    object ADO28DISC_4: TFloatField
      FieldName = 'DISC_4'
    end
    object ADO28DISC_5: TFloatField
      FieldName = 'DISC_5'
    end
    object ADO28DISC_6: TFloatField
      FieldName = 'DISC_6'
    end
    object ADO28TAX_3: TFloatField
      FieldName = 'TAX_3'
    end
    object ADO28TAX_4: TFloatField
      FieldName = 'TAX_4'
    end
    object ADO28PURCHASE_UNIT_PTR: TIntegerField
      FieldName = 'PURCHASE_UNIT_PTR'
    end
    object ADO28CONVERSION_FACTOR: TFloatField
      Alignment = taLeftJustify
      FieldName = 'CONVERSION_FACTOR'
      DisplayFormat = '0.0000'
      EditFormat = '0.0000'
    end
    object ADO28AVL_FLAG: TStringField
      FieldName = 'AVL_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADO28CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object ADO28EDI_OUT_FORCST: TIntegerField
      FieldName = 'EDI_OUT_FORCST'
    end
    object ADO28qte_price: TFloatField
      DisplayLabel = #24066#22330#25253#20215#20215#26684
      FieldName = 'qte_price'
    end
    object ADO28TAX_FLAG: TStringField
      FieldName = 'TAX_FLAG'
      FixedChar = True
      Size = 1
    end
  end
  object DataSource2: TDataSource
    DataSet = ADO28
    Left = 96
    Top = 137
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    ParamCheck = False
    Parameters = <>
    Left = 94
    Top = 32
  end
  object ADO17: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'supp_rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'cost'
        Attributes = [paSigned]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'self_rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'update data0017 '
      'set pref_supplier_ptr=:supp_rkey,'
      '    STD_COST=:cost'
      'where rkey=:self_rkey')
    Left = 219
    Top = 32
  end
  object ADO2811: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'ep053;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@v_type'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 28
      end
      item
        Name = '@v_rkey'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 163
    Top = 32
  end
end
