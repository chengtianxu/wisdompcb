object dm: Tdm
  OldCreateOrder = False
  Left = 443
  Top = 171
  Height = 388
  Width = 380
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdompcb1077;Persist Security Info' +
      '=True;User ID=sa;Initial Catalog=wisdompcb_bak;Data Source=172.1' +
      '6.68.8'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 52
    Top = 48
  end
  object DataSource1: TDataSource
    DataSet = Aqwz306
    Left = 48
    Top = 112
  end
  object DataSource2: TDataSource
    DataSet = Aqwz307
    Left = 48
    Top = 168
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    Parameters = <>
    Left = 152
    Top = 16
  end
  object Aqwz306: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = Aqwz306CalcFields
    Parameters = <
      item
        Name = 'v1'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 0
      end
      item
        Name = 'v2'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 0
      end
      item
        Name = 'v3'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 0
      end
      item
        Name = 'v4'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 4
      end
      item
        Name = 'v5'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 5
      end
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38666d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38686d
      end>
    SQL.Strings = (
      'SELECT dbo.WZDATA306.rkey, dbo.WZDATA306.rejected_number,'
      '       dbo.WZDATA303.DELIVER_NUMBER, dbo.WZDATA303.EPIBOLY_PTR,'
      '       dbo.Data0023.CODE,dbo.Data0023.SUPPLIER_NAME,'
      '       dbo.Data0023.ABBR_NAME, dbo.WZDATA300.epiboly_number,'
      '       dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME,'
      '       dbo.Data0005.EMPL_CODE, dbo.Data0005.EMPLOYEE_NAME,'
      '       dbo.WZDATA306.ENT_DATE, dbo.WZDATA306.STATUS,'
      '       dbo.WZDATA306.REMARK, dbo.WZDATA306.return_qty,'
      '       dbo.WZDATA306.AUTH_EMPL, dbo.WZDATA306.AUTH_DATE,'
      '       dbo.WZDATA306.return_date, dbo.WZDATA303.RKEY AS RKEY303,'
      '       Data0005_1.EMPLOYEE_NAME AS AUTH_EMPLOYEE_NAME,'
      '       Data0005_1.EMPL_CODE AS AUTH_EMPL_CODE'
      'FROM dbo.WZDATA300 INNER JOIN'
      
        '     dbo.WZDATA303 ON dbo.WZDATA300.rkey = dbo.WZDATA303.EPIBOLY' +
        '_PTR INNER JOIN'
      
        '     dbo.WZDATA306 ON dbo.WZDATA303.RKEY = dbo.WZDATA306.DELIVER' +
        '_PTR INNER JOIN'
      
        '     dbo.Data0034 ON dbo.WZDATA306.DEPT_PTR = dbo.Data0034.RKEY ' +
        'INNER JOIN'
      
        '     dbo.Data0005 ON dbo.WZDATA306.EMPL_PTR = dbo.Data0005.RKEY ' +
        'INNER JOIN'
      
        '     dbo.Data0023 ON dbo.WZDATA306.supp_ptr = dbo.Data0023.RKEY ' +
        'LEFT OUTER JOIN'
      
        '     dbo.Data0005 AS Data0005_1 ON dbo.WZDATA306.AUTH_EMPL = Dat' +
        'a0005_1.RKEY'
      'where'
      '      WZDATA306.status <> :v1 and'
      '      WZDATA306.status <> :v2 and'
      '      WZDATA306.status <> :v3 and'
      '      WZDATA306.status <> :v4 and'
      '      WZDATA306.status <> :v5 and'
      '      WZDATA306.return_date >= :dtpk1 and'
      '      WZDATA306.return_date <= :dtpk2'
      'order by WZDATA306.rejected_number')
    Left = 114
    Top = 112
    object Aqwz306rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Aqwz306rejected_number: TStringField
      DisplayLabel = #36820#24037#21333#21495
      FieldName = 'rejected_number'
      Size = 15
    end
    object Aqwz306DELIVER_NUMBER: TStringField
      DisplayLabel = #25910#36135#21333#21495
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object Aqwz306EPIBOLY_PTR: TIntegerField
      FieldName = 'EPIBOLY_PTR'
    end
    object Aqwz306EMPLOYEE_NAME: TStringField
      DisplayLabel = #24405#20837#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object Aqwz306CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object Aqwz306SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object Aqwz306ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object Aqwz306epiboly_number: TStringField
      DisplayLabel = #22806#21457#32534#21495
      FieldName = 'epiboly_number'
      Size = 15
    end
    object Aqwz306DEPT_CODE: TStringField
      DisplayLabel = #22806#21457#24037#24207#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object Aqwz306DEPT_NAME: TStringField
      DisplayLabel = #22806#21457#24037#24207
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object Aqwz306EMPL_CODE: TStringField
      DisplayLabel = #36864#36135#20154#24037#21495
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object Aqwz306ENT_DATE: TDateTimeField
      DisplayLabel = #24405#20837#26085#26399
      FieldName = 'ENT_DATE'
    end
    object Aqwz306STATUS: TWordField
      FieldName = 'STATUS'
    end
    object Aqwz306v_status: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Size = 6
      Calculated = True
    end
    object Aqwz306REMARK: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REMARK'
      Size = 100
    end
    object Aqwz306return_qty: TIntegerField
      DisplayLabel = #36820#24037#24635#25968#37327
      FieldName = 'return_qty'
    end
    object Aqwz306AUTH_EMPL: TIntegerField
      DisplayLabel = #23457#25209#20154
      FieldName = 'AUTH_EMPL'
    end
    object Aqwz306AUTH_DATE: TDateTimeField
      DisplayLabel = #23457#25209#26085#26399
      FieldName = 'AUTH_DATE'
    end
    object Aqwz306return_date: TDateTimeField
      FieldName = 'return_date'
    end
    object Aqwz306RKEY303: TAutoIncField
      FieldName = 'RKEY303'
      ReadOnly = True
    end
    object Aqwz306AUTH_EMPLOYEE_NAME: TStringField
      DisplayLabel = #23457#25209#20154#22995#21517
      FieldName = 'AUTH_EMPLOYEE_NAME'
      Size = 16
    end
    object Aqwz306AUTH_EMPL_CODE: TStringField
      DisplayLabel = #23457#25209#20154#24037#21495
      FieldName = 'AUTH_EMPL_CODE'
      Size = 10
    end
  end
  object Aqwz307: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DES' +
        'C, '
      '       dbo.WZDATA304.reject_qty, dbo.WZDATA304.rece_quantity, '
      '       dbo.WZDATA307.rejected_ptr,dbo.WZDATA304.RETURN_QTY,'
      '       dbo.WZDATA307.UNIT_NAME, dbo.WZDATA307.STANDARD, '
      '       dbo.WZDATA307.received_qty,dbo.WZDATA307.rework_qry,'
      '       dbo.WZDATA307.particulars_REMARK      '
      'FROM dbo.WZDATA304 INNER JOIN'
      
        '     dbo.WZDATA307 ON dbo.WZDATA304.RKEY = dbo.WZDATA307.receive' +
        'd_ptr INNER JOIN'
      
        '     dbo.Data0025 ON dbo.WZDATA307.CUSTPART_PTR = dbo.Data0025.R' +
        'KEY'
      'where dbo.WZDATA307.rejected_ptr= :rkey')
    Left = 116
    Top = 168
    object Aqwz307MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object Aqwz307MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object Aqwz307STANDARD: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'STANDARD'
      Size = 30
    end
    object Aqwz307rece_quantity: TIntegerField
      DisplayLabel = #22806#21457#25910#36135#25968#37327
      FieldName = 'rece_quantity'
    end
    object Aqwz307RETURN_QTY: TIntegerField
      DisplayLabel = #36864#22238#25968#37327
      FieldName = 'RETURN_QTY'
    end
    object Aqwz307UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
      Size = 10
    end
    object Aqwz307reject_qty: TIntegerField
      DisplayLabel = #25253#24223#25968#37327
      FieldName = 'reject_qty'
    end
    object Aqwz307rework_qry: TIntegerField
      DisplayLabel = #26412#27425#36820#24037#25968#37327
      FieldName = 'rework_qry'
    end
    object Aqwz307received_qty: TIntegerField
      DisplayLabel = #36820#24037#25509#25910#25968#37327
      FieldName = 'received_qty'
    end
    object Aqwz307particulars_REMARK: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'particulars_REMARK'
      Size = 50
    end
    object Aqwz307rejected_ptr: TIntegerField
      FieldName = 'rejected_ptr'
    end
  end
  object ADOwz306: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
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
      'select * from wzdata306'
      'where rkey=:rkey')
    Left = 174
    Top = 111
    object ADOwz306rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOwz306rejected_number: TStringField
      FieldName = 'rejected_number'
      Size = 15
    end
    object ADOwz306DELIVER_PTR: TIntegerField
      FieldName = 'DELIVER_PTR'
    end
    object ADOwz306supp_ptr: TIntegerField
      FieldName = 'supp_ptr'
    end
    object ADOwz306DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADOwz306EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ADOwz306return_date: TDateTimeField
      FieldName = 'return_date'
    end
    object ADOwz306ENT_DATE: TDateTimeField
      FieldName = 'ENT_DATE'
    end
    object ADOwz306STATUS: TWordField
      FieldName = 'STATUS'
    end
    object ADOwz306REMARK: TStringField
      FieldName = 'REMARK'
      Size = 100
    end
    object ADOwz306return_qty: TIntegerField
      FieldName = 'return_qty'
    end
    object ADOwz306AUTH_EMPL: TIntegerField
      FieldName = 'AUTH_EMPL'
    end
    object ADOwz306AUTH_DATE: TDateTimeField
      FieldName = 'AUTH_DATE'
    end
  end
  object ADOwz307: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
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
      'SELECT *'
      'FROM WZDATA307'
      'where rejected_ptr=:rkey')
    Left = 240
    Top = 112
    object ADOwz307RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOwz307rejected_ptr: TIntegerField
      FieldName = 'rejected_ptr'
    end
    object ADOwz307received_ptr: TIntegerField
      FieldName = 'received_ptr'
    end
    object ADOwz307CUSTPART_PTR: TIntegerField
      FieldName = 'CUSTPART_PTR'
    end
    object ADOwz307UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
      Size = 50
    end
    object ADOwz307STANDARD: TStringField
      FieldName = 'STANDARD'
      Size = 30
    end
    object ADOwz307rework_qry: TIntegerField
      FieldName = 'rework_qry'
    end
    object ADOwz307received_qty: TIntegerField
      FieldName = 'received_qty'
    end
    object ADOwz307particulars_REMARK: TStringField
      FieldName = 'particulars_REMARK'
      Size = 50
    end
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    Parameters = <>
    Left = 224
    Top = 16
  end
  object Aq304: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltPessimistic
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
      
        'SELECT     dbo.WZDATA304.rece_quantity, dbo.WZDATA304.rework_qry' +
        ' AS rework_qry_304, dbo.WZDATA304.RKEY, '
      
        '                      dbo.WZDATA307.rework_qry AS rework_qry_307' +
        ', dbo.WZDATA301.UNIT_NAME, dbo.WZDATA301.STANDARD, dbo.WZDATA307' +
        '.received_ptr, '
      
        '                      dbo.WZDATA307.received_qty, dbo.WZDATA307.' +
        'particulars_REMARK, dbo.WZDATA307.rejected_ptr, dbo.WZDATA307.CU' +
        'STPART_PTR, '
      
        '                      wzdata307sum.rework_qry_sum307, wzdata307s' +
        'um.received_qty_sum307, dbo.Data0025.MANU_PART_NUMBER, '
      '                      dbo.Data0025.MANU_PART_DESC'
      'FROM         dbo.WZDATA301 INNER JOIN'
      
        '                      dbo.WZDATA304 ON dbo.WZDATA301.RKEY = dbo.' +
        'WZDATA304.EPILIST_PTR INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.WZDATA301.CUSTPART_PTR' +
        ' = dbo.Data0025.RKEY INNER JOIN'
      
        '                      dbo.WZDATA307 ON dbo.WZDATA304.RKEY = dbo.' +
        'WZDATA307.received_ptr LEFT OUTER JOIN'
      
        '                          (SELECT     received_ptr, SUM(rework_q' +
        'ry) AS rework_qry_sum307, SUM(received_qty) AS received_qty_sum3' +
        '07'
      
        '                            FROM          dbo.WZDATA307 AS WZDAT' +
        'A307_1'
      
        '                            GROUP BY received_ptr) AS wzdata307s' +
        'um ON dbo.WZDATA304.RKEY = wzdata307sum.received_ptr'
      'WHERE dbo.WZDATA307.rejected_ptr = :rkey')
    Left = 112
    Top = 219
    object Aq304rece_quantity: TIntegerField
      FieldName = 'rece_quantity'
    end
    object Aq304MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object Aq304MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object Aq304rework_qry_304: TIntegerField
      FieldName = 'rework_qry_304'
    end
    object Aq304RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object Aq304rework_qry_307: TIntegerField
      FieldName = 'rework_qry_307'
    end
    object Aq304UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
      Size = 50
    end
    object Aq304received_qty: TIntegerField
      FieldName = 'received_qty'
    end
    object Aq304particulars_REMARK: TStringField
      FieldName = 'particulars_REMARK'
      Size = 50
    end
    object Aq304rejected_ptr: TIntegerField
      FieldName = 'rejected_ptr'
    end
    object Aq304STANDARD: TStringField
      FieldName = 'STANDARD'
      Size = 30
    end
    object Aq304CUSTPART_PTR: TIntegerField
      FieldName = 'CUSTPART_PTR'
    end
    object Aq304received_ptr: TIntegerField
      FieldName = 'received_ptr'
    end
    object Aq304rework_qry_sum307: TIntegerField
      FieldName = 'rework_qry_sum307'
      ReadOnly = True
    end
    object Aq304received_qty_sum307: TIntegerField
      FieldName = 'received_qty_sum307'
      ReadOnly = True
    end
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 248
    Top = 248
  end
  object Aq04: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select CONTROL_NO_LENGTH,SEED_VALUE,SEED_FLAG'
      'from data0004'
      'where table_name = '#39'WZDATA306'#39)
    Left = 206
    Top = 200
    object Aq04CONTROL_NO_LENGTH: TSmallintField
      FieldName = 'CONTROL_NO_LENGTH'
    end
    object Aq04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object Aq04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
end
