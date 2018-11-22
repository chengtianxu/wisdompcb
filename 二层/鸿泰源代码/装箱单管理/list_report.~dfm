object Form6: TForm6
  Left = 415
  Top = 195
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Form6'
  ClientHeight = 430
  ClientWidth = 280
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DataSource1: TDataSource
    DataSet = aq0439
    Left = 88
    Top = 18
  end
  object DataSource2: TDataSource
    DataSet = aq64
    Left = 88
    Top = 69
  end
  object aq0439: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      
        'SELECT     dbo.data0439.delivery_no, dbo.Data0010.CUST_CODE, dbo' +
        '.Data0010.PHONE, dbo.Data0010.FAX, dbo.Data0010.CUSTOMER_NAME, '
      
        '                      dbo.Data0010.BILLING_ADDRESS_1, dbo.Data00' +
        '05.EMPLOYEE_NAME, dbo.Data0012.LOCATION, dbo.Data0010.FED_TAX_ID' +
        '_NO, '
      
        '                      dbo.Data0012.SHIP_TO_ADDRESS_1, dbo.Data00' +
        '02.UNIT_CODE, dbo.Data0010.APPLY_IN_TRANSIT, dbo.Data0002.UNIT_N' +
        'AME, '
      
        '                      d05.EMPLOYEE_NAME AS SALES_REP_NAME, dbo.d' +
        'ata0439.Remark_bak as '#20851#32852#21407#23458#25143', dbo.Data0112.invoice_number, dbo.da' +
        'ta0439.shipping_method, dbo.data0439.fob, '
      
        '                      dbo.data0439.cartons_no, dbo.data0439.weig' +
        'ht, dbo.data0439.net_weight, dbo.data0439.date_sailing, dbo.data' +
        '0439.date_ent, dbo.data0439.reference_number, '
      
        '                      dbo.data0439.charge, dbo.data0439.Remark, ' +
        'dbo.data0439.print_date, dbo.data0439.fh_location, dbo.Data0012.' +
        'STATE, dbo.Data0250.COUNTRY_CODE, '
      
        '                      dbo.Data0250.COUNTRY_NAME, dbo.data0439.rk' +
        'ey, dbo.data0439.customer_ptr, dbo.Data0010.CONTACT_NAME_1 AS '#19994#21153 +
        #32852#31995#20154',dbo.data0012.LOCNAME_FOR_FORM, '
      
        '                      dbo.Data0010.CONT_PHONE_1 AS '#19994#21153#32852#31995#30005#35805', dbo.D' +
        'ata0015.WAREHOUSE_CODE as '#24037#21378#20195#30721', dbo.Data0015.ABBR_NAME as '#24037#21378#31616#31216','#39 +
        '*'#39' + dbo.data0439.delivery_no + '#39'*'#39' as '#35013#36816#21333#21495'_39'#30721' '
      'FROM         dbo.data0439 INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.data0439.customer_ptr ' +
        '= dbo.Data0010.RKEY INNER JOIN'
      
        '                      dbo.Data0012 ON dbo.data0439.ship_addr_ptr' +
        ' = dbo.Data0012.RKEY INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.data0439.unit_ptr = db' +
        'o.Data0002.RKEY INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.data0439.employee_ptr ' +
        '= dbo.Data0005.RKEY INNER JOIN'
      
        '                      dbo.Data0005 AS d05 ON dbo.Data0010.SALES_' +
        'REP_PTR = d05.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0015 ON dbo.data0439.warehouse_ptr' +
        ' = dbo.Data0015.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0250 ON dbo.Data0012.COUNTRY_PTR =' +
        ' dbo.Data0250.COUNTRY_RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0112 ON dbo.data0439.invoice_ptr =' +
        ' dbo.Data0112.RKEY'
      'where data0439.rkey=:rkey')
    Left = 32
    Top = 18
    object aq0439delivery_no: TStringField
      FieldName = 'delivery_no'
      Size = 10
    end
    object aq0439CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object aq0439CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object aq0439BILLING_ADDRESS_1: TStringField
      FieldName = 'BILLING_ADDRESS_1'
      Size = 100
    end
    object aq0439EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aq0439LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 80
    end
    object aq0439SHIP_TO_ADDRESS_1: TStringField
      FieldName = 'SHIP_TO_ADDRESS_1'
      Size = 100
    end
    object aq0439UNIT_CODE: TStringField
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object aq0439UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object aq0439SALES_REP_NAME: TStringField
      FieldName = 'SALES_REP_NAME'
    end
    object aq0439invoice_number: TStringField
      FieldName = 'invoice_number'
      FixedChar = True
      Size = 12
    end
    object aq0439shipping_method: TStringField
      FieldName = 'shipping_method'
    end
    object aq0439fob: TStringField
      FieldName = 'fob'
      Size = 50
    end
    object aq0439cartons_no: TIntegerField
      FieldName = 'cartons_no'
    end
    object aq0439weight: TFloatField
      FieldName = 'weight'
    end
    object aq0439net_weight: TFloatField
      FieldName = 'net_weight'
    end
    object aq0439date_sailing: TDateTimeField
      FieldName = 'date_sailing'
    end
    object aq0439date_ent: TDateTimeField
      FieldName = 'date_ent'
    end
    object aq0439reference_number: TStringField
      FieldName = 'reference_number'
      Size = 50
    end
    object aq0439charge: TFloatField
      FieldName = 'charge'
    end
    object aq0439remark: TStringField
      FieldName = 'remark'
      Size = 50
    end
    object aq0439print_date: TDateTimeField
      FieldName = 'print_date'
    end
    object aq0439fh_location: TStringField
      FieldName = 'fh_location'
      Size = 50
    end
    object aq0439STATE: TStringField
      FieldName = 'STATE'
      Size = 10
    end
    object aq0439COUNTRY_CODE: TStringField
      FieldName = 'COUNTRY_CODE'
      Size = 5
    end
    object aq0439COUNTRY_NAME: TStringField
      FieldName = 'COUNTRY_NAME'
      Size = 30
    end
    object aq0439rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aq0439customer_ptr: TIntegerField
      FieldName = 'customer_ptr'
    end
    object aq0439FED_TAX_ID_NO: TStringField
      DisplayLabel = #20184#27454#26041#27861
      FieldName = 'FED_TAX_ID_NO'
    end
    object aq0439PHONE: TStringField
      FieldName = 'PHONE'
      FixedChar = True
    end
    object aq0439FAX: TStringField
      FieldName = 'FAX'
      FixedChar = True
    end
    object aq0439APPLY_IN_TRANSIT: TWordField
      FieldName = 'APPLY_IN_TRANSIT'
    end
    object aq0439DSDesigner: TStringField
      FieldName = #19994#21153#32852#31995#20154
      FixedChar = True
    end
    object aq0439DSDesigner2: TStringField
      FieldName = #19994#21153#32852#31995#30005#35805
      FixedChar = True
      Size = 14
    end
    object aq0439DSDesigner3: TStringField
      FieldName = #20851#32852#21407#23458#25143
      Size = 50
    end
    object aq0439DSDesigner4: TStringField
      FieldName = #24037#21378#20195#30721
      Size = 5
    end
    object aq0439DSDesigner5: TStringField
      FieldName = #24037#21378#31616#31216
      Size = 10
    end
    object strngfldaq0439_39: TStringField
      FieldName = #35013#36816#21333#21495'_39'#30721
      ReadOnly = True
      Size = 12
    end
    object strngfldaq0439LOCNAME_FOR_FORM: TStringField
      FieldName = 'LOCNAME_FOR_FORM'
      Size = 100
    end
  end
  object aq64: TADOQuery
    Active = True
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    OnCalcFields = aq64CalcFields
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
    SQL.Strings = (
      
        'SELECT TOP 100 PERCENT  dbo.Data0064.RKEY, dbo.Data0064.SHIPMENT' +
        '_NO,'
      
        '      Data0064.QUAN_SHIPPED, Data0064.REMARK,Data0064.part_price' +
        ','
      
        '      Data0064.QUAN_SHIPPED * Data0064.REPORT_UNIT_VALUE1 * 0.00' +
        '1 AS weight,'
      '      Data0060.SALES_ORDER, dbo.Data0060.FOB,'
      '      Data0060.REFERENCE_NUMBER, dbo.Data0060.TOTAL_ADD_L_PRICE,'
      '      Data0025.MANU_PART_DESC,Data0025.MANU_PART_NUMBER,'
      '      Data0025.ANALYSIS_CODE_1,Data0025.ANALYSIS_CODE_2,'
      '      Data0025.set_qty,Data0064.REPORT_UNIT_VALUE1,'
      '      Data0097.PO_NUMBER,Data0097.PO_DATE,'
      
        '      dbo.Data0011.NOTE_PAD_LINE_1, dbo.Data0011.NOTE_PAD_LINE_2' +
        ', '
      
        '      dbo.Data0011.NOTE_PAD_LINE_3, dbo.Data0011.NOTE_PAD_LINE_4' +
        ', '
      '      dbo.Data0060.COMMISION_ON_TOOLING, dbo.Data0064.TAX_2, '
      
        '      dbo.Data0060.tax_in_price,data0060.ANALYSIS_CODE_1 as ANAL' +
        'YSIS_code60_1,'
      
        '      '#39'*'#39' + data0060.ANALYSIS_CODE_1 + '#39'*'#39' as Bar39_ANALYSIS_cod' +
        'e60_1,'
      '      data0060.ANALYSIS_CODE_2 as ANALYSIS_code60_2,'
      '      data0060.ANALYSIS_CODE_3 as ANALYSIS_code60_3,'
      '      data0060.PARTS_ORDERED,data0060.PARTS_SHIPPED,'
      '      data0060.PARTS_RETURNED,data0060.RETURNED_SHIP,'
      #9#39'*'#39'+data0097.PO_NUMBER+'#39'*'#39' as '#23458#25143#35746#21333#21495'_39'#30721','
      #9#39'*'#39'+ data0025.MANU_PART_DESC + '#39'*'#39' as '#23458#25143#22411#21495'_39'#30721','
      #9#39'*'#39'+ Data0025.ANALYSIS_CODE_2 + '#39'*'#39' as '#23458#25143#29289#26009#21495'_39'#30721','
      #9#39'*'#39'+ CAST(QUAN_SHIPPED as VARCHAR(100)) + '#39'*'#39' as '#25968#37327'_39'#30721','
      'row_number()over(order by data0064.RKEY )as '#34892#21495
      'FROM Data0064 INNER JOIN'
      '      Data0060 ON Data0064.SO_PTR = Data0060.RKEY INNER JOIN'
      
        '      Data0025 ON Data0060.CUST_PART_PTR = Data0025.RKEY INNER J' +
        'OIN'
      '      Data0097 ON'
      
        '      Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY LEFT OUTER JOI' +
        'N'
      
        '      dbo.Data0011 ON dbo.Data0064.RKEY = dbo.Data0011.FILE_POIN' +
        'TER AND'
      '      dbo.Data0011.SOURCE_TYPE = 64'
      'WHERE (Data0064.packing_list_ptr = :rkey)')
    Left = 32
    Top = 69
    object aq64rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aq64shipment_no: TSmallintField
      FieldName = 'shipment_no'
    end
    object aq64sales_order: TStringField
      FieldName = 'sales_order'
      FixedChar = True
      Size = 12
    end
    object aq64po_number: TStringField
      FieldName = 'po_number'
      Size = 25
    end
    object aq64po_date: TDateTimeField
      FieldName = 'po_date'
    end
    object aq64QUAN_SHIPPED: TIntegerField
      FieldName = 'QUAN_SHIPPED'
    end
    object aq64NOTE_PAD_LINE_1: TStringField
      FieldName = 'NOTE_PAD_LINE_1'
      Size = 70
    end
    object aq64NOTE_PAD_LINE_2: TStringField
      FieldName = 'NOTE_PAD_LINE_2'
      Size = 70
    end
    object aq64NOTE_PAD_LINE_3: TStringField
      FieldName = 'NOTE_PAD_LINE_3'
      Size = 70
    end
    object aq64NOTE_PAD_LINE_4: TStringField
      FieldName = 'NOTE_PAD_LINE_4'
      Size = 70
    end
    object aq64fob: TStringField
      FieldName = 'fob'
      Size = 50
    end
    object aq64REFERENCE_NUMBER: TStringField
      DisplayWidth = 30
      FieldName = 'REFERENCE_NUMBER'
      FixedChar = True
      Size = 50
    end
    object aq64ANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
      Size = 30
    end
    object aq64ANALYSIS_CODE_2: TStringField
      DisplayWidth = 30
      FieldName = 'ANALYSIS_CODE_2'
      Size = 80
    end
    object aq64REPORT_UNIT_VALUE1: TFloatField
      FieldName = 'REPORT_UNIT_VALUE1'
    end
    object aq64weight: TFloatField
      FieldName = 'weight'
      ReadOnly = True
    end
    object aq64remark: TStringField
      FieldName = 'remark'
      Size = 50
    end
    object aq64part_price: TFloatField
      FieldName = 'part_price'
    end
    object aq64TOTAL_ADD_L_PRICE: TFloatField
      DisplayLabel = #24037#20855#36153#29992'('#19981#21547#31246')'
      FieldName = 'TOTAL_ADD_L_PRICE'
    end
    object aq64tools_taxprice: TFloatField
      DisplayLabel = #24037#20855#36153#29992'('#21547#31246')'
      FieldKind = fkCalculated
      FieldName = 'tools_taxprice'
      Calculated = True
    end
    object aq64COMMISION_ON_TOOLING: TStringField
      FieldName = 'COMMISION_ON_TOOLING'
      FixedChar = True
      Size = 1
    end
    object aq64TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object aq64tax_in_price: TStringField
      DisplayLabel = #20215#26684#21547#31246
      FieldName = 'tax_in_price'
      FixedChar = True
      Size = 1
    end
    object aq64taxprice: TFloatField
      DisplayLabel = #21547#31246#20215
      FieldKind = fkCalculated
      FieldName = 'taxprice'
      Calculated = True
    end
    object aq64taxamount: TFloatField
      DisplayLabel = #21547#31246#37329#39069
      FieldKind = fkCalculated
      FieldName = 'taxamount'
      Calculated = True
    end
    object aq64notaxprice: TFloatField
      DisplayLabel = #19981#21547#31246#20215
      FieldKind = fkCalculated
      FieldName = 'notaxprice'
      Calculated = True
    end
    object aq64notaxamount: TFloatField
      DisplayLabel = #19981#21547#31246#37329#39069
      FieldKind = fkCalculated
      FieldName = 'notaxamount'
      Calculated = True
    end
    object aq64MANU_PART_DESC: TStringField
      DisplayWidth = 40
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object aq64MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object aq64set_qty: TIntegerField
      FieldName = 'set_qty'
    end
    object aq64ANALYSIS_code60_1: TStringField
      FieldName = 'ANALYSIS_code60_1'
    end
    object aq64ANALYSIS_code60_2: TStringField
      FieldName = 'ANALYSIS_code60_2'
    end
    object aq64ANALYSIS_code60_3: TStringField
      FieldName = 'ANALYSIS_code60_3'
    end
    object aq64PARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object aq64PARTS_SHIPPED: TFloatField
      FieldName = 'PARTS_SHIPPED'
    end
    object aq64PARTS_RETURNED: TFloatField
      FieldName = 'PARTS_RETURNED'
    end
    object aq64RETURNED_SHIP: TIntegerField
      FieldName = 'RETURNED_SHIP'
    end
    object strngfldaq64_39: TStringField
      FieldName = #23458#25143#35746#21333#21495'_39'#30721
      ReadOnly = True
      Size = 34
    end
    object strngfldaq64_392: TStringField
      FieldName = #23458#25143#22411#21495'_39'#30721
      ReadOnly = True
      Size = 82
    end
    object strngfldaq64_393: TStringField
      FieldName = #23458#25143#29289#26009#21495'_39'#30721
      ReadOnly = True
      Size = 82
    end
    object strngfldaq64_394: TStringField
      FieldName = #25968#37327'_39'#30721
      ReadOnly = True
      Size = 102
    end
    object aq64DSDesigner: TLargeintField
      FieldName = #34892#21495
      ReadOnly = True
    end
    object intgrfldaq64allqty: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'allqty'
      Calculated = True
    end
    object strngfldaq64Bar39_ANALYSIS_code60_1: TStringField
      FieldName = 'Bar39_ANALYSIS_code60_1'
      ReadOnly = True
      Size = 22
    end
  end
  object Aq11: TADOQuery
    Connection = DM.ADOConnection1
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
      'select memo_text from data0011'
      'where source_type=439 and '
      '           file_pointer=:rkey')
    Left = 32
    Top = 120
    object Aq11memo_text: TMemoField
      FieldName = 'memo_text'
      BlobType = ftMemo
    end
  end
  object DataSource3: TDataSource
    DataSet = Aq11
    Left = 88
    Top = 120
  end
  object ppDB64: TppDBPipeline
    DataSource = DataSource2
    UserName = 'DB64'
    Left = 144
    Top = 69
    MasterDataPipelineName = 'ppDB439'
    object ppDB64ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'rkey'
      FieldName = 'rkey'
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 0
      Position = 0
    end
    object ppDB64ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'shipment_no'
      FieldName = 'shipment_no'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDB64ppField3: TppField
      FieldAlias = 'sales_order'
      FieldName = 'sales_order'
      FieldLength = 12
      DisplayWidth = 12
      Position = 2
    end
    object ppDB64ppField4: TppField
      FieldAlias = 'po_number'
      FieldName = 'po_number'
      FieldLength = 25
      DisplayWidth = 25
      Position = 3
    end
    object ppDB64ppField5: TppField
      FieldAlias = 'po_date'
      FieldName = 'po_date'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object ppDB64ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUAN_SHIPPED'
      FieldName = 'QUAN_SHIPPED'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object ppDB64ppField7: TppField
      FieldAlias = 'NOTE_PAD_LINE_1'
      FieldName = 'NOTE_PAD_LINE_1'
      FieldLength = 70
      DisplayWidth = 70
      Position = 6
    end
    object ppDB64ppField8: TppField
      FieldAlias = 'NOTE_PAD_LINE_2'
      FieldName = 'NOTE_PAD_LINE_2'
      FieldLength = 70
      DisplayWidth = 70
      Position = 7
    end
    object ppDB64ppField9: TppField
      FieldAlias = 'NOTE_PAD_LINE_3'
      FieldName = 'NOTE_PAD_LINE_3'
      FieldLength = 70
      DisplayWidth = 70
      Position = 8
    end
    object ppDB64ppField10: TppField
      FieldAlias = 'NOTE_PAD_LINE_4'
      FieldName = 'NOTE_PAD_LINE_4'
      FieldLength = 70
      DisplayWidth = 70
      Position = 9
    end
    object ppDB64ppField11: TppField
      FieldAlias = 'fob'
      FieldName = 'fob'
      FieldLength = 50
      DisplayWidth = 50
      Position = 10
    end
    object ppDB64ppField12: TppField
      FieldAlias = 'REFERENCE_NUMBER'
      FieldName = 'REFERENCE_NUMBER'
      FieldLength = 50
      DisplayWidth = 30
      Position = 11
    end
    object ppDB64ppField13: TppField
      FieldAlias = 'ANALYSIS_CODE_1'
      FieldName = 'ANALYSIS_CODE_1'
      FieldLength = 30
      DisplayWidth = 30
      Position = 12
    end
    object ppDB64ppField14: TppField
      FieldAlias = 'ANALYSIS_CODE_2'
      FieldName = 'ANALYSIS_CODE_2'
      FieldLength = 80
      DisplayWidth = 30
      Position = 13
    end
    object ppDB64ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'REPORT_UNIT_VALUE1'
      FieldName = 'REPORT_UNIT_VALUE1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppDB64ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'weight'
      FieldName = 'weight'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppDB64ppField17: TppField
      FieldAlias = 'remark'
      FieldName = 'remark'
      FieldLength = 50
      DisplayWidth = 50
      Position = 16
    end
    object ppDB64ppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'part_price'
      FieldName = 'part_price'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppDB64ppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL_ADD_L_PRICE'
      FieldName = 'TOTAL_ADD_L_PRICE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppDB64ppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'tools_taxprice'
      FieldName = 'tools_taxprice'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppDB64ppField21: TppField
      FieldAlias = 'COMMISION_ON_TOOLING'
      FieldName = 'COMMISION_ON_TOOLING'
      FieldLength = 1
      DisplayWidth = 1
      Position = 20
    end
    object ppDB64ppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'TAX_2'
      FieldName = 'TAX_2'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 5
      Position = 21
    end
    object ppDB64ppField23: TppField
      FieldAlias = 'tax_in_price'
      FieldName = 'tax_in_price'
      FieldLength = 1
      DisplayWidth = 1
      Position = 22
    end
    object ppDB64ppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'taxprice'
      FieldName = 'taxprice'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object ppDB64ppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'taxamount'
      FieldName = 'taxamount'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object ppDB64ppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'notaxprice'
      FieldName = 'notaxprice'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object ppDB64ppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'notaxamount'
      FieldName = 'notaxamount'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object ppDB64ppField28: TppField
      FieldAlias = 'MANU_PART_DESC'
      FieldName = 'MANU_PART_DESC'
      FieldLength = 80
      DisplayWidth = 40
      Position = 27
    end
    object ppDB64ppField29: TppField
      FieldAlias = 'MANU_PART_NUMBER'
      FieldName = 'MANU_PART_NUMBER'
      FieldLength = 20
      DisplayWidth = 20
      Position = 28
    end
    object ppDB64ppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'set_qty'
      FieldName = 'set_qty'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 29
    end
    object ppDB64ppField31: TppField
      FieldAlias = 'ANALYSIS_code60_1'
      FieldName = 'ANALYSIS_code60_1'
      FieldLength = 20
      DisplayWidth = 20
      Position = 30
    end
    object ppDB64ppField32: TppField
      FieldAlias = 'ANALYSIS_code60_2'
      FieldName = 'ANALYSIS_code60_2'
      FieldLength = 20
      DisplayWidth = 20
      Position = 31
    end
    object ppDB64ppField33: TppField
      FieldAlias = 'ANALYSIS_code60_3'
      FieldName = 'ANALYSIS_code60_3'
      FieldLength = 20
      DisplayWidth = 20
      Position = 32
    end
    object ppDB64ppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'PARTS_ORDERED'
      FieldName = 'PARTS_ORDERED'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object ppDB64ppField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'PARTS_SHIPPED'
      FieldName = 'PARTS_SHIPPED'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
    object ppDB64ppField36: TppField
      Alignment = taRightJustify
      FieldAlias = 'PARTS_RETURNED'
      FieldName = 'PARTS_RETURNED'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object ppDB64ppField37: TppField
      Alignment = taRightJustify
      FieldAlias = 'RETURNED_SHIP'
      FieldName = 'RETURNED_SHIP'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 36
    end
    object ppDB64ppField38: TppField
      FieldAlias = #23458#25143#35746#21333#21495'_39'#30721
      FieldName = #23458#25143#35746#21333#21495'_39'#30721
      FieldLength = 34
      DisplayWidth = 34
      Position = 37
    end
    object ppDB64ppField39: TppField
      FieldAlias = #23458#25143#22411#21495'_39'#30721
      FieldName = #23458#25143#22411#21495'_39'#30721
      FieldLength = 82
      DisplayWidth = 82
      Position = 38
    end
    object ppDB64ppField40: TppField
      FieldAlias = #23458#25143#29289#26009#21495'_39'#30721
      FieldName = #23458#25143#29289#26009#21495'_39'#30721
      FieldLength = 82
      DisplayWidth = 82
      Position = 39
    end
    object ppDB64ppField41: TppField
      FieldAlias = #25968#37327'_39'#30721
      FieldName = #25968#37327'_39'#30721
      FieldLength = 102
      DisplayWidth = 102
      Position = 40
    end
    object ppDB64ppField42: TppField
      FieldAlias = #34892#21495
      FieldName = #34892#21495
      FieldLength = 0
      DataType = dtLargeInt
      DisplayWidth = 15
      Position = 41
    end
    object ppDB64ppField43: TppField
      Alignment = taRightJustify
      FieldAlias = 'allqty'
      FieldName = 'allqty'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 42
    end
    object ppDB64ppField44: TppField
      FieldAlias = 'Bar39_ANALYSIS_code60_1'
      FieldName = 'Bar39_ANALYSIS_code60_1'
      FieldLength = 22
      DisplayWidth = 22
      Position = 43
    end
  end
  object ppDB11: TppDBPipeline
    DataSource = DataSource3
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB11'
    Left = 144
    Top = 120
    MasterDataPipelineName = 'ppDB439'
    object ppDB11ppField1: TppField
      FieldAlias = 'memo_text'
      FieldName = 'memo_text'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB64
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = #36865#36135#21333
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 10000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 10000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'D:\sjsys\NIERP\Report\packlist_list_Areport4.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport1PreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 218
    Top = 50
    Version = '7.01'
    mmColumnWidth = 197300
    DataPipelineName = 'ppDB64'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 33073
      mmPrintPosition = 0
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #28145#22323#24066#21326#20005#24935#28023#30005#23376#26377#38480#20844#21496
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 20
        Font.Style = []
        Transparent = True
        mmHeight = 8043
        mmLeft = 48154
        mmTop = 6350
        mmWidth = 91906
        BandType = 1
      end
      object ppDBText22: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'delivery_no'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4022
        mmLeft = 151342
        mmTop = 17198
        mmWidth = 19558
        BandType = 1
      end
      object ppSystemVariable7: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 26194
        mmTop = 25135
        mmWidth = 24077
        BandType = 1
      end
      object lbl1: TppLabel
        UserName = 'lbl1'
        Caption = #20986#24211#26085#26399#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 7408
        mmTop = 25135
        mmWidth = 17568
        BandType = 1
      end
      object lbl2: TppLabel
        UserName = 'lbl2'
        Caption = #20986#24211#21333#21495#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 132557
        mmTop = 17198
        mmWidth = 17568
        BandType = 1
      end
      object ppDBBarCode1: TppDBBarCode
        UserName = 'DBBarCode1'
        AutoSizeFont = False
        BarCodeType = bcCode39
        BarColor = clWindowText
        CalcCheckDigit = False
        DataField = #35013#36816#21333#21495'_39'#30721
        DataPipeline = ppDB439
        Alignment = taCenter
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 8731
        mmLeft = 129646
        mmTop = 22225
        mmWidth = 64294
        BandType = 1
        mmBarWidth = 254
        mmWideBarRatio = 76200
      end
    end
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppLabel12: TppLabel
        UserName = 'Label9'
        Caption = #37319#36141#21333#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 21960
        mmTop = 1588
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label11'
        Caption = #36135#29289#32534#30721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 55827
        mmTop = 1323
        mmWidth = 14055
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label12'
        Caption = #21697#21517#35268#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 89959
        mmTop = 1323
        mmWidth = 14055
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label13'
        Caption = #25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 116152
        mmTop = 1323
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label10'
        Caption = #22791#27880
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 177007
        mmTop = 1323
        mmWidth = 7144
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 6879
        mmTop = 0
        mmWidth = 180975
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6879
        mmLeft = 78317
        mmTop = 0
        mmWidth = 529
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 6615
        mmTop = 6614
        mmWidth = 181240
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6879
        mmLeft = 6615
        mmTop = 0
        mmWidth = 529
        BandType = 0
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6879
        mmLeft = 45508
        mmTop = 0
        mmWidth = 529
        BandType = 0
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6879
        mmLeft = 111919
        mmTop = 0
        mmWidth = 529
        BandType = 0
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6615
        mmLeft = 127794
        mmTop = 0
        mmWidth = 529
        BandType = 0
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 187325
        mmTop = 265
        mmWidth = 529
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 12435
        mmTop = 265
        mmWidth = 529
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = #24207#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 5556
        mmLeft = 7673
        mmTop = 265
        mmWidth = 4498
        BandType = 0
      end
      object lbl3: TppLabel
        UserName = 'lbl3'
        Caption = #21333#20301
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 128852
        mmTop = 1323
        mmWidth = 7027
        BandType = 0
      end
      object lbl4: TppLabel
        UserName = 'lbl4'
        Caption = #31665#25968
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 157692
        mmTop = 1588
        mmWidth = 7144
        BandType = 0
      end
      object lbl5: TppLabel
        UserName = 'lbl5'
        Caption = #22791#21697
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 141817
        mmTop = 1588
        mmWidth = 7144
        BandType = 0
      end
      object pln1: TppLine
        UserName = 'pln1'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6615
        mmLeft = 138377
        mmTop = 0
        mmWidth = 2381
        BandType = 0
      end
      object pln3: TppLine
        UserName = 'pln3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6615
        mmLeft = 150813
        mmTop = 0
        mmWidth = 2381
        BandType = 0
      end
      object pln5: TppLine
        UserName = 'pln5'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6615
        mmLeft = 170921
        mmTop = 0
        mmWidth = 2381
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 17198
      mmPrintPosition = 0
      object ppLine13: TppLine
        UserName = 'Line13'
        Weight = 0.750000000000000000
        mmHeight = 200
        mmLeft = 6615
        mmTop = 16933
        mmWidth = 180711
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 16933
        mmLeft = 78317
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 16933
        mmLeft = 6615
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 16933
        mmLeft = 45508
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 17198
        mmLeft = 187325
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 16933
        mmLeft = 111919
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 16933
        mmLeft = 127794
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 16933
        mmLeft = 12435
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = #34892#21495
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 3969
        mmLeft = 7144
        mmTop = 5556
        mmWidth = 5027
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'po_number'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 4022
        mmLeft = 13494
        mmTop = 529
        mmWidth = 17780
        BandType = 4
      end
      object ppDBBarCode2: TppDBBarCode
        UserName = 'DBBarCode2'
        AutoSizeFont = False
        BarCodeType = bcCode39
        BarColor = clWindowText
        CalcCheckDigit = False
        DataField = #23458#25143#35746#21333#21495'_39'#30721
        DataPipeline = ppDB64
        Alignment = taCenter
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 10583
        mmLeft = 13229
        mmTop = 5292
        mmWidth = 31485
        BandType = 4
        mmBarWidth = 168
        mmWideBarRatio = 76200
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'MANU_PART_DESC'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 4022
        mmLeft = 46567
        mmTop = 794
        mmWidth = 14224
        BandType = 4
      end
      object ppDBBarCode3: TppDBBarCode
        UserName = 'DBBarCode3'
        AutoSizeFont = False
        BarCodeType = bcCode39
        BarColor = clWindowText
        CalcCheckDigit = False
        DataField = #23458#25143#22411#21495'_39'#30721
        DataPipeline = ppDB64
        Alignment = taCenter
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 11113
        mmLeft = 46038
        mmTop = 5292
        mmWidth = 31221
        BandType = 4
        mmBarWidth = 168
        mmWideBarRatio = 76200
      end
      object ppDBText4: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'ANALYSIS_CODE_2'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 4022
        mmLeft = 79640
        mmTop = 794
        mmWidth = 23114
        BandType = 4
      end
      object ppDBBarCode4: TppDBBarCode
        UserName = 'DBBarCode4'
        AutoSizeFont = False
        BarCodeType = bcCode39
        BarColor = clWindowText
        CalcCheckDigit = False
        DataField = #23458#25143#29289#26009#21495'_39'#30721
        DataPipeline = ppDB64
        Alignment = taCenter
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 11113
        mmLeft = 79375
        mmTop = 5556
        mmWidth = 30956
        BandType = 4
        mmBarWidth = 168
        mmWideBarRatio = 76200
      end
      object ppDBText5: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'QUAN_SHIPPED'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 4022
        mmLeft = 112977
        mmTop = 1058
        mmWidth = 3556
        BandType = 4
      end
      object ppDBBarCode5: TppDBBarCode
        UserName = 'DBBarCode5'
        AutoSizeFont = False
        BarCodeType = bcCode39
        BarColor = clWindowText
        CalcCheckDigit = False
        DataField = #25968#37327'_39'#30721
        DataPipeline = ppDB64
        Alignment = taCenter
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 11113
        mmLeft = 112977
        mmTop = 5556
        mmWidth = 14023
        BandType = 4
        mmBarWidth = 168
        mmWideBarRatio = 76200
      end
      object pln2: TppLine
        UserName = 'pln2'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 16933
        mmLeft = 138377
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object pln4: TppLine
        UserName = 'pln4'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 16933
        mmLeft = 150813
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'NOTE_PAD_LINE_3'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 3979
        mmLeft = 139171
        mmTop = 5821
        mmWidth = 10837
        BandType = 4
      end
      object pln6: TppLine
        UserName = 'pln6'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 16933
        mmLeft = 170921
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText9'
        DataField = 'NOTE_PAD_LINE_2'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDB64'
        mmHeight = 10583
        mmLeft = 151607
        mmTop = 5292
        mmWidth = 18521
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText10'
        DataField = 'remark'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDB64'
        mmHeight = 15610
        mmLeft = 171715
        mmTop = 529
        mmWidth = 15081
        BandType = 4
      end
      object lbl6: TppLabel
        UserName = 'lbl6'
        Caption = 'PCS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 130440
        mmTop = 6085
        mmWidth = 5292
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand4: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 23548
      mmPrintPosition = 0
      object lbl13: TppLabel
        UserName = 'lbl13'
        Caption = #19968#65306#23384#26681#65288#30333#65289'  '#20108#65306#23458#25143#20179#24211#65288#32418#65289' '#19977'  '#65306#23458#25143#36130#21153#65288#40644#65289
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 7144
        mmTop = 18785
        mmWidth = 87313
        BandType = 7
      end
      object pln7: TppLine
        UserName = 'pln7'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 6615
        mmTop = 6085
        mmWidth = 180711
        BandType = 7
      end
      object pln8: TppLine
        UserName = 'pln8'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 6615
        mmTop = 0
        mmWidth = 529
        BandType = 7
      end
      object pln9: TppLine
        UserName = 'pln9'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 12435
        mmTop = 0
        mmWidth = 529
        BandType = 7
      end
      object pln10: TppLine
        UserName = 'pln10'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 45508
        mmTop = 0
        mmWidth = 529
        BandType = 7
      end
      object pln11: TppLine
        UserName = 'pln11'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 78317
        mmTop = 0
        mmWidth = 529
        BandType = 7
      end
      object pln12: TppLine
        UserName = 'pln12'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 111919
        mmTop = 0
        mmWidth = 529
        BandType = 7
      end
      object pln13: TppLine
        UserName = 'pln13'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 127794
        mmTop = 0
        mmWidth = 529
        BandType = 7
      end
      object pln14: TppLine
        UserName = 'pln14'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 138377
        mmTop = 0
        mmWidth = 529
        BandType = 7
      end
      object pln15: TppLine
        UserName = 'pln15'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 150813
        mmTop = 0
        mmWidth = 529
        BandType = 7
      end
      object pln16: TppLine
        UserName = 'pln16'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 170921
        mmTop = 0
        mmWidth = 529
        BandType = 7
      end
      object pln17: TppLine
        UserName = 'pln17'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 187325
        mmTop = 0
        mmWidth = 529
        BandType = 7
      end
      object lbl7: TppLabel
        UserName = 'lbl7'
        AutoSize = False
        Caption = #24635#35745
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 6879
        mmLeft = 7673
        mmTop = 0
        mmWidth = 4498
        BandType = 7
      end
      object lbl8: TppLabel
        UserName = 'lbl8'
        Caption = #21046#21333#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6879
        mmTop = 8996
        mmWidth = 9525
        BandType = 7
      end
      object lbl9: TppLabel
        UserName = 'lbl9'
        Caption = #23457#26680#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 54769
        mmTop = 8996
        mmWidth = 9525
        BandType = 7
      end
      object lbl10: TppLabel
        UserName = 'lbl10'
        Caption = #36865#36135#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 106627
        mmTop = 8996
        mmWidth = 9525
        BandType = 7
      end
      object lbl11: TppLabel
        UserName = 'lbl11'
        Caption = #31614#25910#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 151077
        mmTop = 8996
        mmWidth = 9525
        BandType = 7
      end
      object lbl12: TppLabel
        UserName = 'lbl12'
        Caption = 
          '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ' +
          '- - - - - - - - - - - - - - - - - - - - - - - - '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6879
        mmTop = 13758
        mmWidth = 180182
        BandType = 7
      end
      object ppDBText6: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'allqty'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 3969
        mmLeft = 112977
        mmTop = 1323
        mmWidth = 10583
        BandType = 7
      end
      object lbl14: TppLabel
        UserName = 'lbl14'
        Caption = 'lbl14'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 129117
        mmTop = 794
        mmWidth = 8996
        BandType = 7
      end
    end
    object ppPageStyle1: TppPageStyle
      EndPage = 0
      SinglePage = 0
      StartPage = 0
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {00}
    end
  end
  object aq0493: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 32
    Top = 171
    object aq0493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object aq0493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object aq0493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object aq0493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object aq0493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object aq0493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object aq0493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object DataSource4: TDataSource
    DataSet = aq0493
    Left = 88
    Top = 171
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource4
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 144
    Top = 171
    object ppDBPipeline4ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 50
      DisplayWidth = 30
      Position = 0
    end
    object ppDBPipeline4ppField2: TppField
      FieldAlias = 'ship_address'
      FieldName = 'ship_address'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBPipeline4ppField3: TppField
      FieldAlias = 'Company_Icon'
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline4ppField4: TppField
      FieldAlias = 'SITE_INFO_ADD_1'
      FieldName = 'SITE_INFO_ADD_1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDBPipeline4ppField5: TppField
      FieldAlias = 'SITE_INFO_ADD_2'
      FieldName = 'SITE_INFO_ADD_2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object ppDBPipeline4ppField6: TppField
      FieldAlias = 'SITE_INFO_ADD_3'
      FieldName = 'SITE_INFO_ADD_3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object ppDBPipeline4ppField7: TppField
      FieldAlias = 'SITE_INFO_PHONE'
      FieldName = 'SITE_INFO_PHONE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 6
    end
  end
  object ADO1011: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'customer_ptr'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select memo_text from data0011'
      'where source_type=2010 and '
      '           file_pointer=:customer_ptr')
    Left = 33
    Top = 219
    object ADO1011memo_text: TMemoField
      FieldName = 'memo_text'
      BlobType = ftMemo
    end
  end
  object DataSource5: TDataSource
    DataSet = ADO1011
    Left = 89
    Top = 219
  end
  object ppDB1011: TppDBPipeline
    DataSource = DataSource5
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB1011'
    Left = 145
    Top = 219
    MasterDataPipelineName = 'ppDB439'
  end
  object ppDB439: TppDBPipeline
    DataSource = DataSource1
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB439'
    Left = 144
    Top = 16
    object ppDB439ppField1: TppField
      FieldAlias = 'delivery_no'
      FieldName = 'delivery_no'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField2: TppField
      FieldAlias = 'CUST_CODE'
      FieldName = 'CUST_CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField3: TppField
      FieldAlias = 'CUSTOMER_NAME'
      FieldName = 'CUSTOMER_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField4: TppField
      FieldAlias = 'BILLING_ADDRESS_1'
      FieldName = 'BILLING_ADDRESS_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField5: TppField
      FieldAlias = 'EMPLOYEE_NAME'
      FieldName = 'EMPLOYEE_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField6: TppField
      FieldAlias = 'LOCATION'
      FieldName = 'LOCATION'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField7: TppField
      FieldAlias = 'SHIP_TO_ADDRESS_1'
      FieldName = 'SHIP_TO_ADDRESS_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField8: TppField
      FieldAlias = 'UNIT_CODE'
      FieldName = 'UNIT_CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField9: TppField
      FieldAlias = 'UNIT_NAME'
      FieldName = 'UNIT_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField10: TppField
      FieldAlias = 'SALES_REP_NAME'
      FieldName = 'SALES_REP_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField11: TppField
      FieldAlias = 'invoice_number'
      FieldName = 'invoice_number'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField12: TppField
      FieldAlias = 'shipping_method'
      FieldName = 'shipping_method'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField13: TppField
      FieldAlias = 'fob'
      FieldName = 'fob'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField14: TppField
      FieldAlias = 'cartons_no'
      FieldName = 'cartons_no'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField15: TppField
      FieldAlias = 'weight'
      FieldName = 'weight'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField16: TppField
      FieldAlias = 'net_weight'
      FieldName = 'net_weight'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField17: TppField
      FieldAlias = 'date_sailing'
      FieldName = 'date_sailing'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField18: TppField
      FieldAlias = 'date_ent'
      FieldName = 'date_ent'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField19: TppField
      FieldAlias = 'reference_number'
      FieldName = 'reference_number'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField20: TppField
      FieldAlias = 'charge'
      FieldName = 'charge'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField21: TppField
      FieldAlias = 'remark'
      FieldName = 'remark'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField22: TppField
      FieldAlias = 'print_date'
      FieldName = 'print_date'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField23: TppField
      FieldAlias = 'fh_location'
      FieldName = 'fh_location'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField24: TppField
      FieldAlias = 'STATE'
      FieldName = 'STATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField25: TppField
      FieldAlias = 'COUNTRY_CODE'
      FieldName = 'COUNTRY_CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField26: TppField
      FieldAlias = 'COUNTRY_NAME'
      FieldName = 'COUNTRY_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField27: TppField
      FieldAlias = 'rkey'
      FieldName = 'rkey'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField28: TppField
      FieldAlias = 'customer_ptr'
      FieldName = 'customer_ptr'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField29: TppField
      FieldAlias = 'FED_TAX_ID_NO'
      FieldName = 'FED_TAX_ID_NO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField30: TppField
      FieldAlias = 'PHONE'
      FieldName = 'PHONE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField31: TppField
      FieldAlias = 'FAX'
      FieldName = 'FAX'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField32: TppField
      FieldAlias = 'APPLY_IN_TRANSIT'
      FieldName = 'APPLY_IN_TRANSIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField33: TppField
      FieldAlias = #19994#21153#32852#31995#20154
      FieldName = #19994#21153#32852#31995#20154
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField34: TppField
      FieldAlias = #19994#21153#32852#31995#30005#35805
      FieldName = #19994#21153#32852#31995#30005#35805
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField35: TppField
      FieldAlias = #20851#32852#21407#23458#25143
      FieldName = #20851#32852#21407#23458#25143
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField36: TppField
      FieldAlias = #24037#21378#20195#30721
      FieldName = #24037#21378#20195#30721
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField37: TppField
      FieldAlias = #24037#21378#31616#31216
      FieldName = #24037#21378#31616#31216
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField38: TppField
      FieldAlias = #35013#36816#21333#21495'_39'#30721
      FieldName = #35013#36816#21333#21495'_39'#30721
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppDB439ppField39: TppField
      FieldAlias = 'LOCNAME_FOR_FORM'
      FieldName = 'LOCNAME_FOR_FORM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
  end
  object ppDesigner1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppReport1
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 248
    Top = 48
  end
end
