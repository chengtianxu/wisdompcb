object DM: TDM
  OldCreateOrder = False
  Left = 581
  Top = 168
  Height = 241
  Width = 283
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdompcb1077;Persist Security Info' +
      '=True;User ID=sa;Initial Catalog=wisdompcb_bak;Data Source=W0080' +
      '08'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 16
  end
  object ADODataSet2: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = ADODataSet2CalcFields
    CommandText = 
      'SELECT Data0006.WORK_ORDER_NUMBER, Data0006.QUAN_SCH, '#13#10'      Da' +
      'ta0006.QUAN_REJ, Data0006.QUAN_PROD, Data0006.FLOW_NO, '#13#10'      D' +
      'ata0006.wtype, Data0006.put_type, Data0006.ENGG_STATUS, '#13#10'      ' +
      'Data0006.PROD_STATUS, Data0006.ENGG_PROD_FLAG, '#13#10'      Data0006.' +
      'SCH_COMPL_DATE, Data0006.PROJ_START_DATE, '#13#10'      Data0006.PROJ_' +
      'COMPL_DATE, Data0006.CANCEL_HOLD_DATE, '#13#10'      Data0006.ACT_COMP' +
      'L_DATE, Data0006.PLANNED_QTY, '#13#10'      Data0006.RELEASE_DATE, Dat' +
      'a0034.DEPT_CODE, '#13#10'      Data0034.DEPT_NAME, Data0008.PROD_CODE,' +
      ' '#13#10'      Data0008.PRODUCT_NAME, Data0025.MANU_PART_NUMBER,'#13#10'    ' +
      '  data0006.rkey as rkey06, Data0006.BOM_PTR'#13#10'FROM Data0025 INNER' +
      ' JOIN'#13#10'      Data0006 ON Data0025.RKEY = Data0006.BOM_PTR INNER ' +
      'JOIN'#13#10'      Data0008 ON '#13#10'      Data0025.PROD_CODE_PTR = Data000' +
      '8.RKEY LEFT OUTER JOIN'#13#10'      Data0034 RIGHT OUTER JOIN'#13#10'      D' +
      'ata0056 ON Data0034.RKEY = Data0056.DEPT_PTR ON '#13#10'      Data0006' +
      '.RKEY = Data0056.WO_PTR'#13#10'WHERE (Data0006.CUT_NO =:CUT_NO )'
    Parameters = <
      item
        Name = 'cut_no'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = '1'
      end>
    Left = 40
    Top = 136
    object ADODataSet2MANU_PART_NUMBER: TStringField
      DisplayLabel = #37096#20214#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADODataSet2WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ADODataSet2QUAN_SCH: TFloatField
      DisplayLabel = #25237#20135#25968#37327
      FieldName = 'QUAN_SCH'
    end
    object ADODataSet2QUAN_REJ: TFloatField
      DisplayLabel = #25253#24223#25968#37327
      FieldName = 'QUAN_REJ'
    end
    object ADODataSet2QUAN_PROD: TFloatField
      DisplayLabel = #20837#20179#25968#37327
      FieldName = 'QUAN_PROD'
    end
    object ADODataSet2FLOW_NO: TSmallintField
      DisplayLabel = #27969#31243#21495
      FieldName = 'FLOW_NO'
    end
    object ADODataSet2wtype: TWordField
      FieldName = 'wtype'
    end
    object ADODataSet2put_type: TWordField
      FieldName = 'put_type'
    end
    object ADODataSet2ENGG_STATUS: TSmallintField
      FieldName = 'ENGG_STATUS'
    end
    object ADODataSet2PROD_STATUS: TSmallintField
      FieldName = 'PROD_STATUS'
    end
    object ADODataSet2ENGG_PROD_FLAG: TSmallintField
      FieldName = 'ENGG_PROD_FLAG'
    end
    object ADODataSet2SCH_COMPL_DATE: TDateTimeField
      FieldName = 'SCH_COMPL_DATE'
    end
    object ADODataSet2PROJ_START_DATE: TDateTimeField
      FieldName = 'PROJ_START_DATE'
    end
    object ADODataSet2PROJ_COMPL_DATE: TDateTimeField
      FieldName = 'PROJ_COMPL_DATE'
    end
    object ADODataSet2CANCEL_HOLD_DATE: TDateTimeField
      FieldName = 'CANCEL_HOLD_DATE'
    end
    object ADODataSet2ACT_COMPL_DATE: TDateTimeField
      FieldName = 'ACT_COMPL_DATE'
    end
    object ADODataSet2PLANNED_QTY: TFloatField
      FieldName = 'PLANNED_QTY'
    end
    object ADODataSet2RELEASE_DATE: TDateTimeField
      FieldName = 'RELEASE_DATE'
    end
    object ADODataSet2DEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADODataSet2DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADODataSet2PROD_CODE: TStringField
      DisplayLabel = #20135#21697#20195#30721
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADODataSet2PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADODataSet2My_PROD_STATUS: TStringField
      DisplayLabel = #29983#20135#29366#24577
      FieldKind = fkCalculated
      FieldName = 'My_PROD_STATUS'
      Calculated = True
    end
    object ADODataSet2My_wtype: TStringField
      FieldKind = fkCalculated
      FieldName = 'My_wtype'
      Calculated = True
    end
    object ADODataSet2My_number1: TFloatField
      DisplayLabel = #29616#26377#25968#37327
      FieldKind = fkCalculated
      FieldName = 'My_number1'
      Calculated = True
    end
    object ADODataSet2rkey06: TIntegerField
      FieldName = 'rkey06'
      ReadOnly = True
    end
    object ADODataSet2BOM_PTR: TIntegerField
      FieldName = 'BOM_PTR'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 40
    Top = 72
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 120
    Top = 136
  end
  object ADODataSet1: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    BeforeOpen = ADODataSet1BeforeOpen
    AfterClose = ADODataSet1AfterClose
    AfterScroll = ADODataSet1AfterScroll
    OnCalcFields = ADODataSet1CalcFields
    CommandText = 
      'SELECT Data0060.rkey,'#13#10'     Data0025.MANU_PART_NUMBER,'#13#10'     Dat' +
      'a0025.MANU_PART_DESC,'#13#10'     Data0060.ENT_DATE,  Data0060.SCH_DAT' +
      'E,'#13#10'     Data0005_1.EMPLOYEE_NAME AS ENAME60,'#13#10'     Data0005.EMP' +
      'LOYEE_NAME AS ENAME492,'#13#10'     Data0060.PARTS_ORDERED,  Data0060.' +
      'set_ordered,'#13#10'     Data0060.PARTS_SHIPPED,  Data0060.PARTS_RETUR' +
      'NED,'#13#10'     Data0060.PARTS_ALLOC,   Data0060.PARTS_INVOICED,  Dat' +
      'a0060.FOB,'#13#10'     Data0492.CUT_NO, Data0492.ISSUE_DATE, Data0492.' +
      'ISSUED_QTY,'#13#10'     Data0492.ttype,Data0492.tstatus,'#13#10'     Data006' +
      '0.SALES_ORDER, Data0060.STATUS,'#13#10'     Data0097.PO_NUMBER,    Dat' +
      'a0008.PRODUCT_NAME,'#13#10'     Data0010.cust_code,Data0010.customer_n' +
      'ame,Data0010.abbr_name'#13#10'FROM Data0025 INNER JOIN Data0005 INNER ' +
      'JOIN Data0492 '#13#10'       ON Data0005.RKEY = data0492.CREATED_BY_PT' +
      'R '#13#10'       ON Data0025.RKEY = Data0492.BOM_PTR '#13#10'     INNER JOIN' +
      ' Data0010 ON Data0025.CUSTOMER_PTR = Data0010.RKEY '#13#10'     INNER ' +
      'JOIN Data0008 ON Data0025.PROD_CODE_PTR = Data0008.RKEY '#13#10'     L' +
      'EFT OUTER JOIN Data0060 ON Data0492.SO_NO = Data0060.SALES_ORDER' +
      ' '#13#10'     LEFT OUTER JOIN Data0097 '#13#10'       ON Data0060.PURCHASE_O' +
      'RDER_PTR = Data0097.RKEY '#13#10'     LEFT OUTER JOIN Data0005 AS Data' +
      '0005_1 '#13#10'       ON Data0060.ENTERED_BY_EMPL_PTR = Data0005_1.RKE' +
      'Y'#13#10'WHERE 1=1'
    Parameters = <>
    Left = 120
    Top = 72
    object ADODataSet1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADODataSet1MANU_PART_NUMBER: TStringField
      DisplayLabel = #37096#20214#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADODataSet1MANU_PART_DESC: TStringField
      DisplayLabel = #37096#20214#25551#36848
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADODataSet1ENT_DATE: TDateTimeField
      DisplayLabel = #35746#21333#36755#20837#26085#26399
      FieldName = 'ENT_DATE'
    end
    object ADODataSet1SCH_DATE: TDateTimeField
      DisplayLabel = #22238#22797#20132#26399
      FieldName = 'SCH_DATE'
    end
    object ADODataSet1CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      ReadOnly = True
      Size = 10
    end
    object ADODataSet1CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CUSTOMER_NAME'
      ReadOnly = True
      Size = 100
    end
    object ADODataSet1ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      ReadOnly = True
      Size = 10
    end
    object ADODataSet1ENAME60: TStringField
      DisplayLabel = #35746#21333#36755#20837#20154
      FieldName = 'ENAME60'
      Size = 16
    end
    object ADODataSet1ENAME492: TStringField
      DisplayLabel = #25237#20135#20154
      FieldName = 'ENAME492'
      Size = 16
    end
    object ADODataSet1PARTS_ORDERED: TFloatField
      DisplayLabel = #35746#21333#25968#37327'(PCS)'
      FieldName = 'PARTS_ORDERED'
    end
    object ADODataSet1set_ordered: TIntegerField
      DisplayLabel = #35746#21333#25968#37327'(Set)'
      FieldName = 'set_ordered'
    end
    object ADODataSet1PARTS_SHIPPED: TFloatField
      DisplayLabel = #24050#35013#36816#30340#25968#37327
      FieldName = 'PARTS_SHIPPED'
    end
    object ADODataSet1PARTS_RETURNED: TFloatField
      DisplayLabel = #24050#36864#22238#30340#25968#37327
      FieldName = 'PARTS_RETURNED'
    end
    object ADODataSet1PARTS_ALLOC: TFloatField
      DisplayLabel = #24050#20998#37197#30340#25968#37327
      FieldName = 'PARTS_ALLOC'
    end
    object ADODataSet1PARTS_INVOICED: TFloatField
      DisplayLabel = #24050#24320#21457#31080#25968#37327
      FieldName = 'PARTS_INVOICED'
    end
    object ADODataSet1FOB: TStringField
      DisplayLabel = #21512#21516#21495
      FieldName = 'FOB'
      Size = 50
    end
    object ADODataSet1CUT_NO: TStringField
      DisplayLabel = #37197#26009#21333#21495
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADODataSet1ISSUE_DATE: TDateTimeField
      DisplayLabel = #25237#20135#26085#26399
      FieldName = 'ISSUE_DATE'
    end
    object ADODataSet1ISSUED_QTY: TIntegerField
      DisplayLabel = #25237#20135#25968#37327
      FieldName = 'ISSUED_QTY'
    end
    object ADODataSet1SALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADODataSet1PO_NUMBER: TStringField
      DisplayLabel = #23458#25143#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADODataSet1STATUS: TWordField
      FieldName = 'STATUS'
    end
    object ADODataSet1myStatus: TStringField
      DisplayLabel = #35746#21333#29366#24577
      FieldKind = fkCalculated
      FieldName = 'myStatus'
      Calculated = True
    end
    object ADODataSet1PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#31867#21035
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADODataSet1ttype: TWordField
      FieldName = 'ttype'
    end
    object ADODataSet1tstatus: TWordField
      FieldName = 'tstatus'
    end
    object ADODataSet1status492: TStringField
      DisplayLabel = #37197#26009#21333#29366#24577
      FieldKind = fkCalculated
      FieldName = 'status492'
      Calculated = True
    end
    object ADODataSet1type492: TStringField
      DisplayLabel = #25237#20135#31867#22411
      FieldKind = fkCalculated
      FieldName = 'type492'
      Calculated = True
    end
  end
end
