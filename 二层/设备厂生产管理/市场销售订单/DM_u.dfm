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
    Left = 136
    Top = 256
  end
  object DS1: TDataSource
    DataSet = ADO70
    Left = 8
    Top = 88
  end
  object DS2: TDataSource
    DataSet = ADO71
    Left = 8
    Top = 155
  end
  object ADO70: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterOpen = ADO70AfterScroll
    AfterScroll = ADO70AfterScroll
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     dbo.WZCP0070.*, dbo.Data0010.CUST_CODE, dbo.Data0010.' +
        'CUSTOMER_NAME, data0010.ABBR_NAME,'
      '           Data0005_1.empl_code as REP_CODE,'
      '           Data0005_1.employee_name as sales_rep_name,'
      '           dbo.Data0005.EMPL_CODE, dbo.Data0005.EMPLOYEE_NAME, '
      
        '           dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME, dbo.D' +
        'ata0001.CURR_CODE,dbo.Data0001.CURR_NAME,'
      '           case when wzcp0070.status=1 then '#39#26410#25552#20132#39
      '                when wzcp0070.status=2 then '#39#24453#30830#35748#39
      '                when wzcp0070.status=3 then '#39#24050#30830#35748#39
      '                when wzcp0070.status=4 then '#39#24050#25237#20135#39
      '                when wzcp0070.status=5 then '#39#24050#23436#25104#39
      '                when wzcp0070.status=6 then '#39#34987#36864#22238#39'  end status_c'
      ''
      
        'FROM  dbo.Data0034 INNER JOIN dbo.WZCP0070  ON dbo.Data0034.RKEY' +
        ' = dbo.WZCP0070.produce_deptptr'
      
        '                   INNER JOIN dbo.Data0005  ON dbo.Data0005.RKEY' +
        ' = dbo.WZCP0070.ent_user_ptr '
      
        '                   INNER JOIN dbo.Data0010 ON dbo.WZCP0070.custo' +
        'mer_ptr = dbo.Data0010.RKEY '
      
        '                   left JOIN dbo.Data0005 Data0005_1 ON dbo.WZCP' +
        '0070.SALES_REP_PTR =Data0005_1.RKEY                             ' +
        '      '
      
        '                   INNER JOIN dbo.Data0001 ON dbo.WZCP0070.curre' +
        'ncy_ptr = dbo.Data0001.RKEY ')
    Left = 56
    Top = 88
    object ADO70rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO70sales_order: TStringField
      FieldName = 'sales_order'
      Size = 12
    end
    object ADO70sales_date: TDateTimeField
      FieldName = 'sales_date'
    end
    object ADO70customer_ptr: TIntegerField
      FieldName = 'customer_ptr'
    end
    object ADO70type: TWordField
      FieldName = 'type'
    end
    object ADO70status: TWordField
      FieldName = 'status'
    end
    object ADO70ship_method: TStringField
      FieldName = 'ship_method'
    end
    object ADO70location: TStringField
      FieldName = 'location'
      Size = 50
    end
    object ADO70SALES_REP_PTR: TIntegerField
      FieldName = 'SALES_REP_PTR'
    end
    object ADO70ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object ADO70ent_user_ptr: TIntegerField
      FieldName = 'ent_user_ptr'
    end
    object ADO70currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object ADO70exch_rate: TBCDField
      FieldName = 'exch_rate'
      Precision = 10
      Size = 6
    end
    object ADO70total_amount: TBCDField
      FieldName = 'total_amount'
      Precision = 10
      Size = 2
    end
    object ADO70entrust_deptptr: TIntegerField
      FieldName = 'entrust_deptptr'
    end
    object ADO70produce_deptptr: TIntegerField
      FieldName = 'produce_deptptr'
    end
    object ADO70CONTACT_NAME: TStringField
      FieldName = 'CONTACT_NAME'
    end
    object ADO70CONT_PHONE: TStringField
      FieldName = 'CONT_PHONE'
    end
    object ADO70TAX_cate: TStringField
      FieldName = 'TAX_cate'
    end
    object ADO70pay_method: TStringField
      FieldName = 'pay_method'
    end
    object ADO70CONF_BY_EMPL_PTR: TIntegerField
      FieldName = 'CONF_BY_EMPL_PTR'
    end
    object ADO70CONF_DATE: TDateTimeField
      FieldName = 'CONF_DATE'
    end
    object ADO70remark: TStringField
      FieldName = 'remark'
      Size = 50
    end
    object ADO70CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADO70CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADO70ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADO70REP_CODE: TStringField
      FieldName = 'REP_CODE'
      Size = 5
    end
    object ADO70sales_rep_name: TStringField
      FieldName = 'sales_rep_name'
    end
    object ADO70EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ADO70EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO70DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADO70DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADO70CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADO70CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ADO70status_c: TStringField
      FieldName = 'status_c'
      ReadOnly = True
      Size = 6
    end
    object wdstrngfldADO70PO_NO: TWideStringField
      FieldName = 'PO_NO'
      Size = 50
    end
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
        'PRODUCT_NAME'
      'FROM         dbo.WZCP0071 INNER JOIN'
      
        '                      dbo.Data0008 ON dbo.WZCP0071.prod_ptr = db' +
        'o.Data0008.RKEY'
      'where WZCP0071.so_ptr=:rkey70')
    Left = 56
    Top = 152
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
    object ADO71quantity: TBCDField
      FieldName = 'quantity'
      Precision = 10
      Size = 2
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
    object ADO71QTY_PLANED: TBCDField
      FieldName = 'QTY_PLANED'
      Precision = 10
      Size = 2
    end
    object ADO71PARTS_SHIPPED: TBCDField
      FieldName = 'PARTS_SHIPPED'
      Precision = 10
      Size = 2
    end
    object ADO71returen_qty: TBCDField
      FieldName = 'returen_qty'
      Precision = 10
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
      DisplayWidth = 25
      FieldName = 'PROD_CODE'
      Size = 25
    end
    object ADO71PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
  end
  object ADO70_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
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
      'select  * from wzcp0070 where rkey=:rkey70')
    Left = 128
    Top = 88
    object ADO70_1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO70_1sales_order: TStringField
      FieldName = 'sales_order'
      Size = 12
    end
    object ADO70_1sales_date: TDateTimeField
      FieldName = 'sales_date'
    end
    object ADO70_1customer_ptr: TIntegerField
      FieldName = 'customer_ptr'
    end
    object ADO70_1type: TWordField
      FieldName = 'type'
    end
    object ADO70_1status: TWordField
      FieldName = 'status'
    end
    object ADO70_1ship_method: TStringField
      FieldName = 'ship_method'
    end
    object ADO70_1location: TStringField
      FieldName = 'location'
      Size = 50
    end
    object ADO70_1SALES_REP_PTR: TIntegerField
      FieldName = 'SALES_REP_PTR'
    end
    object ADO70_1ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object ADO70_1ent_user_ptr: TIntegerField
      FieldName = 'ent_user_ptr'
    end
    object ADO70_1currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object ADO70_1exch_rate: TBCDField
      FieldName = 'exch_rate'
      Precision = 10
      Size = 6
    end
    object ADO70_1total_amount: TBCDField
      FieldName = 'total_amount'
      Precision = 10
      Size = 2
    end
    object ADO70_1entrust_deptptr: TIntegerField
      FieldName = 'entrust_deptptr'
    end
    object ADO70_1produce_deptptr: TIntegerField
      FieldName = 'produce_deptptr'
    end
    object ADO70_1CONTACT_NAME: TStringField
      FieldName = 'CONTACT_NAME'
    end
    object ADO70_1CONT_PHONE: TStringField
      FieldName = 'CONT_PHONE'
    end
    object ADO70_1TAX_cate: TStringField
      FieldName = 'TAX_cate'
    end
    object ADO70_1pay_method: TStringField
      FieldName = 'pay_method'
    end
    object ADO70_1CONF_BY_EMPL_PTR: TIntegerField
      FieldName = 'CONF_BY_EMPL_PTR'
    end
    object ADO70_1CONF_DATE: TDateTimeField
      FieldName = 'CONF_DATE'
    end
    object ADO70_1remark: TStringField
      FieldName = 'remark'
      Size = 50
    end
    object wdstrngfldADO70_1PO_NO: TWideStringField
      FieldName = 'PO_NO'
      Size = 50
    end
  end
  object ADO71_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
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
      'select  * from wzcp0071 where so_ptr=:rkey70')
    Left = 128
    Top = 152
  end
  object DS3: TDataSource
    DataSet = ADO70_1
    Left = 192
    Top = 88
  end
  object ADO08: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     dbo.Data0008.rkey,dbo.Data0008.PROD_CODE, dbo.Data000' +
        '8.PRODUCT_NAME, dbo.Data0008.PRODUCT_DESC, dbo.Data0008.new_pric' +
        'e, dbo.Data0008.qty_onhand,'
      '                       case when Data0008.TTYPE=0 then '#39#21322#25104#21697#39
      
        '                             when Data0008.TTYPE=1 then '#39#25104#21697#39' end' +
        ' type_c'
      ''
      'FROM         dbo.Data0008 INNER JOIN'
      
        '                      dbo.Data0034 ON dbo.Data0008.DEPT_PTR = db' +
        'o.Data0034.RKEY')
    Left = 24
    Top = 248
    object ADO08PROD_CODE: TStringField
      DisplayLabel = #20135#21697#32534#30721
      DisplayWidth = 25
      FieldName = 'PROD_CODE'
      Size = 25
    end
    object ADO08PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADO08PRODUCT_DESC: TStringField
      DisplayLabel = #20135#21697#35268#26684
      DisplayWidth = 200
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
    object ADO08new_price: TBCDField
      DisplayLabel = #21333#20215
      FieldName = 'new_price'
      Precision = 8
      Size = 2
    end
    object ADO08qty_onhand: TBCDField
      DisplayLabel = #24403#21069#24211#23384
      FieldName = 'qty_onhand'
      Precision = 10
      Size = 3
    end
    object ADO08rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO08type_c: TStringField
      DisplayLabel = #31867#21035
      FieldName = 'type_c'
      ReadOnly = True
      Size = 6
    end
  end
  object ADO71_2: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey71'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.WZCP0071.*, dbo.Data0008.PROD_CODE, dbo.Data0008.' +
        'PRODUCT_NAME'
      'FROM         dbo.WZCP0071 INNER JOIN'
      
        '                      dbo.Data0008 ON dbo.WZCP0071.prod_ptr = db' +
        'o.Data0008.RKEY'
      'where WZCP0071.rkey = :rkey71')
    Left = 128
    Top = 208
    object ADO71_2rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO71_2so_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
    object ADO71_2prod_ptr: TIntegerField
      FieldName = 'prod_ptr'
    end
    object ADO71_2quantity: TBCDField
      FieldName = 'quantity'
      Precision = 10
      Size = 2
    end
    object ADO71_2price: TBCDField
      FieldName = 'price'
      Precision = 10
      Size = 2
    end
    object ADO71_2tax_rate: TBCDField
      FieldName = 'tax_rate'
      Precision = 4
      Size = 2
    end
    object ADO71_2QTY_PLANED: TBCDField
      FieldName = 'QTY_PLANED'
      Precision = 10
      Size = 2
    end
    object ADO71_2PARTS_SHIPPED: TBCDField
      FieldName = 'PARTS_SHIPPED'
      Precision = 10
      Size = 2
    end
    object ADO71_2returen_qty: TBCDField
      FieldName = 'returen_qty'
      Precision = 10
      Size = 2
    end
    object ADO71_2complete_date: TDateTimeField
      FieldName = 'complete_date'
    end
    object ADO71_2remark: TStringField
      FieldName = 'remark'
      Size = 50
    end
    object ADO71_2PROD_CODE: TStringField
      DisplayWidth = 25
      FieldName = 'PROD_CODE'
      Size = 25
    end
    object ADO71_2PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
  end
  object tmp1: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 248
    Top = 208
  end
end
