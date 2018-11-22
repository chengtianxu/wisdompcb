object DM: TDM
  OldCreateOrder = False
  Left = 938
  Top = 176
  Height = 432
  Width = 502
  object ADOConnection1: TADOConnection
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 18
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 124
    Top = 16
  end
  object ado04: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select SEED_VALUE,SEED_FLAG from data0004'
      'where rkey=6')
    Left = 191
    Top = 15
    object ado04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object ado04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
  object ds492_468: TDataSource
    DataSet = ads492_468
    Left = 194
    Top = 78
  end
  object ads492_468: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT     TOP (100) PERCENT dbo.Data0468.SO_NO, dbo.Data0468.CU' +
      'T_NO, dbo.data0492.TSTATUS, dbo.Data0468.Invent_or, dbo.Data0468' +
      '.STATUS, '#13#10'                      dbo.Data0034.DEPT_NAME, dbo.Dat' +
      'a0008.PRODUCT_NAME, dbo.Data0008.PRODUCT_DESC, dbo.Data0468.QUAN' +
      '_BOM, dbo.Data0468.QUAN_ISSUED, '#13#10'                      dbo.Data' +
      '0002.UNIT_NAME, dbo.Data0008.new_price, dbo.WZCP0071.price, dbo.' +
      'Data0468.RKEY AS RKEY468, dbo.data0492.rkey AS RKEY492, '#13#10'      ' +
      '                dbo.Data0008.RKEY AS RKEY08, dbo.Data0008.PROD_C' +
      'ODE, dbo.Data0008.qty_onhand'#13#10'FROM         dbo.data0492 INNER JO' +
      'IN'#13#10'                      dbo.Data0468 ON dbo.data0492.CUT_NO = ' +
      'dbo.Data0468.CUT_NO INNER JOIN'#13#10'                      dbo.Data00' +
      '08 ON dbo.Data0468.INVENT_PTR = dbo.Data0008.RKEY INNER JOIN'#13#10'  ' +
      '                    dbo.Data0002 ON dbo.Data0008.unit_ptr = dbo.' +
      'Data0002.RKEY INNER JOIN'#13#10'                      dbo.WZCP0070 ON ' +
      'dbo.data0492.SO_NO = dbo.WZCP0070.sales_order INNER JOIN'#13#10'      ' +
      '                dbo.WZCP0071 ON dbo.data0492.PRINTED_BY_PTR = db' +
      'o.WZCP0071.rkey INNER JOIN'#13#10'                      dbo.Data0034 O' +
      'N dbo.Data0008.DEPT_PTR = dbo.Data0034.RKEY'#13#10'WHERE     (dbo.data' +
      '0492.TSTATUS = 0 OR'#13#10'                      dbo.data0492.TSTATUS ' +
      '= 2) AND (dbo.Data0468.Invent_or = 1) AND (dbo.Data0468.STATUS =' +
      ' 0) AND (dbo.data0492.rkey = :rkey492)'#13#10'ORDER BY dbo.Data0468.SO' +
      '_NO, dbo.Data0468.CUT_NO, RKEY468'
    Parameters = <
      item
        Name = 'rkey492'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    Left = 126
    Top = 80
    object ads492_468SO_NO: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'SO_NO'
      Size = 12
    end
    object ads492_468CUT_NO: TStringField
      DisplayLabel = #29983#20135#21333#21495
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ads492_468TSTATUS: TWordField
      FieldName = 'TSTATUS'
    end
    object ads492_468invent_or: TWordField
      FieldName = 'invent_or'
    end
    object ads492_468STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object ads492_468DEPT_NAME: TStringField
      DisplayLabel = #21046#36896#37096#38376
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ads492_468PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ads492_468PRODUCT_DESC: TStringField
      DisplayLabel = #20135#21697#35268#26684
      FieldName = 'PRODUCT_DESC'
      Size = 50
    end
    object ads492_468QUAN_BOM: TFloatField
      DisplayLabel = #37197#39069#25968#37327
      FieldName = 'QUAN_BOM'
    end
    object ads492_468QUAN_ISSUED: TFloatField
      DisplayLabel = #24050#21457#25918#25968#37327
      FieldName = 'QUAN_ISSUED'
    end
    object ads492_468UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ads492_468new_price: TBCDField
      DisplayLabel = #26368#26032#21333#20215
      FieldName = 'new_price'
      Precision = 8
      Size = 2
    end
    object ads492_468RKEY468: TAutoIncField
      FieldName = 'RKEY468'
      ReadOnly = True
    end
    object ads492_468RKEY492: TAutoIncField
      FieldName = 'RKEY492'
      ReadOnly = True
    end
    object ads492_468RKEY08: TAutoIncField
      FieldName = 'RKEY08'
      ReadOnly = True
    end
    object ads492_468PROD_CODE: TStringField
      DisplayLabel = #20135#21697#32534#30721
      FieldName = 'PROD_CODE'
      Size = 15
    end
    object ads492_468qty_onhand: TBCDField
      DisplayLabel = #24403#21069#24211#23384
      FieldName = 'qty_onhand'
      Precision = 10
      Size = 3
    end
    object ads492_468price: TBCDField
      FieldName = 'price'
      Precision = 10
      Size = 2
    end
  end
  object ds08: TDataSource
    DataSet = ads08
    Left = 192
    Top = 146
  end
  object ads08: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT     TOP (100) PERCENT dbo.Data0008.RKEY AS RKEY08, dbo.Da' +
      'ta0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME, dbo.Data0008.PRODUC' +
      'T_DESC, '#13#10'                      dbo.Data0016.RKEY AS RKEY16, dbo' +
      '.Data0016.CODE, dbo.Data0016.LOCATION, dbo.WZCP0001.qty_on_hand ' +
      'AS qty_on_hand_01, '#13#10'                      dbo.Data0008.qty_onha' +
      'nd AS qty_onhand_08, dbo.Data0002.UNIT_NAME,dbo.WZCP0001.RKEY AS' +
      ' RKEY01'#13#10'FROM         dbo.WZCP0001 INNER JOIN'#13#10'                 ' +
      '     dbo.Data0008 ON dbo.WZCP0001.proc_ptr = dbo.Data0008.RKEY I' +
      'NNER JOIN'#13#10'                      dbo.Data0016 ON dbo.WZCP0001.lo' +
      'cation_ptr = dbo.Data0016.RKEY INNER JOIN'#13#10'                     ' +
      ' dbo.Data0002 ON dbo.Data0008.unit_ptr = dbo.Data0002.RKEY'#13#10'WHER' +
      'E     (dbo.WZCP0001.qty_on_hand > 0) AND (dbo.Data0008.RKEY =  :' +
      'rkey08 )'#13#10'ORDER BY dbo.Data0016.CODE'
    Parameters = <
      item
        Name = 'rkey08'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 126
    Top = 147
    object ads08RKEY08: TAutoIncField
      FieldName = 'RKEY08'
      ReadOnly = True
    end
    object ads08PROD_CODE: TStringField
      DisplayLabel = #20135#21697#32534#30721
      FieldName = 'PROD_CODE'
      Size = 15
    end
    object ads08PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ads08PRODUCT_DESC: TStringField
      DisplayLabel = #20135#21697#35268#26684
      DisplayWidth = 50
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
    object ads08RKEY16: TAutoIncField
      FieldName = 'RKEY16'
      ReadOnly = True
    end
    object ads08CODE: TStringField
      DisplayLabel = #20179#24211#20195#30721
      FieldName = 'CODE'
      FixedChar = True
      Size = 5
    end
    object ads08LOCATION: TStringField
      DisplayLabel = #20179#24211#20301#32622
      FieldName = 'LOCATION'
      Size = 10
    end
    object ads08qty_on_hand_01: TBCDField
      DisplayLabel = #20998#20179#24211#23384
      FieldName = 'qty_on_hand_01'
      Precision = 10
      Size = 3
    end
    object ads08qty_onhand_08: TBCDField
      DisplayLabel = #24635#24211#23384
      FieldName = 'qty_onhand_08'
      Precision = 10
      Size = 3
    end
    object ads08UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ads08RKEY01: TAutoIncField
      FieldName = 'RKEY01'
      ReadOnly = True
    end
  end
  object aqry60: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT sales_order, sales_date, type, status, ship_method, ent_d' +
        'ate, ent_user_ptr, currency_ptr, total_amount,'
      
        '       CONTACT_NAME, remark, MO_PTR, rkey, CONF_BY_EMPL_PTR, CON' +
        'F_DATE'
      'FROM dbo.WZCP0060'
      'WHERE rkey IS NULL')
    Left = 128
    Top = 212
    object aqry60sales_order: TStringField
      FieldName = 'sales_order'
      Size = 12
    end
    object aqry60sales_date: TDateTimeField
      FieldName = 'sales_date'
    end
    object aqry60type: TWordField
      FieldName = 'type'
    end
    object aqry60status: TWordField
      FieldName = 'status'
    end
    object aqry60ship_method: TStringField
      FieldName = 'ship_method'
    end
    object aqry60ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object aqry60ent_user_ptr: TIntegerField
      FieldName = 'ent_user_ptr'
    end
    object aqry60currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object aqry60total_amount: TBCDField
      FieldName = 'total_amount'
      Precision = 10
      Size = 2
    end
    object aqry60CONTACT_NAME: TStringField
      FieldName = 'CONTACT_NAME'
    end
    object aqry60remark: TStringField
      FieldName = 'remark'
      Size = 50
    end
    object aqry60MO_PTR: TIntegerField
      FieldName = 'MO_PTR'
    end
    object aqry60rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aqry60CONF_BY_EMPL_PTR: TIntegerField
      FieldName = 'CONF_BY_EMPL_PTR'
    end
    object aqry60CONF_DATE: TDateTimeField
      FieldName = 'CONF_DATE'
    end
  end
  object aqry63: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT so_ptr, prod_ptr, location_ptr, D0468_PTR, quantity, pric' +
        'e, tax_rate, returen_qty, remark,sales_date'
      'FROM dbo.WZCP0063'
      'WHERE rkey IS NULL')
    Left = 130
    Top = 272
    object aqry63so_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
    object aqry63prod_ptr: TIntegerField
      FieldName = 'prod_ptr'
    end
    object aqry63location_ptr: TIntegerField
      FieldName = 'location_ptr'
    end
    object aqry63D0468_PTR: TIntegerField
      FieldName = 'D0468_PTR'
    end
    object aqry63quantity: TBCDField
      FieldName = 'quantity'
      Precision = 10
      Size = 2
    end
    object aqry63price: TBCDField
      FieldName = 'price'
      Precision = 10
      Size = 2
    end
    object aqry63tax_rate: TBCDField
      FieldName = 'tax_rate'
      Precision = 4
      Size = 2
    end
    object aqry63returen_qty: TBCDField
      FieldName = 'returen_qty'
      Precision = 10
      Size = 2
    end
    object aqry63remark: TStringField
      FieldName = 'remark'
      Size = 50
    end
    object aqry63sales_date: TDateTimeField
      FieldName = 'sales_date'
    end
  end
  object aqTmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 40
    Top = 88
  end
  object Ado492: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'PROD_CODE'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 15
        Value = Null
      end>
    SQL.Strings = (
      'select top 1 data0492.CUT_NO'
      'from data0492 INNER JOIN'
      
        '       Data0005 ON data0492.CREATED_BY_PTR = Data0005.RKEY INNER' +
        ' JOIN'
      '       Data0008 ON data0492.BOM_PTR = Data0008.RKEY INNER JOIN'
      '       Data0034 ON data0492.mrb_ptr = Data0034.RKEY INNER JOIN'
      '       Data0015 ON data0492.WHOUSE_PTR = Data0015.RKEY '
      'where Data0008.PROD_CODE=:PROD_CODE'
      'order by data0492.ISSUE_DATE desc')
    Left = 200
    Top = 216
  end
end
