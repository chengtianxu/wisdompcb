object DM: TDM
  OldCreateOrder = False
  Left = 839
  Top = 337
  Height = 244
  Width = 270
  object DataSource1: TDataSource
    DataSet = ADS492
    OnDataChange = DataSource1DataChange
    Left = 24
    Top = 16
  end
  object DataSource2: TDataSource
    DataSet = ADS468
    Left = 24
    Top = 152
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 192
    Top = 80
  end
  object ADS492: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.data0492.rkey, dbo.data0492.CUT_NO, dbo.data0492.' +
      'SO_NO, dbo.data0492.CUT_NO AS cutno, dbo.Data0005.EMPLOYEE_NAME,' +
      ' dbo.data0492.ISSUED_QTY, '#13#10'                      dbo.data0492.I' +
      'SSUE_DATE, '#13#10'CASE data0492.TSTATUS WHEN 0 THEN '#39#24050#23457#26680#39' WHEN 2 THEN' +
      ' '#39#19981#23457#26680#39' END AS '#29366#24577','#13#10'CASE data0492.TTYPE WHEN 0 THEN '#39#35746#21333#25237#20135#39' WHEN 1' +
      ' THEN '#39#34917#26009#25237#20135#39' WHEN 4 THEN '#39#25353#20135#21697#25237#20135#39' END AS '#25237#20135#24615#36136','#13#10'                 ' +
      '      dbo.Data0015.WAREHOUSE_CODE, dbo.data0492.SCH_COMPL_DATE, ' +
      'dbo.data0492.REMARK, dbo.Data0008.PROD_CODE, dbo.Data0008.PRODUC' +
      'T_NAME, '#13#10'                      dbo.Data0008.PRODUCT_DESC, dbo.D' +
      'ata0034.DEPT_CODE, dbo.Data0034.DEPT_NAME, data0008.if_control,d' +
      'ata0492.bom_ptr'#13#10'FROM         dbo.data0492 INNER JOIN'#13#10'         ' +
      '             dbo.Data0005 ON dbo.data0492.CREATED_BY_PTR = dbo.D' +
      'ata0005.RKEY INNER JOIN'#13#10'                      dbo.Data0015 ON d' +
      'bo.data0492.WHOUSE_PTR = dbo.Data0015.RKEY INNER JOIN'#13#10'         ' +
      '             dbo.Data0008 ON dbo.data0492.BOM_PTR = dbo.Data0008' +
      '.RKEY INNER JOIN'#13#10'                      dbo.Data0034 ON dbo.data' +
      '0492.mrb_ptr = dbo.Data0034.RKEY INNER JOIN'#13#10'                   ' +
      '       (SELECT     CUT_NO'#13#10'                            FROM     ' +
      '     dbo.Data0468'#13#10'                            WHERE      (STATU' +
      'S IN (0, 2))'#13#10'                            GROUP BY CUT_NO) AS de' +
      'rivedtbl_1 ON derivedtbl_1.CUT_NO = dbo.data0492.CUT_NO'#13#10'WHERE  ' +
      '   (dbo.data0492.ISSUE_DATE >= :dtpk1) AND (dbo.data0492.ISSUE_D' +
      'ATE <= :dtpk2) AND '#13#10'(dbo.data0492.TSTATUS IN (0, 2))'
    IndexFieldNames = 'cut_no'
    Parameters = <
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
    Left = 88
    Top = 16
    object ADS492rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS492CUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADS492SO_NO: TStringField
      FieldName = 'SO_NO'
      Size = 12
    end
    object ADS492cutno: TStringField
      FieldName = 'cutno'
      FixedChar = True
      Size = 12
    end
    object ADS492EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS492ISSUED_QTY: TIntegerField
      FieldName = 'ISSUED_QTY'
    end
    object ADS492ISSUE_DATE: TDateTimeField
      FieldName = 'ISSUE_DATE'
    end
    object ADS492DSDesigner: TStringField
      FieldName = #25237#20135#24615#36136
      ReadOnly = True
      Size = 10
    end
    object ADS492WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADS492SCH_COMPL_DATE: TDateTimeField
      FieldName = 'SCH_COMPL_DATE'
    end
    object ADS492REMARK: TStringField
      FieldName = 'REMARK'
      Size = 100
    end
    object ADS492PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADS492PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADS492PRODUCT_DESC: TStringField
      FieldName = 'PRODUCT_DESC'
      Size = 50
    end
    object ADS492DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADS492DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADS492DSDesigner2: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 6
    end
    object ADS492if_control: TBooleanField
      FieldName = 'if_control'
    end
    object ADS492bom_ptr: TIntegerField
      FieldName = 'bom_ptr'
    end
  end
  object ADS468: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     '#9'TOP (100) PERCENT'#13#10#9#9#9'dbo.Data0008.PROD_CODE,'#13#10#9#9#9'db' +
      'o.Data0008.PRODUCT_NAME, '#13#10#9#9#9'dbo.Data0008.PRODUCT_DESC,'#13#10'      ' +
      '                                          dbo.Data0468.RKEY,'#13#10'  ' +
      '                                              dbo.Data0468.CUT_N' +
      'O, '#13#10#9#9#9'dbo.Data0468.QUAN_BOM, '#9' '#13#10'  '#9#9#9'dbo.Data0468.QUAN_ISSUED' +
      ', '#13#10#9#9#9'dbo.Data0002.UNIT_NAME,'#13#10' '#13#10#9#9#9#9'CASE Data0468.STATUS WHEN' +
      ' 0 THEN '#39#26377#25928#39' WHEN 2 THEN '#39#24453#30830#35748#39' END AS '#29366#24577', '#13#10'                 '#39#21322#25104 +
      #21697#39'  AS '#31867#22411','#13#10#9#9#9'dbo.Data0468.VENDOR'#13#10#13#10'FROM        dbo.Data0468 I' +
      'NNER JOIN'#13#10'                   dbo.Data0008 ON dbo.Data0468.INVEN' +
      'T_PTR = dbo.Data0008.RKEY'#13#10' INNER JOIN'#13#10'            dbo.Data0002' +
      ' ON dbo.Data0008.unit_ptr = dbo.Data0002.RKEY'#13#10#13#10'WHERE     (dbo.' +
      'Data0468.invent_or = 1) AND (dbo.Data0468.CUT_NO = :cutno )'#13#10' AN' +
      'D (dbo.data0468.STATUS IN (0, 2))'#13#10#13#10'order by Data0008.PROD_CODE'
    Parameters = <
      item
        Name = 'cutno'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = Null
      end>
    Left = 96
    Top = 152
    object ADS468PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 25
    end
    object ADS468PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADS468PRODUCT_DESC: TStringField
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
    object ADS468QUAN_BOM: TFloatField
      FieldName = 'QUAN_BOM'
      ReadOnly = True
    end
    object ADS468QUAN_ISSUED: TFloatField
      FieldName = 'QUAN_ISSUED'
      ReadOnly = True
    end
    object ADS468UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
      ReadOnly = True
    end
    object ADS468DSDesigner: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 6
    end
    object ADS468DSDesigner2: TStringField
      FieldName = #31867#22411
      ReadOnly = True
      Size = 8
    end
    object ADS468VENDOR: TStringField
      FieldName = 'VENDOR'
      ReadOnly = True
      Size = 15
    end
    object ADS468CUT_NO: TStringField
      FieldName = 'CUT_NO'
      ReadOnly = True
      FixedChar = True
      Size = 12
    end
    object ADS468RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    ParamCheck = False
    Parameters = <>
    Left = 184
    Top = 16
  end
end
