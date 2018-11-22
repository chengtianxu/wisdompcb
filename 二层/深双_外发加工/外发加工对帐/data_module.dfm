object dm: Tdm
  OldCreateOrder = False
  Left = 553
  Top = 210
  Height = 497
  Width = 443
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'D:\68.8.udl'
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
    CursorType = ctStatic
    Filtered = True
    LockType = ltPessimistic
    AfterScroll = Aqwz303AfterScroll
    OnCalcFields = Aqwz303CalcFields
    Parameters = <
      item
        Name = 'v1'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 1
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
      'SELECT dbo.WZDATA303.RKEY, dbo.WZDATA303.DELIVER_NUMBER, '
      '      dbo.WZDATA303.EPIBOLY_PTR, dbo.WZDATA303.ENT_DATE, '
      '      dbo.WZDATA303.SHIP_DATE, dbo.WZDATA303.SHIP_NAME, '
      
        '      dbo.WZDATA303.STATUS, dbo.WZDATA303.REMARK, dbo.Data0023.C' +
        'ODE, '
      '      dbo.Data0023.SUPPLIER_NAME, dbo.Data0023.ABBR_NAME, '
      '      dbo.WZDATA300.epiboly_number, dbo.Data0034.DEPT_CODE, '
      '      dbo.Data0034.DEPT_NAME, D05_1.EMPL_CODE, '
      '      D05_1.EMPLOYEE_NAME, dbo.WZDATA303.totoal_money, '
      '      dbo.WZDATA303.exch_rate, dbo.WZDATA303.pay_method, '
      
        '      dbo.WZDATA303.TAX_cate, dbo.Data0001.CURR_CODE, dbo.Data00' +
        '01.CURR_NAME, '
      
        '      dbo.WZDATA303.calculate_method, dbo.WZDATA303.currency_ptr' +
        ','
      
        '      dbo.wzdata303.auth_userptr,dbo.wzdata303.auth_datetime,D05' +
        '_2.employee_name as auth_name'
      'FROM dbo.WZDATA300 INNER JOIN'
      '      dbo.WZDATA303 ON '
      '      dbo.WZDATA300.rkey = dbo.WZDATA303.EPIBOLY_PTR INNER JOIN'
      
        '      dbo.Data0005 D05_1 ON dbo.WZDATA303.EMPL_PTR = D05_1.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0034 ON dbo.WZDATA300.dept_ptr = dbo.Data0034.RKEY' +
        ' INNER JOIN'
      
        '      dbo.Data0001 ON dbo.WZDATA303.currency_ptr = dbo.Data0001.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0023 ON dbo.WZDATA303.SUPP_PTR = dbo.Data0023.RKEY' +
        '  LEFT  JOIN'
      
        '      dbo.Data0005 D05_2  ON dbo.WZDATA303.auth_userptr=D05_2.RK' +
        'EY'
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
      DisplayWidth = 30
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object Aqwz303ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 16
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
    object Aqwz303totoal_money: TBCDField
      DisplayLabel = #37329#39069
      FieldName = 'totoal_money'
      Precision = 9
      Size = 3
    end
    object Aqwz303exch_rate: TBCDField
      FieldName = 'exch_rate'
      Precision = 10
      Size = 8
    end
    object Aqwz303pay_method: TStringField
      FieldName = 'pay_method'
      Size = 50
    end
    object Aqwz303TAX_cate: TStringField
      FieldName = 'TAX_cate'
    end
    object Aqwz303CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object Aqwz303CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object Aqwz303calculate_method: TStringField
      FieldName = 'calculate_method'
      Size = 200
    end
    object Aqwz303currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object Aqwz303auth_userptr: TIntegerField
      FieldName = 'auth_userptr'
    end
    object Aqwz303auth_datetime: TDateTimeField
      FieldName = 'auth_datetime'
    end
    object Aqwz303auth_name: TStringField
      FieldName = 'auth_name'
      Size = 16
    end
  end
  object Aqwz304: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
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
      'SELECT Data0025.MANU_PART_NUMBER,data0025.MANU_PART_DESC,'
      '      WZDATA301.QUANTITY, WZDATA301.STANDARD, '
      '      dbo.WZDATA304.rece_quantity as '#25509#25910#25968#37327', dbo.WZDATA304.REMARK,'
      '      dbo.WZDATA301.UNIT_NAME, dbo.WZDATA304.price as '#21333#20215','
      '      WZDATA304.pattern_money as '#27169#20855#36153','
      '      WZDATA304.MIN_MONEY as '#26368#20302#25910#36153','
      '      dbo.WZDATA304.ENG_MONEY as '#24037#31243#36153','
      '      dbo.WZDATA301.AREA_SQM '#24179#26041#31859','
      '       dbo.WZDATA301.AREA_SQF as '#24179#26041#33521#23610','
      '       dbo.WZDATA304.TOTAL_MONEY,'
      '       dbo.WZDATA301.LAYER,'
      '      dbo.WZDATA301.THINK, dbo.WZDATA301.MIN_aperture, '
      '      dbo.WZDATA301.REQ_DATE'
      'FROM dbo.WZDATA304 INNER JOIN'
      '      dbo.WZDATA301 ON '
      '      dbo.WZDATA304.EPILIST_PTR = dbo.WZDATA301.RKEY INNER JOIN'
      '      dbo.Data0025 ON '
      '      dbo.WZDATA301.CUSTPART_PTR = dbo.Data0025.RKEY'
      'where WZDATA304.DELIVER_PTR=:rkey')
    Left = 112
    Top = 168
    object Aqwz304QUANTITY: TIntegerField
      DisplayLabel = #22806#21457#25968#37327
      FieldName = 'QUANTITY'
      ReadOnly = True
    end
    object Aqwz304STANDARD: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'STANDARD'
      ReadOnly = True
      Size = 30
    end
    object Aqwz304rece_quantity: TIntegerField
      FieldName = #25509#25910#25968#37327
      ReadOnly = True
    end
    object Aqwz304REMARK: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REMARK'
      Size = 50
    end
    object Aqwz304UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
      ReadOnly = True
      Size = 10
    end
    object Aqwz304price: TBCDField
      FieldName = #21333#20215
      Precision = 10
    end
    object Aqwz304pattern_money: TBCDField
      FieldName = #27169#20855#36153
      Precision = 8
      Size = 2
    end
    object Aqwz304MIN_MONEY: TBCDField
      FieldName = #26368#20302#25910#36153
      Precision = 8
      Size = 2
    end
    object Aqwz304ENG_MONEY: TBCDField
      FieldName = #24037#31243#36153
      Precision = 8
      Size = 2
    end
    object Aqwz304TOTAL_MONEY: TBCDField
      DisplayLabel = #23567#35745#37329#39069
      FieldName = 'TOTAL_MONEY'
      Precision = 8
      Size = 3
    end
    object Aqwz304AREA_SQM: TBCDField
      FieldName = #24179#26041#31859
      ReadOnly = True
      Precision = 6
    end
    object Aqwz304AREA_SQF: TBCDField
      FieldName = #24179#26041#33521#23610
      ReadOnly = True
      Precision = 6
    end
    object Aqwz304LAYER: TWordField
      DisplayLabel = #23618#25968#37327
      FieldName = 'LAYER'
      ReadOnly = True
    end
    object Aqwz304THINK: TBCDField
      DisplayLabel = #26495#21402
      FieldName = 'THINK'
      ReadOnly = True
      Precision = 4
      Size = 2
    end
    object Aqwz304MIN_aperture: TBCDField
      DisplayLabel = #26368#23569#23380#24452
      FieldName = 'MIN_aperture'
      ReadOnly = True
      Precision = 5
      Size = 3
    end
    object Aqwz304REQ_DATE: TDateTimeField
      DisplayLabel = #35201#27714#26085#26399
      FieldName = 'REQ_DATE'
      ReadOnly = True
    end
    object Aqwz304MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object Aqwz304MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    Parameters = <>
    Left = 224
    Top = 16
  end
end
