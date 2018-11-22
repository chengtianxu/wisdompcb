object DM: TDM
  OldCreateOrder = False
  Left = 651
  Top = 184
  Height = 296
  Width = 344
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 24
  end
  object Ado439: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'v1'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'v2'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'v3'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'v4'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'v5'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT'#9'cast(0 as bit) Sel,data0439.delivery_no,data0439.shipping' +
        '_method,data0439.date_sailing,data0439.cartons_no,'
      
        '        data0439.Remark_bak,data0439.Remark,data0439.print_date,' +
        'data0439.iStatus,data0439.Rkey,'
      
        '        data0010.cust_code,data0010.customer_name,data0010.APPLY' +
        '_IN_TRANSIT,data0010.ABBR_NAME as ABBR_NAME2,'
      
        '        data0012.location,data0012.SHIP_TO_CONTACT,data0010.cod_' +
        'flag,'
      
        '        data0005.employee_name,data0012.SHIP_TO_FAX,data0015.war' +
        'ehouse_code,'
      
        'data0015.abbr_name,(case when data0439.invoice_ptr is null then ' +
        #39'N'#39' else '#39'Y'#39' end) invoice,'
      
        '(case when data0439.print_date is null then '#39'N'#39' else '#39'Y'#39' end) as' +
        ' print_date2,'
      
        '(case data0439.iStatus when 0 then '#39#24453#22238#31614#39' when 1 then '#39#20179#24211#24453#25509#25910#39' whe' +
        'n 2 then '#39#20179#24211#22238#31614#39' when 3 then '#39#20179#24211#24050#25552#20132#39' when 4 then '#39#36130#21153#25509#25910#39' end) as i' +
        'StatusTxt,'
      
        'data0439.SALES_REP_PTR, data0439.SALES_REP_Date, data0439.depotA' +
        'ccept_PTR, data0439.depotAccept_Date, data0439.depotAccept_Remar' +
        'k, '
      
        'data0439.depotSubmit_PTR, data0439.depotSubmit_Date, data0439.Fi' +
        'nance_PTR, data0439.Finance_Date, data0439.Finance_Remark,'
      'data0439.fob as '#36865#36135#20154#21592#21450#32852#32476#26041#24335',data0439.reference_number as '#36865#36135#31867#22411','
      
        'case data0439.reference_number when '#39#20844#21496#23433#25490#21496#26426#36865#36135#39' then data0439.dat' +
        'e_ent+1 else data0439.date_ent+15 end as '#24212#22238#21333#26085#26399','
      
        'D5_1.employee_name as name1,D5_2.employee_name as name2,D5_3.emp' +
        'loyee_name as name3,D5_4.employee_name as name4,D5_5.employee_na' +
        'me as name5,data0010.ANALYSIS_CODE5'
      
        'from data0439 inner join data0010 on data0439.customer_ptr=data0' +
        '010.rkey'
      
        '              inner join data0012 on data0439.ship_addr_ptr=data' +
        '0012.rkey'
      
        '              inner join data0005 on data0439.employee_ptr=data0' +
        '005.rkey '
      
        '              left join data0015 on data0439.warehouse_ptr=data0' +
        '015.rkey'
      
        '              left join data0005 D5_1 on data0439.SALES_REP_PTR=' +
        'D5_1.Rkey'
      
        '              left join data0005 D5_2 on data0439.depotAccept_PT' +
        'R=D5_2.Rkey'
      
        '              left join data0005 D5_3 on data0439.depotSubmit_PT' +
        'R=D5_3.Rkey'
      
        '              left join data0005 D5_4 on data0439.Finance_PTR=D5' +
        '_4.Rkey'
      
        '              inner join data0005 D5_5 on data0010.SALES_REP_PTR' +
        '=D5_5.RKey'
      'WHERE data0439.iStatus <> :v1 AND data0439.iStatus <> :v2'
      '      AND data0439.iStatus <> :v3 AND data0439.iStatus <> :v4'
      '      AND data0439.iStatus <> :v5 ')
    Left = 160
    Top = 24
    object Ado439Sel: TBooleanField
      FieldName = 'Sel'
    end
    object Ado439delivery_no: TStringField
      FieldName = 'delivery_no'
      ReadOnly = True
      Size = 10
    end
    object Ado439shipping_method: TStringField
      FieldName = 'shipping_method'
      ReadOnly = True
    end
    object Ado439date_sailing: TDateTimeField
      FieldName = 'date_sailing'
      ReadOnly = True
    end
    object Ado439cartons_no: TIntegerField
      FieldName = 'cartons_no'
      ReadOnly = True
    end
    object Ado439Remark_bak: TStringField
      FieldName = 'Remark_bak'
      ReadOnly = True
      Size = 50
    end
    object Ado439Remark: TStringField
      FieldName = 'Remark'
      ReadOnly = True
      Size = 50
    end
    object Ado439print_date: TDateTimeField
      FieldName = 'print_date'
      ReadOnly = True
    end
    object Ado439iStatus: TWordField
      FieldName = 'iStatus'
      ReadOnly = True
    end
    object Ado439cust_code: TStringField
      FieldName = 'cust_code'
      ReadOnly = True
      Size = 10
    end
    object Ado439customer_name: TStringField
      FieldName = 'customer_name'
      ReadOnly = True
      Size = 100
    end
    object Ado439APPLY_IN_TRANSIT: TWordField
      FieldName = 'APPLY_IN_TRANSIT'
      ReadOnly = True
    end
    object Ado439location: TStringField
      FieldName = 'location'
      ReadOnly = True
      Size = 80
    end
    object Ado439SHIP_TO_CONTACT: TStringField
      FieldName = 'SHIP_TO_CONTACT'
      ReadOnly = True
    end
    object Ado439cod_flag: TStringField
      FieldName = 'cod_flag'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object Ado439employee_name: TStringField
      FieldName = 'employee_name'
      ReadOnly = True
      Size = 16
    end
    object Ado439SHIP_TO_FAX: TStringField
      FieldName = 'SHIP_TO_FAX'
      ReadOnly = True
    end
    object Ado439warehouse_code: TStringField
      FieldName = 'warehouse_code'
      ReadOnly = True
      Size = 5
    end
    object Ado439invoice: TStringField
      FieldName = 'invoice'
      ReadOnly = True
      Size = 1
    end
    object Ado439print_date2: TStringField
      FieldName = 'print_date2'
      ReadOnly = True
      Size = 1
    end
    object Ado439iStatusTxt: TStringField
      FieldName = 'iStatusTxt'
      ReadOnly = True
      Size = 10
    end
    object Ado439SALES_REP_PTR: TIntegerField
      FieldName = 'SALES_REP_PTR'
      ReadOnly = True
    end
    object Ado439SALES_REP_Date: TDateTimeField
      FieldName = 'SALES_REP_Date'
      ReadOnly = True
    end
    object Ado439depotAccept_PTR: TIntegerField
      FieldName = 'depotAccept_PTR'
      ReadOnly = True
    end
    object Ado439depotAccept_Date: TDateTimeField
      FieldName = 'depotAccept_Date'
      ReadOnly = True
    end
    object Ado439depotAccept_Remark: TStringField
      FieldName = 'depotAccept_Remark'
      Size = 50
    end
    object Ado439depotSubmit_PTR: TIntegerField
      FieldName = 'depotSubmit_PTR'
      ReadOnly = True
    end
    object Ado439depotSubmit_Date: TDateTimeField
      FieldName = 'depotSubmit_Date'
      ReadOnly = True
    end
    object Ado439Finance_PTR: TIntegerField
      FieldName = 'Finance_PTR'
      ReadOnly = True
    end
    object Ado439Finance_Date: TDateTimeField
      FieldName = 'Finance_Date'
      ReadOnly = True
    end
    object Ado439Finance_Remark: TStringField
      FieldName = 'Finance_Remark'
      Size = 50
    end
    object Ado439Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object Ado439name1: TStringField
      FieldName = 'name1'
      ReadOnly = True
      Size = 16
    end
    object Ado439name2: TStringField
      FieldName = 'name2'
      ReadOnly = True
      Size = 16
    end
    object Ado439name3: TStringField
      FieldName = 'name3'
      ReadOnly = True
      Size = 16
    end
    object Ado439name4: TStringField
      FieldName = 'name4'
      ReadOnly = True
      Size = 16
    end
    object Ado439name5: TStringField
      FieldName = 'name5'
      ReadOnly = True
      Size = 16
    end
    object Ado439abbr_name: TStringField
      FieldName = 'abbr_name'
      ReadOnly = True
      Size = 10
    end
    object Ado439ABBR_NAME2: TStringField
      FieldName = 'ABBR_NAME2'
      ReadOnly = True
      Size = 10
    end
    object Ado439ANALYSIS_CODE5: TStringField
      FieldName = 'ANALYSIS_CODE5'
    end
    object Ado439DSDesigner: TStringField
      FieldName = #36865#36135#20154#21592#21450#32852#32476#26041#24335
    end
    object Ado439DSDesigner2: TStringField
      FieldName = #36865#36135#31867#22411
    end
    object dtmfldAdo439DSDesigner3: TDateTimeField
      FieldName = #24212#22238#21333#26085#26399
      ReadOnly = True
    end
  end
  object Ado64: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'Rkey439'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
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
      ''
      '      Data0025.MANU_PART_NUMBER,Data0025.MANU_PART_DESC,'
      ''
      
        '      Data0010.CUST_CODE,Data0010.CUSTOMER_NAME,data0010.DO_SMOO' +
        'THING,'
      '      data0010.INVOICE_NOTE_PAD_PTR,data0010.CUSTOMER_TYPE,'
      '      Data0064.SHIPMENT_NO, Data0064.QUAN_SHIPPED,'
      '      Data0064.DATE_ASSIGN, data0064.ovsh_discount,'
      '      Data0064.DATE_SHIPPED,Data0064.PACKING_SLIP_FLAG,'
      '      Data0064.QUAN_SHIPPED * Data0060.PART_PRICE AS total_case,'
      '      Data0064.RKEY AS rkey64,Data0064.packing_list_ptr,'
      
        'Data0064.QUAN_SHIPPED*data0064.REPORT_UNIT_VALUE1*0.0001 as weig' +
        'th,'
      
        'case data0064.assign_type  when 0 then '#39#27491#24120#39' when 1 then '#39#36864#36135#39' end' +
        ' as assigntype,'
      
        '      Data0012.SHIP_TO_ADDRESS_1,Data0012.SHIP_TO_CONTACT,Data00' +
        '12.ZIP,'
      '      Data0012.SHIP_TO_PHONE,Data0012.LOCATION,Data0012.STATE,'
      ''
      '      Data0097.OPEN_SOS,Data0097.PO_DATE,Data0097.PO_NUMBER,'
      ''
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
      '      data0064.packing_list_ptr=:Rkey439'
      ''
      ''
      'ORDER BY Data0060.SALES_ORDER,Data0064.SHIPMENT_NO')
    Left = 248
    Top = 24
    object Ado64SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object Ado64COMMISION_ON_TOOLING: TStringField
      FieldName = 'COMMISION_ON_TOOLING'
      FixedChar = True
      Size = 1
    end
    object Ado64SCH_DATE: TDateTimeField
      FieldName = 'SCH_DATE'
    end
    object Ado64ITEM_NBR: TStringField
      FieldName = 'ITEM_NBR'
      FixedChar = True
      Size = 5
    end
    object Ado64COD_FLAG: TStringField
      FieldName = 'COD_FLAG'
      FixedChar = True
      Size = 1
    end
    object Ado64rkey60: TIntegerField
      FieldName = 'rkey60'
      ReadOnly = True
    end
    object Ado64PARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object Ado64PARTS_SHIPPED: TFloatField
      FieldName = 'PARTS_SHIPPED'
    end
    object Ado64PARTS_RETURNED: TFloatField
      FieldName = 'PARTS_RETURNED'
    end
    object Ado64SHIPPING_METHOD: TStringField
      FieldName = 'SHIPPING_METHOD'
      FixedChar = True
    end
    object Ado64CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object Ado64PART_PRICE: TFloatField
      FieldName = 'PART_PRICE'
    end
    object Ado64STATUS: TWordField
      FieldName = 'STATUS'
    end
    object Ado64fob: TStringField
      FieldName = 'fob'
      Size = 50
    end
    object Ado64REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      Size = 100
    end
    object Ado64CUST_SHIP_ADDR_PTR: TIntegerField
      FieldName = 'CUST_SHIP_ADDR_PTR'
    end
    object Ado64CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object Ado64PURCHASE_ORDER_PTR: TIntegerField
      FieldName = 'PURCHASE_ORDER_PTR'
    end
    object Ado64CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object Ado64rkey15: TIntegerField
      FieldName = 'rkey15'
      ReadOnly = True
    end
    object Ado64WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object Ado64abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
    object Ado64MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object Ado64MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object Ado64CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object Ado64CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object Ado64DO_SMOOTHING: TWordField
      FieldName = 'DO_SMOOTHING'
    end
    object Ado64INVOICE_NOTE_PAD_PTR: TIntegerField
      FieldName = 'INVOICE_NOTE_PAD_PTR'
    end
    object Ado64CUSTOMER_TYPE: TIntegerField
      FieldName = 'CUSTOMER_TYPE'
    end
    object Ado64SHIPMENT_NO: TSmallintField
      FieldName = 'SHIPMENT_NO'
    end
    object Ado64QUAN_SHIPPED: TIntegerField
      FieldName = 'QUAN_SHIPPED'
    end
    object Ado64DATE_ASSIGN: TDateTimeField
      FieldName = 'DATE_ASSIGN'
    end
    object Ado64ovsh_discount: TBCDField
      FieldName = 'ovsh_discount'
      Precision = 5
      Size = 2
    end
    object Ado64DATE_SHIPPED: TDateTimeField
      FieldName = 'DATE_SHIPPED'
    end
    object Ado64PACKING_SLIP_FLAG: TStringField
      FieldName = 'PACKING_SLIP_FLAG'
      FixedChar = True
      Size = 1
    end
    object Ado64total_case: TFloatField
      FieldName = 'total_case'
      ReadOnly = True
    end
    object Ado64rkey64: TIntegerField
      FieldName = 'rkey64'
      ReadOnly = True
    end
    object Ado64packing_list_ptr: TIntegerField
      FieldName = 'packing_list_ptr'
    end
    object Ado64weigth: TBCDField
      FieldName = 'weigth'
      ReadOnly = True
      Precision = 25
      Size = 8
    end
    object Ado64assigntype: TStringField
      FieldName = 'assigntype'
      ReadOnly = True
      Size = 4
    end
    object Ado64SHIP_TO_ADDRESS_1: TStringField
      FieldName = 'SHIP_TO_ADDRESS_1'
      Size = 100
    end
    object Ado64SHIP_TO_CONTACT: TStringField
      FieldName = 'SHIP_TO_CONTACT'
    end
    object Ado64ZIP: TStringField
      FieldName = 'ZIP'
      Size = 10
    end
    object Ado64SHIP_TO_PHONE: TStringField
      FieldName = 'SHIP_TO_PHONE'
    end
    object Ado64LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 80
    end
    object Ado64STATE: TStringField
      FieldName = 'STATE'
      Size = 10
    end
    object Ado64OPEN_SOS: TSmallintField
      FieldName = 'OPEN_SOS'
    end
    object Ado64PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object Ado64PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 32
    end
    object Ado64CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object Ado64CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object Ado64EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 48
    Top = 96
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 48
    Top = 160
  end
end
