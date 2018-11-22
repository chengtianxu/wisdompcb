object DM: TDM
  OldCreateOrder = False
  Left = 435
  Top = 173
  Height = 309
  Width = 316
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sa;Initi' +
      'al Catalog=SJ_V20_LIVE_2;Data Source=winxp'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 24
  end
  object AqDcp60: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = AqDcp60CalcFields
    CommandText = 
      'SELECT dbo.WZCP0060.rkey, dbo.WZCP0060.sales_order, dbo.WZCP0060' +
      '.sales_date, '#13#10'      dbo.WZCP0060.customer_ptr, dbo.WZCP0060.sta' +
      'tus, dbo.WZCP0060.ship_method, '#13#10'      dbo.WZCP0060.location, db' +
      'o.WZCP0060.SALES_REP_PTR, dbo.WZCP0060.ent_date, '#13#10'      dbo.WZC' +
      'P0060.ent_user_ptr, dbo.WZCP0060.currency_ptr, '#13#10'      dbo.WZCP0' +
      '060.exch_rate, dbo.WZCP0060.total_amount, '#13#10'      dbo.WZCP0060.C' +
      'ONTACT_NAME, dbo.WZCP0060.CONT_PHONE, '#13#10'      dbo.WZCP0060.TAX_c' +
      'ate, dbo.WZCP0060.pay_method, dbo.WZCP0060.invoice_ptr, '#13#10'      ' +
      'dbo.WZCP0060.remark, dbo.Data0010.CUST_CODE, '#13#10'      dbo.Data001' +
      '0.CUSTOMER_NAME, dbo.Data0010.ABBR_NAME, '#13#10'      dbo.Data0001.CU' +
      'RR_CODE, dbo.Data0001.CURR_NAME, dbo.Data0009.REP_CODE, '#13#10'      ' +
      'dbo.Data0009.SALES_REP_NAME, '#13#10'     '#31867#22411'=  case dbo.WZCP0060.type'#13 +
      #10'                     when 1 then '#39#38144#21806#24320#21333#39#13#10'                     w' +
      'hen 2 then '#39#30452#25509#20986#20179#39#13#10'                 end'#13#10'FROM dbo.WZCP0060 LEFT ' +
      'OUTER JOIN'#13#10'      dbo.Data0010 ON '#13#10'      dbo.WZCP0060.customer_' +
      'ptr = dbo.Data0010.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0009 ON '#13 +
      #10'      dbo.WZCP0060.SALES_REP_PTR = dbo.Data0009.RKEY LEFT OUTER' +
      ' JOIN'#13#10'      dbo.Data0001 ON dbo.WZCP0060.currency_ptr = dbo.Dat' +
      'a0001.RKEY'#13#10'where '#13#10'      WZCP0060.status <> :v1 and'#13#10'      WZCP' +
      '0060.status <> :v2 and'#13#10'      WZCP0060.status <> :v3 and'#13#10'      ' +
      'WZCP0060.status <> :v4 and'#13#10'      WZCP0060.status <> :v5 and'#13#10'  ' +
      '    WZCP0060.status <> :v6 and'#13#10'      WZCP0060.sales_date>=:dtpk' +
      '1 and '#13#10'      WZCP0060.sales_date<=:dtpk2'
    Parameters = <
      item
        Name = 'v1'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 1
      end
      item
        Name = 'v2'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 0
      end
      item
        Name = 'v3'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 0
      end
      item
        Name = 'v4'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 4
      end
      item
        Name = 'v5'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 5
      end
      item
        Name = 'v6'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 6
      end
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
        Value = 38838d
      end>
    Left = 97
    Top = 80
    object AqDcp60rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AqDcp60sales_order: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'sales_order'
      Size = 12
    end
    object AqDcp60CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object AqDcp60CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object AqDcp60ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object AqDcp60CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object AqDcp60CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object AqDcp60exch_rate: TBCDField
      DisplayLabel = #27719#29575
      FieldName = 'exch_rate'
      Precision = 10
      Size = 6
    end
    object AqDcp60total_amount: TBCDField
      DisplayLabel = #37329#39069
      FieldName = 'total_amount'
      Precision = 10
      Size = 2
    end
    object AqDcp60REP_CODE: TStringField
      FieldName = 'REP_CODE'
      Size = 5
    end
    object AqDcp60SALES_REP_NAME: TStringField
      DisplayLabel = #19994#21153#21592
      FieldName = 'SALES_REP_NAME'
    end
    object AqDcp60status: TWordField
      FieldName = 'status'
    end
    object AqDcp60sales_date: TDateTimeField
      DisplayLabel = #26085#26399
      FieldName = 'sales_date'
    end
    object AqDcp60v_status: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Size = 8
      Calculated = True
    end
    object AqDcp60customer_ptr: TIntegerField
      FieldName = 'customer_ptr'
    end
    object AqDcp60currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object AqDcp60SALES_REP_PTR: TIntegerField
      FieldName = 'SALES_REP_PTR'
    end
    object AqDcp60ship_method: TStringField
      FieldName = 'ship_method'
    end
    object AqDcp60location: TStringField
      FieldName = 'location'
      Size = 50
    end
    object AqDcp60ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object AqDcp60ent_user_ptr: TIntegerField
      FieldName = 'ent_user_ptr'
    end
    object AqDcp60CONTACT_NAME: TStringField
      FieldName = 'CONTACT_NAME'
    end
    object AqDcp60CONT_PHONE: TStringField
      FieldName = 'CONT_PHONE'
    end
    object AqDcp60TAX_cate: TStringField
      FieldName = 'TAX_cate'
    end
    object AqDcp60pay_method: TStringField
      FieldName = 'pay_method'
    end
    object AqDcp60invoice_ptr: TIntegerField
      FieldName = 'invoice_ptr'
    end
    object AqDcp60remark: TStringField
      FieldName = 'remark'
      Size = 50
    end
    object AqDcp60DSDesigner: TStringField
      FieldName = #31867#22411
      ReadOnly = True
      Size = 8
    end
  end
  object DataSource1: TDataSource
    DataSet = AqDcp60
    Left = 40
    Top = 80
  end
  object ADO04: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select SEED_VALUE,SEED_FLAG from data0004'
      'where rkey=6')
    Left = 103
    Top = 23
    object ADO04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object ADO04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 184
    Top = 24
  end
  object ADODCP60: TADODataSet
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
    Left = 168
    Top = 80
    object ADODCP60rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADODCP60sales_order: TStringField
      FieldName = 'sales_order'
      Size = 12
    end
    object ADODCP60sales_date: TDateTimeField
      FieldName = 'sales_date'
    end
    object ADODCP60customer_ptr: TIntegerField
      FieldName = 'customer_ptr'
    end
    object ADODCP60status: TWordField
      FieldName = 'status'
    end
    object ADODCP60ship_method: TStringField
      FieldName = 'ship_method'
    end
    object ADODCP60location: TStringField
      FieldName = 'location'
      Size = 50
    end
    object ADODCP60SALES_REP_PTR: TIntegerField
      FieldName = 'SALES_REP_PTR'
    end
    object ADODCP60ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object ADODCP60ent_user_ptr: TIntegerField
      FieldName = 'ent_user_ptr'
    end
    object ADODCP60currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object ADODCP60exch_rate: TBCDField
      FieldName = 'exch_rate'
      Precision = 10
      Size = 6
    end
    object ADODCP60total_amount: TBCDField
      FieldName = 'total_amount'
      Precision = 10
      Size = 2
    end
    object ADODCP60CONTACT_NAME: TStringField
      FieldName = 'CONTACT_NAME'
    end
    object ADODCP60CONT_PHONE: TStringField
      FieldName = 'CONT_PHONE'
    end
    object ADODCP60TAX_cate: TStringField
      FieldName = 'TAX_cate'
    end
    object ADODCP60pay_method: TStringField
      FieldName = 'pay_method'
    end
    object ADODCP60invoice_ptr: TIntegerField
      FieldName = 'invoice_ptr'
    end
    object ADODCP60remark: TStringField
      FieldName = 'remark'
      Size = 50
    end
  end
  object ADODcp63: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select so_ptr, prod_ptr, location_ptr, quantity, price, tax_rate' +
      ', remark  '#13#10' from WZCP0063'#13#10'where so_ptr=:rkeycp60'
    Parameters = <
      item
        Name = 'rkeycp60'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 232
    Top = 80
    object ADODcp63so_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
    object ADODcp63prod_ptr: TIntegerField
      FieldName = 'prod_ptr'
    end
    object ADODcp63location_ptr: TIntegerField
      FieldName = 'location_ptr'
    end
    object ADODcp63quantity: TBCDField
      FieldName = 'quantity'
      Precision = 10
      Size = 2
    end
    object ADODcp63price: TBCDField
      FieldName = 'price'
      Precision = 10
      Size = 2
    end
    object ADODcp63tax_rate: TBCDField
      FieldName = 'tax_rate'
      Precision = 4
      Size = 2
    end
    object ADODcp63remark: TStringField
      FieldName = 'remark'
      Size = 50
    end
  end
  object AqD63: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME, dbo.Da' +
      'ta0016.CODE, '#13#10'      dbo.WZCP0063.quantity, dbo.WZCP0063.price, ' +
      'dbo.WZCP0063.tax_rate, '#13#10'      dbo.WZCP0063.remark, dbo.Data0002' +
      '.UNIT_NAME'#13#10'FROM dbo.Data0008 INNER JOIN'#13#10'      dbo.WZCP0063 ON ' +
      'dbo.Data0008.RKEY = dbo.WZCP0063.prod_ptr INNER JOIN'#13#10'      dbo.' +
      'Data0016 ON dbo.WZCP0063.location_ptr = dbo.Data0016.RKEY INNER ' +
      'JOIN'#13#10'      dbo.Data0002 ON dbo.Data0008.unit_ptr = dbo.Data0002' +
      '.RKEY'#13#10'where wzcp0063.so_ptr=:rkey'
    DataSource = DataSource1
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = 7
      end>
    Left = 96
    Top = 136
    object AqD63PROD_CODE: TStringField
      DisplayLabel = #20135#21697#32534#30721
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object AqD63PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object AqD63CODE: TStringField
      DisplayLabel = #20179#24211
      FieldName = 'CODE'
      FixedChar = True
      Size = 5
    end
    object AqD63quantity: TBCDField
      DisplayLabel = #25968#37327
      FieldName = 'quantity'
      Precision = 10
      Size = 2
    end
    object AqD63price: TBCDField
      DisplayLabel = #21333#20215
      FieldName = 'price'
      Precision = 10
      Size = 2
    end
    object AqD63tax_rate: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'tax_rate'
      Precision = 4
      Size = 2
    end
    object AqD63remark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 50
    end
    object AqD63UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
  end
  object DataSource2: TDataSource
    DataSet = AqD63
    Left = 40
    Top = 136
  end
  object DataSource3: TDataSource
    DataSet = AQD493
    Left = 40
    Top = 192
  end
  object AQD493: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select Company_Name, Company_Name2, Company_Name3, ship_address,' +
      ' Company_Icon from data0493'
    Parameters = <>
    Left = 96
    Top = 192
    object AQD493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object AQD493Company_Name2: TStringField
      FieldName = 'Company_Name2'
      Size = 50
    end
    object AQD493Company_Name3: TStringField
      FieldName = 'Company_Name3'
      Size = 50
    end
    object AQD493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object AQD493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
  end
end
