object DM: TDM
  OldCreateOrder = False
  Left = 590
  Top = 241
  Height = 278
  Width = 301
  object DataSource1: TDataSource
    DataSet = ADS60
    Left = 48
    Top = 96
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 16
  end
  object ADS60: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.WZCP0060.rkey, '#13#10'                   dbo.WZCP0060.' +
      'sales_order, '#13#10'                   dbo.WZCP0060.sales_date,'#13#10'    ' +
      '               dbo.WZCP0060.ent_date,'#13#10'                   dbo.WZ' +
      'CP0060.ent_user_ptr,'#13#10'                   dbo.WZCP0060.status,'#13#10' ' +
      '                  dbo.WZCP0060.status as v_status, '#13#10'           ' +
      '        dbo.WZCP0060.remark, '#13#10'                   dbo.Data0005.E' +
      'MPLOYEE_NAME, '#13#10'                   '#39#30452#25509#20986#20179#39' AS '#31867#22411', '#13#10'             ' +
      '      dbo.WZCP0060.ship_method, '#13#10'                   dbo.WZCP006' +
      '0.location, '#13#10'                   dbo.WZCP0060.CONTACT_NAME,     ' +
      '               dbo.WZCP0060.CONT_PHONE,'#13#10'                   CASE' +
      ' dbo.WZCP0060.STATUS WHEN 1 THEN '#39#26410#25552#20132#39' WHEN 2 THEN '#39#24453#23457#26680#39' WHEN 3 ' +
      'THEN '#39#24050#23457#26680#39' WHEN 4 THEN '#39#24050#20837#36134#39'  WHEN 5 THEN '#39#34987#36864#22238#39' END AS '#29366#24577#13#10#13#10'FRO' +
      'M          dbo.WZCP0060 INNER JOIN'#13#10'                    dbo.Data' +
      '0005 ON dbo.WZCP0060.ent_user_ptr = dbo.Data0005.RKEY'#13#10#13#10'WHERE  ' +
      ' '#13#10'      WZCP0060.status <> :v1 and'#13#10'      WZCP0060.status <> :v' +
      '2 and'#13#10'      WZCP0060.status <> :v3 and'#13#10'      WZCP0060.status <' +
      '> :v4 and'#13#10'      WZCP0060.status <> :v5 and  '#13#10'(dbo.WZCP0060.sal' +
      'es_date >= :dtpk1) AND (dbo.WZCP0060.sales_date <= :dtpk2) AND (' +
      'dbo.WZCP0060.type = 2)'
    Parameters = <
      item
        Name = 'v1'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'v2'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'v3'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'v4'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'v5'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    Left = 120
    Top = 96
    object ADS60v_status: TWordField
      FieldName = 'v_status'
    end
    object ADS60rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS60sales_order: TStringField
      FieldName = 'sales_order'
      Size = 12
    end
    object ADS60status: TWordField
      FieldName = 'status'
    end
    object ADS60remark: TStringField
      FieldName = 'remark'
      Size = 50
    end
    object ADS60EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS60DSDesigner: TStringField
      FieldName = #31867#22411
      ReadOnly = True
      Size = 8
    end
    object ADS60ship_method: TStringField
      FieldName = 'ship_method'
    end
    object ADS60location: TStringField
      FieldName = 'location'
      Size = 50
    end
    object ADS60CONTACT_NAME: TStringField
      FieldName = 'CONTACT_NAME'
    end
    object ADS60CONT_PHONE: TStringField
      FieldName = 'CONT_PHONE'
    end
    object ADS60DSDesigner2: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 6
    end
    object ADS60sales_date: TDateTimeField
      FieldName = 'sales_date'
    end
    object ADS60ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object ADS60ent_user_ptr: TIntegerField
      FieldName = 'ent_user_ptr'
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 232
    Top = 8
  end
  object ADS63: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'SELECT     dbo.Data0008.PROD_CODE,                              ' +
      '         dbo.Data0008.PRODUCT_NAME, '#13#10'                   dbo.Dat' +
      'a0008.qty_onhand, '#13#10'                   dbo.WZCP0063.quantity, '#13#10 +
      '                   dbo.WZCP0063.remark, '#13#10'                   dbo' +
      '.Data0016.LOCATION,'#13#10'                   dbo.Data0016.CODE'#13#10#13#10'FRO' +
      'M         dbo.Data0008 INNER JOIN'#13#10'                   dbo.WZCP00' +
      '63 ON dbo.Data0008.RKEY = dbo.WZCP0063.prod_ptr INNER JOIN'#13#10'    ' +
      '               dbo.Data0016 ON dbo.WZCP0063.location_ptr = dbo.D' +
      'ata0016.RKEY'#13#10'WHERE     (dbo.wzcp0063.so_ptr=:rkey)'
    DataSource = DataSource1
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 120
    Top = 184
    object ADS63PROD_CODE: TStringField
      DisplayWidth = 20
      FieldName = 'PROD_CODE'
    end
    object ADS63PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADS63quantity: TBCDField
      FieldName = 'quantity'
      Precision = 10
      Size = 2
    end
    object ADS63remark: TStringField
      FieldName = 'remark'
      Size = 50
    end
    object ADS63LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 10
    end
    object ADS63CODE: TStringField
      FieldName = 'CODE'
      FixedChar = True
      Size = 5
    end
    object ADS63qty_onhand: TBCDField
      FieldName = 'qty_onhand'
      Precision = 10
      Size = 3
    end
  end
  object DataSource2: TDataSource
    DataSet = ADS63
    Left = 48
    Top = 184
  end
  object ADSSB60: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from wzcp0060'#13#10'where rkey =:rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 192
    Top = 96
    object ADSSB60rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADSSB60sales_order: TStringField
      FieldName = 'sales_order'
      Size = 12
    end
    object ADSSB60sales_date: TDateTimeField
      FieldName = 'sales_date'
    end
    object ADSSB60customer_ptr: TIntegerField
      FieldName = 'customer_ptr'
    end
    object ADSSB60type: TWordField
      FieldName = 'type'
    end
    object ADSSB60status: TWordField
      FieldName = 'status'
    end
    object ADSSB60ship_method: TStringField
      FieldName = 'ship_method'
    end
    object ADSSB60location: TStringField
      FieldName = 'location'
      Size = 50
    end
    object ADSSB60SALES_REP_PTR: TIntegerField
      FieldName = 'SALES_REP_PTR'
    end
    object ADSSB60ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object ADSSB60ent_user_ptr: TIntegerField
      FieldName = 'ent_user_ptr'
    end
    object ADSSB60currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object ADSSB60exch_rate: TBCDField
      FieldName = 'exch_rate'
      Precision = 10
      Size = 6
    end
    object ADSSB60total_amount: TBCDField
      FieldName = 'total_amount'
      Precision = 10
      Size = 2
    end
    object ADSSB60CONTACT_NAME: TStringField
      FieldName = 'CONTACT_NAME'
    end
    object ADSSB60CONT_PHONE: TStringField
      FieldName = 'CONT_PHONE'
    end
    object ADSSB60TAX_cate: TStringField
      FieldName = 'TAX_cate'
    end
    object ADSSB60pay_method: TStringField
      FieldName = 'pay_method'
    end
    object ADSSB60invoice_ptr: TIntegerField
      FieldName = 'invoice_ptr'
    end
    object ADSSB60remark: TStringField
      FieldName = 'remark'
      Size = 50
    end
  end
  object ADO04: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select SEED_VALUE,SEED_FLAG from data0004'
      'where rkey=6')
    Left = 144
    Top = 16
    object ADO04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object ADO04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
  object ADSSB63: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select so_ptr, prod_ptr, location_ptr, quantity,  remark,sales_d' +
      'ate '#13#10' from WZCP0063'#13#10'where so_ptr=:rkeycp60'
    Parameters = <
      item
        Name = 'rkeycp60'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 200
    Top = 184
    object ADSSB63so_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
    object ADSSB63prod_ptr: TIntegerField
      FieldName = 'prod_ptr'
    end
    object ADSSB63location_ptr: TIntegerField
      FieldName = 'location_ptr'
    end
    object ADSSB63quantity: TBCDField
      FieldName = 'quantity'
      Precision = 10
      Size = 2
    end
    object ADSSB63remark: TStringField
      FieldName = 'remark'
      Size = 50
    end
    object ADSSB63sales_date: TDateTimeField
      FieldName = 'sales_date'
    end
  end
end
