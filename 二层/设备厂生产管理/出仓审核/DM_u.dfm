object DM: TDM
  OldCreateOrder = False
  Left = 583
  Top = 242
  Height = 375
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
    Left = 160
    Top = 152
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
        '_NAME_a,'
      '                  dbo.WZCP0070.rkey rkey70'
      'FROM         dbo.WZCP0060 left JOIN'
      
        '                      dbo.Data0010 ON dbo.WZCP0060.customer_ptr ' +
        '= dbo.Data0010.RKEY INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.WZCP0060.ent_user_ptr ' +
        '= dbo.Data0005.RKEY left JOIN'
      
        '                      dbo.WZCP0070 ON dbo.WZCP0060.SALES_REP_PTR' +
        ' = dbo.WZCP0070.rkey left JOIN'
      
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
      DisplayLabel = #20986#20179#21592
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
      DisplayLabel = #23457#26680#26085#26399
      FieldName = 'CONF_DATE'
    end
    object ADO60MO_PTR: TIntegerField
      FieldName = 'MO_PTR'
    end
    object ADO60rkey70: TIntegerField
      FieldName = 'rkey70'
      ReadOnly = True
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
      
        '                      dbo.Data0008.PRODUCT_DESC,dbo.data0002.UNI' +
        'T_NAME'
      'FROM         dbo.WZCP0063 INNER JOIN'
      
        '                      dbo.Data0008 ON dbo.WZCP0063.prod_ptr = db' +
        'o.Data0008.RKEY INNER JOIN'
      
        '                      dbo.Data0016 ON dbo.WZCP0063.location_ptr ' +
        '= dbo.Data0016.RKEY inner join'
      
        '                      dbo.data0002 on dbo.data0008.unit_ptr=dbo.' +
        'data0002.Rkey'
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
    object ADO63quantity: TBCDField
      DisplayLabel = #20986#24211#25968#37327
      FieldName = 'quantity'
      Precision = 10
      Size = 2
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
      DisplayWidth = 30
      FieldName = 'PROD_CODE'
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
    object ADO63UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
  end
end
