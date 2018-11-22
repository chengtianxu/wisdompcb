object DM: TDM
  OldCreateOrder = False
  Left = 779
  Top = 214
  Height = 502
  Width = 428
  object ADOConn: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 24
  end
  object ADO10: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT  RKEY,CUST_CODE,CUSTOMER_NAME'#13#10'FROM  Data0010'#13#10'WHERE CUST' +
      '_CODE LIKE '#39'%'#39'+:cust_code+'#39'%'#39#13#10'ORDER BY CUST_CODE'
    Parameters = <
      item
        Name = 'cust_code+'#39'%'#39
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    Left = 256
    Top = 24
    object ADO10RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO10CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADO10CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO10
    Left = 352
    Top = 24
  end
  object ADOStandard: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADOStandardCalcFields
    CommandText = 
      'SELECT Data0064.Rkey AS req_no,Data0010.rkey as rkey10,Data0010.' +
      'CUST_CODE,Data0010.ABBR_NAME,Data0010.CUSTOMER_NAME,'#13#10'       Dat' +
      'a0112.RKEY,Data0112.invoice_number,Data0001.CURR_CODE,convert(fl' +
      'oat,Data0112.EXCHANGE_RATE) as EXCHANGE_RATE,Data0112.POSTED_DAT' +
      'E,'#13#10'       Data0112.INVOICE_DATE,Data0112.INVOICE_TOTAL,Data0112' +
      '.amount_paid + Data0112.CASH_DISC AS amount_paid, '#13#10'       Data0' +
      '112.INVOICE_TOTAL - Data0112.amount_paid - Data0112.CASH_DISC AS' +
      ' amt_payable,Data0097.PO_NUMBER, '#13#10'       Data0025.MANU_PART_NUM' +
      'BER,Data0025.MANU_PART_DESC,Data0025.ANALYSIS_CODE_2,Data0025.LA' +
      'YERS,data0025.set_qty,Data0008.PRODUCT_NAME,'#13#10'       Data0025.AN' +
      'ALYSIS_CODE_1,Data0025.unit_sq,data0439.delivery_no,Data0060.SAL' +
      'ES_ORDER,Data0064.DATE_SHIPPED, '#13#10'       0.0 + Data0064.QUAN_SHI' +
      'PPED AS quan_shipped,Data0064.ovsh_qty,Data0060.PARTS_ALLOC,Data' +
      '0064.TAX_2,'#13#10'      (Data0060.PARTS_ALLOC * Data0064.ovsh_qty) * ' +
      '(1 + Data0064.TAX_2 * 0.01)As RUSH_CHARGE_AMOUNT, '#13#10'      (Data0' +
      '060.PARTS_ALLOC * Data0064.QUAN_SHIPPED) * (1 + Data0064.TAX_2 *' +
      ' 0.01) AS amt_shipped,'#13#10'       Data0060.PARTS_ALLOC * Data0064.Q' +
      'UAN_SHIPPED AS delivery_price,Data0064.REMARK AS MISC_INV_DESCRI' +
      'PTION,'#13#10'       derivedtbl_1.cost_2,Data0064.GLPTR_STATUS, case D' +
      'ata0025.ttype when 0 then '#39#37327#20135#39' when 1 then '#39#26679#26495#39' else '#39#39' end as s' +
      'ttype,'#13#10'       case Data0060.so_tp when 0 then '#39#33258#21046#39' when 1 then ' +
      #39#22806#21457#39' when 2 then '#39#21322#21046#31243#39' end AS so_tp,'#13#10'       Data0023.abbr_name ' +
      'AS Supp_name,'#39#39' AS REF_NUMBER,Data0064.cust_decl,Data0060.PARTS_' +
      'ORDERED,'#13#10'       Data0015.abbr_name AS Factory_name,case dbo.dat' +
      'a0064.assign_type when 0 then '#39#27491#24120#25351#27966#39' when 1 then '#39#36864#36135#25351#27966#39' end as a' +
      'ssign_type,'#13#10'       Data0085.rate_margin,Data0025.ORIG_CUSTOMER,' +
      #13#10'       data0005.EMPLOYEE_NAME,Data0010.FED_TAX_ID_NO,Data0025.' +
      'unit_sq * Data0064.QUAN_SHIPPED as chmj,data0346.ROW_NAME'#13#10'FROM ' +
      '  Data0060 LEFT OUTER JOIN '#13#10'       Data0023 ON Data0060.supplie' +
      'r_ptr=Data0023.RKEY LEFT OUTER JOIN'#13#10#9'   Data0085 on dbo.data006' +
      '0.QTE_PTR=Data0085.Rkey LEFT OUTER JOIN'#13#10'       data0346 on data' +
      '0085.ENGR_ROUTE_PTR=data0346.rkey INNER JOIN'#13#10'       Data0064 ON' +
      ' Data0060.RKEY = Data0064.SO_PTR INNER JOIN'#13#10'       Data0010 INN' +
      'ER JOIN'#13#10'       Data0112 ON Data0112.CUSTOMER_PTR = Data0010.RKE' +
      'Y INNER JOIN'#13#10'       Data0015 ON Data0112.warehouse_ptr=Data0015' +
      '.RKEY INNER JOIN'#13#10'       Data0001 ON Data0112.CURRENCY_PTR = Dat' +
      'a0001.RKEY INNER JOIN'#13#10'       data0439 ON Data0112.RKEY = data04' +
      '39.invoice_ptr ON Data0064.packing_list_ptr = data0439.rkey INNE' +
      'R JOIN'#13#10'       Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data009' +
      '7.RKEY INNER JOIN'#13#10'       Data0025 ON Data0060.CUST_PART_PTR = D' +
      'ata0025.RKEY INNER JOIN'#13#10'       Data0008 ON Data0025.PROD_CODE_P' +
      'TR = Data0008.RKEY INNER JOIN'#13#10'        (SELECT Data0052.SO_SHP_P' +
      'TR,SUM(Data0052.QUAN_SHP * (Data0053.cost_pcs+data0053.matl_ovhd' +
      '_pcs+data0053.OVHD_COST+data0053.PLANNED_QTY)) AS cost_2'#13#10'      ' +
      '  FROM Data0052 INNER JOIN'#13#10'        Data0053 ON Data0052.DATA005' +
      '3_PTR = Data0053.RKEY'#13#10'        GROUP BY Data0052.SO_SHP_PTR) AS ' +
      'derivedtbl_1 ON Data0064.RKEY = derivedtbl_1.SO_SHP_PTR'#13#10'       ' +
      'INNER JOIN data0005 on Data0060.COMM_ASSIGNED_BY_E_P = data0005.' +
      'rkey '#13#10'WHERE  (Data0112.INVOICE_STATUS <> 3) AND (Data0112.INVOI' +
      'CE_TYPE = 1) AND '#13#10'       (Data0010.CUST_CODE >=:edit1) AND (Dat' +
      'a0010.CUST_CODE <=:edit2)'
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
      end>
    Left = 256
    Top = 80
    object ADOStandardreq_no: TAutoIncField
      FieldName = 'req_no'
      ReadOnly = True
    end
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
    object ADOStandardRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOStandardinvoice_number: TStringField
      FieldName = 'invoice_number'
      Size = 12
    end
    object ADOStandardCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADOStandardEXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
      ReadOnly = True
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
    object ADOStandardLAYERS: TWordField
      FieldName = 'LAYERS'
    end
    object ADOStandardset_qty: TIntegerField
      FieldName = 'set_qty'
    end
    object ADOStandardPRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADOStandardANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
      Size = 30
    end
    object ADOStandardunit_sq: TFloatField
      FieldName = 'unit_sq'
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
    object ADOStandardquan_shipped: TBCDField
      FieldName = 'quan_shipped'
      ReadOnly = True
      Precision = 12
      Size = 1
    end
    object ADOStandardovsh_qty: TIntegerField
      FieldName = 'ovsh_qty'
    end
    object ADOStandardPARTS_ALLOC: TFloatField
      FieldName = 'PARTS_ALLOC'
    end
    object ADOStandardTAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ADOStandardRUSH_CHARGE_AMOUNT: TFloatField
      FieldName = 'RUSH_CHARGE_AMOUNT'
      ReadOnly = True
    end
    object ADOStandardamt_shipped: TFloatField
      FieldName = 'amt_shipped'
      ReadOnly = True
    end
    object ADOStandarddelivery_price: TFloatField
      FieldName = 'delivery_price'
      ReadOnly = True
    end
    object ADOStandardMISC_INV_DESCRIPTION: TStringField
      FieldName = 'MISC_INV_DESCRIPTION'
      Size = 50
    end
    object ADOStandardcost_2: TFloatField
      FieldName = 'cost_2'
      ReadOnly = True
    end
    object ADOStandardGLPTR_STATUS: TBooleanField
      FieldName = 'GLPTR_STATUS'
    end
    object ADOStandardso_tp: TStringField
      FieldName = 'so_tp'
      ReadOnly = True
      Size = 6
    end
    object ADOStandardSupp_name: TStringField
      FieldName = 'Supp_name'
      Size = 16
    end
    object ADOStandardREF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      ReadOnly = True
      Size = 1
    end
    object ADOStandardcust_decl: TStringField
      FieldName = 'cust_decl'
      Size = 50
    end
    object ADOStandardPARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object ADOStandardFactory_name: TStringField
      FieldName = 'Factory_name'
      Size = 10
    end
    object ADOStandardassign_type: TStringField
      FieldName = 'assign_type'
      ReadOnly = True
      Size = 8
    end
    object ADOStandardrate_margin: TBCDField
      FieldName = 'rate_margin'
      Precision = 6
      Size = 2
    end
    object ADOStandardORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      Size = 10
    end
    object ADOStandardsttype: TStringField
      FieldName = 'sttype'
      ReadOnly = True
      Size = 4
    end
    object ADOStandardbzfp: TStringField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'TYPE'
      Size = 8
      Calculated = True
    end
    object ADOStandardEMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOStandardFED_TAX_ID_NO: TStringField
      FieldName = 'FED_TAX_ID_NO'
      Size = 50
    end
    object ADOStandardchmj: TFloatField
      FieldName = 'chmj'
      ReadOnly = True
    end
    object ADOStandardROW_NAME: TStringField
      FieldName = 'ROW_NAME'
      Size = 30
    end
  end
  object ADOTool: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADOToolCalcFields
    CommandText = 
      'SELECT Data0112.Rkey AS req_no,Data0010.rkey as rkey10,Data0010.' +
      'CUST_CODE,Data0010.ABBR_NAME,'#13#10'       Data0010.CUSTOMER_NAME,Dat' +
      'a0112.RKEY,Data0112.invoice_number, '#13#10'       Data0001.CURR_CODE,' +
      'convert(float,Data0112.EXCHANGE_RATE) as EXCHANGE_RATE,Data0112.' +
      'POSTED_DATE,Data0112.INVOICE_DATE, '#13#10'       Data0112.INVOICE_TOT' +
      'AL,Data0112.amount_paid + Data0112.CASH_DISC AS amount_paid, '#13#10' ' +
      '      Data0112.INVOICE_TOTAL - Data0112.amount_paid - Data0112.C' +
      'ASH_DISC AS amt_payable,Data0097.PO_NUMBER, '#13#10'       Data0025.MA' +
      'NU_PART_NUMBER,Data0025.MANU_PART_DESC,Data0025.ANALYSIS_CODE_2,' +
      'Data0025.LAYERS, data0025.set_qty,'#13#10'       Data0008.PRODUCT_NAME' +
      ',Data0025.ANALYSIS_CODE_1,Data0025.unit_sq,'#39#39' AS delivery_no,Dat' +
      'a0060.SALES_ORDER,'#13#10'       '#39#39' AS date_shipped, 0 AS quan_shipped' +
      ',0 AS ovsh_qty,'#39#39' AS PARTS_ALLOC, data0112.ship_tax AS tax_2, '#13#10 +
      '       Data0112.RUSH_CHARGE_AMOUNT,Data0112.INVOICE_TOTAL AS amt' +
      '_shipped,'#13#10'       Data0112.INVOICE_TOTAL/(1+Data0112.ship_tax*0.' +
      '01) AS delivery_price,'#13#10'       0 AS cost_2,Data0112.GLPTR_STATUS' +
      ',case Data0025.ttype when 0 then '#39#37327#20135#39' when 1 then '#39#26679#26495#39' else '#39#39' e' +
      'nd as sttype,'#13#10'       case Data0060.so_tp when 0 then '#39#33258#21046#39' when ' +
      '1 then '#39#22806#21457#39' when 2 then '#39#21322#21046#31243#39' end AS so_tp,'#13#10'       Data0023.abb' +
      'r_name AS Supp_name,'#39#39' AS REF_NUMBER,'#39#39' AS cust_decl,Data0060.PA' +
      'RTS_ORDERED,'#13#10'       Data0015.abbr_name AS Factory_name,'#39#39' as as' +
      'sign_type,'#39#39' as rate_margin,Data0025.ORIG_CUSTOMER,'#13#10'       data' +
      '0005.EMPLOYEE_NAME,Data0010.FED_TAX_ID_NO,0 as chmj,'#39#39' as ROW_NA' +
      'ME'#13#10'FROM   Data0025 INNER JOIN'#13#10'       Data0060 ON Data0025.RKEY' +
      ' = Data0060.CUST_PART_PTR LEFT OUTER JOIN '#13#10'       Data0023 ON D' +
      'ata0060.supplier_ptr=Data0023.RKEY INNER JOIN'#13#10'       Data0008 O' +
      'N Data0025.PROD_CODE_PTR = Data0008.RKEY INNER JOIN'#13#10'       Data' +
      '0010 INNER JOIN'#13#10'       Data0112 ON Data0112.CUSTOMER_PTR = Data' +
      '0010.RKEY INNER JOIN'#13#10'       Data0015 ON Data0112.warehouse_ptr=' +
      'Data0015.RKEY INNER JOIN'#13#10'       Data0001 ON Data0112.CURRENCY_P' +
      'TR = Data0001.RKEY ON Data0060.RKEY = Data0112.sales_order_ptr I' +
      'NNER JOIN'#13#10'       Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data' +
      '0097.RKEY'#13#10'       INNER JOIN data0005 on Data0060.COMM_ASSIGNED_' +
      'BY_E_P = data0005.rkey'#13#10'WHERE  (Data0112.INVOICE_STATUS <> 3) AN' +
      'D (Data0112.INVOICE_TYPE = 2) AND '#13#10'       (Data0010.CUST_CODE >' +
      '= :edit1) AND (Data0010.CUST_CODE <= :edit2)'
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
      end>
    Left = 256
    Top = 136
    object ADOToolreq_no: TAutoIncField
      FieldName = 'req_no'
      ReadOnly = True
    end
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
    object ADOToolRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOToolinvoice_number: TStringField
      FieldName = 'invoice_number'
      Size = 12
    end
    object ADOToolCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADOToolEXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
      ReadOnly = True
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
    object ADOToolLAYERS: TWordField
      FieldName = 'LAYERS'
    end
    object ADOToolset_qty: TIntegerField
      FieldName = 'set_qty'
    end
    object ADOToolPRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADOToolANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
      Size = 30
    end
    object ADOToolunit_sq: TFloatField
      FieldName = 'unit_sq'
    end
    object ADOTooldelivery_no: TStringField
      FieldName = 'delivery_no'
      ReadOnly = True
      Size = 1
    end
    object ADOToolSALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADOTooldate_shipped: TStringField
      FieldName = 'date_shipped'
      ReadOnly = True
      Size = 1
    end
    object ADOToolquan_shipped: TIntegerField
      FieldName = 'quan_shipped'
      ReadOnly = True
    end
    object ADOToolovsh_qty: TIntegerField
      FieldName = 'ovsh_qty'
      ReadOnly = True
    end
    object ADOToolPARTS_ALLOC: TStringField
      FieldName = 'PARTS_ALLOC'
      ReadOnly = True
      Size = 1
    end
    object ADOTooltax_2: TBCDField
      FieldName = 'tax_2'
      Precision = 19
    end
    object ADOToolRUSH_CHARGE_AMOUNT: TBCDField
      FieldName = 'RUSH_CHARGE_AMOUNT'
      Precision = 19
    end
    object ADOToolamt_shipped: TBCDField
      FieldName = 'amt_shipped'
      Precision = 19
    end
    object ADOTooldelivery_price: TBCDField
      FieldName = 'delivery_price'
      ReadOnly = True
      Precision = 32
      Size = 17
    end
    object ADOToolcost_2: TIntegerField
      FieldName = 'cost_2'
      ReadOnly = True
    end
    object ADOToolGLPTR_STATUS: TBooleanField
      FieldName = 'GLPTR_STATUS'
    end
    object ADOToolso_tp: TStringField
      FieldName = 'so_tp'
      ReadOnly = True
      Size = 6
    end
    object ADOToolSupp_name: TStringField
      FieldName = 'Supp_name'
      Size = 16
    end
    object ADOToolREF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      ReadOnly = True
      Size = 1
    end
    object ADOToolcust_decl: TStringField
      FieldName = 'cust_decl'
      ReadOnly = True
      Size = 1
    end
    object ADOToolPARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object ADOToolFactory_name: TStringField
      FieldName = 'Factory_name'
      Size = 10
    end
    object ADOToolMISC_INV_DESCRIPTION: TStringField
      FieldKind = fkCalculated
      FieldName = 'MISC_INV_DESCRIPTION'
      Size = 500
      Calculated = True
    end
    object ADOToolassign_type: TStringField
      FieldName = 'assign_type'
      ReadOnly = True
      Size = 1
    end
    object ADOToolrate_margin: TStringField
      FieldName = 'rate_margin'
      ReadOnly = True
      Size = 1
    end
    object ADOToolORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      Size = 10
    end
    object ADOToolsttype: TStringField
      FieldName = 'sttype'
      ReadOnly = True
      Size = 4
    end
    object ADOToolEMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOToolFED_TAX_ID_NO: TStringField
      FieldName = 'FED_TAX_ID_NO'
      Size = 50
    end
    object ADOToolchmj: TIntegerField
      FieldName = 'chmj'
      ReadOnly = True
    end
    object ADOToolType: TStringField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Type'
      Size = 8
      Calculated = True
    end
    object ADOToolROW_NAME: TStringField
      FieldName = 'ROW_NAME'
      ReadOnly = True
      Size = 1
    end
  end
  object ADOSundry: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADOSundryCalcFields
    CommandText = 
      'SELECT Data0112.Rkey AS req_no,Data0010.rkey as rkey10,Data0010.' +
      'CUST_CODE,Data0010.ABBR_NAME,'#13#10'       Data0010.CUSTOMER_NAME,Dat' +
      'a0112.RKEY,Data0112.invoice_number, '#13#10'       Data0001.CURR_CODE,' +
      'convert(float,Data0112.EXCHANGE_RATE) as EXCHANGE_RATE,Data0112.' +
      'POSTED_DATE,Data0112.INVOICE_DATE, '#13#10'       Data0112.INVOICE_TOT' +
      'AL,Data0112.amount_paid + Data0112.CASH_DISC AS amount_paid, '#13#10' ' +
      '      Data0112.INVOICE_TOTAL - Data0112.amount_paid - Data0112.C' +
      'ASH_DISC AS amt_payable,'#39#39' AS PO_NUMBER, '#13#10'       '#39#39' AS MANU_PAR' +
      'T_NUMBER,'#39#39' AS MANU_PART_DESC,'#39#39' AS ANALYSIS_CODE_2,'#39#39' AS LAYERS' +
      ','#39#39' AS PRODUCT_NAME, '#13#10'       '#39#39' AS ANALYSIS_CODE_1,'#39#39' AS unit_s' +
      'q,'#39#39' AS delivery_no,'#39#39' AS SALES_ORDER,'#39#39' AS date_shipped,0 AS qu' +
      'an_shipped,'#13#10'       0 AS ovsh_qty,'#39#39' AS PARTS_ALLOC,ROUND(Data01' +
      '12.FED_TAX_AMOUNT/Data0112.ship_amount,2)*100 AS tax_2,'#13#10'       ' +
      'Data0112.RUSH_CHARGE_AMOUNT,Data0112.INVOICE_TOTAL AS amt_shippe' +
      'd,'#39#39' as set_qty,'#13#10'       case when Data0112.ship_amount>0 then D' +
      'ata0112.INVOICE_TOTAL/(1+ROUND(Data0112.FED_TAX_AMOUNT/Data0112.' +
      'ship_amount,2))'#13#10'       else Data0112.INVOICE_TOTAL end as deliv' +
      'ery_price,Data0112.MISC_INV_DESCRIPTION, '#13#10'       0 AS cost_2,Da' +
      'ta0112.GLPTR_STATUS,'#39#39' as sttype,'#39#39' AS so_tp,'#39#39' AS Supp_name,'#39#39' ' +
      'AS REF_NUMBER,'#39#39' AS cust_decl,'#13#10'       0 AS PARTS_ORDERED,Data00' +
      '15.abbr_name AS Factory_name,'#39#39' as assign_type,'#39#39' as rate_margin' +
      ','#39#39' as ORIG_CUSTOMER,'#13#10'       data0005.EMPLOYEE_NAME,Data0010.FE' +
      'D_TAX_ID_NO,0 as chmj,'#39#39' as ROW_NAME'#13#10'FROM   Data0010 INNER JOIN' +
      #13#10'       Data0112 ON Data0112.CUSTOMER_PTR = Data0010.RKEY INNER' +
      ' JOIN'#13#10'       Data0015 ON Data0112.warehouse_ptr=Data0015.RKEY I' +
      'NNER JOIN'#13#10'       Data0001 ON Data0112.CURRENCY_PTR = Data0001.R' +
      'KEY'#13#10'       join data0005 on Data0010.SALES_REP_PTR = data0005.r' +
      'key '#13#10'WHERE  (Data0112.INVOICE_STATUS <> 3) AND (Data0112.INVOIC' +
      'E_TYPE = 3) AND'#13#10'       (Data0010.CUST_CODE >= :edit1) AND (Data' +
      '0010.CUST_CODE <= :edit2)'
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
      end>
    Left = 256
    Top = 192
    object ADOSundryreq_no: TAutoIncField
      FieldName = 'req_no'
      ReadOnly = True
    end
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
    object ADOSundryRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOSundryinvoice_number: TStringField
      FieldName = 'invoice_number'
      Size = 12
    end
    object ADOSundryCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADOSundryEXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
      ReadOnly = True
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
    object ADOSundryPO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      ReadOnly = True
      Size = 1
    end
    object ADOSundryMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
      ReadOnly = True
      Size = 1
    end
    object ADOSundryMANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      ReadOnly = True
      Size = 1
    end
    object ADOSundryANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      ReadOnly = True
      Size = 1
    end
    object ADOSundryLAYERS: TStringField
      FieldName = 'LAYERS'
      ReadOnly = True
      Size = 1
    end
    object ADOSundryPRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      ReadOnly = True
      Size = 1
    end
    object ADOSundryANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
      ReadOnly = True
      Size = 1
    end
    object ADOSundryunit_sq: TStringField
      FieldName = 'unit_sq'
      ReadOnly = True
      Size = 1
    end
    object ADOSundrydelivery_no: TStringField
      FieldName = 'delivery_no'
      ReadOnly = True
      Size = 1
    end
    object ADOSundrySALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      ReadOnly = True
      Size = 1
    end
    object ADOSundrydate_shipped: TStringField
      FieldName = 'date_shipped'
      ReadOnly = True
      Size = 1
    end
    object ADOSundryquan_shipped: TIntegerField
      FieldName = 'quan_shipped'
      ReadOnly = True
    end
    object ADOSundryovsh_qty: TIntegerField
      FieldName = 'ovsh_qty'
      ReadOnly = True
    end
    object ADOSundryPARTS_ALLOC: TStringField
      FieldName = 'PARTS_ALLOC'
      ReadOnly = True
      Size = 1
    end
    object ADOSundrytax_2: TBCDField
      FieldName = 'tax_2'
      ReadOnly = True
      Precision = 19
    end
    object ADOSundryRUSH_CHARGE_AMOUNT: TBCDField
      FieldName = 'RUSH_CHARGE_AMOUNT'
      Precision = 19
    end
    object ADOSundryamt_shipped: TBCDField
      FieldName = 'amt_shipped'
      Precision = 19
    end
    object ADOSundrydelivery_price: TBCDField
      FieldName = 'delivery_price'
      ReadOnly = True
      Precision = 19
    end
    object ADOSundryMISC_INV_DESCRIPTION: TStringField
      FieldName = 'MISC_INV_DESCRIPTION'
      Size = 40
    end
    object ADOSundrycost_2: TIntegerField
      FieldName = 'cost_2'
      ReadOnly = True
    end
    object ADOSundryGLPTR_STATUS: TBooleanField
      FieldName = 'GLPTR_STATUS'
    end
    object ADOSundryso_tp: TStringField
      FieldName = 'so_tp'
      ReadOnly = True
      Size = 1
    end
    object ADOSundrySupp_name: TStringField
      FieldName = 'Supp_name'
      ReadOnly = True
      Size = 1
    end
    object ADOSundryREF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      ReadOnly = True
      Size = 1
    end
    object ADOSundrycust_decl: TStringField
      FieldName = 'cust_decl'
      ReadOnly = True
      Size = 1
    end
    object ADOSundryPARTS_ORDERED: TIntegerField
      FieldName = 'PARTS_ORDERED'
      ReadOnly = True
    end
    object ADOSundryFactory_name: TStringField
      FieldName = 'Factory_name'
      Size = 10
    end
    object ADOSundryassign_type: TStringField
      FieldName = 'assign_type'
      ReadOnly = True
      Size = 1
    end
    object ADOSundryrate_margin: TStringField
      FieldName = 'rate_margin'
      ReadOnly = True
      Size = 1
    end
    object ADOSundryORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      ReadOnly = True
      Size = 1
    end
    object ADOSundrysttype: TStringField
      FieldName = 'sttype'
      ReadOnly = True
      Size = 4
    end
    object ADOSundryTYPE: TStringField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'TYPE'
      Size = 8
      Calculated = True
    end
    object ADOSundryEMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOSundryFED_TAX_ID_NO: TStringField
      FieldName = 'FED_TAX_ID_NO'
      Size = 50
    end
    object ADOSundrychmj: TIntegerField
      FieldName = 'chmj'
      ReadOnly = True
    end
    object ADOSundryROW_NAME: TStringField
      FieldName = 'ROW_NAME'
      ReadOnly = True
      Size = 1
    end
    object ADOSundryset_qty: TStringField
      FieldName = 'set_qty'
      ReadOnly = True
      Size = 1
    end
  end
  object ADONoReturnMemo: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADONoReturnMemoCalcFields
    CommandText = 
      'SELECT Data0116.Rkey AS req_no,Data0010.rkey as rkey10,Data0010.' +
      'CUST_CODE,Data0010.ABBR_NAME,Data0010.CUSTOMER_NAME,Data0116.RKE' +
      'Y, '#13#10'       '#39'('#36864')'#39' + Data0116.MEMO_NUMBER AS invoice_number,Data0' +
      '001.CURR_CODE,convert(float,Data0116.EX_RATE) AS exchange_rate, ' +
      #13#10'       Data0116.MEMO_DATE AS POSTED_DATE,Data0116.RMA_DATE AS ' +
      'invoice_date, - (1 * Data0116.AMOUNT) AS invoice_total, '#13#10'      ' +
      ' - (Data0116.AMOUNT - Data0116.AVL_AMT) AS amount_paid, - (1 * D' +
      'ata0116.AVL_AMT) AS amt_payable,'#39#39' AS PO_NUMBER, '#13#10'       '#39#39' AS ' +
      'MANU_PART_NUMBER,'#39#39' AS MANU_PART_DESC,'#39#39' AS ANALYSIS_CODE_2,'#39#39' A' +
      'S LAYERS,'#39#39' AS PRODUCT_NAME, '#13#10'       '#39#39' AS ANALYSIS_CODE_1,'#39#39' A' +
      'S unit_sq,Data0116.MEMO_NUMBER AS delivery_no,'#39#39' AS SALES_ORDER,' +
      #39#39' AS date_shipped, '#13#10'       0 AS quan_shipped,0 AS ovsh_qty,'#39#39' ' +
      'AS PARTS_ALLOC,'#13#10'       case when (Data0116.GOODS_AMT + Data0116' +
      '.SHIPPING + Data0116.TOOLING_CHARGE)>0 '#13#10'       then Round(Data0' +
      '116.FED_TAX/(Data0116.GOODS_AMT + Data0116.SHIPPING + Data0116.T' +
      'OOLING_CHARGE),2)*100 else 0 end AS tax_2,'#13#10'       -Data0116.RUS' +
      'H_CHARGE AS RUSH_CHARGE_AMOUNT, - Data0116.AMOUNT AS amt_shipped' +
      ','#39#39' as set_qty,'#13#10'       -case when (Data0116.GOODS_AMT + Data011' +
      '6.SHIPPING + Data0116.TOOLING_CHARGE)>0 '#13#10'       then Data0116.A' +
      'MOUNT/(1+Round(Data0116.FED_TAX/(Data0116.GOODS_AMT + Data0116.S' +
      'HIPPING + Data0116.TOOLING_CHARGE),2))'#13#10'       else 0 end as del' +
      'ivery_price,'#13#10'       Data0116.DESCRIPTION AS MISC_INV_DESCRIPTIO' +
      'N, 0 AS cost_2,Data0116.GLPTR_STATUS,'#39#39' as sttype,'#39#39' AS so_tp,'#39#39 +
      ' AS Supp_name,'#13#10'       Data0116.REF_NUMBER,'#39#39' AS cust_decl,0 AS ' +
      'PARTS_ORDERED,Data0015.abbr_name AS Factory_name,'#39#39' as assign_ty' +
      'pe,'#39#39' as rate_margin,'#39#39' as ORIG_CUSTOMER,'#13#10'       data0005.EMPLO' +
      'YEE_NAME,Data0010.FED_TAX_ID_NO,0 as chmj,'#39#39' as ROW_NAME'#13#10'FROM  ' +
      ' Data0116 INNER JOIN'#13#10'       Data0015 ON Data0116.warehouse_ptr=' +
      'Data0015.RKEY INNER JOIN'#13#10'       Data0001 ON Data0116.CURRENCY_P' +
      'TR = Data0001.RKEY INNER JOIN'#13#10'       Data0010 ON Data0116.CUST_' +
      'PTR = Data0010.RKEY'#13#10'       join data0005 on Data0010.SALES_REP_' +
      'PTR = data0005.rkey '#13#10'WHERE  (Data0116.MEMO_TP = 3) AND (Data011' +
      '6.memo_status <> 3) AND '#13#10'       (Data0010.CUST_CODE >= :edit1) ' +
      'AND (Data0010.CUST_CODE <= :edit2)'
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
      end>
    Left = 256
    Top = 312
    object ADONoReturnMemoreq_no: TAutoIncField
      FieldName = 'req_no'
      ReadOnly = True
    end
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
    object ADONoReturnMemoRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADONoReturnMemoinvoice_number: TStringField
      FieldName = 'invoice_number'
      ReadOnly = True
      Size = 14
    end
    object ADONoReturnMemoCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADONoReturnMemoexchange_rate: TFloatField
      FieldName = 'exchange_rate'
      ReadOnly = True
    end
    object ADONoReturnMemoPOSTED_DATE: TDateTimeField
      FieldName = 'POSTED_DATE'
    end
    object ADONoReturnMemoinvoice_date: TDateTimeField
      FieldName = 'invoice_date'
    end
    object ADONoReturnMemoinvoice_total: TBCDField
      FieldName = 'invoice_total'
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
    object ADONoReturnMemoPO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      ReadOnly = True
      Size = 1
    end
    object ADONoReturnMemoMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
      ReadOnly = True
      Size = 1
    end
    object ADONoReturnMemoMANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      ReadOnly = True
      Size = 1
    end
    object ADONoReturnMemoANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      ReadOnly = True
      Size = 1
    end
    object ADONoReturnMemoLAYERS: TStringField
      FieldName = 'LAYERS'
      ReadOnly = True
      Size = 1
    end
    object ADONoReturnMemoPRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      ReadOnly = True
      Size = 1
    end
    object ADONoReturnMemoANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
      ReadOnly = True
      Size = 1
    end
    object ADONoReturnMemounit_sq: TStringField
      FieldName = 'unit_sq'
      ReadOnly = True
      Size = 1
    end
    object ADONoReturnMemodelivery_no: TStringField
      FieldName = 'delivery_no'
      Size = 10
    end
    object ADONoReturnMemoSALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      ReadOnly = True
      Size = 1
    end
    object ADONoReturnMemodate_shipped: TStringField
      FieldName = 'date_shipped'
      ReadOnly = True
      Size = 1
    end
    object ADONoReturnMemoquan_shipped: TIntegerField
      FieldName = 'quan_shipped'
      ReadOnly = True
    end
    object ADONoReturnMemoovsh_qty: TIntegerField
      FieldName = 'ovsh_qty'
      ReadOnly = True
    end
    object ADONoReturnMemoPARTS_ALLOC: TStringField
      FieldName = 'PARTS_ALLOC'
      ReadOnly = True
      Size = 1
    end
    object ADONoReturnMemotax_2: TBCDField
      FieldName = 'tax_2'
      ReadOnly = True
      Precision = 19
    end
    object ADONoReturnMemoRUSH_CHARGE_AMOUNT: TBCDField
      FieldName = 'RUSH_CHARGE_AMOUNT'
      ReadOnly = True
      Precision = 19
    end
    object ADONoReturnMemoamt_shipped: TBCDField
      FieldName = 'amt_shipped'
      ReadOnly = True
      Precision = 19
    end
    object ADONoReturnMemodelivery_price: TBCDField
      FieldName = 'delivery_price'
      ReadOnly = True
      Precision = 19
    end
    object ADONoReturnMemoMISC_INV_DESCRIPTION: TStringField
      FieldName = 'MISC_INV_DESCRIPTION'
      Size = 60
    end
    object ADONoReturnMemocost_2: TIntegerField
      FieldName = 'cost_2'
      ReadOnly = True
    end
    object ADONoReturnMemoGLPTR_STATUS: TBooleanField
      FieldName = 'GLPTR_STATUS'
    end
    object ADONoReturnMemoso_tp: TStringField
      FieldName = 'so_tp'
      ReadOnly = True
      Size = 1
    end
    object ADONoReturnMemoSupp_name: TStringField
      FieldName = 'Supp_name'
      ReadOnly = True
      Size = 1
    end
    object ADONoReturnMemoREF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
    end
    object ADONoReturnMemocust_decl: TStringField
      FieldName = 'cust_decl'
      ReadOnly = True
      Size = 1
    end
    object ADONoReturnMemoPARTS_ORDERED: TIntegerField
      FieldName = 'PARTS_ORDERED'
      ReadOnly = True
    end
    object ADONoReturnMemoFactory_name: TStringField
      FieldName = 'Factory_name'
      Size = 10
    end
    object ADONoReturnMemoassign_type: TStringField
      FieldName = 'assign_type'
      ReadOnly = True
      Size = 1
    end
    object ADONoReturnMemorate_margin: TStringField
      FieldName = 'rate_margin'
      ReadOnly = True
      Size = 1
    end
    object ADONoReturnMemoORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      ReadOnly = True
      Size = 1
    end
    object ADONoReturnMemosttype: TStringField
      FieldName = 'sttype'
      ReadOnly = True
      Size = 4
    end
    object ADONoReturnMemoEMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADONoReturnMemoFED_TAX_ID_NO: TStringField
      FieldName = 'FED_TAX_ID_NO'
      Size = 50
    end
    object ADONoReturnMemochmj: TIntegerField
      FieldName = 'chmj'
      ReadOnly = True
    end
    object ADONoReturnMemoTYPE: TStringField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'TYPE'
      Size = 10
      Calculated = True
    end
    object ADONoReturnMemoROW_NAME: TStringField
      FieldName = 'ROW_NAME'
      ReadOnly = True
      Size = 1
    end
    object ADONoReturnMemoset_qty: TStringField
      FieldName = 'set_qty'
      ReadOnly = True
      Size = 1
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 152
    Top = 224
  end
  object ADOItems0: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
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
      'Select data0065.amount,data0061.category'
      'from data0061,data0065'
      'where data0065.ADDL_CATEGORY_PTR=data0061.rkey'
      'and data0065.INVOICE_PTR=:rkey')
    Left = 151
    Top = 280
    object ADOItems0amount: TFloatField
      FieldName = 'amount'
    end
    object ADOItems0category: TStringField
      FieldName = 'category'
    end
  end
  object ADOReturnMemo: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADOReturnMemoCalcFields
    CommandText = 
      'SELECT Data0098.Rkey AS req_no,Data0010.rkey as rkey10,Data0010.' +
      'CUST_CODE,Data0010.ABBR_NAME,Data0010.CUSTOMER_NAME,Data0116.RKE' +
      'Y, '#13#10'       '#39'('#36864')'#39' + Data0116.MEMO_NUMBER AS invoice_number,Data0' +
      '001.CURR_CODE,convert(float,Data0116.EX_RATE) AS EXCHANGE_RATE, ' +
      #13#10'       Data0116.MEMO_DATE AS POSTED_DATE,Data0116.RMA_DATE AS ' +
      'invoice_date, - (1 * Data0116.AMOUNT) AS invoice_total, '#13#10'      ' +
      ' - (Data0116.AMOUNT - Data0116.AVL_AMT) AS amount_paid, - (1 * D' +
      'ata0116.AVL_AMT) AS amt_payable,Data0097.PO_NUMBER, '#13#10'       Dat' +
      'a0025.MANU_PART_NUMBER,Data0025.MANU_PART_DESC,Data0025.ANALYSIS' +
      '_CODE_2,Data0025.LAYERS,data0025.set_qty, '#13#10'       Data0008.PROD' +
      'UCT_NAME,Data0025.ANALYSIS_CODE_1,Data0025.unit_sq,Data0098.RMA_' +
      'NUMBER AS delivery_no, '#13#10'       Data0060.SALES_ORDER,Data0098.Pu' +
      'taway_date AS date_shipped, - (1 * Data0098.QTY_RECD) AS quan_sh' +
      'ipped, '#13#10'       - Data0098.QTY_CRED AS ovsh_qty,Data0060.PARTS_A' +
      'LLOC,Data0098.tax_2,'#13#10'       -(Data0060.PARTS_ALLOC * Data0098.Q' +
      'TY_CRED) * (1 + Data0098.tax_2 * 0.01) As RUSH_CHARGE_AMOUNT, '#13#10 +
      '     - ((Data0060.PARTS_ALLOC * Data0098.QTY_RECD) * (1 + Data00' +
      '98.tax_2 * 0.01)) AS amt_shipped, '#13#10'       -Data0098.QTY_RECD * ' +
      'Data0060.PARTS_ALLOC as delivery_price,'#13#10'       Data0116.DESCRIP' +
      'TION AS MISC_INV_DESCRIPTION, derivedtbl_1.cost_2*QTY_AUTH as co' +
      'st_2,Data0098.GLPTR_STATUS,case Data0025.ttype when 0 then '#39#37327#20135#39' ' +
      'when 1 then '#39#26679#26495#39' else '#39#39' end as sttype,'#13#10'       case Data0060.so' +
      '_tp when 0 then '#39#33258#21046#39' when 1 then '#39#22806#21457#39' when 2 then '#39#21322#21046#31243#39' end AS s' +
      'o_tp,'#13#10'       Data0023.abbr_name AS Supp_name,Data0116.REF_NUMBE' +
      'R,'#39#39' AS cust_decl,Data0060.PARTS_ORDERED,'#13#10'       Data0015.abbr_' +
      'name AS Factory_name,'#39#39' as assign_type,'#39#39' as rate_margin,Data002' +
      '5.ORIG_CUSTOMER,'#13#10'       data0005.EMPLOYEE_NAME,Data0010.FED_TAX' +
      '_ID_NO,Data0025.unit_sq * Data0098.QTY_RECD as chmj,'#39#39' as ROW_NA' +
      'ME'#13#10'FROM   Data0001 INNER JOIN'#13#10'       Data0116 INNER JOIN'#13#10'    ' +
      '   Data0015 ON Data0116.warehouse_ptr=Data0015.RKEY INNER JOIN'#13#10 +
      '       Data0010 ON Data0116.CUST_PTR = Data0010.RKEY ON Data0001' +
      '.RKEY = Data0116.CURRENCY_PTR INNER JOIN'#13#10'       Data0008 INNER ' +
      'JOIN'#13#10'       Data0097 INNER JOIN'#13#10'       Data0025 INNER JOIN'#13#10'  ' +
      '     Data0098 ON Data0025.RKEY = Data0098.CUSTOMER_PART_PTR INNE' +
      'R JOIN'#13#10'       Data0060 ON Data0098.SO_PTR = Data0060.RKEY ON Da' +
      'ta0097.RKEY = Data0060.PURCHASE_ORDER_PTR ON '#13#10'       Data0008.R' +
      'KEY = Data0025.PROD_CODE_PTR ON Data0116.RKEY = Data0098.srce_pt' +
      'r LEFT OUTER JOIN '#13#10'       Data0023 ON Data0060.supplier_ptr=Dat' +
      'a0023.RKEY INNER JOIN'#13#10'       (  SELECT dbo.data0416.rma_ptr, -a' +
      'vg(dbo.Data0053.cost_pcs) as cost_2'#13#10'          FROM data0416 INN' +
      'ER JOIN Data0053 ON data0416.rkey=Data0053.NPAD_PTR '#13#10'          ' +
      'WHERE (dbo.data0416.type = 4) group by data0416.rma_ptr) AS deri' +
      'vedtbl_1 ON Data0098.RKEY = derivedtbl_1.rma_ptr'#13#10'join data0005 ' +
      'on Data0060.COMM_ASSIGNED_BY_E_P = data0005.rkey'#13#10'WHERE  (Data01' +
      '16.MEMO_TP = 4) AND (Data0116.memo_status <> 3) AND'#13#10'       (Dat' +
      'a0010.CUST_CODE >= :edit1) AND (Data0010.CUST_CODE <= :edit2)'#13#10
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
      end>
    Left = 258
    Top = 248
    object ADOReturnMemoreq_no: TAutoIncField
      FieldName = 'req_no'
      ReadOnly = True
    end
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
    object ADOReturnMemoRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOReturnMemoinvoice_number: TStringField
      FieldName = 'invoice_number'
      ReadOnly = True
      Size = 14
    end
    object ADOReturnMemoCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADOReturnMemoEXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
      ReadOnly = True
    end
    object ADOReturnMemoPOSTED_DATE: TDateTimeField
      FieldName = 'POSTED_DATE'
    end
    object ADOReturnMemoinvoice_date: TDateTimeField
      FieldName = 'invoice_date'
    end
    object ADOReturnMemoinvoice_total: TBCDField
      FieldName = 'invoice_total'
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
    object ADOReturnMemoLAYERS: TWordField
      FieldName = 'LAYERS'
    end
    object ADOReturnMemoset_qty: TIntegerField
      FieldName = 'set_qty'
    end
    object ADOReturnMemoPRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADOReturnMemoANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
      Size = 30
    end
    object ADOReturnMemounit_sq: TFloatField
      FieldName = 'unit_sq'
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
    object ADOReturnMemodate_shipped: TDateTimeField
      FieldName = 'date_shipped'
    end
    object ADOReturnMemoquan_shipped: TIntegerField
      FieldName = 'quan_shipped'
      ReadOnly = True
    end
    object ADOReturnMemoovsh_qty: TIntegerField
      FieldName = 'ovsh_qty'
      ReadOnly = True
    end
    object ADOReturnMemoPARTS_ALLOC: TFloatField
      FieldName = 'PARTS_ALLOC'
    end
    object ADOReturnMemotax_2: TBCDField
      FieldName = 'tax_2'
      Precision = 5
      Size = 2
    end
    object ADOReturnMemoRUSH_CHARGE_AMOUNT: TFloatField
      FieldName = 'RUSH_CHARGE_AMOUNT'
      ReadOnly = True
    end
    object ADOReturnMemoamt_shipped: TFloatField
      FieldName = 'amt_shipped'
      ReadOnly = True
    end
    object ADOReturnMemodelivery_price: TFloatField
      FieldName = 'delivery_price'
      ReadOnly = True
    end
    object ADOReturnMemoMISC_INV_DESCRIPTION: TStringField
      FieldName = 'MISC_INV_DESCRIPTION'
      Size = 60
    end
    object ADOReturnMemocost_2: TFloatField
      FieldName = 'cost_2'
      ReadOnly = True
    end
    object ADOReturnMemoGLPTR_STATUS: TBooleanField
      FieldName = 'GLPTR_STATUS'
    end
    object ADOReturnMemoso_tp: TStringField
      FieldName = 'so_tp'
      ReadOnly = True
      Size = 6
    end
    object ADOReturnMemoSupp_name: TStringField
      FieldName = 'Supp_name'
      Size = 16
    end
    object ADOReturnMemoREF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
    end
    object ADOReturnMemocust_decl: TStringField
      FieldName = 'cust_decl'
      ReadOnly = True
      Size = 1
    end
    object ADOReturnMemoPARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object ADOReturnMemoFactory_name: TStringField
      FieldName = 'Factory_name'
      Size = 10
    end
    object ADOReturnMemoassign_type: TStringField
      FieldName = 'assign_type'
      ReadOnly = True
      Size = 1
    end
    object ADOReturnMemorate_margin: TStringField
      FieldName = 'rate_margin'
      ReadOnly = True
      Size = 1
    end
    object ADOReturnMemoORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      Size = 10
    end
    object ADOReturnMemosttype: TStringField
      FieldName = 'sttype'
      ReadOnly = True
      Size = 4
    end
    object ADOReturnMemoEMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOReturnMemoFED_TAX_ID_NO: TStringField
      FieldName = 'FED_TAX_ID_NO'
      Size = 50
    end
    object ADOReturnMemoTYPE: TStringField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'TYPE'
      Size = 8
      Calculated = True
    end
    object ADOReturnMemochmj: TFloatField
      FieldName = 'chmj'
      ReadOnly = True
    end
    object ADOReturnMemoROW_NAME: TStringField
      FieldName = 'ROW_NAME'
      ReadOnly = True
      Size = 1
    end
  end
  object ADO10_1: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT  RKEY,CUST_CODE,CUSTOMER_NAME'#13#10'FROM  Data0010'#13#10'WHERE CUST' +
      '_CODE = :cust_code '#13#10'ORDER BY CUST_CODE'
    Parameters = <
      item
        Name = 'cust_code'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    Left = 160
    Top = 24
    object ADO10_1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO10_1CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADO10_1CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
  end
  object qry_010: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT  RKEY,CUST_CODE,CUSTOMER_NAME'
      'FROM  Data0010'
      ''
      'ORDER BY CUST_CODE')
    Left = 160
    Top = 96
    object qry_010RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object qry_010CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object qry_010CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
  end
end
