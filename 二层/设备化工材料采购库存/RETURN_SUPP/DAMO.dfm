object DM: TDM
  OldCreateOrder = False
  Left = 500
  Top = 299
  Height = 306
  Width = 414
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=SJ_V20_SAMPLE'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 304
    Top = 16
  end
  object AQ71: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = AQ71CalcFields
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
      'SELECT'
      ' data0071.rkey,data0071.quan_ord,data0071.quan_recd,'
      ' data0071.REQ_DATE,data0071.QUAN_RETN,'
      ' data0017.inv_part_number,data0017.s_b_n,'
      ' data0002.unit_code'
      'FROM'
      ' data0071,data0002,data0017'
      'WHERE'
      ' data0071.invt_ptr=data0017.rkey AND'
      ' data0071.purchase_unit_ptr=data0002.rkey and'
      ' data0071.po_ptr=:rkey')
    Left = 48
    Top = 63
    object AQ71rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ71quan_ord: TFloatField
      FieldName = 'quan_ord'
    end
    object AQ71quan_recd: TFloatField
      FieldName = 'quan_recd'
    end
    object AQ71inv_part_number: TStringField
      FieldName = 'inv_part_number'
    end
    object AQ71s_b_n: TStringField
      FieldName = 's_b_n'
      FixedChar = True
      Size = 1
    end
    object AQ71REQ_DATE: TDateTimeField
      FieldName = 'REQ_DATE'
    end
    object AQ71unit_code: TStringField
      FieldName = 'unit_code'
      Size = 5
    end
    object AQ71save_meth: TStringField
      FieldKind = fkCalculated
      FieldName = 'save_meth'
      Size = 4
      Calculated = True
    end
    object AQ71QUAN_RETN: TFloatField
      FieldName = 'QUAN_RETN'
    end
  end
  object DataSource1: TDataSource
    DataSet = AQ71
    Left = 48
    Top = 112
  end
  object AQ22: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    DataSource = DataSource1
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
      'SELECT'
      ' data0017.inv_part_number,data0022.BARCODE_ID,'
      ' data0022.quantity,data0022.quan_stocked,'
      ' data0022.quan_to_be_shipped,data0022.QUAN_RETURNED,'
      ' data0022.tdate,data0022.quan_on_hand,data0022.rkey,'
      ' data0002.unit_code,data0022.inventory_ptr,'
      ' Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION'
      'from data0022,data0017,data0002'
      'where'
      '      data0022.INVENTORY_PTR = data0017.rkey and'
      '      data0022.LOCATION_PTR_FROM = data0002.rkey and'
      '      data0022.SOURCE_PTR =:rkey')
    Left = 128
    Top = 64
    object AQ22inv_part_number: TStringField
      FieldName = 'inv_part_number'
    end
    object AQ22BARCODE_ID: TStringField
      FieldName = 'BARCODE_ID'
      FixedChar = True
      Size = 12
    end
    object AQ22quantity: TFloatField
      FieldName = 'quantity'
    end
    object AQ22quan_stocked: TFloatField
      FieldName = 'quan_stocked'
    end
    object AQ22quan_to_be_shipped: TFloatField
      FieldName = 'quan_to_be_shipped'
    end
    object AQ22QUAN_RETURNED: TFloatField
      FieldName = 'QUAN_RETURNED'
    end
    object AQ22tdate: TDateTimeField
      DisplayLabel = #36865#36135#26085#26399
      FieldName = 'tdate'
    end
    object AQ22quan_on_hand: TFloatField
      FieldName = 'quan_on_hand'
    end
    object AQ22rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ22unit_code: TStringField
      FieldName = 'unit_code'
      Size = 5
    end
    object AQ22inventory_ptr: TIntegerField
      FieldName = 'inventory_ptr'
    end
    object AQ22INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object AQ22INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
  end
  object DataSource2: TDataSource
    DataSet = AQ22
    Left = 128
    Top = 112
  end
  object ado95: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 48
    Top = 168
  end
  object ado9511: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 128
    Top = 168
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 128
    Top = 12
  end
  object aq96: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DataSource2
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
      'select data0096.tdate,data0096.quan_rejd,'
      '       data0076.REJECT_DESCRIPTION,'
      '       data0005.employee_name,data0096.rkey'
      'from data0096,data0076,data0005'
      'where '
      '     data0096.rej_ptr=data0076.rkey and'
      '     data0096.empl_ptr=data0005.rkey and'
      '     data0096.inv_tran_ptr=:rkey')
    Left = 201
    Top = 65
    object aq96tdate: TDateTimeField
      FieldName = 'tdate'
    end
    object aq96quan_rejd: TFloatField
      FieldName = 'quan_rejd'
    end
    object aq96REJECT_DESCRIPTION: TStringField
      FieldName = 'REJECT_DESCRIPTION'
      Size = 30
    end
    object aq96employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object aq96rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object DataSource3: TDataSource
    DataSet = aq96
    Left = 202
    Top = 111
  end
end
