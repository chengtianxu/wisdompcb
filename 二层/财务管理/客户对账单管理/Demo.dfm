object DM: TDM
  OldCreateOrder = False
  Left = 356
  Top = 170
  Height = 412
  Width = 461
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security In' +
      'fo=True;User ID=wzsa;Initial Catalog=sj_v20_live;Data Source=172' +
      '.16.68.8'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 16
  end
  object ADS236: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0236.RKEY as rkey,dbo.Data0236.VOUCHER, dbo.Data0' +
      '236.BATCH_NUMBER,'#13#10'dbo.Data0236.ENTERED_DT,dbo.Data0236.STATUS, ' +
      'dbo.Data0236.FYEAR, dbo.Data0236.PERIOD,'#13#10'dbo.Data0005.EMPLOYEE_' +
      'NAME,dbo.Data0236.ENTERED_BY_EMPL_PTR, '#13#10'dbo.Data0236.CUSTOMER_P' +
      'TR, dbo.Data0236.CURRENCY_PTR, '#13#10'dbo.Data0236.EXCHANGE_RATE, dbo' +
      '.Data0010.ABBR_NAME,'#13#10'dbo.Data0236.TOOL_AMOUNT,dbo.Data0236.OTHE' +
      'RS_AMOUNT,dbo.Data0236.SHIP_AMOUNT,'#13#10'dbo.Data0236.TAX_AMOUNT,dbo' +
      '.Data0236.RECEIVABLE_AMOUNT,'#13#10'dbo.Data0010.CUST_CODE, dbo.Data00' +
      '10.CUSTOMER_NAME, '#13#10'CASE data0236.STATUS WHEN 0 THEN '#39#26410#23457#26680#39' WHEN ' +
      '1 THEN '#39#24050#23457#26680#39' '#13#10'WHEN 2 THEN '#39#24050#36864#22238#39' END AS v_status, dbo.Data0001.C' +
      'URR_CODE, dbo.Data0001.CURR_NAME'#13#10'FROM         dbo.Data0236 INNE' +
      'R JOIN'#13#10'                      dbo.Data0005 ON dbo.Data0236.ENTER' +
      'ED_BY_EMPL_PTR = dbo.Data0005.RKEY INNER JOIN'#13#10'                 ' +
      '     dbo.Data0010 ON dbo.Data0236.CUSTOMER_PTR = dbo.Data0010.RK' +
      'EY LEFT OUTER JOIN'#13#10'                      dbo.Data0001 ON dbo.Da' +
      'ta0236.CURRENCY_PTR = dbo.Data0001.RKEY'#13#10'WHERE DATA0236.entered_' +
      'dt>=:vdate1'#13#10'and DATA0236.entered_dt<=:vdate2'#13#10'and data0236.STAT' +
      'US<>:vStaus0'#13#10'and data0236.STATUS<>:vStaus1'#13#10'and data0236.STATUS' +
      '<>:vStaus2'
    EnableBCD = False
    IndexFieldNames = 'VOUCHER'
    Parameters = <
      item
        Name = 'vdate1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 40544d
      end
      item
        Name = 'vdate2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 40848d
      end
      item
        Name = 'vStaus0'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 9
      end
      item
        Name = 'vStaus1'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 9
      end
      item
        Name = 'vStaus2'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 9
      end>
    Prepared = True
    Left = 120
    Top = 24
    object ADS236VOUCHER: TStringField
      FieldName = 'VOUCHER'
      Size = 12
    end
    object ADS236ENTERED_DT: TDateTimeField
      FieldName = 'ENTERED_DT'
    end
    object ADS236STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object ADS236EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS236ENTERED_BY_EMPL_PTR: TIntegerField
      FieldName = 'ENTERED_BY_EMPL_PTR'
    end
    object ADS236CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object ADS236CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object ADS236EXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
    end
    object ADS236ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADS236CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADS236CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADS236v_status: TStringField
      FieldName = 'v_status'
      ReadOnly = True
      Size = 6
    end
    object ADS236CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADS236CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ADS236BATCH_NUMBER: TStringField
      FieldName = 'BATCH_NUMBER'
      Size = 16
    end
    object ADS236FYEAR: TIntegerField
      FieldName = 'FYEAR'
    end
    object ADS236PERIOD: TSmallintField
      FieldName = 'PERIOD'
    end
    object ADS236TOOL_AMOUNT: TBCDField
      FieldName = 'TOOL_AMOUNT'
      Precision = 19
    end
    object ADS236OTHERS_AMOUNT: TBCDField
      FieldName = 'OTHERS_AMOUNT'
      Precision = 19
    end
    object ADS236SHIP_AMOUNT: TBCDField
      FieldName = 'SHIP_AMOUNT'
      Precision = 19
    end
    object ADS236TAX_AMOUNT: TBCDField
      FieldName = 'TAX_AMOUNT'
      Precision = 19
    end
    object ADS236RECEIVABLE_AMOUNT: TBCDField
      FieldName = 'RECEIVABLE_AMOUNT'
      Precision = 19
    end
    object ADS236rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object ADO236: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    EnableBCD = False
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
      'select * from data0236'
      'where Data0236.rkey=:rkey ')
    Left = 296
    Top = 24
    object ADO236RKEY: TIntegerField
      FieldName = 'RKEY'
    end
    object ADO236VOUCHER: TStringField
      FieldName = 'VOUCHER'
      Size = 12
    end
    object ADO236ENTERED_BY_EMPL_PTR: TIntegerField
      FieldName = 'ENTERED_BY_EMPL_PTR'
    end
    object ADO236AUDITED_BY_EMPL_PTR: TIntegerField
      FieldName = 'AUDITED_BY_EMPL_PTR'
    end
    object ADO236ENTERED_DT: TDateTimeField
      FieldName = 'ENTERED_DT'
    end
    object ADO236CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object ADO236CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object ADO236STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object ADO236EXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
    end
    object ADO236BATCH_NUMBER: TStringField
      FieldName = 'BATCH_NUMBER'
      Size = 16
    end
    object ADO236FYEAR: TIntegerField
      FieldName = 'FYEAR'
    end
    object ADO236PERIOD: TSmallintField
      FieldName = 'PERIOD'
    end
    object ADO236TOOL_AMOUNT: TBCDField
      FieldName = 'TOOL_AMOUNT'
      Precision = 19
    end
    object ADO236OTHERS_AMOUNT: TBCDField
      FieldName = 'OTHERS_AMOUNT'
      Precision = 19
    end
    object ADO236SHIP_AMOUNT: TBCDField
      FieldName = 'SHIP_AMOUNT'
      Precision = 19
    end
    object ADO236TAX_AMOUNT: TBCDField
      FieldName = 'TAX_AMOUNT'
      Precision = 19
    end
    object ADO236RECEIVABLE_AMOUNT: TBCDField
      FieldName = 'RECEIVABLE_AMOUNT'
      Precision = 19
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS236
    Left = 216
    Top = 24
  end
  object DataSource2: TDataSource
    DataSet = ADO237
    Left = 192
    Top = 96
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Prepared = True
    Left = 376
    Top = 24
  end
  object ADO237: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
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
      'select data0237.*,data0439.delivery_no,data0439.date_sailing,'
      'case when data0237.so_shp_ptr>0 then D60_1.SALES_ORDER'
      'when data0237.rma_ptr>0 then D60_2.SALES_ORDER '
      
        'when data0237.invoice_ptr>0 then D60_3.SALES_ORDER else '#39#39' end a' +
        's SALES_ORDER,'
      'case when data0237.so_shp_ptr>0 then D25_1.MANU_PART_NUMBER'
      'when data0237.rma_ptr>0 then D25_2.MANU_PART_NUMBER'
      'when data0237.invoice_ptr>0 then D25_3.MANU_PART_NUMBER  '
      'else '#39#39' end as MANU_PART_NUMBER,'
      'case when data0237.so_shp_ptr>0 then D25_1.MANU_PART_DESC'
      'when data0237.rma_ptr>0 then D25_2.MANU_PART_DESC '
      'when data0237.invoice_ptr>0 then D25_3.MANU_PART_DESC'
      'else '#39#39' end as MANU_PART_DESC,'
      'case when data0237.so_shp_ptr>0 then D97_1.PO_NUMBER'
      'when data0237.rma_ptr>0 then D97_2.PO_NUMBER'
      'when data0237.invoice_ptr>0 then D97_3.PO_NUMBER  '
      'else '#39#39' end as PO_NUMBER,'
      'case when data0237.so_shp_ptr>0 then D15_1.abbr_name'
      'when data0237.rma_ptr>0 then D15_2.abbr_name'
      'when data0237.invoice_ptr>0 then D15_3.abbr_name '
      'else D15_4.abbr_name end as abbr_name,'
      'case when data0237.so_shp_ptr>0 then D60_1.PART_PRICE'
      'when data0237.rma_ptr>0 then D60_2.PART_PRICE'
      'else 0 end as PARTS_ALLOC,'
      'case when data0237.so_shp_ptr>0 then D60_1.RUSH_CHARGE'
      'when data0237.rma_ptr>0 then D60_2.RUSH_CHARGE'
      'when data0237.invoice_ptr>0 then D60_3.RUSH_CHARGE     '
      'else 0 end as RUSH_CHARGE,'
      'case when data0237.invoice_ptr>0 then Data0112.invoice_number'
      'when data0237.DEBIT_PTR>0 then data0116.MEMO_NUMBER'
      'else '#39#39' end as invoice_number,'
      'case when data0237.invoice_ptr>0 then Data0112.TOOLING_CHARGES'
      'when data0237.debit_ptr>0 then data0116.TOOLING_CHARGE'
      'else 0 end as TOOLING_CHARGES,'
      'case when data0237.invoice_ptr>0 then Data0112.ship_tax_amount'
      'else 0 end as ship_tax_amount,'
      'case when data0237.invoice_ptr>0 then Data0112.ship_amount'
      
        'when data0237.debit_ptr>0 then (data0116.GOODS_AMT+data0116.SHIP' +
        'PING+data0116.TOOLING_CHARGE)'
      'else 0 end as ship_amount,'
      'case when data0237.invoice_ptr>0 then Data0112.FED_TAX_AMOUNT'
      'when data0237.debit_ptr>0 then data0116.FED_TAX'
      'else 0 end as FED_TAX_AMOUNT,'
      'case when data0237.invoice_ptr>0 then Data0112.INVOICE_TOTAL'
      'when data0237.debit_ptr>0 then data0116.AMOUNT'
      'else 0 end as INVOICE_TOTAL,'
      
        'case when data0237.so_shp_ptr>0 then (data0237.quantity*d60_1.pa' +
        'rts_alloc)'
      
        'when data0237.rma_ptr>0 then ( -data0237.quantity*d60_2.parts_al' +
        'loc)'
      'when data0237.invoice_ptr>0 then data0237.recon_amount'
      
        'when (data0237.debit_ptr>0) and (data0116.MEMO_TP=1) then data02' +
        '37.recon_amount'
      'else (-data0237.recon_amount) end as ch_amount,'
      'case when data0237.so_shp_ptr>0 then '#39#25351#27966#39
      'when data0237.rma_ptr>0 then '#39#36864#36135#39
      'when data0112.INVOICE_TYPE=1 THEN '#39#26631#20934#21457#31080#39
      'WHEN data0112.INVOICE_TYPE=2 THEN '#39#24037#20855#21457#31080#39' '
      'WHEN data0112.INVOICE_TYPE=3 THEN '#39#26434#39033#21457#31080#39
      'when data0116.MEMO_TP=1 THEN '#39#39044#25910#22791#24536#39
      'WHEN data0116.MEMO_TP=4 THEN '#39#36864#36135#22791#24536#39' '
      'WHEN data0116.MEMO_TP=3 THEN '#39#26080#36864#36135#39' END AS '#31867#22411
      'from data0237 '
      'left join data0064 on data0237.so_shp_ptr=data0064.rkey'
      'left join data0098 on data0237.rma_ptr=data0098.rkey    '
      'left join data0112 on data0237.invoice_ptr=data0112.rkey'
      'left join data0116 on data0237.debit_ptr=data0116.rkey'
      'left join data0060 d60_1 on data0064.SO_PTR=d60_1.rkey'
      'left join data0060 d60_2 on data0098.SO_PTR=d60_2.rkey'
      'left join data0060 d60_3 on data0112.sales_order_ptr=d60_3.rkey'
      'left join data0025 d25_1 on d60_1.CUST_PART_PTR=d25_1.rkey'
      
        'left join data0025 d25_2 on data0098.CUSTOMER_PART_PTR=d25_2.rke' +
        'y'
      'left join data0025 d25_3 on d60_3.CUST_PART_PTR=d25_3.rkey'
      'left join data0097 d97_1 on d60_1.PURCHASE_ORDER_PTR=d97_1.rkey'
      'left join data0097 d97_2 on d60_2.PURCHASE_ORDER_PTR=d97_2.rkey'
      'left join data0097 d97_3 on d60_3.PURCHASE_ORDER_PTR=d97_3.rkey'
      'left join data0439 on data0064.packing_list_ptr=data0439.rkey'
      'left join data0015 d15_1 on data0439.warehouse_ptr=d15_1.rkey'
      'left join data0015 d15_2 on d60_2.SHIP_REG_TAX_ID =d15_2.rkey'
      'left join data0015 d15_3 on data0112.warehouse_ptr=d15_3.rkey'
      'left join data0015 d15_4 on data0116.warehouse_ptr=d15_4.rkey'
      'where data0237.rkey236_ptr=:rkey')
    Left = 248
    Top = 176
    object ADO237rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO237rkey236_ptr: TIntegerField
      FieldName = 'rkey236_ptr'
    end
    object ADO237SO_SHP_PTR: TIntegerField
      FieldName = 'SO_SHP_PTR'
    end
    object ADO237RMA_PTR: TIntegerField
      FieldName = 'RMA_PTR'
    end
    object ADO237QUANTITY: TIntegerField
      FieldName = 'QUANTITY'
    end
    object ADO237DEBIT_PTR: TIntegerField
      FieldName = 'DEBIT_PTR'
    end
    object ADO237recon_amount: TBCDField
      FieldName = 'recon_amount'
      Precision = 19
    end
    object ADO237INVOICE_PTR: TIntegerField
      FieldName = 'INVOICE_PTR'
    end
    object ADO237delivery_no: TStringField
      FieldName = 'delivery_no'
      Size = 10
    end
    object ADO237date_sailing: TDateTimeField
      FieldName = 'date_sailing'
    end
    object ADO237SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      ReadOnly = True
      Size = 12
    end
    object ADO237MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
      ReadOnly = True
    end
    object ADO237MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      ReadOnly = True
      Size = 80
    end
    object ADO237PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      ReadOnly = True
      Size = 25
    end
    object ADO237abbr_name: TStringField
      FieldName = 'abbr_name'
      ReadOnly = True
      Size = 10
    end
    object ADO237PARTS_ALLOC: TFloatField
      FieldName = 'PARTS_ALLOC'
      ReadOnly = True
    end
    object ADO237RUSH_CHARGE: TBCDField
      FieldName = 'RUSH_CHARGE'
      ReadOnly = True
      Precision = 5
      Size = 2
    end
    object ADO237invoice_number: TStringField
      FieldName = 'invoice_number'
      ReadOnly = True
      Size = 12
    end
    object ADO237TOOLING_CHARGES: TBCDField
      FieldName = 'TOOLING_CHARGES'
      ReadOnly = True
      Precision = 19
    end
    object ADO237ship_tax_amount: TBCDField
      FieldName = 'ship_tax_amount'
      ReadOnly = True
      Precision = 19
    end
    object ADO237ship_amount: TBCDField
      FieldName = 'ship_amount'
      ReadOnly = True
      Precision = 19
    end
    object ADO237FED_TAX_AMOUNT: TBCDField
      FieldName = 'FED_TAX_AMOUNT'
      ReadOnly = True
      Precision = 19
    end
    object ADO237INVOICE_TOTAL: TBCDField
      FieldName = 'INVOICE_TOTAL'
      ReadOnly = True
      Precision = 19
    end
    object ADO237ch_amount: TFloatField
      FieldName = 'ch_amount'
      ReadOnly = True
    end
    object ADO237DSDesigner: TStringField
      FieldName = #31867#22411
      ReadOnly = True
      Size = 8
    end
  end
end
