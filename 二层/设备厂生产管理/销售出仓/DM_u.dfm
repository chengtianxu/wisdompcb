object DM: TDM
  OldCreateOrder = False
  Left = 681
  Top = 187
  Height = 390
  Width = 336
  object ADOCon: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 32
  end
  object tmp: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 64
    Top = 288
  end
  object DS1: TDataSource
    DataSet = ADO60
    Left = 8
    Top = 88
  end
  object DS2: TDataSource
    DataSet = ADO63
    Left = 8
    Top = 155
  end
  object ADO60: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterOpen = ADO60AfterScroll
    AfterScroll = ADO60AfterScroll
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     dbo.WZCP0060.*, dbo.Data0010.CUST_CODE, dbo.Data0010.' +
        'CUSTOMER_NAME, dbo.Data0001.CURR_CODE, dbo.Data0001.CURR_NAME, '
      
        '                      dbo.WZCP0070.sales_order sorder, dbo.Data0' +
        '005.EMPL_CODE, dbo.Data0005.EMPLOYEE_NAME,'
      '                    case when wzcp0060.status=1 then '#39#26410#25552#20132#39
      '                             when wzcp0060.status=2 then '#39#24453#23457#26680#39
      '                             when wzcp0060.status=3 then '#39#24050#23457#26680#39
      '                             when wzcp0060.status=4 then '#39#24050#20837#36134#39
      
        '                             when wzcp0060.status=5 then '#39#34987#36864#22238#39'  ' +
        'end status_c,d5.EMPL_CODE EMPL_CODE_a, d5.EMPLOYEE_NAME EMPLOYEE' +
        '_NAME_a'
      'FROM         dbo.WZCP0060 INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.WZCP0060.customer_ptr ' +
        '= dbo.Data0010.RKEY INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.WZCP0060.ent_user_ptr ' +
        '= dbo.Data0005.RKEY INNER JOIN'
      
        '                      dbo.WZCP0070 ON dbo.WZCP0060.SALES_REP_PTR' +
        ' = dbo.WZCP0070.rkey INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.WZCP0060.currency_ptr ' +
        '= dbo.Data0001.RKEY  left join data0005 d5 on'
      '                     dbo.WZCP0060.conf_by_empl_ptr = d5.RKEY')
    Left = 56
    Top = 88
    object ADO60rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO60sales_order: TStringField
      DisplayLabel = #20986#20179#21333#21495
      FieldName = 'sales_order'
      Size = 12
    end
    object ADO60sales_date: TDateTimeField
      DisplayLabel = #20986#20179#26085#26399
      FieldName = 'sales_date'
    end
    object ADO60customer_ptr: TIntegerField
      FieldName = 'customer_ptr'
    end
    object ADO60type: TWordField
      FieldName = 'type'
    end
    object ADO60status: TWordField
      FieldName = 'status'
    end
    object ADO60ship_method: TStringField
      DisplayLabel = #35013#36816#26041#27861
      FieldName = 'ship_method'
    end
    object ADO60location: TStringField
      DisplayLabel = #36865#36135#22320#22336
      FieldName = 'location'
      Size = 50
    end
    object ADO60SALES_REP_PTR: TIntegerField
      FieldName = 'SALES_REP_PTR'
    end
    object ADO60ent_date: TDateTimeField
      DisplayLabel = #36755#20837#26085#26399
      FieldName = 'ent_date'
    end
    object ADO60ent_user_ptr: TIntegerField
      FieldName = 'ent_user_ptr'
    end
    object ADO60currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object ADO60exch_rate: TBCDField
      DisplayLabel = #27719#29575
      FieldName = 'exch_rate'
      Precision = 10
      Size = 6
    end
    object ADO60total_amount: TBCDField
      DisplayLabel = #24635#37329#39069
      FieldName = 'total_amount'
      Precision = 10
      Size = 2
    end
    object ADO60CONTACT_NAME: TStringField
      DisplayLabel = #32852#31995#20154
      FieldName = 'CONTACT_NAME'
    end
    object ADO60CONT_PHONE: TStringField
      DisplayLabel = #32852#31995#30005#35805
      FieldName = 'CONT_PHONE'
    end
    object ADO60TAX_cate: TStringField
      DisplayLabel = #31080#25454#31181#31867
      FieldName = 'TAX_cate'
    end
    object ADO60pay_method: TStringField
      DisplayLabel = #20184#27454#26041#27861
      FieldName = 'pay_method'
    end
    object ADO60invoice_ptr: TIntegerField
      FieldName = 'invoice_ptr'
    end
    object ADO60remark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 50
    end
    object ADO60CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADO60CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADO60CURR_CODE: TStringField
      DisplayLabel = #36135#24065#20195#30721
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADO60CURR_NAME: TStringField
      DisplayLabel = #36135#24065#21517#31216
      FieldName = 'CURR_NAME'
    end
    object ADO60sorder: TStringField
      DisplayLabel = #35746#21333#32534#21495
      FieldName = 'sorder'
      Size = 12
    end
    object ADO60EMPL_CODE: TStringField
      DisplayLabel = #36755#20837#21592#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ADO60EMPLOYEE_NAME: TStringField
      DisplayLabel = #36755#20837#21592#21517#31216
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO60status_c: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'status_c'
      ReadOnly = True
      Size = 6
    end
    object ADO60EMPL_CODE_a: TStringField
      DisplayLabel = #23457#26680#21592#20195#30721
      FieldName = 'EMPL_CODE_a'
      Size = 10
    end
    object ADO60EMPLOYEE_NAME_a: TStringField
      DisplayLabel = #23457#26680#21592#21517#31216
      FieldName = 'EMPLOYEE_NAME_a'
      Size = 16
    end
    object ADO60CONF_BY_EMPL_PTR: TIntegerField
      FieldName = 'CONF_BY_EMPL_PTR'
    end
    object ADO60CONF_DATE: TDateTimeField
      FieldName = 'CONF_DATE'
    end
    object ADO60MO_PTR: TIntegerField
      FieldName = 'MO_PTR'
    end
    object wdstrngfldADO60PO_NO: TWideStringField
      FieldName = 'PO_NO'
      Size = 30
    end
  end
  object ADO63: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey60'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.WZCP0063.*, dbo.Data0016.CODE, dbo.Data0016.LOCAT' +
        'ION, dbo.Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME, '
      
        '                      dbo.Data0008.PRODUCT_DESC,(WZCP0063.quanti' +
        'ty*WZCP0063.price) as total_price,data0002.unit_name,data0008.re' +
        'mark as d8remark'
      'FROM         dbo.WZCP0063 INNER JOIN'
      
        '                      dbo.Data0008 ON dbo.WZCP0063.prod_ptr = db' +
        'o.Data0008.RKEY INNER JOIN'
      
        '                      dbo.Data0016 ON dbo.WZCP0063.location_ptr ' +
        '= dbo.Data0016.RKEY'
      #9#9#9#9#9'  inner join data0002 on data0002.rkey=data0008.unit_ptr'
      'where WZCP0063.so_ptr=:rkey60')
    Left = 56
    Top = 152
    object ADO63rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO63so_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
    object ADO63prod_ptr: TIntegerField
      FieldName = 'prod_ptr'
    end
    object ADO63location_ptr: TIntegerField
      FieldName = 'location_ptr'
    end
    object ADO63cp71_ptr: TIntegerField
      FieldName = 'cp71_ptr'
    end
    object ADO63price: TBCDField
      DisplayLabel = #21333#20215
      FieldName = 'price'
      Precision = 10
      Size = 2
    end
    object ADO63tax_rate: TBCDField
      DisplayLabel = #22686#20540#31246#29575'%'
      FieldName = 'tax_rate'
      Precision = 4
      Size = 2
    end
    object ADO63returen_qty: TBCDField
      FieldName = 'returen_qty'
      Precision = 10
      Size = 2
    end
    object ADO63remark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 50
    end
    object ADO63CODE: TStringField
      DisplayLabel = #20179#24211#20195#30721
      FieldName = 'CODE'
      FixedChar = True
      Size = 5
    end
    object ADO63LOCATION: TStringField
      DisplayLabel = #20179#24211#21517#31216
      FieldName = 'LOCATION'
      Size = 10
    end
    object ADO63PROD_CODE: TStringField
      DisplayLabel = #20135#21697#32534#30721
      DisplayWidth = 25
      FieldName = 'PROD_CODE'
      Size = 25
    end
    object ADO63PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADO63PRODUCT_DESC: TStringField
      DisplayLabel = #20135#21697#35268#26684
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
    object ADO63D0468_PTR: TIntegerField
      FieldName = 'D0468_PTR'
    end
    object ADO63total_price: TBCDField
      FieldName = 'total_price'
      ReadOnly = True
      Precision = 21
    end
    object ADO63unit_name: TStringField
      FieldName = 'unit_name'
    end
    object ADO63quantity: TBCDField
      FieldName = 'quantity'
      Precision = 10
      Size = 2
    end
    object ADO63d8remark: TMemoField
      FieldName = 'd8remark'
      BlobType = ftMemo
    end
  end
  object ADO60_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey60'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select  * from wzcp0060 where rkey=:rkey60')
    Left = 200
    Top = 96
    object ADO60_1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO60_1sales_order: TStringField
      FieldName = 'sales_order'
      Size = 12
    end
    object ADO60_1sales_date: TDateTimeField
      FieldName = 'sales_date'
    end
    object ADO60_1customer_ptr: TIntegerField
      FieldName = 'customer_ptr'
    end
    object ADO60_1type: TWordField
      FieldName = 'type'
    end
    object ADO60_1status: TWordField
      FieldName = 'status'
    end
    object ADO60_1ship_method: TStringField
      FieldName = 'ship_method'
    end
    object ADO60_1location: TStringField
      FieldName = 'location'
      Size = 50
    end
    object ADO60_1SALES_REP_PTR: TIntegerField
      FieldName = 'SALES_REP_PTR'
    end
    object ADO60_1ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object ADO60_1ent_user_ptr: TIntegerField
      FieldName = 'ent_user_ptr'
    end
    object ADO60_1currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object ADO60_1exch_rate: TBCDField
      FieldName = 'exch_rate'
      Precision = 10
      Size = 8
    end
    object ADO60_1total_amount: TBCDField
      FieldName = 'total_amount'
      Precision = 10
      Size = 2
    end
    object ADO60_1CONTACT_NAME: TStringField
      FieldName = 'CONTACT_NAME'
    end
    object ADO60_1CONT_PHONE: TStringField
      FieldName = 'CONT_PHONE'
    end
    object ADO60_1TAX_cate: TStringField
      FieldName = 'TAX_cate'
    end
    object ADO60_1pay_method: TStringField
      FieldName = 'pay_method'
    end
    object ADO60_1invoice_ptr: TIntegerField
      FieldName = 'invoice_ptr'
    end
    object ADO60_1remark: TStringField
      FieldName = 'remark'
      Size = 50
    end
    object ADO60_1CONF_BY_EMPL_PTR: TIntegerField
      FieldName = 'CONF_BY_EMPL_PTR'
    end
    object ADO60_1CONF_DATE: TDateTimeField
      FieldName = 'CONF_DATE'
    end
    object ADO60_1MO_PTR: TIntegerField
      FieldName = 'MO_PTR'
    end
    object wdstrngfldADO60_1PO_NO: TWideStringField
      FieldName = 'PO_NO'
      Size = 30
    end
  end
  object ADO63_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey60'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select  * from wzcp0063 where so_ptr=:rkey60')
    Left = 200
    Top = 144
  end
  object DS3: TDataSource
    DataSet = ADO60_1
    Left = 248
    Top = 96
  end
  object ADO71: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey70'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.WZCP0071.*, dbo.Data0008.PROD_CODE, dbo.Data0008.' +
        'PRODUCT_NAME, dbo.Data0008.PRODUCT_DESC,'
      
        '                 qty_onhand,wzcp0070.sales_order,wzcp0070.sales_' +
        'date,(WZCP0071.quantity + WZCP0071.returen_qty -  WZCP0071.parts' +
        '_shipped) as '#39#27424#36135#25968#37327#39', WZCP0071.returen_qty '#39#36864#36135#25968#37327#39
      'FROM         dbo.WZCP0071 INNER JOIN'
      
        '                      dbo.Data0008 ON dbo.WZCP0071.prod_ptr = db' +
        'o.Data0008.RKEY'
      
        '                   inner join wzcp0070 on dbo.WZCP0071.so_ptr=db' +
        'o.WZCP0070.rkey'
      
        'where WZCP0071.so_ptr=:rkey70 and WZCP0071.parts_shipped<WZCP007' +
        '1.quantity + WZCP0071.returen_qty')
    Left = 56
    Top = 208
    object ADO71rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO71so_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
    object ADO71prod_ptr: TIntegerField
      FieldName = 'prod_ptr'
    end
    object ADO71price: TBCDField
      FieldName = 'price'
      Precision = 10
      Size = 2
    end
    object ADO71tax_rate: TBCDField
      FieldName = 'tax_rate'
      Precision = 4
      Size = 2
    end
    object ADO71complete_date: TDateTimeField
      FieldName = 'complete_date'
    end
    object ADO71remark: TStringField
      FieldName = 'remark'
      Size = 50
    end
    object ADO71PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 15
    end
    object ADO71PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADO71PRODUCT_DESC: TStringField
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
    object ADO71qty_onhand: TBCDField
      FieldName = 'qty_onhand'
      Precision = 10
      Size = 3
    end
    object ADO71sales_order: TStringField
      FieldName = 'sales_order'
      Size = 12
    end
    object ADO71sales_date: TDateTimeField
      FieldName = 'sales_date'
    end
    object ADO71quantity: TFloatField
      FieldName = 'quantity'
    end
    object ADO71PARTS_SHIPPED: TFloatField
      FieldName = 'PARTS_SHIPPED'
    end
    object ADO71returen_qty: TFloatField
      FieldName = 'returen_qty'
    end
    object ADO71QTY_PLANED: TFloatField
      FieldName = 'QTY_PLANED'
    end
    object ADO71Field: TFloatField
      FieldName = #36864#36135#25968#37327
    end
    object ADO71Field2: TFloatField
      FieldName = #27424#36135#25968#37327
    end
  end
  object DS4: TDataSource
    DataSet = ADO71
    Left = 8
    Top = 211
  end
  object ADO63_2: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey60'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.WZCP0063.*, dbo.Data0016.CODE, dbo.Data0016.LOCAT' +
        'ION, dbo.Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME, '
      '                      dbo.Data0008.PRODUCT_DESC'
      'FROM         dbo.WZCP0063 INNER JOIN'
      
        '                      dbo.Data0008 ON dbo.WZCP0063.prod_ptr = db' +
        'o.Data0008.RKEY INNER JOIN'
      
        '                      dbo.Data0016 ON dbo.WZCP0063.location_ptr ' +
        '= dbo.Data0016.RKEY'
      'where WZCP0063.so_ptr=:rkey60')
    Left = 200
    Top = 200
  end
  object DS5: TDataSource
    DataSet = ADO63_2
    Left = 256
    Top = 200
  end
  object qry493: TADOQuery
    Connection = ADOCon
    Parameters = <>
    SQL.Strings = (
      
        'select Company_Icon, Company_Name+'#39#20986#24211#21333#39' as [Company_Name]  from ' +
        'data0493')
    Left = 200
    Top = 280
    object qry493company_Icon: TBlobField
      FieldName = 'company_Icon'
    end
    object wdstrngfldqry493Company_Name: TWideStringField
      FieldName = 'Company_Name'
      Size = 0
    end
  end
  object ds493: TDataSource
    DataSet = qry493
    Left = 256
    Top = 280
  end
  object Ado492: TADOQuery
    Connection = ADOCon
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'RKey71'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'Rkey08'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT     dbo.data0492.CUT_NO'
      'FROM         dbo.data0492 INNER JOIN'
      
        '                      dbo.WZCP0071 ON dbo.data0492.PRINTED_BY_PT' +
        'R = dbo.WZCP0071.rkey INNER JOIN'
      
        '                      dbo.Data0008 ON dbo.data0492.BOM_PTR = dbo' +
        '.Data0008.RKEY'
      'where dbo.WZCP0071.rkey=:RKey71 and dbo.Data0008.RKEY=:Rkey08'
      'order by data0492.ISSUE_DATE desc')
    Left = 200
    Top = 32
  end
end
