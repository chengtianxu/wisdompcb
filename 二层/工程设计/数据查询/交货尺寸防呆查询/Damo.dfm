object DM: TDM
  OldCreateOrder = False
  Left = 475
  Top = 474
  Height = 464
  Width = 845
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 40
  end
  object DS25: TDataSource
    DataSet = ADO25
    Left = 24
    Top = 144
  end
  object DS25_1: TDataSource
    DataSet = ADODataSet1
    Left = 24
    Top = 192
  end
  object ADO25: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'num'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'len'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 18
        Size = 19
        Value = Null
      end
      item
        Name = 'wid'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 18
        Size = 19
        Value = Null
      end
      item
        Name = 'p1'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 1
      end>
    SQL.Strings = (
      'exec JHFoolProofSystem_2 :num, :len,:wid,:p1')
    Left = 96
    Top = 144
    object ADO25ANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
      ReadOnly = True
      Size = 30
    end
    object ADO25set_lngth: TBCDField
      FieldName = 'set_lngth'
      ReadOnly = True
      Precision = 7
      Size = 3
    end
    object ADO25set_width: TBCDField
      FieldName = 'set_width'
      ReadOnly = True
      Precision = 7
      Size = 3
    end
    object ADO25COLUMN1: TIntegerField
      FieldName = 'COLUMN1'
      ReadOnly = True
    end
  end
  object ADO25_1: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      ' SELECT    dbo.Data0025.RKEY, dbo.Data0025.MANU_PART_NUMBER,'#13#10'  ' +
      'dbo.Data0025.MANU_PART_DESC, dbo.Data0010.CUST_CODE, dbo.Data001' +
      '0.ABBR_NAME, '#13#10'  dbo.Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NA' +
      'ME,dbo.Data0025.set_qty,data0025.failsafe_remark,'#13#10' dbo.Data0025' +
      '.ANALYSIS_CODE_1, Data0005_3.EMPLOYEE_NAME AS employee_createnam' +
      'e, '#13#10' dbo.Data0025.CUSTPART_ENT_DATE, dbo.Data0025.PROD_ROUTE_PT' +
      'R, dbo.data0025.quality_status,'#13#10' Data0005_1.EMPLOYEE_NAME AS em' +
      'ployee_auditname, dbo.Data0025.AUDITED_DATE, '#13#10' dbo.Data0025.TST' +
      'ATUS, Data0005_2.EMPLOYEE_NAME AS employee_editname,cast(Data002' +
      '5.REMARK AS VARCHAR(200)) REMARK,data0025.ENG_NOTE,cast(data0025' +
      '.memo_text as VARCHAR(200)) as memo_text,'#13#10' dbo.Data0025.LAST_MO' +
      'DIFIED_DATE, dbo.Data0025.SAMPLE_NR, dbo.data0025.ORIG_CUSTOMER,' +
      #13#10'   dbo.Data0025.ANALYSIS_CODE_2, dbo.Data0025.QTY_ON_HAND, dbo' +
      '.Data0025.LAYERS, dbo.Data0025.green_flag, '#13#10'   CASE Data0025.ON' +
      'HOLD_SALES_FLAG WHEN 0 THEN '#39#26377#25928#39' WHEN 1 THEN '#39#36807#26399#39' END AS overdue' +
      ', '#13#10'  CASE Data0025.TSTATUS WHEN 0 THEN '#39#24453#21046#20316#39' WHEN 1 THEN '#39#24050#23457#26680#39' ' +
      #13#10'WHEN 2 THEN '#39#23457#36864#22238#39' WHEN 3 THEN '#39#24453#26816#26597#39' WHEN 4 THEN '#39#24453#23457#26680#39' WHEN 5 T' +
      'HEN '#39#26816#36864#22238#39#13#10'                       WHEN 6 THEN '#39#26410#25552#20132#39' END AS state' +
      ','#13#10' CASE Data0025.ttype WHEN 0 THEN '#39#37327#20135#39' WHEN 1 THEN '#39#26679#26495#39' END AS' +
      ' batch_or_former,'#13#10' dbo.Data0025.CHECK_DATE, dbo.Data0005.EMPLOY' +
      'EE_NAME AS check_emplname,'#13#10'd10_2.CUST_CODE as ORIG_CUST_CODE'#13#10'F' +
      'ROM         dbo.Data0008 INNER JOIN'#13#10'                      dbo.D' +
      'ata0025 ON dbo.Data0008.RKEY = dbo.Data0025.PROD_CODE_PTR INNER ' +
      'JOIN'#13#10'                      dbo.Data0010 ON dbo.Data0025.CUSTOME' +
      'R_PTR = dbo.Data0010.RKEY LEFT OUTER JOIN'#13#10'                     ' +
      ' dbo.Data0005 ON dbo.Data0025.CHECK_BY_PTR = dbo.Data0005.RKEY L' +
      'EFT OUTER JOIN'#13#10'                      dbo.Data0005 AS Data0005_2' +
      ' ON dbo.Data0025.LAST_MODIFIED_BY_PTR = Data0005_2.RKEY LEFT OUT' +
      'ER JOIN'#13#10'                      dbo.Data0005 AS Data0005_1 ON dbo' +
      '.Data0025.AUDITED_BY_PTR = Data0005_1.RKEY LEFT OUTER JOIN'#13#10'    ' +
      '                  dbo.Data0005 AS Data0005_3 ON dbo.Data0025.CRE' +
      'ATED_BY_EMPL_PTR = Data0005_3.RKEY'#13#10#9#9#9'left JOIN Data0010 d10_2 ' +
      'on Data0025.ORIG_CUSTOMER = d10_2.ABBR_NAME'#13#10'where              ' +
      '                                    '#13#10'   data0025.parent_ptr is ' +
      'null '#13#10'and (((set_lngth >= @len) and (set_lngth <= @len) and '#13#10' ' +
      ' (set_width >= @wid) and (set_width <= @wid)) or'#13#10' ((set_lngth >' +
      '= @wid) and (set_lngth <= @wid) and '#13#10'  (set_width >= @len) and ' +
      '(set_width <= @len)))'#13#10#13#10'order by dbo.Data0025.RKEY'
    EnableBCD = False
    IndexFieldNames = 'MANU_PART_NUMBER'
    Parameters = <>
    Prepared = True
    Left = 168
    Top = 200
    object ADO25_1RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO25_1MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
      Size = 30
    end
    object ADO25_1MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADO25_1CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADO25_1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADO25_1PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADO25_1PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADO25_1ANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
      Size = 30
    end
    object ADO25_1employee_createname: TStringField
      FieldName = 'employee_createname'
      Size = 16
    end
    object ADO25_1CUSTPART_ENT_DATE: TDateTimeField
      FieldName = 'CUSTPART_ENT_DATE'
    end
    object ADO25_1PROD_ROUTE_PTR: TIntegerField
      FieldName = 'PROD_ROUTE_PTR'
    end
    object ADO25_1quality_status: TBooleanField
      FieldName = 'quality_status'
    end
    object ADO25_1employee_auditname: TStringField
      FieldName = 'employee_auditname'
      Size = 16
    end
    object ADO25_1AUDITED_DATE: TDateTimeField
      FieldName = 'AUDITED_DATE'
    end
    object ADO25_1TSTATUS: TWordField
      FieldName = 'TSTATUS'
    end
    object ADO25_1employee_editname: TStringField
      FieldName = 'employee_editname'
      Size = 16
    end
    object ADO25_1REMARK: TStringField
      FieldName = 'REMARK'
      ReadOnly = True
      Size = 200
    end
    object ADO25_1ENG_NOTE: TStringField
      FieldName = 'ENG_NOTE'
      Size = 200
    end
    object ADO25_1memo_text: TStringField
      FieldName = 'memo_text'
      ReadOnly = True
      Size = 200
    end
    object ADO25_1LAST_MODIFIED_DATE: TDateTimeField
      FieldName = 'LAST_MODIFIED_DATE'
    end
    object ADO25_1SAMPLE_NR: TStringField
      FieldName = 'SAMPLE_NR'
      Size = 50
    end
    object ADO25_1ORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      Size = 10
    end
    object ADO25_1ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 80
    end
    object ADO25_1QTY_ON_HAND: TIntegerField
      FieldName = 'QTY_ON_HAND'
    end
    object ADO25_1LAYERS: TWordField
      FieldName = 'LAYERS'
    end
    object ADO25_1green_flag: TStringField
      FieldName = 'green_flag'
      FixedChar = True
      Size = 1
    end
    object ADO25_1overdue: TStringField
      FieldName = 'overdue'
      ReadOnly = True
      Size = 4
    end
    object ADO25_1state: TStringField
      FieldName = 'state'
      ReadOnly = True
      Size = 6
    end
    object ADO25_1batch_or_former: TStringField
      FieldName = 'batch_or_former'
      ReadOnly = True
      Size = 4
    end
    object ADO25_1CHECK_DATE: TDateTimeField
      FieldName = 'CHECK_DATE'
    end
    object ADO25_1check_emplname: TStringField
      FieldName = 'check_emplname'
      Size = 16
    end
    object ADO25_1ORIG_CUST_CODE: TStringField
      FieldName = 'ORIG_CUST_CODE'
      Size = 10
    end
  end
  object ADODataSet1: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 'exec JHFoolProofSystem :num, :len,:wid'#13#10
    IndexFieldNames = 'MANU_PART_NUMBER'
    Parameters = <
      item
        Name = 'num'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'len'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 18
        Size = 19
        Value = Null
      end
      item
        Name = 'wid'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 18
        Size = 19
        Value = Null
      end>
    Left = 96
    Top = 200
    object ADODataSet1RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADODataSet1MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
      ReadOnly = True
      Size = 30
    end
    object ADODataSet1MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      ReadOnly = True
      Size = 80
    end
    object ADODataSet1CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      ReadOnly = True
      Size = 10
    end
    object ADODataSet1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      ReadOnly = True
      Size = 10
    end
    object ADODataSet1PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      ReadOnly = True
      Size = 10
    end
    object ADODataSet1PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      ReadOnly = True
      Size = 30
    end
    object ADODataSet1ANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
      ReadOnly = True
      Size = 30
    end
    object ADODataSet1employee_createname: TStringField
      FieldName = 'employee_createname'
      ReadOnly = True
      Size = 16
    end
    object ADODataSet1CUSTPART_ENT_DATE: TDateTimeField
      FieldName = 'CUSTPART_ENT_DATE'
      ReadOnly = True
    end
    object ADODataSet1PROD_ROUTE_PTR: TIntegerField
      FieldName = 'PROD_ROUTE_PTR'
      ReadOnly = True
    end
    object ADODataSet1quality_status: TBooleanField
      FieldName = 'quality_status'
      ReadOnly = True
    end
    object ADODataSet1employee_auditname: TStringField
      FieldName = 'employee_auditname'
      ReadOnly = True
      Size = 16
    end
    object ADODataSet1AUDITED_DATE: TDateTimeField
      FieldName = 'AUDITED_DATE'
      ReadOnly = True
    end
    object ADODataSet1TSTATUS: TWordField
      FieldName = 'TSTATUS'
      ReadOnly = True
    end
    object ADODataSet1employee_editname: TStringField
      FieldName = 'employee_editname'
      ReadOnly = True
      Size = 16
    end
    object ADODataSet1REMARK: TStringField
      FieldName = 'REMARK'
      ReadOnly = True
      Size = 200
    end
    object ADODataSet1ENG_NOTE: TStringField
      FieldName = 'ENG_NOTE'
      ReadOnly = True
      Size = 200
    end
    object ADODataSet1memo_text: TStringField
      FieldName = 'memo_text'
      ReadOnly = True
      Size = 200
    end
    object ADODataSet1LAST_MODIFIED_DATE: TDateTimeField
      FieldName = 'LAST_MODIFIED_DATE'
      ReadOnly = True
    end
    object ADODataSet1SAMPLE_NR: TStringField
      FieldName = 'SAMPLE_NR'
      ReadOnly = True
      Size = 50
    end
    object ADODataSet1ORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      ReadOnly = True
      Size = 10
    end
    object ADODataSet1ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      ReadOnly = True
      Size = 80
    end
    object ADODataSet1QTY_ON_HAND: TIntegerField
      FieldName = 'QTY_ON_HAND'
      ReadOnly = True
    end
    object ADODataSet1LAYERS: TWordField
      FieldName = 'LAYERS'
      ReadOnly = True
    end
    object ADODataSet1green_flag: TStringField
      FieldName = 'green_flag'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object ADODataSet1overdue: TStringField
      FieldName = 'overdue'
      ReadOnly = True
      Size = 4
    end
    object ADODataSet1state: TStringField
      FieldName = 'state'
      ReadOnly = True
      Size = 6
    end
    object ADODataSet1batch_or_former: TStringField
      FieldName = 'batch_or_former'
      ReadOnly = True
      Size = 4
    end
    object ADODataSet1CHECK_DATE: TDateTimeField
      FieldName = 'CHECK_DATE'
      ReadOnly = True
    end
    object ADODataSet1check_emplname: TStringField
      FieldName = 'check_emplname'
      ReadOnly = True
      Size = 16
    end
    object ADODataSet1ORIG_CUST_CODE: TStringField
      FieldName = 'ORIG_CUST_CODE'
      ReadOnly = True
      Size = 10
    end
    object ADODataSet1set_qty: TIntegerField
      FieldName = 'set_qty'
      ReadOnly = True
    end
    object ADODataSet1failsafe_remark: TWideStringField
      FieldName = 'failsafe_remark'
      Size = 200
    end
    object ADODataSet1pcs_lngth: TBCDField
      FieldName = 'pcs_lngth'
      Precision = 7
      Size = 3
    end
    object ADODataSet1pcs_width: TBCDField
      FieldName = 'pcs_width'
      Precision = 7
      Size = 3
    end
  end
end
