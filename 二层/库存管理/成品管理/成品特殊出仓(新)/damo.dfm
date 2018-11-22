object dm: Tdm
  OldCreateOrder = True
  Left = 480
  Top = 248
  Height = 364
  Width = 396
  object ADOConnection1: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 24
  end
  object DS415: TDataSource
    DataSet = ADS415
    Left = 24
    Top = 79
  end
  object ADS415: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT data0415.number,data0415.type,data0415.status,data0415.rk' +
      'ey,'#13#10'      Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC,'#13#10 +
      '      Data0005.EMPLOYEE_NAME,data0415.sys_date,'#13#10'     ROUND(Data' +
      '0415.quantity * Data0025.unit_sq, 4) AS so_mianji,'#13#10'      data04' +
      '15.quantity,data0415.reference,Data0010.ABBR_NAME as abbr_name10' +
      ','#13#10'      data0010.cust_code,data0010.CUSTOMER_NAME,'#13#10'      case ' +
      'data0415.type when 1 then '#39#30452#25509#20986#20179#39' when 2 then '#39#22996#22806#36864#36135#39' '#13#10'        wh' +
      'en 3 then '#39#36864#36135#37325#26816#39' when 4 then '#39#27491#24120#37325#26816#39' end as v_type,'#13#10'      case d' +
      'ata0415.status when 1 then '#39#24453#25552#20132#39' when 2 then '#39#24050#25552#20132#39' '#13#10'        whe' +
      'n 3 then '#39#24050#20986#20179#39' when 4 then '#39#24050#26816#35270#39' when 5 then '#39#34987#36864#22238#39' end as v_stat' +
      'us,'#13#10'      data0025.rkey as d25rkey, data0415.rma_ptr'#13#10'FROM data' +
      '0415 left JOIN'#13#10'      Data0025 ON data0415.custpart_ptr = Data00' +
      '25.RKEY INNER JOIN'#13#10'      Data0005 ON data0415.empl_ptr = Data00' +
      '05.RKEY INNER JOIN'#13#10'      Data0010 ON data0415.CUSTOMER_PTR = Da' +
      'ta0010.RKEY'#13#10'where data0415.sys_date >= :dtpk1 and data0415.sys_' +
      'date <= :dtpk2'#13#10
    IndexFieldNames = 'number'
    Parameters = <
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
    Left = 72
    Top = 80
    object ADS415number: TStringField
      DisplayLabel = #20986#20179#21333#21495
      FieldName = 'number'
      Size = 15
    end
    object ADS415type: TWordField
      FieldName = 'type'
    end
    object ADS415status: TWordField
      FieldName = 'status'
    end
    object ADS415rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS415MANU_PART_NUMBER: TStringField
      DisplayLabel = #21378#32534
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADS415MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADS415EMPLOYEE_NAME: TStringField
      DisplayLabel = #25805#20316#38599#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS415sys_date: TDateTimeField
      DisplayLabel = #20986#20179#26085#26399
      FieldName = 'sys_date'
    end
    object ADS415quantity: TIntegerField
      DisplayLabel = #25968#37327
      FieldName = 'quantity'
    end
    object ADS415reference: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'reference'
      Size = 50
    end
    object ADS415abbr_name10: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'abbr_name10'
      Size = 10
    end
    object ADS415cust_code: TStringField
      FieldName = 'cust_code'
      Size = 10
    end
    object ADS415CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADS415v_type: TStringField
      DisplayLabel = #20986#20179#31867#22411
      FieldName = 'v_type'
      ReadOnly = True
      Size = 8
    end
    object ADS415v_status: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'v_status'
      ReadOnly = True
      Size = 6
    end
    object ADS415d25rkey: TAutoIncField
      FieldName = 'd25rkey'
      ReadOnly = True
    end
    object ADS415rma_ptr: TIntegerField
      FieldName = 'rma_ptr'
    end
    object ADS415so_mianji: TFloatField
      FieldName = 'so_mianji'
      ReadOnly = True
    end
  end
  object aqtmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 24
    Top = 240
  end
  object AQ04: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from data0004'
      'where rkey=6')
    Left = 24
    Top = 136
    object AQ04RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQ04CONTROL_NO_LENGTH: TSmallintField
      FieldName = 'CONTROL_NO_LENGTH'
    end
    object AQ04SEED_MEAN: TStringField
      FieldName = 'SEED_MEAN'
    end
    object AQ04BIG5_SEED_MEAN: TStringField
      FieldName = 'BIG5_SEED_MEAN'
    end
    object AQ04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object AQ04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
    object AQ04table_name: TStringField
      FieldName = 'table_name'
      Size = 8
    end
  end
  object aqtmp1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 80
    Top = 240
  end
  object AQ415: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey415'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0415 where rkey=:rkey415')
    Left = 128
    Top = 80
    object AQ415rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ415number: TStringField
      FieldName = 'number'
      Size = 15
    end
    object AQ415type: TWordField
      FieldName = 'type'
    end
    object AQ415status: TWordField
      FieldName = 'status'
    end
    object AQ415empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object AQ415custpart_ptr: TIntegerField
      FieldName = 'custpart_ptr'
    end
    object AQ415sys_date: TDateTimeField
      FieldName = 'sys_date'
    end
    object AQ415quantity: TIntegerField
      FieldName = 'quantity'
    end
    object AQ415reference: TStringField
      FieldName = 'reference'
      Size = 50
    end
    object AQ415auth_empl_ptr: TIntegerField
      FieldName = 'auth_empl_ptr'
    end
    object AQ415auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object AQ415qty_received: TIntegerField
      FieldName = 'qty_received'
    end
    object AQ415rma_ptr: TIntegerField
      FieldName = 'rma_ptr'
    end
    object AQ415customer_ptr: TIntegerField
      FieldName = 'customer_ptr'
    end
  end
end
