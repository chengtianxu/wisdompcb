object DM: TDM
  OldCreateOrder = False
  Left = 557
  Top = 235
  Height = 416
  Width = 257
  object ADOConn: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 160
  end
  object ADODataSet1: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT Data0023.rkey,Data0023.CODE,Data0023.ABBR_NAME,Data0023.S' +
      'UPPLIER_NAME,Data0107.INVOICE_NO,Data0001.CURR_CODE, '#13#10'       Da' +
      'ta0107.EX_RATE,Data0107.INV_DATE,Data0107.INV_TOTAL,Data0107.AMT' +
      '_PAID + Data0107.CASH_DISC AS amount_paid, '#13#10'       Data0107.INV' +
      '_TOTAL - Data0107.AMT_PAID - Data0107.CASH_DISC AS amt_payable,D' +
      'ata0017.INV_PART_NUMBER, '#13#10'       Data0017.INV_PART_DESCRIPTION,' +
      'Data0017.INV_DESCRIPTION,Data0022.QUANTITY,Data0022.PRICE,Data00' +
      '22.TAX_2,'#13#10'       Data0022.tax_price,Data0022.tax_price*Data0022' +
      '.QUANTITY AS Rec_amount,Data0107.tax_invoice_amt,'#13#10'       Data01' +
      '07.tax_invoice_date,case Data0022.GLPTR_STATUS '#13#10'       when 0 t' +
      'hen '#39#21542#39' when 1 then '#39#26159#39' end AS GLPTR_STATUS,Data0107.tax_invoice' +
      '_ref,'#13#10'       case Data0022.TTYPE when 2 then '#39#26631#20934'PO'#39' when 3 then' +
      ' '#39#30452#25509#20837#20179#39' end AS TType,'#13#10'       Data0456.GRN_NUMBER,Data0456.DELIV' +
      'ER_NUMBER,Data0070.PO_NUMBER'#13#10'FROM   Data0107 INNER JOIN'#13#10'      ' +
      ' Data0023 ON Data0107.SUPP_PTR = Data0023.RKEY INNER JOIN'#13#10'     ' +
      '  Data0456 ON Data0107.RKEY = Data0456.dealiv_ptr INNER JOIN'#13#10'  ' +
      '     Data0022 ON Data0456.RKEY = Data0022.GRN_PTR INNER JOIN'#13#10'  ' +
      '     Data0017 ON Data0022.INVENTORY_PTR = Data0017.RKEY INNER JO' +
      'IN'#13#10'       Data0001 ON Data0107.CURRENCY_PTR = Data0001.RKEY LEF' +
      'T JOIN'#13#10'       Data0070 ON Data0456.PO_PTR = Data0070.RKEY'#13#10'WHER' +
      'E  Data0107.STATUS<>3 AND (Data0107.INV_TP=0 or Data0107.INV_TP=' +
      '2) AND'#13#10'       (Data0023.Code>=:edit1) AND (Data0023.Code<=:edit' +
      '2) AND Data0107.INV_DATE>=:dtpk1 AND Data0107.INV_DATE<=:dtpk2 '#13 +
      #10'ORDER BY Data0023.CODE'
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
    Left = 128
    Top = 80
    object ADODataSet1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADODataSet1CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ADODataSet1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object ADODataSet1SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ADODataSet1INVOICE_NO: TStringField
      FieldName = 'INVOICE_NO'
      Size = 16
    end
    object ADODataSet1CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADODataSet1EX_RATE: TFloatField
      FieldName = 'EX_RATE'
    end
    object ADODataSet1INV_DATE: TDateTimeField
      FieldName = 'INV_DATE'
    end
    object ADODataSet1INV_TOTAL: TBCDField
      FieldName = 'INV_TOTAL'
      Precision = 19
    end
    object ADODataSet1amount_paid: TBCDField
      FieldName = 'amount_paid'
      ReadOnly = True
      Precision = 19
    end
    object ADODataSet1amt_payable: TBCDField
      FieldName = 'amt_payable'
      ReadOnly = True
      Precision = 19
    end
    object ADODataSet1INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADODataSet1INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ADODataSet1INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADODataSet1QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object ADODataSet1PRICE: TBCDField
      FieldName = 'PRICE'
      Precision = 15
      Size = 6
    end
    object ADODataSet1TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ADODataSet1tax_price: TBCDField
      FieldName = 'tax_price'
      Precision = 12
      Size = 3
    end
    object ADODataSet1Rec_amount: TFloatField
      FieldName = 'Rec_amount'
      ReadOnly = True
    end
    object ADODataSet1tax_invoice_amt: TBCDField
      FieldName = 'tax_invoice_amt'
      Precision = 19
    end
    object ADODataSet1tax_invoice_date: TDateTimeField
      FieldName = 'tax_invoice_date'
    end
    object ADODataSet1GLPTR_STATUS: TStringField
      FieldName = 'GLPTR_STATUS'
      ReadOnly = True
      Size = 2
    end
    object ADODataSet1tax_invoice_ref: TStringField
      FieldName = 'tax_invoice_ref'
      Size = 50
    end
    object ADODataSet1TType: TStringField
      FieldName = 'TType'
      ReadOnly = True
      Size = 8
    end
    object ADODataSet1GRN_NUMBER: TStringField
      DisplayLabel = #20837#24211#21333#21495
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object ADODataSet1DELIVER_NUMBER: TStringField
      DisplayLabel = #20379#24212#21830#36865#36135#21333#21495
      DisplayWidth = 25
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object ADODataSet1PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 15
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 128
    Top = 16
  end
  object ADODataSet2: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT Data0023.rkey,Data0023.CODE,Data0023.ABBR_NAME,Data0023.S' +
      'UPPLIER_NAME,Data0107.INVOICE_NO,Data0001.CURR_CODE, '#13#10'       Da' +
      'ta0107.EX_RATE,Data0107.INV_DATE,Data0107.INV_TOTAL,Data0107.AMT' +
      '_PAID + Data0107.CASH_DISC AS amount_paid, '#13#10'       Data0107.INV' +
      '_TOTAL - Data0107.AMT_PAID - Data0107.CASH_DISC AS amt_payable,'#39 +
      #39' AS INV_PART_NUMBER,'#13#10'       Data0235.goods_name AS INV_PART_DE' +
      'SCRIPTION,Data0235.goods_guige AS INV_DESCRIPTION,Data0235.QUAN_' +
      'RECD AS QUANTITY,'#13#10'       Data0235.unit_price/(1+Data0235.state_' +
      'tax*0.01) AS PRICE,Data0235.state_tax AS TAX_2,Data0235.unit_pri' +
      'ce AS tax_price,'#13#10'       Data0235.QUAN_RECD*Data0235.unit_price ' +
      'AS Rec_amount,Data0107.tax_invoice_amt,Data0107.tax_invoice_date' +
      ','#13#10'       case Data0235.GLPTR_STATUS when 0 then '#39#21542#39' when 1 then' +
      ' '#39#26159#39' end AS GLPTR_STATUS,Data0107.tax_invoice_ref,'#13#10'       case ' +
      'Data0107.INV_TP when 1 then '#39#26434#39033'PO'#39' end AS TType,Data0456.GRN_NUM' +
      'BER,Data0456.DELIVER_NUMBER,Data0070.PO_NUMBER'#13#10'FROM   Data0107 ' +
      'INNER JOIN'#13#10'       Data0023 ON Data0107.SUPP_PTR = Data0023.RKEY' +
      ' LEFT OUTER JOIN'#13#10'       Data0456 ON Data0107.RKEY = Data0456.de' +
      'aliv_ptr INNER JOIN'#13#10'       Data0001 ON Data0107.CURRENCY_PTR = ' +
      'Data0001.RKEY INNER JOIN'#13#10'       Data0235 ON Data0456.RKEY = Dat' +
      'a0235.GRN_PTR LEFT JOIN'#13#10'       Data0070 ON Data0456.PO_PTR = Da' +
      'ta0070.RKEY'#13#10'WHERE  Data0107.INV_TP=1 AND Data0107.STATUS<>3 AND' +
      ' (Data0023.Code >=:edit1) AND (Data0023.Code<=:edit2) AND '#13#10'    ' +
      '   Data0107.INV_DATE>=:dtpk1 AND Data0107.INV_DATE<=:dtpk2'#13#10'ORDE' +
      'R BY Data0023.CODE'
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
    Left = 128
    Top = 136
    object ADODataSet2rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADODataSet2CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ADODataSet2ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object ADODataSet2SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ADODataSet2INVOICE_NO: TStringField
      FieldName = 'INVOICE_NO'
      Size = 16
    end
    object ADODataSet2CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADODataSet2EX_RATE: TFloatField
      FieldName = 'EX_RATE'
    end
    object ADODataSet2INV_DATE: TDateTimeField
      FieldName = 'INV_DATE'
    end
    object ADODataSet2INV_TOTAL: TBCDField
      FieldName = 'INV_TOTAL'
      Precision = 19
    end
    object ADODataSet2amount_paid: TBCDField
      FieldName = 'amount_paid'
      ReadOnly = True
      Precision = 19
    end
    object ADODataSet2amt_payable: TBCDField
      FieldName = 'amt_payable'
      ReadOnly = True
      Precision = 19
    end
    object ADODataSet2INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      ReadOnly = True
      Size = 1
    end
    object ADODataSet2INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      Size = 60
    end
    object ADODataSet2INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 200
    end
    object ADODataSet2QUANTITY: TBCDField
      FieldName = 'QUANTITY'
      Precision = 10
      Size = 3
    end
    object ADODataSet2PRICE: TBCDField
      FieldName = 'PRICE'
      ReadOnly = True
      Precision = 23
      Size = 12
    end
    object ADODataSet2TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ADODataSet2tax_price: TBCDField
      FieldName = 'tax_price'
      Precision = 10
      Size = 3
    end
    object ADODataSet2Rec_amount: TBCDField
      FieldName = 'Rec_amount'
      ReadOnly = True
      Precision = 21
      Size = 6
    end
    object ADODataSet2tax_invoice_amt: TBCDField
      FieldName = 'tax_invoice_amt'
      Precision = 19
    end
    object ADODataSet2tax_invoice_date: TDateTimeField
      FieldName = 'tax_invoice_date'
    end
    object ADODataSet2GLPTR_STATUS: TStringField
      FieldName = 'GLPTR_STATUS'
      ReadOnly = True
      Size = 2
    end
    object ADODataSet2tax_invoice_ref: TStringField
      FieldName = 'tax_invoice_ref'
      Size = 50
    end
    object ADODataSet2TType: TStringField
      FieldName = 'TType'
      ReadOnly = True
      Size = 6
    end
    object ADODataSet2GRN_NUMBER: TStringField
      DisplayLabel = #20837#24211#21333#21495
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object ADODataSet2DELIVER_NUMBER: TStringField
      DisplayLabel = #20379#24212#21830#36865#36135#21333#21495
      DisplayWidth = 25
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object ADODataSet2PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 15
    end
  end
  object ADODataSet3: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT Data0023.rkey,Data0023.CODE,Data0023.ABBR_NAME,Data0023.S' +
      'UPPLIER_NAME,Data0107.INVOICE_NO,Data0001.CURR_CODE, '#13#10'       Da' +
      'ta0107.EX_RATE,Data0107.INV_DATE,Data0107.INV_TOTAL,Data0107.AMT' +
      '_PAID + Data0107.CASH_DISC AS amount_paid, '#13#10'       Data0107.INV' +
      '_TOTAL - Data0107.AMT_PAID - Data0107.CASH_DISC AS amt_payable,'#39 +
      #39' AS INV_PART_NUMBER, '#13#10'       '#39#39' AS INV_PART_DESCRIPTION,'#39#39' AS ' +
      'INV_DESCRIPTION,0 AS QUANTITY,0 AS PRICE,0 AS TAX_2,0 AS tax_pri' +
      'ce,'#13#10'       0 AS Rec_amount,Data0107.tax_invoice_amt,Data0107.ta' +
      'x_invoice_date,'#13#10'       case Data0107.GLPTR_STATUS when 0 then '#39 +
      #21542#39' when 1 then '#39#26159#39' end AS GLPTR_STATUS,'#13#10'       Data0107.tax_inv' +
      'oice_ref,case Data0107.INV_TP when 4 then '#39#20854#23427#36153#29992#39' end AS TType,'#13#10 +
      '       GRN_NUMBER=CAST('#39#39' as varchar(10)),DELIVER_NUMBER=CAST('#39#39 +
      ' as varchar(15)),PO_NUMBER=CAST('#39#39' as varchar(15))'#13#10'FROM   Data0' +
      '001 INNER JOIN'#13#10'       Data0107 INNER JOIN'#13#10'       Data0023 ON D' +
      'ata0107.SUPP_PTR = Data0023.RKEY ON Data0001.RKEY = Data0107.CUR' +
      'RENCY_PTR'#13#10'WHERE  Data0107.INV_TP=4 AND Data0107.STATUS<>3 AND (' +
      'Data0023.Code>=:edit1) AND (Data0023.Code<=:edit2) AND '#13#10'       ' +
      'Data0107.INV_DATE>=:dtpk1 AND Data0107.INV_DATE<=:dtpk2'#13#10'ORDER B' +
      'Y Data0023.CODE'
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
    Left = 128
    Top = 200
    object ADODataSet3rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADODataSet3CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ADODataSet3ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object ADODataSet3SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ADODataSet3INVOICE_NO: TStringField
      FieldName = 'INVOICE_NO'
      Size = 16
    end
    object ADODataSet3CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADODataSet3EX_RATE: TFloatField
      FieldName = 'EX_RATE'
    end
    object ADODataSet3INV_DATE: TDateTimeField
      FieldName = 'INV_DATE'
    end
    object ADODataSet3INV_TOTAL: TBCDField
      FieldName = 'INV_TOTAL'
      Precision = 19
    end
    object ADODataSet3amount_paid: TBCDField
      FieldName = 'amount_paid'
      ReadOnly = True
      Precision = 19
    end
    object ADODataSet3amt_payable: TBCDField
      FieldName = 'amt_payable'
      ReadOnly = True
      Precision = 19
    end
    object ADODataSet3INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      ReadOnly = True
      Size = 1
    end
    object ADODataSet3INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 1
    end
    object ADODataSet3INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      ReadOnly = True
      Size = 1
    end
    object ADODataSet3QUANTITY: TIntegerField
      FieldName = 'QUANTITY'
      ReadOnly = True
    end
    object ADODataSet3PRICE: TIntegerField
      FieldName = 'PRICE'
      ReadOnly = True
    end
    object ADODataSet3TAX_2: TIntegerField
      FieldName = 'TAX_2'
      ReadOnly = True
    end
    object ADODataSet3tax_price: TIntegerField
      FieldName = 'tax_price'
      ReadOnly = True
    end
    object ADODataSet3Rec_amount: TIntegerField
      FieldName = 'Rec_amount'
      ReadOnly = True
    end
    object ADODataSet3tax_invoice_amt: TBCDField
      FieldName = 'tax_invoice_amt'
      Precision = 19
    end
    object ADODataSet3tax_invoice_date: TDateTimeField
      FieldName = 'tax_invoice_date'
    end
    object ADODataSet3GLPTR_STATUS: TStringField
      FieldName = 'GLPTR_STATUS'
      ReadOnly = True
      Size = 1
    end
    object ADODataSet3tax_invoice_ref: TStringField
      FieldName = 'tax_invoice_ref'
      Size = 50
    end
    object ADODataSet3TType: TStringField
      FieldName = 'TType'
      ReadOnly = True
      Size = 8
    end
    object ADODataSet3GRN_NUMBER: TStringField
      DisplayLabel = #20837#24211#21333#21495
      FieldName = 'GRN_NUMBER'
      ReadOnly = True
      Size = 10
    end
    object ADODataSet3DELIVER_NUMBER: TStringField
      DisplayLabel = #20379#24212#21830#36865#36135#21333#21495
      DisplayWidth = 25
      FieldName = 'DELIVER_NUMBER'
      ReadOnly = True
      Size = 15
    end
    object ADODataSet3PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#21495
      FieldName = 'PO_NUMBER'
      ReadOnly = True
      Size = 15
    end
  end
  object ADODataSet4: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT Data0023.rkey,Data0023.CODE,Data0023.ABBR_NAME,Data0023.S' +
      'UPPLIER_NAME,Data0132.MEMO_NUMBER AS INVOICE_NO,Data0001.CURR_CO' +
      'DE,'#13#10'       Data0132.EX_RATE,Data0132.MEMO_DATE AS INV_DATE,Data' +
      '0132.AVL_AMT AS INV_TOTAL,0 AS amount_paid, '#13#10'       0 AS amt_pa' +
      'yable,'#39#39' AS INV_PART_NUMBER,'#13#10'       Data0235.goods_name AS INV_' +
      'PART_DESCRIPTION,Data0235.goods_guige AS INV_DESCRIPTION,- Data0' +
      '210.QUANTITY AS QUANTITY,'#13#10'       Data0235.unit_price/(1+Data023' +
      '5.state_tax*0.01) AS PRICE,Data0235.state_tax AS TAX_2,Data0235.' +
      'unit_price AS tax_price,'#13#10'       - Data0210.QUANTITY*Data0235.un' +
      'it_price AS Rec_amount,- Data0132.AMOUNT AS tax_invoice_amt,NULL' +
      ' AS tax_invoice_date,'#13#10'       case Data0235.GLPTR_STATUS when 0 ' +
      'then '#39#21542#39' when 1 then '#39#26159#39' end AS GLPTR_STATUS,Data0132.REF_NUMBER' +
      ' AS tax_invoice_ref,'#13#10'       case Data0132.MEMO_TP WHEN 3 THEN '#39 +
      #36864#36135#22791#24536#39' END AS TType,Data0456.GRN_NUMBER,Data0456.DELIVER_NUMBER,D' +
      'ata0070.PO_NUMBER'#13#10'FROM   Data0132 INNER JOIN'#13#10'       Data0210 O' +
      'N Data0132.RKEY = Data0210.DEBIT_MEMO_PTR INNER JOIN'#13#10'       Dat' +
      'a0235 ON Data0210.D0235_PTR = Data0235.RKEY INNER JOIN'#13#10'       D' +
      'ata0023 ON Data0132.SUPP_PTR = Data0023.RKEY INNER JOIN'#13#10'       ' +
      'Data0001 ON Data0132.CURRENCY_PTR = Data0001.RKEY INNER JOIN'#13#10'  ' +
      '     Data0456 ON Data0235.GRN_PTR = Data0456.RKEY LEFT JOIN'#13#10'   ' +
      '    Data0070 ON Data0456.PO_PTR = Data0070.RKEY'#13#10'WHERE  Data0132' +
      '.MEMO_TP=3 and Data0210.D0235_PTR is not null AND Data0132.memo_' +
      'status<>3 AND '#13#10'       (Data0023.Code>=:edit1) AND (Data0023.Cod' +
      'e<=:edit2) AND '#13#10'       Data0132.MEMO_DATE>=:dtpk1 AND Data0132.' +
      'MEMO_DATE<=:dtpk2  --'#36864#26434#39033#13#10#13#10'union all'#13#10#13#10'SELECT Data0023.rkey,Da' +
      'ta0023.CODE,Data0023.ABBR_NAME,Data0023.SUPPLIER_NAME,Data0132.M' +
      'EMO_NUMBER AS INVOICE_NO,Data0001.CURR_CODE, '#13#10'       Data0132.E' +
      'X_RATE,Data0132.MEMO_DATE AS INV_DATE,Data0132.AVL_AMT AS INV_TO' +
      'TAL,0 AS amount_paid,'#13#10'       0 AS amt_payable,Data0017.INV_PART' +
      '_NUMBER,Data0017.INV_PART_DESCRIPTION,Data0017.INV_DESCRIPTION,-' +
      ' Data0210.QUANTITY,'#13#10'       Data0022.PRICE,Data0022.TAX_2,Data00' +
      '22.tax_price,Data0022.tax_price* - Data0210.QUANTITY AS Rec_amou' +
      'nt,'#13#10'       - Data0132.AMOUNT AS tax_invoice_amt,NULL AS tax_inv' +
      'oice_date,'#13#10'       CASE Data0022.GLPTR_STATUS WHEN 0 THEN '#39#21542#39' WH' +
      'EN 1 THEN '#39#26159#39' END AS GLPTR_STATUS,Data0132.REF_NUMBER AS tax_inv' +
      'oice_ref, '#13#10'       CASE Data0132.MEMO_TP WHEN 3 THEN '#39#36864#36135#22791#24536#39' END ' +
      'AS TType,Data0456.GRN_NUMBER,Data0456.DELIVER_NUMBER,Data0070.PO' +
      '_NUMBER'#13#10'FROM   Data0132 INNER JOIN'#13#10'       Data0210 ON Data0132' +
      '.RKEY = Data0210.DEBIT_MEMO_PTR INNER JOIN'#13#10'       Data0023 ON D' +
      'ata0132.SUPP_PTR = Data0023.RKEY INNER JOIN'#13#10'       Data0001 ON ' +
      'Data0132.CURRENCY_PTR = Data0001.RKEY INNER JOIN'#13#10'       Data002' +
      '2 ON Data0210.D0022_PTR = Data0022.RKEY INNER JOIN'#13#10'       Data0' +
      '017 ON Data0022.INVENTORY_PTR = Data0017.RKEY INNER JOIN'#13#10'      ' +
      ' Data0456 ON Data0022.GRN_PTR = Data0456.RKEY LEFT JOIN'#13#10'       ' +
      'Data0070 ON Data0456.PO_PTR = Data0070.RKEY'#13#10'WHERE  Data0132.MEM' +
      'O_TP = 3 and D0022_PTR is not null AND Data0132.memo_status<>3 A' +
      'ND '#13#10'       (Data0023.Code>=:edit3) AND (Data0023.Code<=:edit4) ' +
      'AND '#13#10'       Data0132.MEMO_DATE>=:dtpk3 AND Data0132.MEMO_DATE<=' +
      ':dtpk4 --'#36864#29983#20135#29289#26009#13#10'ORDER BY Data0023.CODE'
    Parameters = <
      item
        Name = 'edit1'
        DataType = ftString
        Size = 6
        Value = Null
      end
      item
        Name = 'edit2'
        DataType = ftString
        Size = 6
        Value = Null
      end
      item
        Name = 'dtpk1'
        DataType = ftString
        Size = 8
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftString
        Size = 9
        Value = Null
      end
      item
        Name = 'edit3'
        DataType = ftString
        Size = 6
        Value = Null
      end
      item
        Name = 'edit4'
        DataType = ftString
        Size = 6
        Value = Null
      end
      item
        Name = 'dtpk3'
        DataType = ftString
        Size = 8
        Value = Null
      end
      item
        Name = 'dtpk4'
        DataType = ftString
        Size = 9
        Value = Null
      end>
    Left = 128
    Top = 264
    object ADODataSet4rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADODataSet4CODE: TStringField
      FieldName = 'CODE'
      ReadOnly = True
      Size = 10
    end
    object ADODataSet4ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      ReadOnly = True
      Size = 16
    end
    object ADODataSet4SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      ReadOnly = True
      Size = 100
    end
    object ADODataSet4INVOICE_NO: TStringField
      FieldName = 'INVOICE_NO'
      ReadOnly = True
      Size = 10
    end
    object ADODataSet4CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      ReadOnly = True
      Size = 5
    end
    object ADODataSet4EX_RATE: TBCDField
      FieldName = 'EX_RATE'
      ReadOnly = True
      Precision = 12
      Size = 8
    end
    object ADODataSet4INV_DATE: TDateTimeField
      FieldName = 'INV_DATE'
      ReadOnly = True
    end
    object ADODataSet4INV_TOTAL: TBCDField
      FieldName = 'INV_TOTAL'
      ReadOnly = True
      Precision = 19
    end
    object ADODataSet4amount_paid: TIntegerField
      FieldName = 'amount_paid'
      ReadOnly = True
    end
    object ADODataSet4amt_payable: TIntegerField
      FieldName = 'amt_payable'
      ReadOnly = True
    end
    object ADODataSet4INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      ReadOnly = True
      Size = 25
    end
    object ADODataSet4INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ADODataSet4INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      ReadOnly = True
      Size = 200
    end
    object ADODataSet4QUANTITY: TFloatField
      FieldName = 'QUANTITY'
      ReadOnly = True
    end
    object ADODataSet4PRICE: TBCDField
      FieldName = 'PRICE'
      ReadOnly = True
      Precision = 23
      Size = 12
    end
    object ADODataSet4TAX_2: TBCDField
      FieldName = 'TAX_2'
      ReadOnly = True
      Precision = 4
      Size = 2
    end
    object ADODataSet4tax_price: TBCDField
      FieldName = 'tax_price'
      ReadOnly = True
      Precision = 12
      Size = 3
    end
    object ADODataSet4Rec_amount: TFloatField
      FieldName = 'Rec_amount'
      ReadOnly = True
    end
    object ADODataSet4tax_invoice_amt: TBCDField
      FieldName = 'tax_invoice_amt'
      ReadOnly = True
      Precision = 19
    end
    object ADODataSet4tax_invoice_date: TIntegerField
      FieldName = 'tax_invoice_date'
      ReadOnly = True
    end
    object ADODataSet4GLPTR_STATUS: TStringField
      FieldName = 'GLPTR_STATUS'
      ReadOnly = True
      Size = 2
    end
    object ADODataSet4tax_invoice_ref: TStringField
      FieldName = 'tax_invoice_ref'
      ReadOnly = True
      Size = 50
    end
    object ADODataSet4TType: TStringField
      FieldName = 'TType'
      ReadOnly = True
      Size = 8
    end
    object ADODataSet4GRN_NUMBER: TStringField
      DisplayLabel = #20837#24211#21333#21495
      FieldName = 'GRN_NUMBER'
      ReadOnly = True
      Size = 10
    end
    object ADODataSet4DELIVER_NUMBER: TStringField
      DisplayLabel = #20379#24212#21830#36865#36135#21333#21495
      DisplayWidth = 25
      FieldName = 'DELIVER_NUMBER'
      ReadOnly = True
      Size = 15
    end
    object ADODataSet4PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#21495
      FieldName = 'PO_NUMBER'
      ReadOnly = True
      Size = 15
    end
  end
  object ADODataSet5: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT Data0023.rkey,Data0023.CODE,Data0023.ABBR_NAME,Data0023.S' +
      'UPPLIER_NAME,Data0132.MEMO_NUMBER AS INVOICE_NO,Data0001.CURR_CO' +
      'DE, '#13#10'       Data0132.EX_RATE,Data0132.MEMO_DATE AS INV_DATE,Dat' +
      'a0132.AVL_AMT AS INV_TOTAL,0 AS amount_paid,0 AS amt_payable,'#13#10' ' +
      '      '#39#39' AS INV_PART_NUMBER,'#39#39' AS INV_PART_DESCRIPTION,'#39#39' AS INV' +
      '_DESCRIPTION,0 AS QUANTITY,0 AS PRICE,'#13#10'       0 AS TAX_2,0 AS t' +
      'ax_price,0 AS Rec_amount,- Data0132.AMOUNT AS tax_invoice_amt,'#39#39 +
      ' AS tax_invoice_date,'#13#10'       '#39#39' AS GLPTR_STATUS,Data0132.REF_NU' +
      'MBER AS tax_invoice_ref,CASE Data0132.MEMO_TP WHEN 2 THEN '#39#25187#27454#22791#24536#39 +
      ' END AS TType,'#13#10'       GRN_NUMBER=CAST('#39#39' as varchar(10)),DELIVE' +
      'R_NUMBER=CAST('#39#39' as varchar(15)),PO_NUMBER=CAST('#39#39' as varchar(15' +
      '))'#13#10'FROM   Data0132 INNER JOIN'#13#10'       Data0023 ON Data0132.SUPP' +
      '_PTR = Data0023.RKEY INNER JOIN'#13#10'       Data0001 ON Data0132.CUR' +
      'RENCY_PTR = Data0001.RKEY'#13#10'WHERE  Data0132.MEMO_TP = 2 AND Data0' +
      '132.memo_status<>3 AND (Data0023.Code>=:edit1) AND (Data0023.Cod' +
      'e<=:edit2) AND '#13#10'       Data0132.MEMO_DATE>=:dtpk1 AND Data0132.' +
      'MEMO_DATE<=:dtpk2'#13#10'ORDER BY Data0023.CODE'
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
    Left = 128
    Top = 328
    object ADODataSet5rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADODataSet5CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ADODataSet5ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object ADODataSet5SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ADODataSet5INVOICE_NO: TStringField
      FieldName = 'INVOICE_NO'
      Size = 10
    end
    object ADODataSet5CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADODataSet5EX_RATE: TBCDField
      FieldName = 'EX_RATE'
      Precision = 12
      Size = 8
    end
    object ADODataSet5INV_DATE: TDateTimeField
      FieldName = 'INV_DATE'
    end
    object ADODataSet5INV_TOTAL: TBCDField
      FieldName = 'INV_TOTAL'
      Precision = 19
    end
    object ADODataSet5amount_paid: TIntegerField
      FieldName = 'amount_paid'
      ReadOnly = True
    end
    object ADODataSet5amt_payable: TIntegerField
      FieldName = 'amt_payable'
      ReadOnly = True
    end
    object ADODataSet5INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      ReadOnly = True
      Size = 1
    end
    object ADODataSet5INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 1
    end
    object ADODataSet5INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      ReadOnly = True
      Size = 1
    end
    object ADODataSet5QUANTITY: TIntegerField
      FieldName = 'QUANTITY'
      ReadOnly = True
    end
    object ADODataSet5PRICE: TIntegerField
      FieldName = 'PRICE'
      ReadOnly = True
    end
    object ADODataSet5TAX_2: TIntegerField
      FieldName = 'TAX_2'
      ReadOnly = True
    end
    object ADODataSet5tax_price: TIntegerField
      FieldName = 'tax_price'
      ReadOnly = True
    end
    object ADODataSet5Rec_amount: TIntegerField
      FieldName = 'Rec_amount'
      ReadOnly = True
    end
    object ADODataSet5tax_invoice_amt: TBCDField
      FieldName = 'tax_invoice_amt'
      Precision = 19
    end
    object ADODataSet5tax_invoice_date: TStringField
      FieldName = 'tax_invoice_date'
      ReadOnly = True
      Size = 1
    end
    object ADODataSet5GLPTR_STATUS: TStringField
      FieldName = 'GLPTR_STATUS'
      ReadOnly = True
      Size = 1
    end
    object ADODataSet5tax_invoice_ref: TStringField
      FieldName = 'tax_invoice_ref'
      Size = 50
    end
    object ADODataSet5TType: TStringField
      FieldName = 'TType'
      ReadOnly = True
      Size = 8
    end
    object ADODataSet5GRN_NUMBER: TStringField
      DisplayLabel = #20837#24211#21333#21495
      FieldName = 'GRN_NUMBER'
      ReadOnly = True
      Size = 10
    end
    object ADODataSet5DELIVER_NUMBER: TStringField
      DisplayLabel = #20379#24212#21830#36865#36135#21333#21495
      DisplayWidth = 25
      FieldName = 'DELIVER_NUMBER'
      ReadOnly = True
      Size = 15
    end
    object ADODataSet5PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#21495
      FieldName = 'PO_NUMBER'
      ReadOnly = True
      Size = 15
    end
  end
end
