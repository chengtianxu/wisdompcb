object dm: Tdm
  OldCreateOrder = False
  Left = 443
  Top = 171
  Height = 388
  Width = 380
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 48
  end
  object DataSource1: TDataSource
    DataSet = Aqwz303
    Left = 48
    Top = 112
  end
  object DataSource2: TDataSource
    DataSet = Aqwz304
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
  object Aqwz303: TADOQuery
    Connection = ADOConnection1
    Filtered = True
    OnCalcFields = Aqwz303CalcFields
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
        Value = 3
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
        Name = 'v6'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 6
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
      'SELECT WZDATA303.RKEY, WZDATA303.DELIVER_NUMBER,'
      '       WZDATA303.EPIBOLY_PTR,WZDATA303.ent_date,'
      '       WZDATA303.SHIP_DATE,WZDATA303.SHIP_NAME,'
      '      WZDATA303.STATUS, WZDATA303.REMARK,'
      '      Data0023.CODE, Data0023.SUPPLIER_NAME,'
      '      Data0023.ABBR_NAME, WZDATA300.epiboly_number,'
      '      Data0034.DEPT_CODE, Data0034.DEPT_NAME,'
      '      Data0005.EMPL_CODE, Data0005.EMPLOYEE_NAME,'
      'WZDATA300.remark'
      'FROM WZDATA300 INNER JOIN'
      '      WZDATA303 ON '
      '      WZDATA300.rkey = WZDATA303.EPIBOLY_PTR INNER JOIN'
      '      Data0005 ON WZDATA303.EMPL_PTR = Data0005.RKEY INNER JOIN'
      '      Data0023 ON WZDATA300.supp_ptr = Data0023.RKEY INNER JOIN'
      '      Data0034 ON WZDATA300.dept_ptr = Data0034.RKEY'
      'where'
      '      WZDATA303.status <> :v1 and'
      '      WZDATA303.status <> :v2 and'
      '      WZDATA303.status <> :v3 and'
      '      WZDATA303.status <> :v4 and'
      '      WZDATA303.status <> :v5 and'
      '      WZDATA303.status <> :v6 and'
      '      WZDATA303.SHIP_DATE >= :dtpk1 and'
      '      WZDATA303.SHIP_DATE <= :dtpk2'
      'order by WZDATA303.DELIVER_NUMBER')
    Left = 112
    Top = 112
    object Aqwz303RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object Aqwz303EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object Aqwz303EMPLOYEE_NAME: TStringField
      DisplayLabel = #25910#36135#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object Aqwz303DELIVER_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object Aqwz303SHIP_DATE: TDateTimeField
      DisplayLabel = #36865#36135#26085#26399
      FieldName = 'SHIP_DATE'
    end
    object Aqwz303STATUS: TWordField
      FieldName = 'STATUS'
    end
    object Aqwz303CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object Aqwz303SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 40
    end
    object Aqwz303ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object Aqwz303epiboly_number: TStringField
      DisplayLabel = #22806#21457#32534#21495
      FieldName = 'epiboly_number'
      Size = 15
    end
    object Aqwz303DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object Aqwz303DEPT_NAME: TStringField
      DisplayLabel = #22806#21457#24037#24207
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object Aqwz303v_status: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Size = 6
      Calculated = True
    end
    object Aqwz303SHIP_NAME: TStringField
      FieldName = 'SHIP_NAME'
    end
    object Aqwz303REMARK: TStringField
      FieldName = 'REMARK'
      Size = 200
    end
    object Aqwz303EPIBOLY_PTR: TIntegerField
      FieldName = 'EPIBOLY_PTR'
    end
    object Aqwz303ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object Aqwz303remark_1: TStringField
      FieldName = 'remark_1'
      Size = 100
    end
  end
  object Aqwz304: TADOQuery
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
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Data0025.MANU_PART_NUMBER,'
      '      Data0025.MANU_PART_DESC,WZDATA304.reject_qty,'
      '      WZDATA301.QUANTITY, WZDATA301.STANDARD,'
      '      WZDATA304.rece_quantity, WZDATA304.REMARK,'
      '      WZDATA301.UNIT_NAME,WZDATA304.RETURN_QTY'
      'FROM WZDATA304 INNER JOIN WZDATA301 ON'
      '      WZDATA304.EPILIST_PTR = WZDATA301.RKEY INNER JOIN'
      '      Data0025 ON WZDATA301.CUSTPART_PTR = Data0025.RKEY'
      'where WZDATA304.DELIVER_PTR=:rkey'
      'order by Data0025.MANU_PART_NUMBER')
    Left = 112
    Top = 168
    object Aqwz304MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object Aqwz304MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object Aqwz304QUANTITY: TIntegerField
      DisplayLabel = #22806#21457#25968#37327
      FieldName = 'QUANTITY'
    end
    object Aqwz304STANDARD: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'STANDARD'
      Size = 30
    end
    object Aqwz304rece_quantity: TIntegerField
      DisplayLabel = #25509#25910#25968#37327
      FieldName = 'rece_quantity'
    end
    object Aqwz304RETURN_QTY: TIntegerField
      DisplayLabel = #36864#22238#25968#37327
      FieldName = 'RETURN_QTY'
    end
    object Aqwz304REMARK: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REMARK'
      Size = 50
    end
    object Aqwz304UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
      Size = 10
    end
    object Aqwz304reject_qty: TIntegerField
      DisplayLabel = #25253#24223#25968#37327
      FieldName = 'reject_qty'
    end
  end
  object ADOwz303: TADOQuery
    Connection = ADOConnection1
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
      'select * from wzdata303'
      'where rkey=:rkey')
    Left = 174
    Top = 111
    object ADOwz303RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOwz303DELIVER_NUMBER: TStringField
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object ADOwz303EPIBOLY_PTR: TIntegerField
      FieldName = 'EPIBOLY_PTR'
    end
    object ADOwz303SHIP_NAME: TStringField
      FieldName = 'SHIP_NAME'
    end
    object ADOwz303SHIP_DATE: TDateTimeField
      FieldName = 'SHIP_DATE'
    end
    object ADOwz303ENT_DATE: TDateTimeField
      FieldName = 'ENT_DATE'
    end
    object ADOwz303STATUS: TWordField
      FieldName = 'STATUS'
    end
    object ADOwz303REMARK: TStringField
      FieldName = 'REMARK'
      Size = 50
    end
    object ADOwz303EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ADOwz303TAX_cate: TStringField
      FieldName = 'TAX_cate'
    end
    object ADOwz303pay_method: TStringField
      FieldName = 'pay_method'
      Size = 50
    end
    object ADOwz303currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object ADOwz303exch_rate: TBCDField
      FieldName = 'exch_rate'
      Precision = 10
      Size = 8
    end
    object ADOwz303totoal_money: TBCDField
      FieldName = 'totoal_money'
      Precision = 9
      Size = 3
    end
    object ADOwz303SUPP_PTR: TIntegerField
      FieldName = 'SUPP_PTR'
    end
  end
  object ADOwz304: TADOQuery
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
      'select DELIVER_PTR,EPILIST_PTR,rece_quantity,RETURN_QTY,'
      '  reject_qty,REMARK from wzdata304'
      'where DELIVER_PTR=:rkey')
    Left = 240
    Top = 112
    object ADOwz304DELIVER_PTR: TIntegerField
      FieldName = 'DELIVER_PTR'
    end
    object ADOwz304EPILIST_PTR: TIntegerField
      FieldName = 'EPILIST_PTR'
    end
    object ADOwz304rece_quantity: TIntegerField
      FieldName = 'rece_quantity'
    end
    object ADOwz304RETURN_QTY: TIntegerField
      FieldName = 'RETURN_QTY'
    end
    object ADOwz304reject_qty: TIntegerField
      FieldName = 'reject_qty'
    end
    object ADOwz304REMARK: TStringField
      FieldName = 'REMARK'
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
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'EPIBOLY_PTR'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT dbo.WZDATA301.RKEY, dbo.WZDATA301.STANDARD, dbo.WZDATA301' +
        '.QUANTITY,'
      '      dbo.WZDATA301.UNIT_NAME, dbo.WZDATA301.REQ_DATE,'
      '      dbo.WZDATA301.RECEVIED_QTY + dbo.WZDATA301.RETURN_QTY +'
      
        '      wzdata301.reject_qty-WZDATA304.rece_quantity- WZDATA304.RE' +
        'TURN_QTY-'
      '      wzdata304.reject_qty AS rece_qty,'
      '      WZDATA304.RETURN_QTY,WZDATA304.rece_quantity,'
      '      wzdata304.reject_qty,dbo.WZDATA304.REMARK,'
      '      dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC'
      'FROM dbo.WZDATA301 INNER JOIN'
      '      dbo.Data0025 ON'
      
        '      dbo.WZDATA301.CUSTPART_PTR = dbo.Data0025.RKEY LEFT OUTER ' +
        'JOIN'
      
        '      dbo.WZDATA304 ON dbo.WZDATA301.RKEY = dbo.WZDATA304.EPILIS' +
        'T_PTR AND '
      '      dbo.WZDATA304.DELIVER_PTR = :rkey'
      'WHERE (dbo.WZDATA301.EPIBOLY_PTR = :EPIBOLY_PTR)')
    Left = 112
    Top = 219
    object Aq304STANDARD: TStringField
      FieldName = 'STANDARD'
      Size = 30
    end
    object Aq304QUANTITY: TIntegerField
      FieldName = 'QUANTITY'
    end
    object Aq304UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
      Size = 10
    end
    object Aq304REQ_DATE: TDateTimeField
      FieldName = 'REQ_DATE'
    end
    object Aq304rece_quantity: TIntegerField
      FieldName = 'rece_quantity'
    end
    object Aq304REMARK: TStringField
      FieldName = 'REMARK'
      Size = 50
    end
    object Aq304RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object Aq304RETURN_QTY: TIntegerField
      FieldName = 'RETURN_QTY'
    end
    object Aq304rece_qty: TIntegerField
      FieldName = 'rece_qty'
      ReadOnly = True
    end
    object Aq304reject_qty: TIntegerField
      FieldName = 'reject_qty'
    end
    object Aq304MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object Aq304MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 248
    Top = 248
  end
  object qrytmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 112
    Top = 288
  end
end
