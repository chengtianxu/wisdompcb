object dm: Tdm
  OldCreateOrder = False
  Left = 328
  Top = 253
  Height = 374
  Width = 367
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 72
    Top = 56
  end
  object ads491: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT     dbo.data0492.rkey, dbo.data0492.CUT_NO, dbo.data0492.' +
      'SO_NO, dbo.Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME, '#13#10'    ' +
      '                  dbo.Data0008.PRODUCT_DESC, CASE dbo.Data0008.T' +
      'TYPE WHEN 0 THEN '#39#21322#25104#21697#39' WHEN 1 THEN '#39#25104#21697#39' END AS PROD_TTYPE, '#13#10'   ' +
      '                   dbo.data0492.TSTATUS, '#13#10'                     ' +
      ' CASE dbo.data0492.TSTATUS WHEN 0 THEN '#39#24050#23457#26680#39' WHEN 1 THEN '#39#26410#23457#26680#39' W' +
      'HEN 2 THEN '#39#19981#23457#26680#39' WHEN 3 THEN '#39#24050#21462#28040#39' WHEN 4 THEN '#39#24050#23436#24037#39' END'#13#10'      ' +
      '                 AS CSTATUS, CASE data0492.ttype WHEN 0 THEN '#39#35746#21333 +
      #25237#20135#39' WHEN 1 THEN '#39#34917#26009#25237#20135#39' WHEN 4 THEN '#39#20135#21697#25237#20135#39' END AS ct_type, '#13#10'    ' +
      '                  dbo.data0492.PLANNED_QTY, dbo.data0492.ISSUED_' +
      'QTY, dbo.data0492.ISSUE_DATE, dbo.Data0034.DEPT_NAME, '#13#10'        ' +
      '              dbo.data0492.REMARK AS remark492, dbo.Data0491.APP' +
      '_QUAN, dbo.Data0005.EMPLOYEE_NAME, dbo.Data0491.APP_BY_PTR, '#13#10'  ' +
      '                    Data0005_1.EMPLOYEE_NAME AS AUTH_EMPLOYEE_NA' +
      'ME, dbo.Data0491.APP_DATE, dbo.Data0491.remark, dbo.data0492.WHO' +
      'USE_PTR, '#13#10'                      dbo.Data0015.ABBR_NAME'#13#10'FROM   ' +
      '      dbo.Data0491 INNER JOIN'#13#10'                      dbo.data049' +
      '2 ON dbo.Data0491.MO_PTR = dbo.data0492.rkey INNER JOIN'#13#10'       ' +
      '               dbo.Data0005 ON dbo.data0492.CREATED_BY_PTR = dbo' +
      '.Data0005.RKEY INNER JOIN'#13#10'                      dbo.Data0008 ON' +
      ' dbo.data0492.BOM_PTR = dbo.Data0008.RKEY INNER JOIN'#13#10'          ' +
      '            dbo.Data0034 ON dbo.data0492.mrb_ptr = dbo.Data0034.' +
      'RKEY INNER JOIN'#13#10'                      dbo.Data0015 ON dbo.data0' +
      '492.WHOUSE_PTR = dbo.Data0015.RKEY LEFT OUTER JOIN'#13#10'            ' +
      '          dbo.Data0005 AS Data0005_1 ON dbo.Data0491.APP_BY_PTR ' +
      '= Data0005_1.RKEY'#13#10'where data0492.TSTATUS<2 and'#13#10'           data' +
      '0492.ISSUE_DATE >= :dtpk1 and'#13#10'           data0492.ISSUE_DATE <=' +
      ' :dtpk2 '
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39448d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39814d
      end>
    Left = 136
    Top = 112
    object ads491rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ads491CUT_NO: TStringField
      DisplayLabel = #29983#20135#21333#21495
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ads491SO_NO: TStringField
      DisplayLabel = #35746#21333#32534#21495
      FieldName = 'SO_NO'
      Size = 12
    end
    object ads491PROD_CODE: TStringField
      DisplayLabel = #20135#21697#32534#30721
      DisplayWidth = 40
      FieldName = 'PROD_CODE'
      Size = 50
    end
    object ads491PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ads491PRODUCT_DESC: TStringField
      DisplayLabel = #20135#21697#35268#26684
      FieldName = 'PRODUCT_DESC'
      Size = 50
    end
    object ads491PROD_TTYPE: TStringField
      DisplayLabel = #20135#21697#31867#22411
      FieldName = 'PROD_TTYPE'
      ReadOnly = True
      Size = 6
    end
    object ads491TSTATUS: TWordField
      FieldName = 'TSTATUS'
    end
    object ads491CSTATUS: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'CSTATUS'
      ReadOnly = True
      Size = 6
    end
    object ads491ct_type: TStringField
      DisplayLabel = #25237#20135#31867#22411
      FieldName = 'ct_type'
      ReadOnly = True
      Size = 8
    end
    object ads491PLANNED_QTY: TIntegerField
      DisplayLabel = #35746#21333#25968#37327
      FieldName = 'PLANNED_QTY'
    end
    object ads491ISSUED_QTY: TIntegerField
      DisplayLabel = #25237#20135#25968#37327
      FieldName = 'ISSUED_QTY'
    end
    object ads491ISSUE_DATE: TDateTimeField
      DisplayLabel = #25237#20135#26085#26399
      FieldName = 'ISSUE_DATE'
    end
    object ads491DEPT_NAME: TStringField
      DisplayLabel = #21046#36896#37096#38376
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ads491remark492: TStringField
      DisplayLabel = #25237#20135#21333#22791#27880
      FieldName = 'remark492'
      Size = 100
    end
    object ads491APP_QUAN: TIntegerField
      DisplayLabel = #36229#25237#25968#37327
      FieldName = 'APP_QUAN'
    end
    object ads491EMPLOYEE_NAME: TStringField
      DisplayLabel = #25237#20135#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ads491APP_BY_PTR: TIntegerField
      FieldName = 'APP_BY_PTR'
    end
    object ads491AUTH_EMPLOYEE_NAME: TStringField
      DisplayLabel = #23457#26680#20154#21592
      FieldName = 'AUTH_EMPLOYEE_NAME'
      Size = 16
    end
    object ads491APP_DATE: TDateTimeField
      DisplayLabel = #23457#26680#26085#26399
      FieldName = 'APP_DATE'
    end
    object ads491remark: TStringField
      DisplayLabel = #36229#25237#21407#22240
      FieldName = 'remark'
      Size = 300
    end
    object ads491WHOUSE_PTR: TIntegerField
      FieldName = 'WHOUSE_PTR'
    end
    object ads491ABBR_NAME: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'ABBR_NAME'
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = ads491
    Left = 80
    Top = 112
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 200
    Top = 72
  end
end
