object DM: TDM
  OldCreateOrder = False
  Left = 450
  Top = 209
  Height = 486
  Width = 519
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 43
    Top = 16
  end
  object AQ414: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
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
        Value = 38382d
      end>
    SQL.Strings = (
      'SELECT data0414.number as number414,data0414.qty_rece,'
      '       data0414.qty_to_be_reworked,data0414.QTY_REWORKED,'
      '      data0414.qty_to_be_remaked,data0414.QTY_REMAKED,'
      '      data0414.sys_date as sys_date414,data0414.rkey,'
      '      Data0005.EMPLOYEE_NAME, data0415.number AS number415,'
      '      Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC,'
      '      Data0010.ABBR_NAME as abbr_name10,'
      '      data0415.custpart_ptr, data0414.status,data0415.type,'
      '      case data0414.status when 1 then '#39#26410#25552#20132#39' when 2 then '#39#24453#22788#29702#39
      '      when 3 then '#39#24050#23436#25104#39' end as v_status,'
      '      data0025.unit_sq*data0414.qty_rece as area_rece,'
      '      data0415.quantity,data0415.qty_received'
      'FROM data0415 INNER JOIN'
      
        '      Data0025 ON data0415.custpart_ptr = Data0025.RKEY INNER JO' +
        'IN'
      '      Data0005 INNER JOIN'
      '      data0414 ON Data0005.RKEY = data0414.empl_ptr ON'
      '      data0415.rkey = data0414.d415_ptr INNER JOIN'
      '      Data0010 ON Data0025.CUSTOMER_PTR = Data0010.RKEY'
      
        'where (data0414.sys_date>=:dtpk1) and (data0414.sys_date<=:dtpk2' +
        ')'
      'order by number414')
    Left = 152
    Top = 80
    object AQ414rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ414number414: TStringField
      DisplayLabel = 'MRB'#32534#21495
      FieldName = 'number414'
      Size = 15
    end
    object AQ414qty_rece: TIntegerField
      DisplayLabel = #26816#35270#25968#37327
      FieldName = 'qty_rece'
    end
    object AQ414qty_to_be_reworked: TIntegerField
      DisplayLabel = #36820#24037#25968
      FieldName = 'qty_to_be_reworked'
    end
    object AQ414qty_to_be_remaked: TIntegerField
      DisplayLabel = #25253#24223#25968
      FieldName = 'qty_to_be_remaked'
    end
    object AQ414sys_date414: TDateTimeField
      DisplayLabel = #26085#26399
      FieldName = 'sys_date414'
    end
    object AQ414EMPLOYEE_NAME: TStringField
      DisplayLabel = #25805#20316#21592#24037
      DisplayWidth = 8
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object AQ414number415: TStringField
      DisplayLabel = #20986#20179#21333#21495
      FieldName = 'number415'
      Size = 15
    end
    object AQ414MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      DisplayWidth = 10
      FieldName = 'MANU_PART_NUMBER'
    end
    object AQ414MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      DisplayWidth = 10
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object AQ414ABBR_NAME10: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'ABBR_NAME10'
      Size = 10
    end
    object AQ414status: TWordField
      FieldName = 'status'
    end
    object AQ414QTY_REWORKED: TIntegerField
      FieldName = 'QTY_REWORKED'
    end
    object AQ414QTY_REMAKED: TIntegerField
      FieldName = 'QTY_REMAKED'
    end
    object AQ414custpart_ptr: TIntegerField
      FieldName = 'custpart_ptr'
    end
    object AQ414quantity: TIntegerField
      FieldName = 'quantity'
    end
    object AQ414qty_received: TIntegerField
      FieldName = 'qty_received'
    end
    object AQ414type: TWordField
      FieldName = 'type'
    end
    object AQ414area_rece: TFloatField
      FieldName = 'area_rece'
      ReadOnly = True
    end
    object AQ414v_status: TStringField
      FieldName = 'v_status'
      ReadOnly = True
      Size = 6
    end
  end
  object DataSource1: TDataSource
    DataSet = AQ414
    Left = 96
    Top = 80
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 120
    Top = 16
  end
  object ADO414: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'rkey414'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0414 '
      'where rkey=:rkey414')
    Left = 152
    Top = 136
    object ADO414rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO414number: TStringField
      FieldName = 'number'
      Size = 15
    end
    object ADO414empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object ADO414d415_ptr: TIntegerField
      FieldName = 'd415_ptr'
    end
    object ADO414qty_rece: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'qty_rece'
    end
    object ADO414qty_to_be_reworked: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'qty_to_be_reworked'
    end
    object ADO414qty_to_be_remaked: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'qty_to_be_remaked'
    end
    object ADO414status: TWordField
      FieldName = 'status'
    end
    object ADO414sys_date: TDateTimeField
      FieldName = 'sys_date'
    end
    object ADO414QTY_REWORKED: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'QTY_REWORKED'
    end
    object ADO414QTY_REMAKED: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'QTY_REMAKED'
    end
    object ADO414reference: TMemoField
      FieldName = 'reference'
      BlobType = ftMemo
    end
  end
  object ADO04: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from data0004'
      'where rkey=45')
    Left = 172
    Top = 15
    object ADO04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object ADO04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
  object DataSource2: TDataSource
    DataSet = ADO414
    Left = 96
    Top = 137
  end
  object ADO99: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey414'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0099'
      'where rma_ptr=:rkey414')
    Left = 153
    Top = 192
    object ADO99RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO99CUSTOMER_PART_PTR: TIntegerField
      FieldName = 'CUSTOMER_PART_PTR'
    end
    object ADO99REJECT_CODE_PTR: TIntegerField
      FieldName = 'REJECT_CODE_PTR'
    end
    object ADO99RMA_PTR: TIntegerField
      FieldName = 'RMA_PTR'
    end
    object ADO99EMPLOYEE_PTR: TIntegerField
      FieldName = 'EMPLOYEE_PTR'
    end
    object ADO99CSI_USER_PTR: TIntegerField
      FieldName = 'CSI_USER_PTR'
    end
    object ADO99TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object ADO99QUANTITY: TIntegerField
      DisplayLabel = #25968#37327
      FieldName = 'QUANTITY'
    end
    object ADO99REFERENCE_NUMBER: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REFERENCE_NUMBER'
    end
    object ADO99rej_code: TStringField
      DisplayLabel = #25253#24223'/'#19981#33391#21697#20195#30721
      FieldKind = fkLookup
      FieldName = 'rej_code'
      LookupDataSet = AQ39
      LookupKeyFields = 'RKEY'
      LookupResultField = 'REJ_CODE'
      KeyFields = 'REJECT_CODE_PTR'
      Size = 10
      Lookup = True
    end
    object ADO99rej_desc: TStringField
      DisplayLabel = #25253#24223'/'#19981#33391#21697#21407#22240
      FieldKind = fkLookup
      FieldName = 'rej_desc'
      LookupDataSet = AQ39
      LookupKeyFields = 'RKEY'
      LookupResultField = 'REJECT_DESCRIPTION'
      KeyFields = 'REJECT_CODE_PTR'
      Size = 30
      Lookup = True
    end
    object ADO99v_type: TStringField
      DisplayLabel = #31867#22411
      FieldKind = fkLookup
      FieldName = 'v_type'
      LookupDataSet = AQ39
      LookupKeyFields = 'RKEY'
      LookupResultField = 'type'
      KeyFields = 'REJECT_CODE_PTR'
      Size = 10
      Lookup = True
    end
  end
  object DataSource3: TDataSource
    DataSet = ADO99
    Left = 96
    Top = 192
  end
  object AQ39: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = AQ39CalcFields
    Parameters = <>
    SQL.Strings = (
      'SELECT RKEY,REJ_CODE,REJECT_DESCRIPTION,REJECT_DEFECT_FLAG'
      'FROM  Data0039'
      'ORDER BY REJ_CODE')
    Left = 155
    Top = 246
    object AQ39RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQ39REJ_CODE: TStringField
      FieldName = 'REJ_CODE'
      FixedChar = True
      Size = 5
    end
    object AQ39REJECT_DESCRIPTION: TStringField
      FieldName = 'REJECT_DESCRIPTION'
      FixedChar = True
      Size = 30
    end
    object AQ39REJECT_DEFECT_FLAG: TStringField
      FieldName = 'REJECT_DEFECT_FLAG'
      FixedChar = True
      Size = 1
    end
    object AQ39type: TStringField
      FieldKind = fkCalculated
      FieldName = 'type'
      Size = 6
      Calculated = True
    end
  end
  object DataSource4: TDataSource
    DataSet = AQ39
    Left = 98
    Top = 248
  end
end
