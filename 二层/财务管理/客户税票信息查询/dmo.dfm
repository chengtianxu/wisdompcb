object DM: TDM
  OldCreateOrder = False
  Left = 549
  Top = 141
  Height = 481
  Width = 329
  object ADOConn: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 72
  end
  object ADOQueryDate: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 144
    Top = 80
  end
  object DataSource1: TDataSource
    DataSet = ADO10
    Left = 224
    Top = 16
  end
  object ADO10: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select rkey,cust_code,customer_name from data0010 where cust_cod' +
      'e like '#39'%'#39'+ :cust_code +'#39'%'#39#13#10'order by cust_code'
    Parameters = <
      item
        Name = 'cust_code'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    Left = 144
    Top = 16
    object ADO10rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO10cust_code: TStringField
      FieldName = 'cust_code'
      Size = 10
    end
    object ADO10customer_name: TStringField
      FieldName = 'customer_name'
      Size = 100
    end
  end
  object ADOStandard: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    Parameters = <
      item
        Name = 'edit1'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'edit2'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
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
    SQL.Strings = (
      'SELECT Data0010.RKEY AS rkey10,Data0010.CUST_CODE,'
      '       Data0010.ABBR_NAME,Data0010.CUSTOMER_NAME, '
      
        '       Data0001.CURR_CODE,CONVERT(float,Data0105.EXCHANGE_RATE) ' +
        'AS EXCHANGE_RATE,'
      '       Data0112.invoice_number,Data0112.POSTED_DATE, '
      
        '       Data0112.INVOICE_DATE,Data0112.INVOICE_TOTAL,Data0112.amo' +
        'unt_paid + Data0112.CASH_DISC AS amount_paid, '
      
        '       Data0112.INVOICE_TOTAL - Data0112.amount_paid - Data0112.' +
        'CASH_DISC AS amt_payable,Data0097.PO_NUMBER, '
      '       Data0025.MANU_PART_NUMBER,Data0025.MANU_PART_DESC,'
      
        '       Data0025.ANALYSIS_CODE_2,Data0025.unit_sq,Data0064.cust_d' +
        'ecl, '
      
        '       data0439.delivery_no,Data0060.SALES_ORDER,Data0064.DATE_S' +
        'HIPPED,'
      
        '       Data0064.QUAN_SHIPPED,DATA0131.QUANTITY,DATA0131.PARTS_AL' +
        'LOC, '
      
        '       CASE WHEN DATA0131.RUSH_CHARGE <> 0 THEN DATA0131.RUSH_CH' +
        'ARGE ELSE DATA0131.PARTS_ALLOC * DATA0131.QUANTITY * (1 + Data00' +
        '64.TAX_2 * 0.01)'
      
        '       END AS RUSH_CHARGE,DATA0131.PARTS_ALLOC * DATA0131.QUANTI' +
        'TY AS invoice_price,Data0064.TAX_2,DATA0131.TAX_NO,'
      
        '       DATA0131.TAX_DATE,Data0112.MISC_INV_DESCRIPTION,DATA0131.' +
        'QUANTITY * d1.cost_price AS cost_2,Data0064.part_price,'
      
        '       Data0023.ABBR_NAME AS Supp_name,Data0105.VOUCHER,Data0064' +
        '.RKEY AS RecordID,Data0105.ENTERED_DT,'
      
        '       Data0015.ABBR_NAME AS Factory_name,Data0008.PRODUCT_NAME,' +
        'DATA0131.QUANTITY *'#26448#26009#25104#26412' as '#26448#26009#25104#26412',DATA0131.QUANTITY *'#21046#20316#36153#29992' as '#21046#20316#36153#29992',' +
        'DATA0131.QUANTITY *'#30452#25509#20154#24037' as '#30452#25509#20154#24037',DATA0131.QUANTITY *'#20108#31867#26448#26009#25104#26412' as '#20108#31867#26448 +
        #26009#25104#26412',DATA0131.QUANTITY *'#22996#22806#25110#25253#24223' as '#22996#22806#25110#25253#24223',DATA0131.QUANTITY *'#24102#20837#25104#26412' as' +
        ' '#24102#20837#25104#26412
      'FROM   DATA0131 INNER JOIN'
      
        '       Data0105 ON DATA0131.GL_HEADER_PTR = Data0105.RKEY INNER ' +
        'JOIN'
      
        '       Data0010 ON Data0105.CUSTOMER_PTR = Data0010.RKEY INNER J' +
        'OIN'
      
        '       Data0001 ON Data0105.CURRENCY_PTR = Data0001.RKEY INNER J' +
        'OIN'
      
        '       Data0064 ON DATA0131.SO_SHP_PTR = Data0064.RKEY INNER JOI' +
        'N'
      
        '       data0439 ON Data0064.packing_list_ptr = data0439.rkey INN' +
        'ER JOIN'
      
        '       Data0112 ON data0439.invoice_ptr = Data0112.RKEY INNER JO' +
        'IN'
      
        '       Data0015 ON Data0112.warehouse_ptr = Data0015.RKEY INNER ' +
        'JOIN'
      
        '       Data0060 ON Data0064.SO_PTR = Data0060.RKEY LEFT OUTER JO' +
        'IN'
      
        '       Data0023 ON Data0060.supplier_ptr = Data0023.RKEY INNER J' +
        'OIN'
      
        '       (SELECT t64.RKEY,derivedtbl_1.cost_2/t64.QUAN_SHIPPED as ' +
        'cost_price,'#26448#26009#25104#26412'/t64.QUAN_SHIPPED as '#26448#26009#25104#26412','#21046#20316#36153#29992'/t64.QUAN_SHIPPED a' +
        's '#21046#20316#36153#29992','#30452#25509#20154#24037'/t64.QUAN_SHIPPED as '#30452#25509#20154#24037','#20108#31867#26448#26009#25104#26412'/t64.QUAN_SHIPPED as ' +
        #20108#31867#26448#26009#25104#26412','#22996#22806#25110#25253#24223'/t64.QUAN_SHIPPED as '#22996#22806#25110#25253#24223','#24102#20837#25104#26412'/t64.QUAN_SHIPPED as ' +
        #24102#20837#25104#26412' FROM Data0064 t64 INNER JOIN'
      
        '              (SELECT Data0052.SO_SHP_PTR,SUM(Data0052.QUAN_SHP*' +
        '(Data0053.cost_pcs+Data0053.matl_ovhd_pcs+'
      
        '                  data0053.OVHD_COST+data0053.PLANNED_QTY+data00' +
        '53.ovhd1_pcs+data0053.outsource_pcs)) AS cost_2,sum(Data0052.QUA' +
        'N_SHP*matl_ovhd_pcs) as '#26448#26009#25104#26412',sum(Data0052.QUAN_SHP*OVHD_COST) as' +
        ' '#21046#20316#36153#29992',sum(Data0052.QUAN_SHP*ovhd1_pcs) as '#30452#25509#20154#24037',sum(Data0052.QUAN' +
        '_SHP*outsource_pcs) as '#20108#31867#26448#26009#25104#26412',sum(Data0052.QUAN_SHP*cost_pcs) as' +
        ' '#22996#22806#25110#25253#24223',sum(Data0052.QUAN_SHP*PLANNED_QTY) as '#24102#20837#25104#26412
      
        '               FROM   Data0052 INNER JOIN   Data0053 ON Data0052' +
        '.DATA0053_PTR = Data0053.RKEY'
      
        '               GROUP BY Data0052.SO_SHP_PTR) AS derivedtbl_1 ON ' +
        'derivedtbl_1.SO_SHP_PTR=t64.RKEY) as d1 ON Data0064.RKEY = d1.RK' +
        'EY INNER JOIN'
      
        '               Data0025 ON Data0060.CUST_PART_PTR = Data0025.RKE' +
        'Y INNER JOIN Data0008 on Data0025.PROD_CODE_PTR=Data0008.rkey IN' +
        'NER JOIN '
      
        '               Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data009' +
        '7.RKEY'
      
        'WHERE  (Data0010.CUST_CODE >=:edit1) AND (Data0010.CUST_CODE <=:' +
        'edit2)'
      
        'and Data0112.POSTED_DATE>=:dtpk1 and Data0112.POSTED_DATE<=:dtpk' +
        '2'
      'order by Data0010.CUST_CODE'
      ' '
      ' ')
    Left = 144
    Top = 136
    object ADOStandardrkey10: TAutoIncField
      FieldName = 'rkey10'
      ReadOnly = True
    end
    object ADOStandardCUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADOStandardABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOStandardCUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADOStandardCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADOStandardEXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
      ReadOnly = True
    end
    object ADOStandardinvoice_number: TStringField
      FieldName = 'invoice_number'
      Size = 12
    end
    object ADOStandardPOSTED_DATE: TDateTimeField
      FieldName = 'POSTED_DATE'
    end
    object ADOStandardINVOICE_DATE: TDateTimeField
      FieldName = 'INVOICE_DATE'
    end
    object ADOStandardINVOICE_TOTAL: TBCDField
      FieldName = 'INVOICE_TOTAL'
      Precision = 19
    end
    object ADOStandardamount_paid: TBCDField
      FieldName = 'amount_paid'
      ReadOnly = True
      Precision = 19
    end
    object ADOStandardamt_payable: TBCDField
      FieldName = 'amt_payable'
      ReadOnly = True
      Precision = 19
    end
    object ADOStandardPO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADOStandardMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOStandardMANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADOStandardANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 80
    end
    object ADOStandardunit_sq: TFloatField
      FieldName = 'unit_sq'
    end
    object ADOStandardcust_decl: TStringField
      FieldName = 'cust_decl'
      Size = 50
    end
    object ADOStandarddelivery_no: TStringField
      FieldName = 'delivery_no'
      Size = 10
    end
    object ADOStandardSALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADOStandardDATE_SHIPPED: TDateTimeField
      FieldName = 'DATE_SHIPPED'
    end
    object ADOStandardQUAN_SHIPPED: TIntegerField
      FieldName = 'QUAN_SHIPPED'
    end
    object ADOStandardQUANTITY: TIntegerField
      FieldName = 'QUANTITY'
    end
    object ADOStandardPARTS_ALLOC: TFloatField
      FieldName = 'PARTS_ALLOC'
    end
    object ADOStandardRUSH_CHARGE: TFloatField
      FieldName = 'RUSH_CHARGE'
      ReadOnly = True
    end
    object ADOStandardinvoice_price: TFloatField
      FieldName = 'invoice_price'
      ReadOnly = True
    end
    object ADOStandardTAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ADOStandardTAX_NO: TStringField
      FieldName = 'TAX_NO'
    end
    object ADOStandardTAX_DATE: TDateTimeField
      FieldName = 'TAX_DATE'
    end
    object ADOStandardMISC_INV_DESCRIPTION: TStringField
      FieldName = 'MISC_INV_DESCRIPTION'
      Size = 40
    end
    object ADOStandardcost_2: TFloatField
      FieldName = 'cost_2'
      ReadOnly = True
    end
    object ADOStandardSupp_name: TStringField
      FieldName = 'Supp_name'
      Size = 16
    end
    object ADOStandardVOUCHER: TStringField
      FieldName = 'VOUCHER'
      Size = 12
    end
    object ADOStandardRecordID: TAutoIncField
      FieldName = 'RecordID'
      ReadOnly = True
    end
    object ADOStandardENTERED_DT: TDateTimeField
      FieldName = 'ENTERED_DT'
    end
    object ADOStandardFactory_name: TStringField
      FieldName = 'Factory_name'
      Size = 10
    end
    object ADOStandardPRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADOStandardDSDesigner: TFloatField
      FieldName = #26448#26009#25104#26412
      ReadOnly = True
    end
    object ADOStandardDSDesigner2: TFloatField
      FieldName = #21046#20316#36153#29992
      ReadOnly = True
    end
    object ADOStandardDSDesigner3: TFloatField
      FieldName = #30452#25509#20154#24037
      ReadOnly = True
    end
    object ADOStandardDSDesigner4: TFloatField
      FieldName = #20108#31867#26448#26009#25104#26412
      ReadOnly = True
    end
    object ADOStandardDSDesigner5: TFloatField
      FieldName = #22996#22806#25110#25253#24223
      ReadOnly = True
    end
    object ADOStandardDSDesigner6: TFloatField
      FieldName = #24102#20837#25104#26412
      ReadOnly = True
    end
    object ADOStandardpart_price: TFloatField
      FieldName = 'part_price'
    end
  end
  object ADOTool: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    Parameters = <
      item
        Name = 'edit1'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'edit2'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
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
    SQL.Strings = (
      
        'SELECT Data0010.RKEY AS rkey10,Data0010.CUST_CODE,Data0010.ABBR_' +
        'NAME,Data0010.CUSTOMER_NAME,Data0001.CURR_CODE,'
      
        '       convert(float,Data0105.EXCHANGE_RATE) as EXCHANGE_RATE,Da' +
        'ta0112.invoice_number,Data0112.POSTED_DATE,Data0112.INVOICE_DATE' +
        ',Data0112.INVOICE_TOTAL, '
      
        '       Data0112.amount_paid + Data0112.CASH_DISC AS amount_paid,' +
        ' '
      
        '       Data0112.INVOICE_TOTAL - Data0112.amount_paid - Data0112.' +
        'CASH_DISC AS amt_payable,'
      
        '       Data0097.PO_NUMBER,Data0025.MANU_PART_NUMBER,Data0025.MAN' +
        'U_PART_DESC,Data0025.ANALYSIS_CODE_2,Data0025.unit_sq,'
      '       NULL AS cust_decl,NULL AS delivery_no, '
      
        '       Data0060.SALES_ORDER,NULL AS DATE_SHIPPED, NULL AS QUAN_S' +
        'HIPPED,DATA0131.QUANTITY,DATA0131.PARTS_ALLOC,'
      
        '       DATA0131.RUSH_CHARGE,DATA0131.RUSH_CHARGE/(1+Data0112.shi' +
        'p_tax*0.01) AS invoice_price,Data0112.ship_tax AS TAX_2,'
      
        '       DATA0131.TAX_NO,DATA0131.TAX_DATE,Data0112.MISC_INV_DESCR' +
        'IPTION, '
      
        '       0 AS cost_2,Data0023.abbr_name AS Supp_name,Data0105.VOUC' +
        'HER,Data0112.rkey AS RecordID,Data0105.ENTERED_DT,'
      '       Data0015.abbr_name AS Factory_name,Data0008.PRODUCT_NAME '
      'FROM   DATA0131 INNER JOIN'
      
        '       Data0105 ON DATA0131.GL_HEADER_PTR = Data0105.RKEY INNER ' +
        'JOIN'
      
        '       Data0010 ON Data0105.CUSTOMER_PTR = Data0010.RKEY INNER J' +
        'OIN'
      
        '       Data0001 ON Data0105.CURRENCY_PTR = Data0001.RKEY INNER J' +
        'OIN'
      
        '       Data0112 ON DATA0131.INVOICE_PTR = Data0112.RKEY INNER JO' +
        'IN'
      
        '       Data0015 ON Data0112.warehouse_ptr=Data0015.RKEY INNER JO' +
        'IN'
      
        '       Data0060 ON Data0112.sales_order_ptr = Data0060.RKEY LEFT' +
        ' OUTER JOIN '
      
        '       Data0023 ON Data0060.supplier_ptr=Data0023.RKEY INNER JOI' +
        'N'
      
        '       Data0025 ON Data0060.CUST_PART_PTR = Data0025.RKEY INNER ' +
        'JOIN Data0008 on Data0025.PROD_CODE_PTR=Data0008.rkey INNER JOIN' +
        ' '
      '       Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY'
      
        'WHERE  isnull(Data0112.sales_order_ptr,null)<>'#39#39' AND REVERSE_TRA' +
        'NS_FLAG='#39'Y'#39' '
      
        '       AND (Data0010.CUST_CODE >=:edit1) AND (Data0010.CUST_CODE' +
        ' <=:edit2)'
      
        '       and Data0112.POSTED_DATE>=:dtpk1 and Data0112.POSTED_DATE' +
        '<=:dtpk2'
      'order by Data0010.CUST_CODE')
    Left = 144
    Top = 192
    object ADOToolrkey10: TAutoIncField
      FieldName = 'rkey10'
      ReadOnly = True
    end
    object ADOToolCUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADOToolABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOToolCUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADOToolCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADOToolEXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
      ReadOnly = True
    end
    object ADOToolinvoice_number: TStringField
      FieldName = 'invoice_number'
      Size = 12
    end
    object ADOToolPOSTED_DATE: TDateTimeField
      FieldName = 'POSTED_DATE'
    end
    object ADOToolINVOICE_DATE: TDateTimeField
      FieldName = 'INVOICE_DATE'
    end
    object ADOToolINVOICE_TOTAL: TBCDField
      FieldName = 'INVOICE_TOTAL'
      Precision = 19
    end
    object ADOToolamount_paid: TBCDField
      FieldName = 'amount_paid'
      ReadOnly = True
      Precision = 19
    end
    object ADOToolamt_payable: TBCDField
      FieldName = 'amt_payable'
      ReadOnly = True
      Precision = 19
    end
    object ADOToolPO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADOToolMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOToolMANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADOToolANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 80
    end
    object ADOToolunit_sq: TFloatField
      FieldName = 'unit_sq'
    end
    object ADOToolcust_decl: TIntegerField
      FieldName = 'cust_decl'
      ReadOnly = True
    end
    object ADOTooldelivery_no: TIntegerField
      FieldName = 'delivery_no'
      ReadOnly = True
    end
    object ADOToolSALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADOToolDATE_SHIPPED: TIntegerField
      FieldName = 'DATE_SHIPPED'
      ReadOnly = True
    end
    object ADOToolQUAN_SHIPPED: TIntegerField
      FieldName = 'QUAN_SHIPPED'
      ReadOnly = True
    end
    object ADOToolQUANTITY: TIntegerField
      FieldName = 'QUANTITY'
    end
    object ADOToolPARTS_ALLOC: TFloatField
      FieldName = 'PARTS_ALLOC'
    end
    object ADOToolRUSH_CHARGE: TBCDField
      FieldName = 'RUSH_CHARGE'
      Precision = 19
    end
    object ADOToolinvoice_price: TBCDField
      FieldName = 'invoice_price'
      ReadOnly = True
      Precision = 32
      Size = 17
    end
    object ADOToolTAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 19
    end
    object ADOToolTAX_NO: TStringField
      FieldName = 'TAX_NO'
    end
    object ADOToolTAX_DATE: TDateTimeField
      FieldName = 'TAX_DATE'
    end
    object ADOToolMISC_INV_DESCRIPTION: TStringField
      FieldName = 'MISC_INV_DESCRIPTION'
      Size = 40
    end
    object ADOToolcost_2: TIntegerField
      FieldName = 'cost_2'
      ReadOnly = True
    end
    object ADOToolSupp_name: TStringField
      FieldName = 'Supp_name'
      Size = 16
    end
    object ADOToolVOUCHER: TStringField
      FieldName = 'VOUCHER'
      Size = 12
    end
    object ADOToolRecordID: TAutoIncField
      FieldName = 'RecordID'
      ReadOnly = True
    end
    object ADOToolENTERED_DT: TDateTimeField
      FieldName = 'ENTERED_DT'
    end
    object ADOToolFactory_name: TStringField
      FieldName = 'Factory_name'
      Size = 10
    end
    object ADOToolPRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
  end
  object ADOSundry: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    Parameters = <
      item
        Name = 'edit1'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'edit2'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
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
    SQL.Strings = (
      
        'SELECT Data0010.RKEY AS rkey10,Data0010.CUST_CODE,Data0010.ABBR_' +
        'NAME,Data0010.CUSTOMER_NAME,'
      
        '       Data0001.CURR_CODE,convert(float,Data0105.EXCHANGE_RATE) ' +
        'as EXCHANGE_RATE,Data0112.invoice_number,Data0112.POSTED_DATE,'
      
        '       Data0112.INVOICE_DATE,Data0112.INVOICE_TOTAL,Data0112.amo' +
        'unt_paid + Data0112.CASH_DISC AS amount_paid, '
      
        '       Data0112.INVOICE_TOTAL - Data0112.amount_paid - Data0112.' +
        'CASH_DISC AS amt_payable,NULL AS PO_NUMBER,'
      
        '       NULL AS MANU_PART_NUMBER,NULL AS MANU_PART_DESC,NULL AS A' +
        'NALYSIS_CODE_2,NULL AS unit_sq,'
      '       NULL AS cust_decl,NULL AS delivery_no, '
      
        '       NULL AS SALES_ORDER,NULL AS DATE_SHIPPED,NULL AS QUAN_SHI' +
        'PPED,DATA0131.QUANTITY,DATA0131.PARTS_ALLOC,DATA0131.RUSH_CHARGE' +
        ','
      
        '       case when Data0112.ship_amount<>0 then DATA0131.RUSH_CHAR' +
        'GE/(1+ROUND(Data0112.FED_TAX_AMOUNT/Data0112.ship_amount,2))'
      '       else DATA0131.RUSH_CHARGE end AS invoice_price,'
      
        '       case when Data0112.ship_amount<>0 then ROUND(Data0112.FED' +
        '_TAX_AMOUNT/Data0112.ship_amount,2)*100 else 0 end AS TAX_2,'
      
        '       DATA0131.TAX_NO,DATA0131.TAX_DATE,Data0112.MISC_INV_DESCR' +
        'IPTION,0 AS cost_2,'#39#39' AS Supp_name,Data0105.VOUCHER,'
      
        '       Data0112.rkey AS RecordID,Data0105.ENTERED_DT,Data0015.ab' +
        'br_name AS Factory_name,convert(varchar(30),'#39#39') as PRODUCT_NAME '
      'FROM   DATA0131 INNER JOIN'
      
        '       Data0105 ON DATA0131.GL_HEADER_PTR = Data0105.RKEY INNER ' +
        'JOIN'
      
        '       Data0010 ON Data0105.CUSTOMER_PTR = Data0010.RKEY INNER J' +
        'OIN'
      
        '       Data0001 ON Data0105.CURRENCY_PTR = Data0001.RKEY INNER J' +
        'OIN'
      
        '       Data0112 ON DATA0131.INVOICE_PTR = Data0112.RKEY INNER JO' +
        'IN'
      '       Data0015 ON Data0112.warehouse_ptr=Data0015.RKEY'
      
        'WHERE  reverse_trans_flag='#39'Y'#39' and Data0112.sales_order_ptr is nu' +
        'll AND (Data0010.CUST_CODE >=:edit1) AND (Data0010.CUST_CODE <=:' +
        'edit2)'
      
        '       and Data0112.POSTED_DATE>=:dtpk1 and Data0112.POSTED_DATE' +
        '<=:dtpk2'
      'order by Data0010.CUST_CODE')
    Left = 144
    Top = 248
    object ADOSundryrkey10: TAutoIncField
      FieldName = 'rkey10'
      ReadOnly = True
    end
    object ADOSundryCUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADOSundryABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOSundryCUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADOSundryCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADOSundryEXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
      ReadOnly = True
    end
    object ADOSundryinvoice_number: TStringField
      FieldName = 'invoice_number'
      Size = 12
    end
    object ADOSundryPOSTED_DATE: TDateTimeField
      FieldName = 'POSTED_DATE'
    end
    object ADOSundryINVOICE_DATE: TDateTimeField
      FieldName = 'INVOICE_DATE'
    end
    object ADOSundryINVOICE_TOTAL: TBCDField
      FieldName = 'INVOICE_TOTAL'
      Precision = 19
    end
    object ADOSundryamount_paid: TBCDField
      FieldName = 'amount_paid'
      ReadOnly = True
      Precision = 19
    end
    object ADOSundryamt_payable: TBCDField
      FieldName = 'amt_payable'
      ReadOnly = True
      Precision = 19
    end
    object ADOSundryPO_NUMBER: TIntegerField
      FieldName = 'PO_NUMBER'
      ReadOnly = True
    end
    object ADOSundryMANU_PART_NUMBER: TIntegerField
      FieldName = 'MANU_PART_NUMBER'
      ReadOnly = True
    end
    object ADOSundryMANU_PART_DESC: TIntegerField
      FieldName = 'MANU_PART_DESC'
      ReadOnly = True
    end
    object ADOSundryANALYSIS_CODE_2: TIntegerField
      FieldName = 'ANALYSIS_CODE_2'
      ReadOnly = True
    end
    object ADOSundryunit_sq: TIntegerField
      FieldName = 'unit_sq'
      ReadOnly = True
    end
    object ADOSundrycust_decl: TIntegerField
      FieldName = 'cust_decl'
      ReadOnly = True
    end
    object ADOSundrydelivery_no: TIntegerField
      FieldName = 'delivery_no'
      ReadOnly = True
    end
    object ADOSundrySALES_ORDER: TIntegerField
      FieldName = 'SALES_ORDER'
      ReadOnly = True
    end
    object ADOSundryDATE_SHIPPED: TIntegerField
      FieldName = 'DATE_SHIPPED'
      ReadOnly = True
    end
    object ADOSundryQUAN_SHIPPED: TIntegerField
      FieldName = 'QUAN_SHIPPED'
      ReadOnly = True
    end
    object ADOSundryQUANTITY: TIntegerField
      FieldName = 'QUANTITY'
    end
    object ADOSundryPARTS_ALLOC: TFloatField
      FieldName = 'PARTS_ALLOC'
    end
    object ADOSundryRUSH_CHARGE: TBCDField
      FieldName = 'RUSH_CHARGE'
      Precision = 19
    end
    object ADOSundryinvoice_price: TBCDField
      FieldName = 'invoice_price'
      ReadOnly = True
      Precision = 19
    end
    object ADOSundryTAX_2: TBCDField
      FieldName = 'TAX_2'
      ReadOnly = True
      Precision = 19
    end
    object ADOSundryTAX_NO: TStringField
      FieldName = 'TAX_NO'
    end
    object ADOSundryTAX_DATE: TDateTimeField
      FieldName = 'TAX_DATE'
    end
    object ADOSundryMISC_INV_DESCRIPTION: TStringField
      FieldName = 'MISC_INV_DESCRIPTION'
      Size = 40
    end
    object ADOSundrycost_2: TIntegerField
      FieldName = 'cost_2'
      ReadOnly = True
    end
    object ADOSundrySupp_name: TStringField
      FieldName = 'Supp_name'
      ReadOnly = True
      Size = 1
    end
    object ADOSundryVOUCHER: TStringField
      FieldName = 'VOUCHER'
      Size = 12
    end
    object ADOSundryRecordID: TAutoIncField
      FieldName = 'RecordID'
      ReadOnly = True
    end
    object ADOSundryENTERED_DT: TDateTimeField
      FieldName = 'ENTERED_DT'
    end
    object ADOSundryFactory_name: TStringField
      FieldName = 'Factory_name'
      Size = 10
    end
    object ADOSundryPRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
  end
  object ADOReturnMemo: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    Parameters = <
      item
        Name = 'edit1'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'edit2'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
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
    SQL.Strings = (
      
        'SELECT Data0010.RKEY AS rkey10,Data0010.CUST_CODE,Data0010.ABBR_' +
        'NAME,Data0010.CUSTOMER_NAME,Data0001.CURR_CODE,'
      
        '       convert(float,Data0105.EXCHANGE_RATE) as EXCHANGE_RATE,'#39'(' +
        #36864')'#39' + Data0116.MEMO_NUMBER AS invoice_number,'
      
        '       Data0116.MEMO_DATE AS POSTED_DATE,Data0116.RMA_DATE AS IN' +
        'VOICE_DATE,'
      
        '       - (1 * dbo.Data0116.AMOUNT) AS INVOICE_TOTAL,- (Data0116.' +
        'AMOUNT - Data0116.AVL_AMT) AS amount_paid,'
      
        '       - (1 * dbo.Data0116.AVL_AMT) AS amt_payable,Data0097.PO_N' +
        'UMBER,Data0025.MANU_PART_NUMBER,Data0025.MANU_PART_DESC,'
      
        '       Data0025.ANALYSIS_CODE_2,Data0025.unit_sq,NULL AS cust_de' +
        'cl,Data0098.RMA_NUMBER AS delivery_no,Data0060.SALES_ORDER,'
      
        '       Data0098.Putaway_date AS DATE_SHIPPED,- (1 * Data0098.QTY' +
        '_RECD) AS QUAN_SHIPPED,'
      '       -DATA0131.QUANTITY AS QUANTITY,DATA0131.PARTS_ALLOC,'
      
        '       -case when DATA0131.RUSH_CHARGE<>0 then DATA0131.RUSH_CHA' +
        'RGE '
      
        '       else DATA0131.PARTS_ALLOC*DATA0131.QUANTITY*(1 + Data0060' +
        '.RUSH_CHARGE * 0.01) end AS RUSH_CHARGE,'
      '       -DATA0131.PARTS_ALLOC*DATA0131.QUANTITY AS invoice_price,'
      
        '       Data0060.RUSH_CHARGE AS TAX_2,DATA0131.TAX_NO,DATA0131.TA' +
        'X_DATE,Data0116.DESCRIPTION AS MISC_INV_DESCRIPTION,'
      
        '       dbo.DATA0131.QUANTITY * d2.cost_price AS cost_2,Data0023.' +
        'abbr_name AS Supp_name,DATA0131.QUANTITY *'#26448#26009#25104#26412' as '#26448#26009#25104#26412',DATA0131.' +
        'QUANTITY *'#21046#20316#36153#29992' as '#21046#20316#36153#29992',DATA0131.QUANTITY *'#30452#25509#20154#24037' as '#30452#25509#20154#24037',DATA0131.' +
        'QUANTITY *'#20108#31867#26448#26009#25104#26412' as '#20108#31867#26448#26009#25104#26412',DATA0131.QUANTITY *'#22996#22806#25110#25253#24223' as '#22996#22806#25110#25253#24223',DAT' +
        'A0131.QUANTITY *'#24102#20837#25104#26412' as '#24102#20837#25104#26412','
      
        '       Data0105.VOUCHER,Data0098.rkey AS RecordID,Data0105.ENTER' +
        'ED_DT, Data0015.abbr_name AS Factory_name,Data0008.PRODUCT_NAME'
      'FROM   DATA0131 INNER JOIN'
      
        '       Data0105 ON DATA0131.GL_HEADER_PTR = Data0105.RKEY INNER ' +
        'JOIN'
      
        '       Data0010 ON Data0105.CUSTOMER_PTR = Data0010.RKEY INNER J' +
        'OIN'
      
        '       Data0001 ON Data0105.CURRENCY_PTR = Data0001.RKEY INNER J' +
        'OIN'
      '       Data0098 ON DATA0131.RMA_PTR = Data0098.RKEY INNER JOIN'
      '       Data0116 ON Data0098.srce_ptr = Data0116.RKEY INNER JOIN'
      
        '       Data0015 ON Data0116.warehouse_ptr=Data0015.RKEY INNER JO' +
        'IN'
      
        '       Data0060 ON dbo.Data0098.SO_PTR = Data0060.RKEY LEFT OUTE' +
        'R JOIN '
      
        '       Data0023 ON Data0060.supplier_ptr=Data0023.RKEY INNER JOI' +
        'N'
      ''
      ''
      ''
      
        '          (SELECT dbo.data0416.rma_ptr, -avg(dbo.Data0053.cost_p' +
        'cs) as cost_price,-avg(matl_ovhd_pcs) as '#26448#26009#25104#26412',-avg(OVHD_COST) as' +
        ' '#21046#20316#36153#29992',-avg(ovhd1_pcs) as '#30452#25509#20154#24037',-avg(outsource_pcs) as '#20108#31867#26448#26009#25104#26412',-avg' +
        '(cost_pcs) as '#22996#22806#25110#25253#24223',-avg(PLANNED_QTY) as '#24102#20837#25104#26412
      
        '            FROM data0416 INNER JOIN Data0053 ON data0416.rkey=D' +
        'ata0053.NPAD_PTR'
      
        '            WHERE (dbo.data0416.type = 4) group by data0416.rma_' +
        'ptr) AS d2 '
      ''
      '       ON Data0098.RKEY = d2.rma_ptr INNER JOIN'
      
        '       Data0025 ON Data0060.CUST_PART_PTR = Data0025.RKEY INNER ' +
        'JOIN Data0008 on Data0025.PROD_CODE_PTR=Data0008.rkey INNER JOIN' +
        ' '
      '       Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY'
      ''
      ''
      
        'WHERE  (Data0010.CUST_CODE >=:edit1) AND (Data0010.CUST_CODE <=:' +
        'edit2)'
      
        '       and Data0116.MEMO_DATE>=:dtpk1 and Data0116.MEMO_DATE<=:d' +
        'tpk2'
      'order by Data0010.CUST_CODE'
      ' '
      ' ')
    Left = 144
    Top = 304
    object ADOReturnMemorkey10: TAutoIncField
      FieldName = 'rkey10'
      ReadOnly = True
    end
    object ADOReturnMemoCUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADOReturnMemoABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOReturnMemoCUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADOReturnMemoCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADOReturnMemoEXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
      ReadOnly = True
    end
    object ADOReturnMemoinvoice_number: TStringField
      FieldName = 'invoice_number'
      ReadOnly = True
      Size = 14
    end
    object ADOReturnMemoPOSTED_DATE: TDateTimeField
      FieldName = 'POSTED_DATE'
    end
    object ADOReturnMemoINVOICE_DATE: TDateTimeField
      FieldName = 'INVOICE_DATE'
    end
    object ADOReturnMemoINVOICE_TOTAL: TBCDField
      FieldName = 'INVOICE_TOTAL'
      ReadOnly = True
      Precision = 19
    end
    object ADOReturnMemoamount_paid: TBCDField
      FieldName = 'amount_paid'
      ReadOnly = True
      Precision = 19
    end
    object ADOReturnMemoamt_payable: TBCDField
      FieldName = 'amt_payable'
      ReadOnly = True
      Precision = 19
    end
    object ADOReturnMemoPO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADOReturnMemoMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOReturnMemoMANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADOReturnMemoANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 80
    end
    object ADOReturnMemounit_sq: TFloatField
      FieldName = 'unit_sq'
    end
    object ADOReturnMemocust_decl: TIntegerField
      FieldName = 'cust_decl'
      ReadOnly = True
    end
    object ADOReturnMemodelivery_no: TStringField
      FieldName = 'delivery_no'
      FixedChar = True
      Size = 10
    end
    object ADOReturnMemoSALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADOReturnMemoDATE_SHIPPED: TDateTimeField
      FieldName = 'DATE_SHIPPED'
    end
    object ADOReturnMemoQUAN_SHIPPED: TIntegerField
      FieldName = 'QUAN_SHIPPED'
      ReadOnly = True
    end
    object ADOReturnMemoQUANTITY: TIntegerField
      FieldName = 'QUANTITY'
      ReadOnly = True
    end
    object ADOReturnMemoPARTS_ALLOC: TFloatField
      FieldName = 'PARTS_ALLOC'
    end
    object ADOReturnMemoRUSH_CHARGE: TFloatField
      FieldName = 'RUSH_CHARGE'
      ReadOnly = True
    end
    object ADOReturnMemoinvoice_price: TFloatField
      FieldName = 'invoice_price'
      ReadOnly = True
    end
    object ADOReturnMemoTAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 5
      Size = 2
    end
    object ADOReturnMemoTAX_NO: TStringField
      FieldName = 'TAX_NO'
    end
    object ADOReturnMemoTAX_DATE: TDateTimeField
      FieldName = 'TAX_DATE'
    end
    object ADOReturnMemoMISC_INV_DESCRIPTION: TStringField
      FieldName = 'MISC_INV_DESCRIPTION'
      Size = 60
    end
    object ADOReturnMemocost_2: TFloatField
      FieldName = 'cost_2'
      ReadOnly = True
    end
    object ADOReturnMemoSupp_name: TStringField
      FieldName = 'Supp_name'
      Size = 16
    end
    object ADOReturnMemoVOUCHER: TStringField
      FieldName = 'VOUCHER'
      Size = 12
    end
    object ADOReturnMemoRecordID: TAutoIncField
      FieldName = 'RecordID'
      ReadOnly = True
    end
    object ADOReturnMemoENTERED_DT: TDateTimeField
      FieldName = 'ENTERED_DT'
    end
    object ADOReturnMemoFactory_name: TStringField
      FieldName = 'Factory_name'
      Size = 10
    end
    object ADOReturnMemoPRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADOReturnMemoDSDesigner: TFloatField
      FieldName = #26448#26009#25104#26412
      ReadOnly = True
    end
    object ADOReturnMemoDSDesigner2: TFloatField
      FieldName = #21046#20316#36153#29992
      ReadOnly = True
    end
    object ADOReturnMemoDSDesigner3: TFloatField
      FieldName = #30452#25509#20154#24037
      ReadOnly = True
    end
    object ADOReturnMemoDSDesigner4: TFloatField
      FieldName = #20108#31867#26448#26009#25104#26412
      ReadOnly = True
    end
    object ADOReturnMemoDSDesigner5: TFloatField
      FieldName = #22996#22806#25110#25253#24223
      ReadOnly = True
    end
    object ADOReturnMemoDSDesigner6: TFloatField
      FieldName = #24102#20837#25104#26412
      ReadOnly = True
    end
  end
  object ADONoReturnMemo: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    Parameters = <
      item
        Name = 'edit1'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'edit2'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
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
    SQL.Strings = (
      
        'SELECT Data0010.RKEY AS rkey10,Data0010.CUST_CODE,Data0010.ABBR_' +
        'NAME,Data0010.CUSTOMER_NAME,Data0001.CURR_CODE,'
      
        '       convert(float,Data0105.EXCHANGE_RATE) as EXCHANGE_RATE,'#39'(' +
        #36864')'#39' + Data0116.MEMO_NUMBER AS invoice_number,Data0116.MEMO_DATE ' +
        'AS POSTED_DATE, '
      
        '       Data0116.RMA_DATE AS INVOICE_DATE, - (1 * Data0116.AMOUNT' +
        ') AS INVOICE_TOTAL,'
      
        '       - (Data0116.AMOUNT - Data0116.AVL_AMT) AS amount_paid,- (' +
        '1 * dbo.Data0116.AVL_AMT) AS amt_payable,'
      
        '       NULL AS PO_NUMBER,NULL AS MANU_PART_NUMBER,NULL AS MANU_P' +
        'ART_DESC,NULL AS ANALYSIS_CODE_2,'
      '       NULL AS unit_sq,NULL AS cust_decl,'
      '       Data0116.MEMO_NUMBER AS delivery_no, NULL AS SALES_ORDER,'
      
        '       NULL AS DATE_SHIPPED, 0 AS QUAN_SHIPPED,-DATA0131.QUANTIT' +
        'Y AS QUANTITY,DATA0131.PARTS_ALLOC,'
      '       -DATA0131.RUSH_CHARGE AS RUSH_CHARGE,'
      
        '       -case when (Data0116.GOODS_AMT + Data0116.SHIPPING + Data' +
        '0116.TOOLING_CHARGE)>0 '
      
        '       then DATA0131.RUSH_CHARGE/(1+Round(Data0116.FED_TAX/(Data' +
        '0116.GOODS_AMT + Data0116.SHIPPING + Data0116.TOOLING_CHARGE),2)' +
        ')'
      '       else DATA0131.RUSH_CHARGE end AS invoice_price, '
      
        '       case when (Data0116.GOODS_AMT + Data0116.SHIPPING + Data0' +
        '116.TOOLING_CHARGE)>0 '
      
        '       then Round(Data0116.FED_TAX/(Data0116.GOODS_AMT + Data011' +
        '6.SHIPPING + Data0116.TOOLING_CHARGE),2)*100'
      
        '       else 0 end AS TAX_2,DATA0131.TAX_NO,DATA0131.TAX_DATE,Dat' +
        'a0116.DESCRIPTION AS MISC_INV_DESCRIPTION,'
      
        '       0 AS cost_2,'#39#39' AS Supp_name,Data0105.VOUCHER,Data0116.rke' +
        'y AS RecordID,Data0105.ENTERED_DT,'
      
        '       Data0015.abbr_name AS Factory_name,convert(varchar(30),'#39#39 +
        ') as PRODUCT_NAME  '
      'FROM   DATA0131 INNER JOIN'
      
        '       Data0105 ON DATA0131.GL_HEADER_PTR = Data0105.RKEY INNER ' +
        'JOIN'
      
        '       Data0010 ON Data0105.CUSTOMER_PTR = Data0010.RKEY INNER J' +
        'OIN'
      
        '       Data0001 ON Data0105.CURRENCY_PTR = Data0001.RKEY INNER J' +
        'OIN'
      '       Data0116 ON DATA0131.DEBIT_PTR = Data0116.RKEY INNER JOIN'
      '       Data0015 ON Data0116.warehouse_ptr=Data0015.RKEY'
      
        'WHERE  Data0105.reverse_trans_flag='#39'Y'#39' and (Data0010.CUST_CODE >' +
        '=:edit1) AND (Data0010.CUST_CODE <=:edit2)'
      
        '       and Data0116.MEMO_DATE>=:dtpk1 and Data0116.MEMO_DATE<=:d' +
        'tpk2'
      'order by Data0010.CUST_CODE')
    Left = 144
    Top = 360
    object ADONoReturnMemorkey10: TAutoIncField
      FieldName = 'rkey10'
      ReadOnly = True
    end
    object ADONoReturnMemoCUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADONoReturnMemoABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADONoReturnMemoCUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADONoReturnMemoCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADONoReturnMemoEXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
      ReadOnly = True
    end
    object ADONoReturnMemoinvoice_number: TStringField
      FieldName = 'invoice_number'
      ReadOnly = True
      Size = 14
    end
    object ADONoReturnMemoPOSTED_DATE: TDateTimeField
      FieldName = 'POSTED_DATE'
    end
    object ADONoReturnMemoINVOICE_DATE: TDateTimeField
      FieldName = 'INVOICE_DATE'
    end
    object ADONoReturnMemoINVOICE_TOTAL: TBCDField
      FieldName = 'INVOICE_TOTAL'
      ReadOnly = True
      Precision = 19
    end
    object ADONoReturnMemoamount_paid: TBCDField
      FieldName = 'amount_paid'
      ReadOnly = True
      Precision = 19
    end
    object ADONoReturnMemoamt_payable: TBCDField
      FieldName = 'amt_payable'
      ReadOnly = True
      Precision = 19
    end
    object ADONoReturnMemoPO_NUMBER: TIntegerField
      FieldName = 'PO_NUMBER'
      ReadOnly = True
    end
    object ADONoReturnMemoMANU_PART_NUMBER: TIntegerField
      FieldName = 'MANU_PART_NUMBER'
      ReadOnly = True
    end
    object ADONoReturnMemoMANU_PART_DESC: TIntegerField
      FieldName = 'MANU_PART_DESC'
      ReadOnly = True
    end
    object ADONoReturnMemoANALYSIS_CODE_2: TIntegerField
      FieldName = 'ANALYSIS_CODE_2'
      ReadOnly = True
    end
    object ADONoReturnMemounit_sq: TIntegerField
      FieldName = 'unit_sq'
      ReadOnly = True
    end
    object ADONoReturnMemocust_decl: TIntegerField
      FieldName = 'cust_decl'
      ReadOnly = True
    end
    object ADONoReturnMemodelivery_no: TStringField
      FieldName = 'delivery_no'
      Size = 10
    end
    object ADONoReturnMemoSALES_ORDER: TIntegerField
      FieldName = 'SALES_ORDER'
      ReadOnly = True
    end
    object ADONoReturnMemoDATE_SHIPPED: TIntegerField
      FieldName = 'DATE_SHIPPED'
      ReadOnly = True
    end
    object ADONoReturnMemoQUAN_SHIPPED: TIntegerField
      FieldName = 'QUAN_SHIPPED'
      ReadOnly = True
    end
    object ADONoReturnMemoQUANTITY: TIntegerField
      FieldName = 'QUANTITY'
      ReadOnly = True
    end
    object ADONoReturnMemoPARTS_ALLOC: TFloatField
      FieldName = 'PARTS_ALLOC'
    end
    object ADONoReturnMemoRUSH_CHARGE: TBCDField
      FieldName = 'RUSH_CHARGE'
      ReadOnly = True
      Precision = 19
    end
    object ADONoReturnMemoinvoice_price: TBCDField
      FieldName = 'invoice_price'
      ReadOnly = True
      Precision = 19
    end
    object ADONoReturnMemoTAX_2: TBCDField
      FieldName = 'TAX_2'
      ReadOnly = True
      Precision = 19
    end
    object ADONoReturnMemoTAX_NO: TStringField
      FieldName = 'TAX_NO'
    end
    object ADONoReturnMemoTAX_DATE: TDateTimeField
      FieldName = 'TAX_DATE'
    end
    object ADONoReturnMemoMISC_INV_DESCRIPTION: TStringField
      FieldName = 'MISC_INV_DESCRIPTION'
      Size = 60
    end
    object ADONoReturnMemocost_2: TIntegerField
      FieldName = 'cost_2'
      ReadOnly = True
    end
    object ADONoReturnMemoSupp_name: TStringField
      FieldName = 'Supp_name'
      ReadOnly = True
      Size = 1
    end
    object ADONoReturnMemoVOUCHER: TStringField
      FieldName = 'VOUCHER'
      Size = 12
    end
    object ADONoReturnMemoRecordID: TAutoIncField
      FieldName = 'RecordID'
      ReadOnly = True
    end
    object ADONoReturnMemoENTERED_DT: TDateTimeField
      FieldName = 'ENTERED_DT'
    end
    object ADONoReturnMemoFactory_name: TStringField
      FieldName = 'Factory_name'
      Size = 10
    end
    object ADONoReturnMemoPRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
  end
  object ADO10_1: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select rkey,cust_code,customer_name from data0010 where cust_cod' +
      'e =  :cust_code '#13#10'order by cust_code'
    Parameters = <
      item
        Name = 'cust_code'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    Left = 80
    Top = 16
    object AutoIncField1: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object StringField1: TStringField
      FieldName = 'cust_code'
      Size = 10
    end
    object StringField2: TStringField
      FieldName = 'customer_name'
      Size = 100
    end
  end
end
