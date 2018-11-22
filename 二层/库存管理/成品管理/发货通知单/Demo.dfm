object DM: TDM
  OldCreateOrder = False
  Left = 311
  Top = 128
  Height = 418
  Width = 681
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 38
    Top = 9
  end
  object ADO530: TADOQuery
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
    Prepared = True
    SQL.Strings = (
      
        'select data0530.*,data0064.rkey,data0064.rkey529_ptr as rkey529,' +
        'data0064.DATE_ASSIGN,'
      
        'data0064.SHIPMENT_NO,data0060.sales_order,Data0060.PART_PRICE,da' +
        'ta0025.manu_part_number,'
      
        'Data0530.quan_declare*data0064.REPORT_UNIT_VALUE1*0.001 as weigt' +
        'h,Data0064.QUAN_SHIPPED,'
      
        'data0064.report_unit_value1*0.001 as pcs_weight,data0025.manu_pa' +
        'rt_desc,Data0025.ANALYSIS_CODE_2,Data0025.ANALYSIS_CODE_5,'
      
        'data0439.delivery_no,Data0530.quan_declare * Data0060.PART_PRICE' +
        ' AS total_case'
      ' from Data0064'
      'left join data0530 on data0530.rkey64_ptr=data0064.rkey'
      'inner join data0060 on data0064.so_ptr=data0060.rkey'
      'inner join data0025 on data0060.CUST_PART_PTR=data0025.rkey'
      'inner join data0439 on data0064.packing_list_ptr=data0439.rkey'
      'where data0530.rkey529_ptr=:rkey')
    Left = 94
    Top = 95
    object ADO530rkey529_ptr: TIntegerField
      FieldName = 'rkey529_ptr'
    end
    object ADO530rkey64_PTR: TIntegerField
      FieldName = 'rkey64_PTR'
    end
    object ADO530cartons_no: TIntegerField
      FieldName = 'cartons_no'
    end
    object ADO530weight: TBCDField
      FieldName = 'weight'
      Precision = 10
      Size = 3
    end
    object ADO530reference_number: TStringField
      FieldName = 'reference_number'
      Size = 50
    end
    object ADO530remark1: TStringField
      FieldName = 'remark1'
      Size = 50
    end
    object ADO530remark2: TStringField
      FieldName = 'remark2'
      Size = 50
    end
    object ADO530remark3: TStringField
      FieldName = 'remark3'
      Size = 50
    end
    object ADO530remark4: TStringField
      FieldName = 'remark4'
      Size = 50
    end
    object ADO530rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO530rkey529: TIntegerField
      FieldName = 'rkey529'
    end
    object ADO530SHIPMENT_NO: TSmallintField
      FieldName = 'SHIPMENT_NO'
    end
    object ADO530sales_order: TStringField
      FieldName = 'sales_order'
      FixedChar = True
      Size = 12
    end
    object ADO530manu_part_number: TStringField
      FieldName = 'manu_part_number'
    end
    object ADO530delivery_no: TStringField
      FieldName = 'delivery_no'
      Size = 10
    end
    object ADO530PART_PRICE: TFloatField
      FieldName = 'PART_PRICE'
    end
    object ADO530weigth: TBCDField
      FieldName = 'weigth'
      ReadOnly = True
      Precision = 25
      Size = 8
    end
    object ADO530QUAN_SHIPPED: TIntegerField
      FieldName = 'QUAN_SHIPPED'
    end
    object ADO530total_case: TFloatField
      FieldName = 'total_case'
      ReadOnly = True
    end
    object ADO530DATE_ASSIGN: TDateTimeField
      FieldName = 'DATE_ASSIGN'
    end
    object ADO530quan_declare: TIntegerField
      FieldName = 'quan_declare'
    end
    object ADO530pcs_weight: TBCDField
      FieldName = 'pcs_weight'
      ReadOnly = True
      Precision = 13
      Size = 7
    end
    object ADO530manu_part_desc: TStringField
      FieldName = 'manu_part_desc'
      Size = 80
    end
    object ADO530ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 80
    end
    object ADO530ANALYSIS_CODE_5: TStringField
      FieldName = 'ANALYSIS_CODE_5'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS529
    Left = 277
    Top = 22
  end
  object DataSource2: TDataSource
    DataSet = ADO530
    Left = 248
    Top = 101
  end
  object ADO64: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey10'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
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
    Prepared = True
    SQL.Strings = (
      'SELECT'
      '      Data0060.SALES_ORDER,Data0060.COMMISION_ON_TOOLING,'
      '      Data0060.SCH_DATE, Data0060.ITEM_NBR,'
      '      Data0010.COD_FLAG,Data0060.RKEY AS rkey60,'
      '      Data0060.PARTS_ORDERED, Data0060.PARTS_SHIPPED,'
      '      Data0060.PARTS_RETURNED,Data0060.SHIPPING_METHOD,'
      '      Data0060.CURRENCY_PTR,Data0060.PART_PRICE,'
      '      Data0060.STATUS,data0060.fob,data0060.REFERENCE_NUMBER,'
      '      Data0060.CUST_SHIP_ADDR_PTR,Data0060.CUSTOMER_PTR,'
      
        '      Data0060.PURCHASE_ORDER_PTR,Data0060.CUST_PART_PTR,data001' +
        '5.rkey rkey15,data0015.WAREHOUSE_CODE,data0015.abbr_name, '
      
        '      Data0025.MANU_PART_NUMBER,Data0025.MANU_PART_DESC,Data0025' +
        '.ANALYSIS_CODE_2,'
      
        '      Data0010.CUST_CODE,Data0010.CUSTOMER_NAME,data0010.DO_SMOO' +
        'THING,'
      '      data0010.INVOICE_NOTE_PAD_PTR,data0010.CUSTOMER_TYPE,'
      
        '      Data0064.SHIPMENT_NO, Data0064.QUAN_SHIPPED,Data0064.carto' +
        'ns_no,'
      '      Data0064.DATE_ASSIGN, data0064.ovsh_discount,'
      '      Data0064.DATE_SHIPPED,Data0064.PACKING_SLIP_FLAG,'
      
        '       (Data0064.quan_shipped-isnull(data0064.rkey529_ptr,0) ) *' +
        ' Data0060.PART_PRICE AS total_case,'
      
        '      Data0064.RKEY AS rkey64,Data0064.packing_list_ptr,Data0064' +
        '.rkey529_ptr,'
      
        '      Data0064.quan_shipped-isnull(data0064.rkey529_ptr,0) as '#39#21487 +
        #25253#20851#25968#37327#39','
      
        ' (Data0064.quan_shipped-isnull(data0064.rkey529_ptr,0) )*data006' +
        '4.REPORT_UNIT_VALUE1*0.001 as weigth,'
      'case data0064.assign_type  when 0 then '#39#27491#24120#39' when 1 then '#39#36864#36135#39
      'end as assigntype,'
      
        '      Data0012.SHIP_TO_ADDRESS_1,Data0012.SHIP_TO_CONTACT,Data00' +
        '12.ZIP,'
      
        '      Data0012.SHIP_TO_PHONE,Data0012.LOCATION,Data0012.STATE,Da' +
        'ta0012.rkey as rkey12,'
      
        '      Data0012.LOCNAME_FOR_FORM,Data0012.MISC_BARCODE_LABLE,Data' +
        '0012.SHP_ADDR1_FOR_FORM,'
      
        '      Data0012.COFC_FORMAT_FILENAME,Data0012.S3_BARCODE_LABLE,Da' +
        'ta0012.S4_BARCODE_LABLE,Data0012.PACKGE_BARCODE_LABLE,'
      '      Data0097.OPEN_SOS,Data0097.PO_DATE,Data0097.PO_NUMBER,'
      '      Data0001.CURR_CODE,Data0001.CURR_NAME,'
      '      Data0005.EMPLOYEE_NAME'
      'FROM Data0064 INNER JOIN'
      '      Data0060 ON Data0064.SO_PTR = Data0060.RKEY INNER JOIN'
      
        '      Data0025 ON Data0060.CUST_PART_PTR = Data0025.RKEY INNER J' +
        'OIN'
      
        '      Data0010 ON Data0060.CUSTOMER_PTR = Data0010.RKEY INNER JO' +
        'IN'
      
        '      Data0005 ON Data0064.ENT_EMPL_PTR = Data0005.RKEY INNER JO' +
        'IN'
      
        '      Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY IN' +
        'NER JOIN'
      
        '      Data0001 ON Data0060.CURRENCY_PTR = Data0001.RKEY INNER JO' +
        'IN'
      
        '      Data0012 ON Data0060.CUST_SHIP_ADDR_PTR = Data0012.RKEY in' +
        'ner join data0015 on data0060.SHIP_REG_TAX_ID=data0015.rkey'
      'WHERE'
      
        '      (Data0064.PACKING_SLIP_FLAG = '#39'1'#39')  and (data0025.ttype=0)' +
        ' and (data0064.quan_shipped-ISNULL(rkey529_ptr,0))>0 '
      '      and  (data0060.customer_ptr=:rkey10)'
      
        '      and  (data0064.DATE_ASSIGN>=:dtpk1) and(data0064.DATE_ASSI' +
        'GN<=:dtpk2)'
      ''
      ''
      '     ORDER BY Data0060.SALES_ORDER,Data0064.SHIPMENT_NO')
    Left = 234
    Top = 181
    object ADO64SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADO64COMMISION_ON_TOOLING: TStringField
      FieldName = 'COMMISION_ON_TOOLING'
      FixedChar = True
      Size = 1
    end
    object ADO64SCH_DATE: TDateTimeField
      FieldName = 'SCH_DATE'
    end
    object ADO64ITEM_NBR: TStringField
      FieldName = 'ITEM_NBR'
      FixedChar = True
      Size = 5
    end
    object ADO64COD_FLAG: TStringField
      FieldName = 'COD_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADO64rkey60: TIntegerField
      FieldName = 'rkey60'
      ReadOnly = True
    end
    object ADO64PARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object ADO64PARTS_SHIPPED: TFloatField
      FieldName = 'PARTS_SHIPPED'
    end
    object ADO64PARTS_RETURNED: TFloatField
      FieldName = 'PARTS_RETURNED'
    end
    object ADO64SHIPPING_METHOD: TStringField
      FieldName = 'SHIPPING_METHOD'
      FixedChar = True
    end
    object ADO64CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object ADO64PART_PRICE: TFloatField
      FieldName = 'PART_PRICE'
    end
    object ADO64STATUS: TWordField
      FieldName = 'STATUS'
    end
    object ADO64fob: TStringField
      FieldName = 'fob'
      Size = 50
    end
    object ADO64REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      Size = 50
    end
    object ADO64CUST_SHIP_ADDR_PTR: TIntegerField
      FieldName = 'CUST_SHIP_ADDR_PTR'
    end
    object ADO64CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object ADO64PURCHASE_ORDER_PTR: TIntegerField
      FieldName = 'PURCHASE_ORDER_PTR'
    end
    object ADO64CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object ADO64rkey15: TIntegerField
      FieldName = 'rkey15'
      ReadOnly = True
    end
    object ADO64WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADO64abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADO64MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADO64MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADO64ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 80
    end
    object ADO64CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADO64CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADO64DO_SMOOTHING: TWordField
      FieldName = 'DO_SMOOTHING'
    end
    object ADO64INVOICE_NOTE_PAD_PTR: TIntegerField
      FieldName = 'INVOICE_NOTE_PAD_PTR'
    end
    object ADO64CUSTOMER_TYPE: TIntegerField
      FieldName = 'CUSTOMER_TYPE'
    end
    object ADO64SHIPMENT_NO: TSmallintField
      FieldName = 'SHIPMENT_NO'
    end
    object ADO64QUAN_SHIPPED: TIntegerField
      FieldName = 'QUAN_SHIPPED'
    end
    object ADO64DATE_ASSIGN: TDateTimeField
      FieldName = 'DATE_ASSIGN'
    end
    object ADO64ovsh_discount: TBCDField
      FieldName = 'ovsh_discount'
      Precision = 5
      Size = 2
    end
    object ADO64DATE_SHIPPED: TDateTimeField
      FieldName = 'DATE_SHIPPED'
    end
    object ADO64PACKING_SLIP_FLAG: TStringField
      FieldName = 'PACKING_SLIP_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADO64total_case: TFloatField
      FieldName = 'total_case'
      ReadOnly = True
    end
    object ADO64rkey64: TIntegerField
      FieldName = 'rkey64'
      ReadOnly = True
    end
    object ADO64packing_list_ptr: TIntegerField
      FieldName = 'packing_list_ptr'
    end
    object ADO64weigth: TBCDField
      FieldName = 'weigth'
      ReadOnly = True
      Precision = 25
      Size = 8
    end
    object ADO64assigntype: TStringField
      FieldName = 'assigntype'
      ReadOnly = True
      Size = 4
    end
    object ADO64SHIP_TO_ADDRESS_1: TStringField
      FieldName = 'SHIP_TO_ADDRESS_1'
      Size = 100
    end
    object ADO64SHIP_TO_CONTACT: TStringField
      FieldName = 'SHIP_TO_CONTACT'
    end
    object ADO64ZIP: TStringField
      FieldName = 'ZIP'
      Size = 10
    end
    object ADO64SHIP_TO_PHONE: TStringField
      FieldName = 'SHIP_TO_PHONE'
    end
    object ADO64LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 80
    end
    object ADO64STATE: TStringField
      FieldName = 'STATE'
      Size = 10
    end
    object ADO64rkey12: TIntegerField
      FieldName = 'rkey12'
      ReadOnly = True
    end
    object ADO64LOCNAME_FOR_FORM: TStringField
      FieldName = 'LOCNAME_FOR_FORM'
      Size = 100
    end
    object ADO64MISC_BARCODE_LABLE: TStringField
      FieldName = 'MISC_BARCODE_LABLE'
      Size = 100
    end
    object ADO64SHP_ADDR1_FOR_FORM: TStringField
      FieldName = 'SHP_ADDR1_FOR_FORM'
      Size = 100
    end
    object ADO64COFC_FORMAT_FILENAME: TStringField
      FieldName = 'COFC_FORMAT_FILENAME'
      Size = 100
    end
    object ADO64S3_BARCODE_LABLE: TStringField
      FieldName = 'S3_BARCODE_LABLE'
      Size = 100
    end
    object ADO64S4_BARCODE_LABLE: TStringField
      FieldName = 'S4_BARCODE_LABLE'
      Size = 100
    end
    object ADO64PACKGE_BARCODE_LABLE: TStringField
      FieldName = 'PACKGE_BARCODE_LABLE'
      Size = 100
    end
    object ADO64OPEN_SOS: TSmallintField
      FieldName = 'OPEN_SOS'
    end
    object ADO64PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object ADO64PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADO64CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADO64CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ADO64EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO64cartons_no: TIntegerField
      FieldName = 'cartons_no'
    end
    object ADO64rkey529_ptr: TIntegerField
      FieldName = 'rkey529_ptr'
    end
    object ADO64DSDesigner: TIntegerField
      FieldName = #21487#25253#20851#25968#37327
      ReadOnly = True
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 476
    Top = 26
  end
  object ADO529: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <
      item
        Name = 'rkey529'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'SELECT'#9'data0529.* ,'
      '        case data0529.tstatus '
      '        when 0 then '#39#26410#25552#20132#39' when 1 then '#39#24453#23457#26680#39
      '        when 2 then '#39#24050#23457#26680#39' when 3 then '#39#34987#36864#22238#39
      '        end as sstatus,'
      '        data0010.rkey as rkey10,'
      
        '        data0010.cust_code,data0010.customer_name,data0010.APPLY' +
        '_IN_TRANSIT,'
      
        '        data0012.location,data0012.SHIP_TO_CONTACT,data0010.cod_' +
        'flag,'
      '        data0005.employee_name,data0012.SHIP_TO_FAX'
      '  from  data0529  '
      
        '        inner join data0012 on data0529.ship_addr_ptr=data0012.r' +
        'key'
      '        inner join data0005 on data0529.empl_ptr=data0005.rkey '
      
        '        inner join data0010 on data0012.CUSTOMER_PTR=data0010.rk' +
        'ey'
      ' where data0529.rkey=:rkey529')
    Left = 118
    Top = 17
    object ADO529RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO529shipadvice_no: TStringField
      FieldName = 'shipadvice_no'
      Size = 10
    end
    object ADO529SHIP_ADDR_PTR: TIntegerField
      FieldName = 'SHIP_ADDR_PTR'
    end
    object ADO529empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object ADO529ATTN: TStringField
      FieldName = 'ATTN'
      Size = 50
    end
    object ADO529ATTN1: TStringField
      FieldName = 'ATTN1'
      Size = 50
    end
    object ADO529ATTN_CC: TStringField
      FieldName = 'ATTN_CC'
      Size = 50
    end
    object ADO529ADV_FROM: TStringField
      FieldName = 'ADV_FROM'
      Size = 50
    end
    object ADO529ADV_FROM_CC: TStringField
      FieldName = 'ADV_FROM_CC'
      Size = 50
    end
    object ADO529SHIP_FROM: TStringField
      FieldName = 'SHIP_FROM'
      Size = 80
    end
    object ADO529TO_PORT: TStringField
      FieldName = 'TO_PORT'
      Size = 100
    end
    object ADO529FAX_NO: TStringField
      FieldName = 'FAX_NO'
    end
    object ADO529SHIP_TO_PHONE: TStringField
      FieldName = 'SHIP_TO_PHONE'
    end
    object ADO529FAX_TO: TStringField
      FieldName = 'FAX_TO'
      Size = 80
    end
    object ADO529TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object ADO529MAWB_NO: TStringField
      FieldName = 'MAWB_NO'
    end
    object ADO529HAWB_NO: TStringField
      FieldName = 'HAWB_NO'
    end
    object ADO529FLIGHT_NO: TStringField
      FieldName = 'FLIGHT_NO'
    end
    object ADO529DEPA_DATE: TDateTimeField
      FieldName = 'DEPA_DATE'
    end
    object ADO529TSTATUS: TWordField
      FieldName = 'TSTATUS'
    end
    object ADO529sstatus: TStringField
      FieldName = 'sstatus'
      ReadOnly = True
      Size = 6
    end
    object ADO529cust_code: TStringField
      FieldName = 'cust_code'
      Size = 10
    end
    object ADO529customer_name: TStringField
      FieldName = 'customer_name'
      Size = 100
    end
    object ADO529APPLY_IN_TRANSIT: TWordField
      FieldName = 'APPLY_IN_TRANSIT'
    end
    object ADO529location: TStringField
      FieldName = 'location'
      Size = 80
    end
    object ADO529SHIP_TO_CONTACT: TStringField
      FieldName = 'SHIP_TO_CONTACT'
    end
    object ADO529cod_flag: TStringField
      FieldName = 'cod_flag'
      FixedChar = True
      Size = 1
    end
    object ADO529employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADO529SHIP_TO_FAX: TStringField
      FieldName = 'SHIP_TO_FAX'
    end
    object ADO529rkey10: TAutoIncField
      FieldName = 'rkey10'
      ReadOnly = True
    end
  end
  object ado04: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'table_name'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = Null
      end>
    SQL.Strings = (
      'select SEED_VALUE,SEED_FLAG from data0004'
      'where table_name=:table_name')
    Left = 365
    Top = 118
    object ado04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object ado04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
  object AQR530: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey64'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey529'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select * from data0530 where rkey64_ptr=:rkey64 and rkey529_ptr=' +
        ':rkey529')
    Left = 173
    Top = 97
    object AQR530rkey529_ptr: TIntegerField
      FieldName = 'rkey529_ptr'
    end
    object AQR530rkey64_PTR: TIntegerField
      FieldName = 'rkey64_PTR'
    end
    object AQR530cartons_no: TIntegerField
      FieldName = 'cartons_no'
    end
    object AQR530weight: TBCDField
      FieldName = 'weight'
      Precision = 10
      Size = 3
    end
    object AQR530reference_number: TStringField
      FieldName = 'reference_number'
      Size = 50
    end
    object AQR530remark1: TStringField
      FieldName = 'remark1'
      Size = 50
    end
    object AQR530remark2: TStringField
      FieldName = 'remark2'
      Size = 50
    end
    object AQR530remark3: TStringField
      FieldName = 'remark3'
      Size = 50
    end
    object AQR530remark4: TStringField
      FieldName = 'remark4'
      Size = 50
    end
    object AQR530quan_declare: TIntegerField
      FieldName = 'quan_declare'
    end
  end
  object QRY64: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey529'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT dbo.Data0064.RKEY, dbo.Data0064.SO_PTR, dbo.Data0064.pack' +
        'ing_list_ptr,dbo.Data0064.rkey529_ptr,'
      
        '      dbo.Data0064.PACKING_SLIP_FLAG, dbo.Data0064.DATE_SHIPPED,' +
        ' '
      
        '      dbo.Data0060.SALES_ORDER, dbo.Data0097.PO_NUMBER, dbo.Data' +
        '0097.PO_DATE,dbo.Data0060.SHIP_REG_TAX_ID as rkey15, '
      
        '      dbo.Data0005.EMPLOYEE_NAME, dbo.Data0064.QUAN_SHIPPED,dbo.' +
        'Data0530.cartons_no, '
      
        '      dbo.Data0064.ovsh_qty, dbo.Data0060.FOB, dbo.Data0060.REFE' +
        'RENCE_NUMBER, '
      
        '      dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC' +
        ',dbo.Data0025.ANALYSIS_CODE_2,'
      
        '      data0530.quan_declare * dbo.Data0064.REPORT_UNIT_VALUE1 * ' +
        '0.001 AS weigth,'
      
        '      dbo.Data0064.quan_shipped-isnull(data0064.rkey529_ptr,0) a' +
        's '#39#21487#25253#20851#25968#37327#39',data0530.quan_declare,'
      'case data0064.assign_type '
      '  when 0 then '#39#27491#24120#39' when 1 then '#39#36864#36135#39
      'end as assigntype'
      'FROM dbo.Data0064 INNER JOIN'
      
        '      dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.Data0060.RKEY IN' +
        'NER JOIN'
      
        '      dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.' +
        'RKEY INNER JOIN'
      '      dbo.Data0097 ON '
      
        '      dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY INNER ' +
        'JOIN'
      
        '      dbo.Data0005 ON dbo.Data0064.ENT_EMPL_PTR = dbo.Data0005.R' +
        'KEY inner join'
      '      data0530 on data0530.rkey64_ptr=data0064.rkey'
      'WHERE (dbo.Data0530.rkey529_ptr = :rkey529)')
    Left = 238
    Top = 235
    object QRY64RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object QRY64SO_PTR: TIntegerField
      FieldName = 'SO_PTR'
    end
    object QRY64packing_list_ptr: TIntegerField
      FieldName = 'packing_list_ptr'
    end
    object QRY64rkey529_ptr: TIntegerField
      FieldName = 'rkey529_ptr'
    end
    object QRY64PACKING_SLIP_FLAG: TStringField
      FieldName = 'PACKING_SLIP_FLAG'
      FixedChar = True
      Size = 1
    end
    object QRY64DATE_SHIPPED: TDateTimeField
      FieldName = 'DATE_SHIPPED'
    end
    object QRY64SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object QRY64PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object QRY64PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object QRY64EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object QRY64QUAN_SHIPPED: TIntegerField
      FieldName = 'QUAN_SHIPPED'
    end
    object QRY64ovsh_qty: TIntegerField
      FieldName = 'ovsh_qty'
    end
    object QRY64FOB: TStringField
      FieldName = 'FOB'
      Size = 50
    end
    object QRY64REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      Size = 50
    end
    object QRY64MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object QRY64MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object QRY64weigth: TBCDField
      FieldName = 'weigth'
      ReadOnly = True
      Precision = 24
      Size = 7
    end
    object QRY64assigntype: TStringField
      FieldName = 'assigntype'
      ReadOnly = True
      Size = 4
    end
    object QRY64rkey15: TIntegerField
      FieldName = 'rkey15'
    end
    object QRY64ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 80
    end
    object QRY64cartons_no: TIntegerField
      FieldName = 'cartons_no'
    end
    object QRY64DSDesigner: TIntegerField
      FieldName = #21487#25253#20851#25968#37327
      ReadOnly = True
    end
    object QRY64quan_declare: TIntegerField
      FieldName = 'quan_declare'
    end
  end
  object ADS529: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADS529CalcFields
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
    Prepared = True
    SQL.Strings = (
      'SELECT'#9'data0529.* ,'
      '        case data0529.tstatus '
      '        when 0 then '#39#26410#25552#20132#39' when 1 then '#39#24453#23457#26680#39
      '        when 2 then '#39#24050#23457#26680#39' when 3 then '#39#34987#36864#22238#39
      '        end as sstatus,'
      '        data0010.rkey as rkey10,'
      
        '        data0010.cust_code,data0010.customer_name,data0010.APPLY' +
        '_IN_TRANSIT,'
      
        '        data0012.location,data0012.SHIP_TO_CONTACT,data0010.cod_' +
        'flag,'
      '        data0005.employee_name,data0012.SHIP_TO_FAX'
      '  from  data0529  '
      
        '        inner join data0012 on data0529.ship_addr_ptr=data0012.r' +
        'key'
      '        inner join data0005 on data0529.empl_ptr=data0005.rkey '
      
        '        inner join data0010 on data0012.CUSTOMER_PTR=data0010.rk' +
        'ey'
      'where data0529.tdate>=:dtpk1 and data0529.tdate<=:dtpk2')
    Left = 195
    Top = 24
    object ADS529RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS529shipadvice_no: TStringField
      FieldName = 'shipadvice_no'
      Size = 10
    end
    object ADS529SHIP_ADDR_PTR: TIntegerField
      FieldName = 'SHIP_ADDR_PTR'
    end
    object ADS529empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object ADS529ATTN: TStringField
      FieldName = 'ATTN'
      Size = 50
    end
    object ADS529ATTN1: TStringField
      FieldName = 'ATTN1'
      Size = 50
    end
    object ADS529ATTN_CC: TStringField
      FieldName = 'ATTN_CC'
      Size = 50
    end
    object ADS529ADV_FROM: TStringField
      FieldName = 'ADV_FROM'
      Size = 50
    end
    object ADS529ADV_FROM_CC: TStringField
      FieldName = 'ADV_FROM_CC'
      Size = 50
    end
    object ADS529SHIP_FROM: TStringField
      FieldName = 'SHIP_FROM'
      Size = 80
    end
    object ADS529TO_PORT: TStringField
      FieldName = 'TO_PORT'
      Size = 100
    end
    object ADS529FAX_NO: TStringField
      FieldName = 'FAX_NO'
    end
    object ADS529SHIP_TO_PHONE: TStringField
      FieldName = 'SHIP_TO_PHONE'
    end
    object ADS529FAX_TO: TStringField
      FieldName = 'FAX_TO'
      Size = 80
    end
    object ADS529TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object ADS529MAWB_NO: TStringField
      FieldName = 'MAWB_NO'
    end
    object ADS529HAWB_NO: TStringField
      FieldName = 'HAWB_NO'
    end
    object ADS529FLIGHT_NO: TStringField
      FieldName = 'FLIGHT_NO'
    end
    object ADS529DEPA_DATE: TDateTimeField
      FieldName = 'DEPA_DATE'
    end
    object ADS529TSTATUS: TWordField
      FieldName = 'TSTATUS'
    end
    object ADS529sstatus: TStringField
      FieldName = 'sstatus'
      ReadOnly = True
      Size = 6
    end
    object ADS529cust_code: TStringField
      FieldName = 'cust_code'
      Size = 10
    end
    object ADS529customer_name: TStringField
      FieldName = 'customer_name'
      Size = 100
    end
    object ADS529APPLY_IN_TRANSIT: TWordField
      FieldName = 'APPLY_IN_TRANSIT'
    end
    object ADS529location: TStringField
      FieldName = 'location'
      Size = 80
    end
    object ADS529SHIP_TO_CONTACT: TStringField
      FieldName = 'SHIP_TO_CONTACT'
    end
    object ADS529cod_flag: TStringField
      FieldName = 'cod_flag'
      FixedChar = True
      Size = 1
    end
    object ADS529employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADS529SHIP_TO_FAX: TStringField
      FieldName = 'SHIP_TO_FAX'
    end
    object ADS529rkey10: TAutoIncField
      FieldName = 'rkey10'
      ReadOnly = True
    end
    object ADS529IntegerField: TIntegerField
      FieldKind = fkCalculated
      FieldName = #25968#37327#27719#24635
      Calculated = True
    end
    object ADS529IntegerField2: TIntegerField
      FieldKind = fkCalculated
      FieldName = #31665#25968#27719#24635
      Calculated = True
    end
    object ADS529Field: TFloatField
      FieldKind = fkCalculated
      FieldName = #24635#20215#27719#24635
      Calculated = True
    end
    object ADS529FloatField: TFloatField
      FieldKind = fkCalculated
      FieldName = #20928#37325#27719#24635
      Calculated = True
    end
    object ADS529FloatField2: TFloatField
      FieldKind = fkCalculated
      FieldName = #27611#37325#27719#24635
      Calculated = True
    end
  end
  object DataSource3: TDataSource
    DataSet = ADO529
    Left = 71
    Top = 230
  end
  object AQ530: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0530 ')
    Left = 136
    Top = 151
    object AQ530rkey529_ptr: TIntegerField
      FieldName = 'rkey529_ptr'
    end
    object AQ530rkey64_PTR: TIntegerField
      FieldName = 'rkey64_PTR'
    end
    object AQ530cartons_no: TIntegerField
      FieldName = 'cartons_no'
    end
    object AQ530weight: TBCDField
      FieldName = 'weight'
      Precision = 10
      Size = 3
    end
    object AQ530reference_number: TStringField
      FieldName = 'reference_number'
      Size = 50
    end
    object AQ530remark1: TStringField
      FieldName = 'remark1'
      Size = 50
    end
    object AQ530remark2: TStringField
      FieldName = 'remark2'
      Size = 50
    end
    object AQ530remark3: TStringField
      FieldName = 'remark3'
      Size = 50
    end
    object AQ530remark4: TStringField
      FieldName = 'remark4'
      Size = 50
    end
    object AQ530quan_declare: TIntegerField
      FieldName = 'quan_declare'
    end
  end
  object AQ64: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
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
      
        'SELECT dbo.Data0064.RKEY, dbo.Data0064.SO_PTR, dbo.Data0064.pack' +
        'ing_list_ptr,dbo.Data0064.rkey529_ptr,'
      
        '      dbo.Data0064.PACKING_SLIP_FLAG, dbo.Data0064.DATE_SHIPPED,' +
        '   dbo.Data0064.QUAN_SHIPPED, dbo.data0064.cartons_no,'
      
        '      dbo.Data0064.ovsh_qty, (dbo.Data0064.QUAN_SHIPPED-isnull(d' +
        'bo.Data0064.rkey529_ptr,0)) * dbo.Data0064.REPORT_UNIT_VALUE1 * ' +
        '0.001 AS weigth,'
      '      dbo.Data0064.report_unit_value1,'
      '      dbo.Data0439.reference_number'
      'FROM dbo.Data0064 '
      'inner join'
      'data0439 on data0064.packing_list_ptr=data0439.rkey'
      'WHERE (dbo.Data0064.rkey = :rkey)')
    Left = 242
    Top = 288
    object AQ64RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQ64SO_PTR: TIntegerField
      FieldName = 'SO_PTR'
    end
    object AQ64packing_list_ptr: TIntegerField
      FieldName = 'packing_list_ptr'
    end
    object AQ64rkey529_ptr: TIntegerField
      FieldName = 'rkey529_ptr'
    end
    object AQ64PACKING_SLIP_FLAG: TStringField
      FieldName = 'PACKING_SLIP_FLAG'
      FixedChar = True
      Size = 1
    end
    object AQ64DATE_SHIPPED: TDateTimeField
      FieldName = 'DATE_SHIPPED'
    end
    object AQ64QUAN_SHIPPED: TIntegerField
      FieldName = 'QUAN_SHIPPED'
    end
    object AQ64cartons_no: TIntegerField
      FieldName = 'cartons_no'
    end
    object AQ64ovsh_qty: TIntegerField
      FieldName = 'ovsh_qty'
    end
    object AQ64weigth: TBCDField
      FieldName = 'weigth'
      ReadOnly = True
      Precision = 24
      Size = 7
    end
    object AQ64report_unit_value1: TBCDField
      FieldName = 'report_unit_value1'
      Precision = 9
    end
    object AQ64reference_number: TStringField
      FieldName = 'reference_number'
    end
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 547
    Top = 24
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 543
    Top = 80
  end
end
