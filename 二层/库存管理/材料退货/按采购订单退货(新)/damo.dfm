object dm: Tdm
  OldCreateOrder = True
  Left = 551
  Top = 196
  Height = 364
  Width = 396
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 24
  end
  object DS22: TDataSource
    DataSet = ADS22
    Left = 24
    Top = 79
  end
  object ADS22: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select d17.inv_part_number,d17.INV_part_description,'#13#10'  d22.quan' +
      'tity,d22.quan_on_hand,d22.quan_to_be_shipped,d22.QUAN_RETURNED,d' +
      '02.unit_code,'#13#10'  d22.tdate,d22.BARCODE_ID,'#13#10'  d23.CODE,d23.SUPPL' +
      'IER_NAME,d70.po_number,D70.confirmation_number,D70.po_date,'#13#10'  d' +
      '15.warehouse_code,d15.abbr_name,d16.location,'#13#10'  d22.rkey,d22.in' +
      'ventory_ptr'#13#10'from data0022 d22 inner join data0017 d17 on d22.IN' +
      'VENTORY_PTR=d17.rkey'#13#10'inner join data0002 d02 on d22.location_pt' +
      'r_from=d02.rkey'#13#10'inner join data0016 d16 on d22.location_ptr=d16' +
      '.rkey'#13#10'inner join data0456 d456 on d22.grn_ptr=d456.rkey'#13#10'left j' +
      'oin data0070 d70 on d456.po_ptr=d70.rkey'#13#10'inner join data0015 d1' +
      '5 on d456.warehouse_ptr=d15.rkey'#13#10'inner join data0023 d23 on d45' +
      '6.supp_ptr=d23.rkey'#13#10'where (d456.ttype in (1,3,5))  '#13#10'and d22.td' +
      'ate>=:dtpk1 and d22.tdate<=:dtpk2'
    IndexFieldNames = 'tdate DESC'
    Parameters = <
      item
        Name = 'dtpk1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    Left = 72
    Top = 80
    object ADS22inv_part_number: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'inv_part_number'
      Size = 25
    end
    object ADS22INV_part_description: TStringField
      DisplayLabel = #26448#26009#25551#36848
      FieldName = 'INV_part_description'
      ReadOnly = True
      Size = 100
    end
    object ADS22quantity: TFloatField
      DisplayLabel = #25509#25910#25968#37327
      FieldName = 'quantity'
    end
    object ADS22quan_on_hand: TBCDField
      DisplayLabel = #22312#24211#25968#37327
      FieldName = 'quan_on_hand'
      Precision = 19
    end
    object ADS22quan_to_be_shipped: TBCDField
      DisplayLabel = #24453#35013#36816#25968
      FieldName = 'quan_to_be_shipped'
      Precision = 18
      Size = 6
    end
    object ADS22QUAN_RETURNED: TBCDField
      DisplayLabel = #36864#36135#25968#37327
      FieldName = 'QUAN_RETURNED'
      Precision = 18
      Size = 6
    end
    object ADS22unit_code: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'unit_code'
      Size = 5
    end
    object ADS22tdate: TDateTimeField
      DisplayLabel = #20837#24211#26085#26399
      FieldName = 'tdate'
    end
    object ADS22BARCODE_ID: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BARCODE_ID'
      Size = 12
    end
    object ADS22CODE: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'CODE'
      Size = 10
    end
    object ADS22SUPPLIER_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ADS22po_number: TStringField
      DisplayLabel = #37319#36141#21333#21495
      FieldName = 'po_number'
      Size = 15
    end
    object ADS22confirmation_number: TStringField
      DisplayLabel = #30830#35748#29992#25143
      FieldName = 'confirmation_number'
    end
    object ADS22po_date: TDateTimeField
      DisplayLabel = #19979#21333#26085#26399
      FieldName = 'po_date'
    end
    object ADS22rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS22inventory_ptr: TIntegerField
      FieldName = 'inventory_ptr'
    end
    object ADS22abbr_name: TStringField
      DisplayLabel = #24037#21378#21517#31216
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADS22location: TStringField
      DisplayLabel = #23384#25918#20179#24211
      FieldName = 'location'
    end
    object ADS22warehouse_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
  end
  object aqtmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 24
    Top = 240
  end
  object AQ22: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'rkey22'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0022 where rkey=:rkey22')
    Left = 128
    Top = 80
    object AQ22RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQ22INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object AQ22GRN_PTR: TIntegerField
      FieldName = 'GRN_PTR'
    end
    object AQ22SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object AQ22LOCATION_PTR: TIntegerField
      FieldName = 'LOCATION_PTR'
    end
    object AQ22QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object AQ22PRICE: TBCDField
      FieldName = 'PRICE'
      Precision = 15
      Size = 6
    end
    object AQ22DISCOUNT: TFloatField
      FieldName = 'DISCOUNT'
    end
    object AQ22QUAN_IN_INSP: TBCDField
      FieldName = 'QUAN_IN_INSP'
      Precision = 18
      Size = 6
    end
    object AQ22QUAN_TO_BE_SHIPPED: TBCDField
      FieldName = 'QUAN_TO_BE_SHIPPED'
      Precision = 18
      Size = 6
    end
    object AQ22QUAN_TO_BE_STOCKED: TBCDField
      FieldName = 'QUAN_TO_BE_STOCKED'
      Precision = 18
      Size = 6
    end
    object AQ22QUAN_RETURNED: TBCDField
      FieldName = 'QUAN_RETURNED'
      Precision = 18
      Size = 6
    end
    object AQ22QUAN_SCRAPPED: TBCDField
      FieldName = 'QUAN_SCRAPPED'
      Precision = 18
      Size = 6
    end
    object AQ22TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object AQ22TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object AQ22STATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object AQ22LOCATION_PTR_FROM: TIntegerField
      FieldName = 'LOCATION_PTR_FROM'
    end
    object AQ22PACKING_SLIP_FLAG: TStringField
      FieldName = 'PACKING_SLIP_FLAG'
      FixedChar = True
      Size = 1
    end
    object AQ22QUAN_STOCKED: TFloatField
      FieldName = 'QUAN_STOCKED'
    end
    object AQ22QUAN_ISSUED_TO_FACT: TFloatField
      FieldName = 'QUAN_ISSUED_TO_FACT'
    end
    object AQ22QUAN_RTNED_FM_FACT: TFloatField
      FieldName = 'QUAN_RTNED_FM_FACT'
    end
    object AQ22QUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      Precision = 19
    end
    object AQ22BARCODE_ID: TStringField
      FieldName = 'BARCODE_ID'
      Size = 12
    end
    object AQ22EXPIRE_DATE: TDateTimeField
      FieldName = 'EXPIRE_DATE'
    end
    object AQ22SUPPLIER2: TStringField
      FieldName = 'SUPPLIER2'
      Size = 10
    end
    object AQ22TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object AQ22rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object AQ22tax_price: TBCDField
      FieldName = 'tax_price'
      Precision = 12
      Size = 3
    end
  end
  object DSQ22: TDataSource
    DataSet = AQ22
    Left = 176
    Top = 79
  end
  object DS96: TDataSource
    DataSet = AQ96
    Left = 24
    Top = 135
  end
  object AQ96: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'rkey22'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select d05.employee_name,d96.tdate,d76.reject_description,d96.qu' +
        'an_rejd,'
      '  d96.reference_number,d96.rkey,'
      
        '  case d96.status when 0 then '#39#26410#35013#36816#39' when 1 then '#39#24050#35013#36816#39' end as v_s' +
        'tatus,'
      '  case d96.flag when 1 then '#39#25253#24223#39' when 2 then '#39#36864#36135#39' end ttype'
      
        '  from data0096 d96 inner join data0005 d05 on d96.empl_ptr=d05.' +
        'rkey'
      '  inner join data0076 d76 on d96.rej_ptr=d76.rkey '
      '  WHERE D96.inv_tran_ptr=:rkey22')
    Left = 72
    Top = 136
    object AQ96employee_name: TStringField
      DisplayLabel = #36864#36135#38599#21592
      FieldName = 'employee_name'
      Size = 16
    end
    object AQ96tdate: TDateTimeField
      DisplayLabel = #36864#36135#26102#38388
      FieldName = 'tdate'
    end
    object AQ96reject_description: TStringField
      DisplayLabel = #36864#36135#21407#22240
      FieldName = 'reject_description'
      Size = 30
    end
    object AQ96quan_rejd: TFloatField
      DisplayLabel = #36864#36135#25968#37327
      FieldName = 'quan_rejd'
    end
    object AQ96reference_number: TStringField
      DisplayLabel = #22791#27880#20449#24687
      FieldName = 'reference_number'
      FixedChar = True
    end
    object AQ96rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ96v_status: TStringField
      DisplayLabel = #35013#36816#29366#24577
      FieldName = 'v_status'
      ReadOnly = True
      Size = 6
    end
    object AQ96ttype: TStringField
      DisplayLabel = #25298#25910#31867#22411
      FieldName = 'ttype'
      ReadOnly = True
      Size = 4
    end
  end
  object aqtmp1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 80
    Top = 240
  end
end
