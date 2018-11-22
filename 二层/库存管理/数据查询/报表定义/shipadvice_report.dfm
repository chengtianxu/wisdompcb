object Form_shipadvice: TForm_shipadvice
  Left = 344
  Top = 239
  Width = 322
  Height = 382
  Caption = #21457#36135#36890#30693#21333#25253#34920#23450#20041
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ADO529: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'RKEY'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'SELECT'
      '      Data0529.shipadvice_no,'
      '      Data0529.ATTN, Data0529.ATTN1, Data0529.ATTN_CC,'
      
        '      Data0529.ADV_FROM, Data0529.ADV_FROM_CC, Data0529.SHIP_FRO' +
        'M,'
      '      Data0529.TO_PORT, Data0529.SHIP_TO_PHONE, Data0529.FAX_NO,'
      '      Data0529.FAX_TO, Data0529.TDATE, dbo.Data0529.MAWB_NO,'
      '      Data0529.HAWB_NO, Data0529.FLIGHT_NO,'
      '      Data0529.DEPA_DATE,'
      '      Data0012.LOCATION,'
      '      dbo.Data0010.CUST_CODE , dbo.Data0010.CUSTOMER_NAME ,'
      '      dbo.Data0005.EMPL_CODE , dbo.Data0005.EMPLOYEE_NAME'
      'FROM dbo.Data0010 INNER JOIN'
      
        '      dbo.Data0012 ON dbo.Data0010.RKEY = dbo.Data0012.CUSTOMER_' +
        'PTR INNER JOIN'
      
        '      dbo.Data0529 ON dbo.Data0012.RKEY = dbo.Data0529.SHIP_ADDR' +
        '_PTR INNER JOIN'
      '      dbo.Data0005 ON dbo.Data0529.empl_ptr = dbo.Data0005.RKEY'
      'where data0529.rkey=:RKEY')
    Left = 80
    Top = 96
    object ADO529shipadvice_no: TStringField
      FieldName = 'shipadvice_no'
      Size = 10
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
    object ADO529SHIP_TO_PHONE: TStringField
      FieldName = 'SHIP_TO_PHONE'
    end
    object ADO529FAX_NO: TStringField
      FieldName = 'FAX_NO'
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
    object ADO529LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 80
    end
    object ADO529CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADO529CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADO529EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ADO529EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object ADO439: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'RKEY'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'SELECT Data0064.QUAN_SHIPPED, dbo.Data0064.ovsh_qty,'
      '      Data0064.QUAN_SHIPPED + dbo.Data0064.ovsh_qty AS quantity,'
      '      Data0064.remark,'
      '      Data0050.REPORT_UNIT_VALUE1,Data0050.unit_sq,'
      '      (Data0064.QUAN_SHIPPED +Data0064.ovsh_qty)'
      '      * Data0050.REPORT_UNIT_VALUE1 / 1000 AS weight,'
      '      Data0060.SALES_ORDER, Data0060.FOB,'
      '      Data0060.REFERENCE_NUMBER,Data0060.TOTAL_ADD_L_PRICE,'
      '      Data0050.CP_REV, Data0050.CUSTOMER_PART_DESC,'
      '      Data0050.CUSTOMER_PART_NUMBER,Data0050.ANALYSIS_CODE_1,'
      '      Data0050.ANALYSIS_CODE_2,Data0064.part_price,'
      
        '      Data0050.set_x_qty, Data0050.set_y_qty,Data0050.CATALOG_NU' +
        'MBER,'
      '      Data0097.PO_NUMBER,Data0097.PO_DATE,'
      '      Data0011.NOTE_PAD_LINE_1,Data0011.NOTE_PAD_LINE_2,'
      '      Data0011.NOTE_PAD_LINE_3,Data0011.NOTE_PAD_LINE_4,'
      '      Data0064.DATE_SHIPPED, Data0064.SHIPMENT_NO,'
      
        '      data0439.delivery_no, data0439.cartons_no, data0439.weight' +
        ' AS weight439,'
      
        '      data0439.net_weight, data0439.date_sailing, data0439.charg' +
        'e,'
      
        '      data0439.fob AS fob439,data0439.reference_number AS refere' +
        'nce_num439,'
      '      data0439.remark AS remark439,Data0001.CURR_CODE,'
      '      Data0001.CURR_NAME, Data0112.invoice_number'
      'FROM Data0064 INNER JOIN'
      '      Data0060 ON Data0064.SO_PTR = Data0060.RKEY INNER JOIN'
      
        '      Data0050 ON Data0060.CUST_PART_PTR = Data0050.RKEY INNER J' +
        'OIN'
      '      Data0097 ON'
      '      Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER JOIN'
      
        '      data0439 ON Data0064.packing_list_ptr = data0439.rkey INNE' +
        'R JOIN'
      '      Data0001 ON'
      '      data0439.currency_ptr = Data0001.RKEY LEFT OUTER JOIN'
      
        '      Data0112 ON data0439.invoice_ptr = Data0112.RKEY LEFT OUTE' +
        'R JOIN'
      '      Data0011 ON Data0064.RKEY = Data0011.FILE_POINTER AND'
      '      Data0011.SOURCE_TYPE = 64'
      'where data0439.shipadvice_ptr=:RKEY      '
      'order by Data0050.CUSTOMER_PART_DESC,Data0097.PO_NUMBER')
    Left = 80
    Top = 136
    object ADO439QUAN_SHIPPED: TIntegerField
      FieldName = 'QUAN_SHIPPED'
    end
    object ADO439ovsh_qty: TIntegerField
      FieldName = 'ovsh_qty'
    end
    object ADO439quantity: TIntegerField
      FieldName = 'quantity'
      ReadOnly = True
    end
    object ADO439remark: TStringField
      FieldName = 'remark'
      Size = 50
    end
    object ADO439REPORT_UNIT_VALUE1: TFloatField
      FieldName = 'REPORT_UNIT_VALUE1'
    end
    object ADO439unit_sq: TFloatField
      FieldName = 'unit_sq'
      ReadOnly = True
    end
    object ADO439weight: TFloatField
      FieldName = 'weight'
      ReadOnly = True
    end
    object ADO439SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADO439FOB: TStringField
      FieldName = 'FOB'
      Size = 50
    end
    object ADO439REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      Size = 30
    end
    object ADO439TOTAL_ADD_L_PRICE: TFloatField
      FieldName = 'TOTAL_ADD_L_PRICE'
    end
    object ADO439CP_REV: TStringField
      FieldName = 'CP_REV'
      FixedChar = True
      Size = 5
    end
    object ADO439CUSTOMER_PART_DESC: TStringField
      FieldName = 'CUSTOMER_PART_DESC'
      Size = 40
    end
    object ADO439CUSTOMER_PART_NUMBER: TStringField
      FieldName = 'CUSTOMER_PART_NUMBER'
    end
    object ADO439ANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
    end
    object ADO439ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 50
    end
    object ADO439part_price: TFloatField
      FieldName = 'part_price'
    end
    object ADO439set_x_qty: TIntegerField
      FieldName = 'set_x_qty'
    end
    object ADO439set_y_qty: TIntegerField
      FieldName = 'set_y_qty'
    end
    object ADO439CATALOG_NUMBER: TStringField
      DisplayLabel = #24037#31243#32534#21495
      FieldName = 'CATALOG_NUMBER'
      FixedChar = True
      Size = 10
    end
    object ADO439PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADO439PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object ADO439NOTE_PAD_LINE_1: TStringField
      FieldName = 'NOTE_PAD_LINE_1'
      Size = 70
    end
    object ADO439NOTE_PAD_LINE_2: TStringField
      FieldName = 'NOTE_PAD_LINE_2'
      Size = 70
    end
    object ADO439NOTE_PAD_LINE_3: TStringField
      FieldName = 'NOTE_PAD_LINE_3'
      Size = 70
    end
    object ADO439NOTE_PAD_LINE_4: TStringField
      FieldName = 'NOTE_PAD_LINE_4'
      Size = 70
    end
    object ADO439DATE_SHIPPED: TDateTimeField
      FieldName = 'DATE_SHIPPED'
    end
    object ADO439SHIPMENT_NO: TSmallintField
      FieldName = 'SHIPMENT_NO'
    end
    object ADO439delivery_no: TStringField
      FieldName = 'delivery_no'
      Size = 10
    end
    object ADO439cartons_no: TIntegerField
      FieldName = 'cartons_no'
    end
    object ADO439weight439: TFloatField
      FieldName = 'weight439'
    end
    object ADO439net_weight: TFloatField
      FieldName = 'net_weight'
    end
    object ADO439date_sailing: TDateTimeField
      FieldName = 'date_sailing'
    end
    object ADO439charge: TFloatField
      FieldName = 'charge'
    end
    object ADO439fob439: TStringField
      FieldName = 'fob439'
      Size = 50
    end
    object ADO439reference_num439: TStringField
      FieldName = 'reference_num439'
      Size = 50
    end
    object ADO439remark439: TStringField
      FieldName = 'remark439'
      Size = 50
    end
    object ADO439CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADO439CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ADO439invoice_number: TStringField
      FieldName = 'invoice_number'
      FixedChar = True
      Size = 12
    end
  end
  object ADO493: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 80
    Top = 184
    object ADO493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object ADO493Company_Name2: TStringField
      FieldName = 'Company_Name2'
      Size = 50
    end
    object ADO493Company_Name3: TStringField
      FieldName = 'Company_Name3'
      Size = 50
    end
    object ADO493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object ADO493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object ADO493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object ADO493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object ADO493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object ADO493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO529
    Left = 120
    Top = 98
  end
  object DataSource2: TDataSource
    DataSet = ADO439
    Left = 120
    Top = 136
  end
  object DataSource3: TDataSource
    DataSet = ADO493
    Left = 121
    Top = 184
  end
  object ppDB439: TppDBPipeline
    DataSource = DataSource2
    OpenDataSource = False
    UserName = 'DB439'
    Left = 160
    Top = 136
    object ppDBPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = #38656#27714#25968#37327
      FieldName = 'QUAN_SHIPPED'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = #28322#35013#25968#37327
      FieldName = 'ovsh_qty'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = #35013#36816#25968#37327
      FieldName = 'quantity'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = #25351#27966#24120#29992#22791#27880
      FieldName = 'remark'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = #37325#37327'('#20811'/PCS)'
      FieldName = 'REPORT_UNIT_VALUE1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = #38754#31215'('#24179#31859'/PCS)'
      FieldName = 'unit_sq'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = #25351#27966#37325#37327'('#20844#26020')'
      FieldName = 'weight'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      FieldAlias = #38144#21806#35746#21333#21495
      FieldName = 'SALES_ORDER'
      FieldLength = 12
      DisplayWidth = 12
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      FieldAlias = #23458#25143#35746#21333#21495
      FieldName = 'FOB'
      FieldLength = 50
      DisplayWidth = 50
      Position = 8
    end
    object ppDBPipeline1ppField10: TppField
      FieldAlias = #35746#21333#21442#32771
      FieldName = 'REFERENCE_NUMBER'
      FieldLength = 30
      DisplayWidth = 30
      Position = 9
    end
    object ppDBPipeline1ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = #24037#20855#36153#29992
      FieldName = 'TOTAL_ADD_L_PRICE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppDBPipeline1ppField12: TppField
      FieldAlias = #29256#26412
      FieldName = 'CP_REV'
      FieldLength = 5
      DisplayWidth = 5
      Position = 11
    end
    object ppDBPipeline1ppField13: TppField
      FieldAlias = #23458#25143#22411#21495
      FieldName = 'CUSTOMER_PART_DESC'
      FieldLength = 40
      DisplayWidth = 40
      Position = 12
    end
    object ppDBPipeline1ppField14: TppField
      FieldAlias = #26412#21378#32534#21495
      FieldName = 'CUSTOMER_PART_NUMBER'
      FieldLength = 20
      DisplayWidth = 20
      Position = 13
    end
    object ppDBPipeline1ppField15: TppField
      FieldAlias = #20132#36135#23610#23544
      FieldName = 'ANALYSIS_CODE_1'
      FieldLength = 20
      DisplayWidth = 20
      Position = 14
    end
    object ppDBPipeline1ppField16: TppField
      FieldAlias = #23458#25143#29289#26009#21495
      FieldName = 'ANALYSIS_CODE_2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 15
    end
    object ppDBPipeline1ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = #20215#26684
      FieldName = 'part_price'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppDBPipeline1ppField18: TppField
      Alignment = taRightJustify
      FieldAlias = #20132#36135#25340#26495'X'#26041#38754
      FieldName = 'set_x_qty'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 17
    end
    object ppDBPipeline1ppField19: TppField
      Alignment = taRightJustify
      FieldAlias = #20132#36135#25340#26495'Y'#26041#38754
      FieldName = 'set_y_qty'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 18
    end
    object ppDBPipeline1ppField20: TppField
      FieldAlias = #24037#31243#32534#21495
      FieldName = 'CATALOG_NUMBER'
      FieldLength = 10
      DisplayWidth = 10
      Position = 19
    end
    object ppDBPipeline1ppField21: TppField
      FieldAlias = #21512#21516#21495
      FieldName = 'PO_NUMBER'
      FieldLength = 25
      DisplayWidth = 25
      Position = 20
    end
    object ppDBPipeline1ppField22: TppField
      FieldAlias = 'PO'#25910#21040#26085#26399
      FieldName = 'PO_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 21
    end
    object ppDBPipeline1ppField23: TppField
      FieldAlias = 'LOT#'
      FieldName = 'NOTE_PAD_LINE_1'
      FieldLength = 70
      DisplayWidth = 70
      Position = 22
    end
    object ppDBPipeline1ppField24: TppField
      FieldAlias = #31665#21495'C/N#'
      FieldName = 'NOTE_PAD_LINE_2'
      FieldLength = 70
      DisplayWidth = 70
      Position = 23
    end
    object ppDBPipeline1ppField25: TppField
      FieldAlias = #20998#26512#20195#30721'3'
      FieldName = 'NOTE_PAD_LINE_3'
      FieldLength = 70
      DisplayWidth = 70
      Position = 24
    end
    object ppDBPipeline1ppField26: TppField
      FieldAlias = #20998#26512#20195#30721'3'
      FieldName = 'NOTE_PAD_LINE_4'
      FieldLength = 70
      DisplayWidth = 70
      Position = 25
    end
    object ppDBPipeline1ppField27: TppField
      FieldAlias = #35013#36816#26085#26399
      FieldName = 'DATE_SHIPPED'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 26
    end
    object ppDBPipeline1ppField28: TppField
      Alignment = taRightJustify
      FieldAlias = #25351#27966#25209#27425
      FieldName = 'SHIPMENT_NO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 27
    end
    object ppDBPipeline1ppField29: TppField
      FieldAlias = #35013#31665#21333#21495
      FieldName = 'delivery_no'
      FieldLength = 10
      DisplayWidth = 10
      Position = 28
    end
    object ppDBPipeline1ppField30: TppField
      Alignment = taRightJustify
      FieldAlias = #31665#25968
      FieldName = 'cartons_no'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 29
    end
    object ppDBPipeline1ppField31: TppField
      Alignment = taRightJustify
      FieldAlias = #35013#31665#21333#27611#37325
      FieldName = 'weight439'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object ppDBPipeline1ppField32: TppField
      Alignment = taRightJustify
      FieldAlias = #35013#31665#21333#20928#37325
      FieldName = 'net_weight'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object ppDBPipeline1ppField34: TppField
      Alignment = taRightJustify
      FieldAlias = #35013#36816#36153#29992
      FieldName = 'charge'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object ppDBPipeline1ppField35: TppField
      FieldAlias = #20132#36135#23610#23544
      FieldName = 'fob439'
      FieldLength = 50
      DisplayWidth = 50
      Position = 33
    end
    object ppDBPipeline1ppField36: TppField
      FieldAlias = #21253#35013#23610#23544
      FieldName = 'reference_num439'
      FieldLength = 50
      DisplayWidth = 50
      Position = 34
    end
    object ppDBPipeline1ppField37: TppField
      FieldAlias = #35013#31665#21333#22791#27880
      FieldName = 'remark439'
      FieldLength = 50
      DisplayWidth = 50
      Position = 35
    end
    object ppDBPipeline1ppField38: TppField
      FieldAlias = #36135#24065#20195#30721
      FieldName = 'CURR_CODE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 36
    end
    object ppDBPipeline1ppField39: TppField
      FieldAlias = #36135#24065#21517#31216
      FieldName = 'CURR_NAME'
      FieldLength = 20
      DisplayWidth = 20
      Position = 37
    end
    object ppDBPipeline1ppField40: TppField
      FieldAlias = #21457#31080#32534#21495
      FieldName = 'invoice_number'
      FieldLength = 12
      DisplayWidth = 12
      Position = 38
    end
  end
  object ppDB529: TppDBPipeline
    DataSource = DataSource1
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB529'
    Left = 160
    Top = 98
    object ppDB529ppField1: TppField
      FieldAlias = #21457#36135#36890#30693#21333#32534#21495
      FieldName = 'shipadvice_no'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDB529ppField2: TppField
      FieldAlias = 'ATTN'
      FieldName = 'ATTN'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDB529ppField3: TppField
      FieldAlias = 'ATTN1'
      FieldName = 'ATTN1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppDB529ppField4: TppField
      FieldAlias = 'ATTN_CC'
      FieldName = 'ATTN_CC'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDB529ppField5: TppField
      FieldAlias = #21457#36135#22320#28857'FROM'
      FieldName = 'ADV_FROM'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object ppDB529ppField6: TppField
      FieldAlias = #21457#36135#22320#28857'FROM_CC'
      FieldName = 'ADV_FROM_CC'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object ppDB529ppField7: TppField
      FieldAlias = #21457#36135#22320#28857
      FieldName = 'SHIP_FROM'
      FieldLength = 80
      DisplayWidth = 80
      Position = 6
    end
    object ppDB529ppField8: TppField
      FieldAlias = #21040#36798#22320#28857
      FieldName = 'TO_PORT'
      FieldLength = 100
      DisplayWidth = 100
      Position = 7
    end
    object ppDB529ppField9: TppField
      FieldAlias = #30005#35805
      FieldName = 'SHIP_TO_PHONE'
      FieldLength = 20
      DisplayWidth = 20
      Position = 8
    end
    object ppDB529ppField10: TppField
      FieldAlias = #20256#30495
      FieldName = 'FAX_NO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 9
    end
    object ppDB529ppField11: TppField
      FieldAlias = #21457#36135#21040
      FieldName = 'FAX_TO'
      FieldLength = 80
      DisplayWidth = 80
      Position = 10
    end
    object ppDB529ppField12: TppField
      FieldAlias = #21019#24314#26085#26399
      FieldName = 'TDATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 11
    end
    object ppDB529ppField13: TppField
      FieldAlias = #20027#25552#21333#21495
      FieldName = 'MAWB_NO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 12
    end
    object ppDB529ppField14: TppField
      FieldAlias = #21103#25552#21333#21495
      FieldName = 'HAWB_NO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 13
    end
    object ppDB529ppField15: TppField
      FieldAlias = #36816#36755#24037#20855#21495
      FieldName = 'FLIGHT_NO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 14
    end
    object ppDB529ppField16: TppField
      FieldAlias = #21457#36135#26085#26399
      FieldName = 'DEPA_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 15
    end
    object ppDB529ppField17: TppField
      FieldAlias = #36865#36135#22320#28857
      FieldName = 'LOCATION'
      FieldLength = 80
      DisplayWidth = 80
      Position = 16
    end
    object ppDB529ppField18: TppField
      FieldAlias = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 17
    end
    object ppDB529ppField19: TppField
      FieldAlias = #23458#25143#21517#31216
      FieldName = 'CUSTOMER_NAME'
      FieldLength = 100
      DisplayWidth = 100
      Position = 18
    end
    object ppDB529ppField20: TppField
      FieldAlias = #21592#24037#20195#30721
      FieldName = 'EMPL_CODE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 19
    end
    object ppDB529ppField21: TppField
      FieldAlias = #21592#24037#21517#31216
      FieldName = 'EMPLOYEE_NAME'
      FieldLength = 16
      DisplayWidth = 16
      Position = 20
    end
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource3
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 160
    Top = 184
    object ppDB493ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDB493ppField2: TppField
      FieldAlias = 'Company_Name2'
      FieldName = 'Company_Name2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDB493ppField3: TppField
      FieldAlias = 'Company_Name3'
      FieldName = 'Company_Name3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppDB493ppField4: TppField
      FieldAlias = 'ship_address'
      FieldName = 'ship_address'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDB493ppField5: TppField
      FieldAlias = 'Company_Icon'
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField6: TppField
      FieldAlias = 'SITE_INFO_ADD_1'
      FieldName = 'SITE_INFO_ADD_1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object ppDB493ppField7: TppField
      FieldAlias = 'SITE_INFO_ADD_2'
      FieldName = 'SITE_INFO_ADD_2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppDB493ppField8: TppField
      FieldAlias = 'SITE_INFO_ADD_3'
      FieldName = 'SITE_INFO_ADD_3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object ppDB493ppField9: TppField
      FieldAlias = 'SITE_INFO_PHONE'
      FieldName = 'SITE_INFO_PHONE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 8
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB439
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'report2'
    PrinterSetup.PaperName = 'A4 210 x 297 '#27627#31859
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    SaveAsTemplate = True
    Template.FileName = 'R:\NIERP\Report\shipment_advice.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport2PreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 200
    Top = 136
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB439'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 87048
      mmPrintPosition = 0
      object ppDBImage1: TppDBImage
        UserName = 'DBImage2'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'Company_Icon'
        DataPipeline = ppDB493
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDB493'
        mmHeight = 13229
        mmLeft = 8202
        mmTop = 12171
        mmWidth = 17992
        BandType = 1
      end
      object ppLine7: TppLine
        UserName = 'Line21'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 5556
        mmTop = 26723
        mmWidth = 183886
        BandType = 1
      end
      object ppLabel25: TppLabel
        UserName = 'Label28'
        Caption = 'Fax No:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 13494
        mmTop = 30956
        mmWidth = 11642
        BandType = 1
      end
      object ppLabel26: TppLabel
        UserName = 'Label29'
        Caption = 'Fax To:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 13758
        mmTop = 36513
        mmWidth = 11377
        BandType = 1
      end
      object ppDBText26: TppDBText
        UserName = 'DBText33'
        AutoSize = True
        DataField = 'FAX_NO'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4128
        mmLeft = 27781
        mmTop = 30956
        mmWidth = 13335
        BandType = 1
      end
      object ppDBText27: TppDBText
        UserName = 'DBText34'
        AutoSize = True
        DataField = 'FAX_TO'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4128
        mmLeft = 27781
        mmTop = 36513
        mmWidth = 14393
        BandType = 1
      end
      object ppLabel27: TppLabel
        UserName = 'Label30'
        Caption = 'Attn No1:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 10848
        mmTop = 42069
        mmWidth = 14288
        BandType = 1
      end
      object ppDBText28: TppDBText
        UserName = 'DBText35'
        AutoSize = True
        DataField = 'ATTN'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4128
        mmLeft = 27781
        mmTop = 42069
        mmWidth = 31433
        BandType = 1
      end
      object ppLabel1: TppLabel
        UserName = 'Label301'
        Caption = 'Attn No2:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 10848
        mmTop = 47625
        mmWidth = 14288
        BandType = 1
      end
      object ppDBText29: TppDBText
        UserName = 'DBText36'
        AutoSize = True
        DataField = 'ATTN1'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4128
        mmLeft = 27781
        mmTop = 47625
        mmWidth = 11218
        BandType = 1
      end
      object ppLabel2: TppLabel
        UserName = 'Label32'
        Caption = #26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 137054
        mmTop = 30692
        mmWidth = 8202
        BandType = 1
      end
      object ppDBText30: TppDBText
        UserName = 'DBText37'
        AutoSize = True
        DataField = 'DEPA_DATE'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4163
        mmLeft = 147902
        mmTop = 30692
        mmWidth = 20884
        BandType = 1
      end
      object ppLabel3: TppLabel
        UserName = 'Label33'
        Caption = 'CC:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 116152
        mmTop = 47625
        mmWidth = 6085
        BandType = 1
      end
      object ppDBText31: TppDBText
        UserName = 'DBText38'
        AutoSize = True
        DataField = 'ATTN_CC'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4128
        mmLeft = 125413
        mmTop = 47625
        mmWidth = 36195
        BandType = 1
      end
      object ppLabel4: TppLabel
        UserName = 'Label34'
        Caption = 'From:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 16140
        mmTop = 53446
        mmWidth = 8996
        BandType = 1
      end
      object ppDBText32: TppDBText
        UserName = 'DBText39'
        DataField = 'ADV_FROM'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4233
        mmLeft = 28046
        mmTop = 53446
        mmWidth = 17198
        BandType = 1
      end
      object ppLabel5: TppLabel
        UserName = 'Label35'
        Caption = 'CC:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 116417
        mmTop = 53446
        mmWidth = 6085
        BandType = 1
      end
      object ppDBText18: TppDBText
        UserName = 'DBText40'
        AutoSize = True
        DataField = 'ADV_FROM_CC'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4128
        mmLeft = 125413
        mmTop = 53446
        mmWidth = 26141
        BandType = 1
      end
      object ppDBText1: TppDBText
        UserName = 'DBText43'
        AutoSize = True
        DataField = 'SHIP_FROM'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4163
        mmLeft = 43656
        mmTop = 69056
        mmWidth = 20532
        BandType = 1
      end
      object ppDBText2: TppDBText
        UserName = 'DBText45'
        AutoSize = True
        DataField = 'TO_PORT'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4163
        mmLeft = 43392
        mmTop = 74083
        mmWidth = 16722
        BandType = 1
      end
      object ppLabel6: TppLabel
        UserName = 'Label43'
        Caption = #35013#31665#21333':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 110861
        mmTop = 36777
        mmWidth = 11642
        BandType = 1
      end
      object ppDBText3: TppDBText
        UserName = 'DBText50'
        DataField = 'shipadvice_no'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4233
        mmLeft = 125413
        mmTop = 36777
        mmWidth = 28046
        BandType = 1
      end
      object ppLabel8: TppLabel
        UserName = 'Label46'
        Caption = 
          'We are pleased to advise that the following goods have been desp' +
          'atched '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4128
        mmLeft = 28840
        mmTop = 62971
        mmWidth = 110384
        BandType = 1
      end
      object ppLabel9: TppLabel
        UserName = 'Label47'
        Caption = 'details as follows:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4128
        mmLeft = 29104
        mmTop = 79111
        mmWidth = 26564
        BandType = 1
      end
      object ppLabel10: TppLabel
        UserName = 'Label48'
        Caption = 'from'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4128
        mmLeft = 28840
        mmTop = 69056
        mmWidth = 6879
        BandType = 1
      end
      object ppLabel11: TppLabel
        UserName = 'Label50'
        Caption = 'to'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4128
        mmLeft = 29104
        mmTop = 74083
        mmWidth = 2752
        BandType = 1
      end
      object ppLine8: TppLine
        UserName = 'Line26'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 5556
        mmTop = 61383
        mmWidth = 183886
        BandType = 1
      end
      object ppLabel12: TppLabel
        UserName = 'Label49'
        Caption = #21457#36135#36890#30693#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 85990
        mmTop = 14288
        mmWidth = 21167
        BandType = 1
      end
      object ppDBText4: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'Company_Name'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 5821
        mmLeft = 77788
        mmTop = 5292
        mmWidth = 38629
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppLabel13: TppLabel
        UserName = 'Label36'
        Caption = 'P/O#'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 17198
        mmTop = 2381
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label37'
        Caption = 'Descrption'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 47625
        mmTop = 2381
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label38'
        Caption = 'QTY(pcs)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 89165
        mmTop = 2381
        mmWidth = 15081
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line22'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 14288
        mmTop = 7408
        mmWidth = 22225
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line23'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 44979
        mmTop = 7408
        mmWidth = 37306
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line24'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 86784
        mmTop = 7408
        mmWidth = 28310
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppDBText5: TppDBText
        UserName = 'DBText41'
        DataField = 'po_number'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4233
        mmLeft = 16140
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText42'
        AutoSize = True
        DataField = 'CUSTOMER_PART_DESC'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4163
        mmLeft = 48154
        mmTop = 1058
        mmWidth = 19685
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText44'
        DataField = 'quantity'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4233
        mmLeft = 90223
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 92604
      mmPrintPosition = 0
      object ppLabel16: TppLabel
        UserName = 'Label39'
        Caption = #25552#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 13229
        mmTop = 41804
        mmWidth = 11642
        BandType = 8
      end
      object ppLabel17: TppLabel
        UserName = 'Label40'
        Caption = #21103#25552#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 9525
        mmTop = 48154
        mmWidth = 15346
        BandType = 8
      end
      object ppDBText8: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'MAWB_NO'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4128
        mmLeft = 28046
        mmTop = 41540
        mmWidth = 18309
        BandType = 8
      end
      object ppDBText9: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'HAWB_NO'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4128
        mmLeft = 28046
        mmTop = 48419
        mmWidth = 17992
        BandType = 8
      end
      object ppLabel18: TppLabel
        UserName = 'Label41'
        Caption = #36816#36755#24037#20855#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 85461
        mmTop = 42333
        mmWidth = 19050
        BandType = 8
      end
      object ppLabel19: TppLabel
        UserName = 'Label42'
        Caption = #21457#36816#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 88900
        mmTop = 48948
        mmWidth = 15346
        BandType = 8
      end
      object ppDBText11: TppDBText
        UserName = 'DBText48'
        AutoSize = True
        DataField = 'FLIGHT_NO'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4128
        mmLeft = 107686
        mmTop = 42069
        mmWidth = 19685
        BandType = 8
      end
      object ppDBText12: TppDBText
        UserName = 'DBText49'
        AutoSize = True
        DataField = 'DEPA_DATE'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4128
        mmLeft = 107686
        mmTop = 48948
        mmWidth = 20849
        BandType = 8
      end
      object ppLine12: TppLine
        UserName = 'Line25'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 3175
        mmTop = 39952
        mmWidth = 183886
        BandType = 8
      end
      object ppLabel22: TppLabel
        UserName = 'Label51'
        Caption = 'Best Regards'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 9790
        mmTop = 62442
        mmWidth = 21167
        BandType = 8
      end
      object ppDBText14: TppDBText
        UserName = 'DBText53'
        AutoSize = True
        DataField = 'Company_Name'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 4551
        mmLeft = 9313
        mmTop = 71438
        mmWidth = 46990
        BandType = 8
      end
    end
  end
  object ppReport2: TppReport
    AutoStop = False
    DataPipeline = ppDB439
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'report2'
    PrinterSetup.PaperName = 'A4 210 x 297 '#27627#31859
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    SaveAsTemplate = True
    Template.FileName = 'R:\NIERP\Report\shipment_advice1.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport2PreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 240
    Top = 136
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB439'
    object ppTitleBand2: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 87048
      mmPrintPosition = 0
      object ppDBImage2: TppDBImage
        UserName = 'DBImage2'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'Company_Icon'
        DataPipeline = ppDB493
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDB493'
        mmHeight = 13229
        mmLeft = 8202
        mmTop = 12171
        mmWidth = 17992
        BandType = 1
      end
      object ppVariable2: TppVariable
        UserName = 'Variable1'
        CalcOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6085
        mmLeft = 57944
        mmTop = 6879
        mmWidth = 79640
        BandType = 1
      end
      object ppLine1: TppLine
        UserName = 'Line21'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 5556
        mmTop = 26723
        mmWidth = 183886
        BandType = 1
      end
      object ppLabel23: TppLabel
        UserName = 'Label28'
        Caption = 'Fax No:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 13494
        mmTop = 30956
        mmWidth = 11642
        BandType = 1
      end
      object ppLabel28: TppLabel
        UserName = 'Label29'
        Caption = 'Fax To:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 13758
        mmTop = 36513
        mmWidth = 11377
        BandType = 1
      end
      object ppDBText22: TppDBText
        UserName = 'DBText33'
        AutoSize = True
        DataField = 'FAX_NO'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4128
        mmLeft = 27781
        mmTop = 30956
        mmWidth = 13335
        BandType = 1
      end
      object ppDBText36: TppDBText
        UserName = 'DBText34'
        AutoSize = True
        DataField = 'FAX_TO'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4128
        mmLeft = 27781
        mmTop = 36513
        mmWidth = 14393
        BandType = 1
      end
      object ppLabel29: TppLabel
        UserName = 'Label30'
        Caption = 'Attn No1:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 10848
        mmTop = 42069
        mmWidth = 14288
        BandType = 1
      end
      object ppDBText37: TppDBText
        UserName = 'DBText35'
        AutoSize = True
        DataField = 'ATTN'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4128
        mmLeft = 27781
        mmTop = 42069
        mmWidth = 31433
        BandType = 1
      end
      object ppLabel30: TppLabel
        UserName = 'Label301'
        Caption = 'Attn No2:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 10848
        mmTop = 47625
        mmWidth = 14288
        BandType = 1
      end
      object ppDBText38: TppDBText
        UserName = 'DBText36'
        AutoSize = True
        DataField = 'ATTN1'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4128
        mmLeft = 27781
        mmTop = 47625
        mmWidth = 11218
        BandType = 1
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = #26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 137054
        mmTop = 30692
        mmWidth = 8202
        BandType = 1
      end
      object ppDBText39: TppDBText
        UserName = 'DBText37'
        DataField = 'DEPA_DATE'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4233
        mmLeft = 147902
        mmTop = 30692
        mmWidth = 17198
        BandType = 1
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = 'CC:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 116152
        mmTop = 47625
        mmWidth = 6085
        BandType = 1
      end
      object ppDBText40: TppDBText
        UserName = 'DBText38'
        AutoSize = True
        DataField = 'ATTN_CC'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4128
        mmLeft = 125413
        mmTop = 47625
        mmWidth = 36195
        BandType = 1
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        Caption = 'From:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 16140
        mmTop = 53446
        mmWidth = 8996
        BandType = 1
      end
      object ppDBText41: TppDBText
        UserName = 'DBText39'
        DataField = 'ADV_FROM'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4233
        mmLeft = 28046
        mmTop = 53446
        mmWidth = 17198
        BandType = 1
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'CC:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 116417
        mmTop = 53446
        mmWidth = 6085
        BandType = 1
      end
      object ppDBText42: TppDBText
        UserName = 'DBText40'
        AutoSize = True
        DataField = 'ADV_FROM_CC'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4128
        mmLeft = 125413
        mmTop = 53446
        mmWidth = 26141
        BandType = 1
      end
      object ppDBText43: TppDBText
        UserName = 'DBText43'
        AutoSize = True
        DataField = 'SHIP_FROM'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4128
        mmLeft = 43656
        mmTop = 69056
        mmWidth = 6668
        BandType = 1
      end
      object ppDBText44: TppDBText
        UserName = 'DBText45'
        AutoSize = True
        DataField = 'TO_PORT'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4128
        mmLeft = 43392
        mmTop = 74083
        mmWidth = 19368
        BandType = 1
      end
      object ppLabel36: TppLabel
        UserName = 'Label43'
        Caption = #35013#31665#21333':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 110861
        mmTop = 36777
        mmWidth = 11642
        BandType = 1
      end
      object ppDBText45: TppDBText
        UserName = 'DBText50'
        DataField = 'shipadvice_no'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4233
        mmLeft = 125413
        mmTop = 36777
        mmWidth = 28046
        BandType = 1
      end
      object ppLabel38: TppLabel
        UserName = 'Label46'
        Caption = 
          'We are pleased to advise that the following goods have been desp' +
          'atched '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4128
        mmLeft = 28840
        mmTop = 62971
        mmWidth = 110384
        BandType = 1
      end
      object ppLabel39: TppLabel
        UserName = 'Label47'
        Caption = 'details as follows:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4128
        mmLeft = 29104
        mmTop = 79111
        mmWidth = 26564
        BandType = 1
      end
      object ppLabel40: TppLabel
        UserName = 'Label48'
        Caption = 'from'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4128
        mmLeft = 28840
        mmTop = 69056
        mmWidth = 6879
        BandType = 1
      end
      object ppLabel41: TppLabel
        UserName = 'Label50'
        Caption = 'to'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4128
        mmLeft = 29104
        mmTop = 74083
        mmWidth = 2752
        BandType = 1
      end
      object ppLine2: TppLine
        UserName = 'Line26'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 5556
        mmTop = 61383
        mmWidth = 183886
        BandType = 1
      end
      object ppLabel42: TppLabel
        UserName = 'Label49'
        Caption = #21457#36135#36890#30693#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 87048
        mmTop = 20638
        mmWidth = 21167
        BandType = 1
      end
    end
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppLabel43: TppLabel
        UserName = 'Label36'
        Caption = 'P/O#'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 17198
        mmTop = 2381
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label37'
        Caption = 'Descrption'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 47625
        mmTop = 2381
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label38'
        Caption = 'QTY(pcs)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 89165
        mmTop = 2381
        mmWidth = 15081
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line22'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 14288
        mmTop = 7408
        mmWidth = 22225
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line23'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 44979
        mmTop = 7408
        mmWidth = 37306
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line24'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 86784
        mmTop = 7408
        mmWidth = 28310
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppDBText47: TppDBText
        UserName = 'DBText41'
        DataField = 'po_number'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4233
        mmLeft = 16140
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText48: TppDBText
        UserName = 'DBText42'
        AutoSize = True
        DataField = 'CUSTOMER_PART_DESC'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4163
        mmLeft = 48154
        mmTop = 1058
        mmWidth = 43180
        BandType = 4
      end
      object ppDBText49: TppDBText
        UserName = 'DBText44'
        DataField = 'quantity'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4233
        mmLeft = 90223
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 92604
      mmPrintPosition = 0
      object ppLabel46: TppLabel
        UserName = 'Label39'
        Caption = #25552#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 13229
        mmTop = 41804
        mmWidth = 11642
        BandType = 8
      end
      object ppLabel47: TppLabel
        UserName = 'Label40'
        Caption = #21103#25552#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 9525
        mmTop = 48154
        mmWidth = 15346
        BandType = 8
      end
      object ppDBText54: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'MAWB_NO'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4128
        mmLeft = 28046
        mmTop = 41540
        mmWidth = 18309
        BandType = 8
      end
      object ppDBText55: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'HAWB_NO'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4128
        mmLeft = 28046
        mmTop = 48419
        mmWidth = 17992
        BandType = 8
      end
      object ppLabel48: TppLabel
        UserName = 'Label41'
        Caption = #36816#36755#24037#20855#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 85461
        mmTop = 42333
        mmWidth = 19050
        BandType = 8
      end
      object ppLabel49: TppLabel
        UserName = 'Label42'
        Caption = #21457#36816#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 88900
        mmTop = 48948
        mmWidth = 15346
        BandType = 8
      end
      object ppDBText59: TppDBText
        UserName = 'DBText48'
        AutoSize = True
        DataField = 'FLIGHT_NO'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4128
        mmLeft = 107686
        mmTop = 42069
        mmWidth = 19685
        BandType = 8
      end
      object ppDBText64: TppDBText
        UserName = 'DBText49'
        AutoSize = True
        DataField = 'DEPA_DATE'
        DataPipeline = ppDB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB529'
        mmHeight = 4128
        mmLeft = 107686
        mmTop = 48948
        mmWidth = 20849
        BandType = 8
      end
      object ppLine6: TppLine
        UserName = 'Line25'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 3175
        mmTop = 39952
        mmWidth = 183886
        BandType = 8
      end
      object ppLabel54: TppLabel
        UserName = 'Label51'
        Caption = 'Best Regards'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 9790
        mmTop = 62442
        mmWidth = 21167
        BandType = 8
      end
      object ppDBText83: TppDBText
        UserName = 'DBText53'
        AutoSize = True
        DataField = 'Company_Name'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 4551
        mmLeft = 9313
        mmTop = 71438
        mmWidth = 46990
        BandType = 8
      end
    end
    object raCodeModule2: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
        5661726961626C65314F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F75726365066870726F636564757265205661726961
        626C65314F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A626567696E0D0A0D0A202056616C7565203A3D207472696D2844423439335B
        27436F6D70616E795F4E616D65275D293B0D0A656E643B0D0A0D436F6D706F6E
        656E744E616D6506095661726961626C6531094576656E744E616D6506064F6E
        43616C63074576656E74494402210000}
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
    Left = 200
    Top = 184
  end
  object ppDesigner2: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppReport2
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 240
    Top = 184
  end
end
