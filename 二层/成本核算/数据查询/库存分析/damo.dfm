object dm: Tdm
  OldCreateOrder = False
  Left = 624
  Top = 227
  Height = 509
  Width = 479
  object ADOConnection1: TADOConnection
    ConnectionTimeout = 30
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 8
  end
  object ADOQ444: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'v_year'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select data0444.cut_date,data0444.tdate, '
      'data0005.employee_name,data0444.rkey '
      'from data0444,data0005'
      'where data0444.cut_by=data0005.rkey'
      'and year(data0444.cut_date)=:v_year')
    Left = 109
    Top = 7
    object ADOQ444cut_date: TDateTimeField
      FieldName = 'cut_date'
    end
    object ADOQ444tdate: TDateTimeField
      FieldName = 'tdate'
    end
    object ADOQ444employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADOQ444rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object ADOD448a: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT TOP 100 PERCENT dbo.Data0025.MANU_PART_NUMBER, '#13#10'      db' +
      'o.Data0025.MANU_PART_DESC, dbo.Data0010.CUST_CODE, '#13#10'      SUM(d' +
      'bo.Data0448.QUANTITY * dbo.Data0448.ACT_MATL_COST_PER_PCS) '#13#10'   ' +
      '   AS std_matl_cost, '#13#10'      SUM(dbo.Data0448.QUANTITY * dbo.Dat' +
      'a0448.ACT_OVHD_COST_PER_PCS) '#13#10'      AS std_ovhd_cost,'#13#10'      su' +
      'm(dbo.data0448.QUANTITY * dbo.data0448.act_ovhd1_pcs) as std_ovh' +
      'd1_pcs,'#13#10'      sum(dbo.data0448.QUANTITY * dbo.data0448.act_outs' +
      'ource_pcs) as std_outsource_pcs,  '#13#10'      SUM(dbo.Data0448.QUANT' +
      'ITY * (dbo.Data0448.ACT_MATL_COST_PER_PCS + dbo.Data0448.ACT_OVH' +
      'D_COST_PER_PCS+dbo.data0448.act_ovhd1_pcs+dbo.data0448.act_outso' +
      'urce_pcs))'#13#10'       AS total_cost, SUM(dbo.Data0448.QUANTITY * db' +
      'o.Data0448.UNIT_PRICE) '#13#10'      AS sales_amount'#13#10'FROM dbo.Data044' +
      '8 INNER JOIN'#13#10'      dbo.Data0010 ON dbo.Data0448.CUSTOMER_PTR = ' +
      'dbo.Data0010.RKEY INNER JOIN'#13#10'      dbo.Data0025 ON dbo.Data0448' +
      '.MANU_PART_PTR = dbo.Data0025.RKEY'#13#10'WHERE (dbo.Data0448.D0444_PT' +
      'R = :vptr)'#13#10'GROUP BY dbo.Data0010.CUST_CODE, dbo.Data0025.MANU_P' +
      'ART_NUMBER, '#13#10'      dbo.Data0025.MANU_PART_DESC'#13#10'ORDER BY dbo.Da' +
      'ta0010.CUST_CODE, dbo.Data0025.MANU_PART_NUMBER'
    Parameters = <
      item
        Name = 'vptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    Left = 96
    Top = 72
    object ADOD448aMANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOD448aMANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADOD448acust_code: TStringField
      DisplayLabel = #23458#25143#32534#21495
      FieldName = 'cust_code'
      Size = 10
    end
    object ADOD448astd_matl_cost: TFloatField
      DisplayLabel = 'WIP'#26448#26009#36153#29992
      FieldName = 'std_matl_cost'
      ReadOnly = True
    end
    object ADOD448astd_ovhd_cost: TFloatField
      DisplayLabel = 'WIP'#21046#36896#36153#29992
      FieldName = 'std_ovhd_cost'
      ReadOnly = True
    end
    object ADOD448atotal_cost: TFloatField
      DisplayLabel = 'WIP'#24635#25104#26412
      FieldName = 'total_cost'
      ReadOnly = True
    end
    object ADOD448asales_amount: TFloatField
      DisplayLabel = #38144#21806#37329#39069
      FieldName = 'sales_amount'
      ReadOnly = True
    end
    object ADOD448astd_ovhd1_pcs: TFloatField
      FieldName = 'std_ovhd1_pcs'
      ReadOnly = True
    end
    object ADOD448astd_outsource_pcs: TFloatField
      FieldName = 'std_outsource_pcs'
      ReadOnly = True
    end
  end
  object ADOD448b: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT TOP 100 PERCENT dbo.Data0008.PROD_CODE, dbo.Data0008.PROD' +
      'UCT_NAME, '#13#10'      SUM(dbo.Data0448.QUANTITY * dbo.Data0448.ACT_M' +
      'ATL_COST_PER_PCS) '#13#10'      AS std_matl_cost, '#13#10'      sum(dbo.data' +
      '0448.QUANTITY * dbo.data0448.act_ovhd1_pcs) as std_ovhd1_pcs,'#13#10' ' +
      '     sum(dbo.data0448.QUANTITY * dbo.data0448.act_outsource_pcs)' +
      ' as std_outsource_pcs,  '#13#10'      SUM(dbo.Data0448.QUANTITY * (dbo' +
      '.Data0448.ACT_MATL_COST_PER_PCS + dbo.Data0448.ACT_OVHD_COST_PER' +
      '_PCS+dbo.data0448.act_ovhd1_pcs+dbo.data0448.act_outsource_pcs))' +
      #13#10'       AS total_cost, '#13#10'      SUM(dbo.Data0448.QUANTITY * dbo.' +
      'Data0448.ACT_OVHD_COST_PER_PCS) '#13#10'      AS std_ovhd_cost, SUM(db' +
      'o.Data0448.QUANTITY * dbo.Data0448.UNIT_PRICE) '#13#10'      AS sales_' +
      'amount'#13#10'FROM dbo.Data0448 INNER JOIN'#13#10'      dbo.Data0025 ON '#13#10'  ' +
      '    dbo.Data0448.MANU_PART_PTR = dbo.Data0025.RKEY INNER JOIN'#13#10' ' +
      '     dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.R' +
      'KEY'#13#10'WHERE (dbo.Data0448.D0444_PTR = :vptr)'#13#10'GROUP BY dbo.Data00' +
      '08.PROD_CODE, dbo.Data0008.PRODUCT_NAME'#13#10'ORDER BY dbo.Data0008.P' +
      'ROD_CODE'
    Parameters = <
      item
        Name = 'vptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    Left = 160
    Top = 72
    object ADOD448bprod_code: TStringField
      DisplayLabel = #20135#21697#31867#21035
      FieldName = 'prod_code'
      Size = 10
    end
    object ADOD448bproduct_name: TStringField
      DisplayLabel = #20135#21697#21517#31216
      FieldName = 'product_name'
      Size = 30
    end
    object ADOD448bstd_matl_cost: TFloatField
      DisplayLabel = 'WIP'#26448#26009#36153#29992
      FieldName = 'std_matl_cost'
      ReadOnly = True
    end
    object ADOD448bstd_ovhd_cost: TFloatField
      DisplayLabel = 'WIP'#21046#36896#36153#29992
      FieldName = 'std_ovhd_cost'
      ReadOnly = True
    end
    object ADOD448btotal_cost: TFloatField
      DisplayLabel = 'WIP'#24635#25104#26412
      FieldName = 'total_cost'
      ReadOnly = True
    end
    object ADOD448bsales_amount: TFloatField
      DisplayLabel = #38144#21806#20215#26684
      FieldName = 'sales_amount'
      ReadOnly = True
    end
    object ADOD448bstd_ovhd1_pcs: TFloatField
      FieldName = 'std_ovhd1_pcs'
      ReadOnly = True
    end
    object ADOD448bstd_outsource_pcs: TFloatField
      FieldName = 'std_outsource_pcs'
      ReadOnly = True
    end
  end
  object ADOD449: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'wzcx090;7'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@vptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 96
    Top = 128
    object ADOD449prod_code: TStringField
      DisplayLabel = #31867#21035#32534#21495
      FieldName = 'prod_code'
      Size = 10
    end
    object ADOD449product_name: TStringField
      DisplayLabel = #31867#21035#21517#31216
      FieldName = 'product_name'
      Size = 30
    end
    object ADOD449std_matl_cost: TFloatField
      DisplayLabel = 'FG'#26448#26009#25104#26412
      FieldName = 'std_matl_cost'
      ReadOnly = True
    end
    object ADOD449std_ovhd_cost: TFloatField
      DisplayLabel = 'FG'#21046#36896#36153#29992
      FieldName = 'std_ovhd_cost'
      ReadOnly = True
    end
    object ADOD449sales_amount: TFloatField
      DisplayLabel = #38144#21806#39069
      FieldName = 'sales_amount'
      ReadOnly = True
    end
    object ADOD449quantity: TIntegerField
      DisplayLabel = #24211#23384#25968#37327
      FieldName = 'quantity'
    end
    object ADOD449sqft: TFloatField
      DisplayLabel = #24211#23384#38754#31215
      FieldName = 'sqft'
    end
    object ADOD449std_OVHD1_COST_PER_PCS: TFloatField
      FieldName = 'std_OVHD1_COST_PER_PCS'
      ReadOnly = True
    end
    object ADOD449std_outsource_pcs: TFloatField
      FieldName = 'std_outsource_pcs'
      ReadOnly = True
    end
  end
  object ADOD445: TADODataSet
    Connection = ADOConnection1
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'wzcx090;12'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@vptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 160
    Top = 184
    object ADOD445group_name: TStringField
      DisplayLabel = #26448#26009#31867#21035
      FieldName = 'group_name'
      Size = 10
    end
    object ADOD445group_desc: TStringField
      DisplayLabel = #31867#21035#25551#36848
      FieldName = 'group_desc'
      Size = 30
    end
    object ADOD445amount: TFloatField
      DisplayLabel = #37329#39069
      FieldName = 'amount'
      ReadOnly = True
    end
    object ADOD445quantity: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'quantity'
    end
  end
  object ADOD462a: TADODataSet
    Connection = ADOConnection1
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'wzcx090;14'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@vptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 92
    Top = 241
    object ADOD462aWAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADOD462aABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOD462ainv_part_number: TStringField
      DisplayLabel = #26448#26009#32534#21495
      FieldName = 'inv_part_number'
      Size = 25
    end
    object ADOD462ainv_part_description: TStringField
      DisplayLabel = #26448#26009#25551#36848
      FieldName = 'inv_part_description'
      Size = 100
    end
    object ADOD462aunit_code: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'unit_code'
      Size = 5
    end
    object ADOD462astd_price: TFloatField
      DisplayLabel = #26631#20934#20215#26684
      FieldName = 'std_price'
    end
    object ADOD462aquantity: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'quantity'
      ReadOnly = True
    end
    object ADOD462aamount: TFloatField
      DisplayLabel = #26631#20934#25104#26412
      FieldName = 'amount'
      ReadOnly = True
    end
  end
  object ADOD462b: TADODataSet
    Connection = ADOConnection1
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'wzcx090;15'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@vptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 153
    Top = 240
    object ADOD462bwarehouse_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
    object ADOD462babbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADOD462bdept_code: TStringField
      DisplayLabel = #24037#24207
      FieldName = 'dept_code'
      Size = 10
    end
    object ADOD462bdept_name: TStringField
      DisplayLabel = #24037#24207#21517#31216
      FieldName = 'dept_name'
      Size = 30
    end
    object ADOD462bamount: TFloatField
      DisplayLabel = #26631#20934#25104#26412
      FieldName = 'amount'
      ReadOnly = True
    end
  end
  object ADOS_17: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'wzcx090;17'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@cut_no'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = #39#39
      end
      item
        Name = '@vdept_ptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 98
    Top = 366
    object ADOS_17CUT_NO: TStringField
      DisplayLabel = #37197#26009#21333#21495
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADOS_17INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      DisplayWidth = 10
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOS_17INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      DisplayWidth = 20
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADOS_17INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      DisplayWidth = 20
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADOS_17TDATE: TDateTimeField
      DisplayLabel = #21457#26009#26085#26399
      FieldName = 'TDATE'
    end
    object ADOS_17QUANTITY: TBCDField
      DisplayLabel = #21457#25918#25968#37327
      FieldName = 'QUANTITY'
      Precision = 19
    end
    object ADOS_17PRICE: TBCDField
      DisplayLabel = #20215#26684
      FieldName = 'PRICE'
      Precision = 15
      Size = 6
    end
    object ADOS_17exch_rate: TBCDField
      DisplayLabel = #27719#29575
      FieldName = 'exch_rate'
      Precision = 12
      Size = 8
    end
    object ADOS_17amount: TBCDField
      DisplayLabel = #37329#39069
      FieldName = 'amount'
      ReadOnly = True
      Precision = 32
      Size = 6
    end
    object ADOS_17ISSUED_QTY: TIntegerField
      DisplayLabel = #25237#20135#25968#37327
      FieldName = 'ISSUED_QTY'
    end
    object ADOS_17cost_pcs: TBCDField
      DisplayLabel = #27599'PCS'#25104#26412
      FieldName = 'cost_pcs'
      ReadOnly = True
      Precision = 32
      Size = 6
    end
  end
  object ADOS_19: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'wzcx090;19'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@vdept_ptr'
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@d451'
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@vtype'
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@OVHD_MTAL_1'
        DataType = ftString
        Direction = pdInputOutput
        Size = 20
        Value = Null
      end
      item
        Name = '@yield_sqft'
        DataType = ftString
        Direction = pdInputOutput
        Size = 20
        Value = Null
      end
      item
        Name = '@STD_MTAL_1'
        DataType = ftString
        Direction = pdInputOutput
        Size = 20
        Value = Null
      end
      item
        Name = '@STD_MTAL_2'
        DataType = ftString
        Direction = pdInputOutput
        Size = 20
        Value = Null
      end
      item
        Name = '@warehouse_ptr'
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 162
    Top = 302
    object ADOS_19inv_part_number: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'inv_part_number'
      Size = 25
    end
    object ADOS_19inv_part_description: TStringField
      DisplayLabel = #26448#26009#25551#36848
      FieldName = 'inv_part_description'
      ReadOnly = True
      Size = 100
    end
    object ADOS_19quantity: TBCDField
      DisplayLabel = #21457#25918#25968#37327
      FieldName = 'quantity'
      Precision = 19
    end
    object ADOS_19actual_cost: TFloatField
      DisplayLabel = #21457#25918#37329#39069
      FieldName = 'actual_cost'
      ReadOnly = True
    end
    object ADOS_19OPEN_QUANTITY: TFloatField
      DisplayLabel = #26399#21021#25968#37327
      FieldName = 'OPEN_QUANTITY'
    end
    object ADOS_19OPEN_AMOUNT: TBCDField
      DisplayLabel = #26399#21021#25104#26412
      FieldName = 'OPEN_AMOUNT'
      Precision = 18
      Size = 2
    end
    object ADOS_19CLOSED_QTY: TFloatField
      DisplayLabel = #26399#26410#25968#37327
      FieldName = 'CLOSED_QTY'
    end
    object ADOS_19CLOSED_AMOUNT: TBCDField
      DisplayLabel = #26399#26410#25104#26412
      FieldName = 'CLOSED_AMOUNT'
      Precision = 18
      Size = 2
    end
  end
  object ADOS_21: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'wzcx090;21'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@vdept_ptr'
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@vd451ptr'
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@vtype'
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@warehouse_ptr'
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 226
    Top = 302
    object ADOS_21RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOS_21D0451_PTR: TIntegerField
      FieldName = 'D0451_PTR'
    end
    object ADOS_21DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADOS_21OVHD_1: TBCDField
      DisplayLabel = #30452#25509#20154#24037
      FieldName = 'OVHD_1'
      Precision = 18
      Size = 2
    end
    object ADOS_21OVHD_2: TBCDField
      DisplayLabel = #35774#22791#25240#26087
      FieldName = 'OVHD_2'
      Precision = 18
      Size = 2
    end
    object ADOS_21OVHD_3: TBCDField
      DisplayLabel = #27700#30005#20854#23427
      FieldName = 'OVHD_3'
      Precision = 18
      Size = 2
    end
    object ADOS_21yield_sqft: TBCDField
      DisplayLabel = #20135#20986#38754#31215
      FieldName = 'yield_sqft'
      Precision = 19
    end
    object ADOS_21yield_sqft_wf: TBCDField
      DisplayLabel = #22806#21457#29983#20135#38754#31215
      FieldName = 'yield_sqft_wf'
      Precision = 18
    end
    object ADOS_21yield_amount: TBCDField
      DisplayLabel = #20135#20986#37329#39069
      FieldName = 'yield_amount'
      Precision = 19
    end
    object ADOS_21STD_OVHD_1: TBCDField
      DisplayLabel = #26631#20934#36153#29992'1'
      FieldName = 'STD_OVHD_1'
      Precision = 18
      Size = 2
    end
    object ADOS_21STD_OVHD_2: TBCDField
      DisplayLabel = #26631#20934#36153#29992'2'
      FieldName = 'STD_OVHD_2'
      Precision = 18
      Size = 2
    end
    object ADOS_21STD_OVHD_3: TBCDField
      DisplayLabel = #26631#20934#36153#29992'3'
      FieldName = 'STD_OVHD_3'
      Precision = 18
      Size = 2
    end
    object ADOS_21OVHD_4: TBCDField
      DisplayLabel = #22806#21457#36153#29992
      FieldName = 'OVHD_4'
      Precision = 18
      Size = 2
    end
    object ADOS_21OVHD_5: TBCDField
      DisplayLabel = #20108#31867#26448#26009
      FieldName = 'OVHD_5'
      Precision = 18
      Size = 2
    end
  end
  object ADOS_20: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'wzcx090;20'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@vdept_ptr'
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@d451'
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@vtype'
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@warehouse_ptr'
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 162
    Top = 366
    object ADOS_20DEPT_CODE: TStringField
      DisplayLabel = #24037#24207
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADOS_20MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOS_20WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ADOS_20QTY_PROD: TIntegerField
      DisplayLabel = #20135#20986#25968#37327
      FieldName = 'QTY_PROD'
    end
    object ADOS_20PARAMETER_VALUE: TFloatField
      DisplayLabel = #21333#20803#38754#31215
      FieldName = 'PARAMETER_VALUE'
    end
    object ADOS_20MATL_PER_SQFT_1: TFloatField
      DisplayLabel = #27599#24179#31859#19968#31867#26448#26009
      FieldName = 'MATL_PER_SQFT_1'
    end
    object ADOS_20MATL_PER_SQFT_2: TFloatField
      DisplayLabel = #27599#24179#31859#20108#31867#26448#26009
      FieldName = 'MATL_PER_SQFT_2'
    end
    object ADOS_20manu_part_desc: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'manu_part_desc'
      Size = 40
    end
  end
  object ADOD448: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    CommandText = 'wzcx090;3'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@vptr'
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 32
    Top = 72
    object ADOD448RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOD448WO_PTR: TIntegerField
      FieldName = 'WO_PTR'
    end
    object ADOD448WORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ADOD448MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOD448PROD_STATUS: TStringField
      FieldName = 'PROD_STATUS'
      ReadOnly = True
      Size = 10
    end
    object ADOD448unit_sq: TFloatField
      FieldName = 'unit_sq'
    end
    object ADOD448PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADOD448PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADOD448CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADOD448DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADOD448STEP: TSmallintField
      FieldName = 'STEP'
    end
    object ADOD448SO_NO: TStringField
      FieldName = 'SO_NO'
      FixedChar = True
      Size = 12
    end
    object ADOD448CUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADOD448QUANTITY: TIntegerField
      FieldName = 'QUANTITY'
    end
    object ADOD448INDATE: TDateTimeField
      FieldName = 'INDATE'
    end
    object ADOD448latest_price: TFloatField
      FieldName = 'latest_price'
    end
    object ADOD448std_matl_cost_per_pcs: TFloatField
      FieldName = 'std_matl_cost_per_pcs'
    end
    object ADOD448std_ovhd_cost_per_pcs: TFloatField
      FieldName = 'std_ovhd_cost_per_pcs'
    end
    object ADOD448MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADOD448ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOD448DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADOD448warehouse_code: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'warehouse_code'
      Size = 5
    end
    object ADOD448whouse_name: TStringField
      DisplayLabel = #24037#21378#21517#31216
      FieldName = 'whouse_name'
      Size = 10
    end
    object ADOD448PLANNED_QTY: TFloatField
      DisplayLabel = #39069#22806#24102#20837#25104#26412
      FieldName = 'PLANNED_QTY'
    end
    object ADOD448REFERENCE_PTR: TStringField
      FieldName = 'REFERENCE_PTR'
      ReadOnly = True
      Size = 2
    end
    object ADOD448act_ovhd1_pcs: TFloatField
      DisplayLabel = #30452#25509#20154#24037'/pcs'
      FieldName = 'act_ovhd1_pcs'
    end
    object ADOD448act_outsource_pcs: TFloatField
      DisplayLabel = #20108#31867#26448#26009'/pcs'
      FieldName = 'act_outsource_pcs'
    end
  end
  object ADO449: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT     TOP (100) PERCENT dbo.Data0025.MANU_PART_NUMBER, dbo.' +
      'Data0025.MANU_PART_DESC,dbo.data0025.ORIG_CUSTOMER, dbo.Data0010' +
      '.CUST_CODE, dbo.Data0015.WAREHOUSE_CODE, '#13#10'                     ' +
      ' dbo.Data0016.CODE, dbo.Data0449.unit_sq, dbo.Data0008.PROD_CODE' +
      ', dbo.Data0449.INDATE, '#13#10'                      dbo.Data0449.ACT_' +
      'MATL_COST_PER_PCS AS std_matl_cost_per_pcs, dbo.Data0449.ACT_OVH' +
      'D_COST_PER_PCS AS std_ovhd_cost_per_pcs, dbo.Data0449.D0444_PTR ' +
      'as rkey444,'#13#10'                      dbo.Data0449.UNIT_PRICE, dbo.' +
      'Data0449.RMA_NUMBER, dbo.Data0449.WO_PTR, dbo.Data0449.QUANTITY ' +
      'AS quan_on_hand, dbo.data0449.d0053_ptr as rkey53,'#13#10'            ' +
      '          dbo.Data0449.WORK_ORDER_NUMBER, dbo.Data0010.ABBR_NAME' +
      ', dbo.Data0010.CUSTOMER_NAME, dbo.Data0008.PRODUCT_NAME, dbo.Dat' +
      'a0016.LOCATION, '#13#10'                      dbo.Data0023.ABBR_NAME A' +
      'S ABBR_NAME_1,dbo.data0449.ACT_OVHD1_COST_PER_PCS,dbo.data0449.A' +
      'CT_outsource_pcs, '#13#10'                      CASE data0053.rma_ptr ' +
      'WHEN 0 THEN '#39#27491#24120#36807#25968#20837#20179#39' WHEN 1 THEN '#39#36864#36135#37325#26816#20837#20179#39' WHEN 2 THEN '#39#36820#20462#37325#26816#20837#20179#39' W' +
      'HEN 3 THEN '#39#30452#25509#20837#20179#39' WHEN 4 THEN '#39#22996#22806#21152#24037#20837#20179#39#13#10'                       W' +
      'HEN 5 THEN '#39#22996#22806#21152#24037#36864#36135#20837#20179#39' WHEN 6 THEN '#39#38144#21806#36864#36135#20837#20179#39' WHEN 7 THEN '#39#36716#25442#20837#20179#39' WH' +
      'EN 8 THEN '#39#29305#27530#20837#20179#39' END AS '#20837#24211#31867#22411', '#13#10'                      ISNULL(dbo' +
      '.Data0006.PLANNED_QTY, dbo.Data0053.cost_pcs) AS '#39069#22806#24102#20837#25104#26412#13#10'FROM   ' +
      '      dbo.Data0006 RIGHT OUTER JOIN'#13#10'                      dbo.D' +
      'ata0008 INNER JOIN'#13#10'                      dbo.Data0025 ON dbo.Da' +
      'ta0008.RKEY = dbo.Data0025.PROD_CODE_PTR INNER JOIN'#13#10'           ' +
      '           dbo.Data0449 INNER JOIN'#13#10'                      dbo.Da' +
      'ta0010 ON dbo.Data0449.CUSTOMER_PTR = dbo.Data0010.RKEY INNER JO' +
      'IN'#13#10'                      dbo.Data0015 ON dbo.Data0449.WHOUSE_PT' +
      'R = dbo.Data0015.RKEY INNER JOIN'#13#10'                      dbo.Data' +
      '0016 ON dbo.Data0449.LOCATION_PTR = dbo.Data0016.RKEY ON dbo.Dat' +
      'a0025.RKEY = dbo.Data0449.CUSTOMER_PART_PTR INNER JOIN'#13#10'        ' +
      '              dbo.Data0053 ON dbo.Data0449.d0053_ptr = dbo.Data0' +
      '053.RKEY ON dbo.Data0006.RKEY = dbo.Data0449.WO_PTR LEFT OUTER J' +
      'OIN'#13#10'                      dbo.Data0023 RIGHT OUTER JOIN'#13#10'      ' +
      '                dbo.Data0060 ON dbo.Data0023.RKEY = dbo.Data0060' +
      '.supplier_ptr ON dbo.Data0053.barcode_ptr = dbo.Data0060.RKEY'#13#10'W' +
      'HERE     (dbo.Data0449.D0444_PTR = :vptr)'#13#10'ORDER BY dbo.Data0449' +
      '.WORK_ORDER_NUMBER, dbo.Data0449.INDATE'
    Parameters = <
      item
        Name = 'vptr'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 32
    Top = 128
    object ADO449MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADO449MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADO449CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADO449WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADO449CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ADO449unit_sq: TFloatField
      FieldName = 'unit_sq'
    end
    object ADO449PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADO449INDATE: TDateTimeField
      FieldName = 'INDATE'
    end
    object ADO449std_matl_cost_per_pcs: TFloatField
      FieldName = 'std_matl_cost_per_pcs'
    end
    object ADO449std_ovhd_cost_per_pcs: TFloatField
      FieldName = 'std_ovhd_cost_per_pcs'
    end
    object ADO449UNIT_PRICE: TFloatField
      FieldName = 'UNIT_PRICE'
    end
    object ADO449RMA_NUMBER: TStringField
      FieldName = 'RMA_NUMBER'
      Size = 10
    end
    object ADO449WO_PTR: TIntegerField
      FieldName = 'WO_PTR'
    end
    object ADO449quan_on_hand: TIntegerField
      FieldName = 'quan_on_hand'
    end
    object ADO449WORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ADO449ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADO449CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADO449PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADO449LOCATION: TStringField
      FieldName = 'LOCATION'
    end
    object ADO449ABBR_NAME_1: TStringField
      FieldName = 'ABBR_NAME_1'
      ReadOnly = True
      Size = 16
    end
    object ADO449DSDesigner: TStringField
      FieldName = #20837#24211#31867#22411
      ReadOnly = True
      Size = 16
    end
    object ADO449DSDesigner2: TFloatField
      FieldName = #39069#22806#24102#20837#25104#26412
      ReadOnly = True
    end
    object ADO449rkey53: TIntegerField
      FieldName = 'rkey53'
    end
    object ADO449rkey444: TIntegerField
      FieldName = 'rkey444'
    end
    object ADO449ORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      Size = 10
    end
    object ADO449ACT_OVHD1_COST_PER_PCS: TFloatField
      DisplayLabel = #30452#25509#20154#24037'/pcs'
      FieldName = 'ACT_OVHD1_COST_PER_PCS'
    end
    object ADO449ACT_outsource_pcs: TFloatField
      DisplayLabel = #20108#31867#26448#26009'/pcs'
      FieldName = 'ACT_outsource_pcs'
    end
  end
  object ADOQ445: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT  Data0496.GROUP_NAME,Data0017.INV_PART_NUMBER,Data0017.IN' +
      'V_PART_DESCRIPTION, '#13#10'        Data0002.UNIT_CODE,Data0445.RECD_D' +
      'ATE,DATA0022.EXPIRE_DATE,Data0445.UNIT_PRICE,Data0445.QUANTITY A' +
      'S quantity, '#13#10'        Data0445.QUANTITY * Data0445.UNIT_PRICE AS' +
      ' amount, '#13#10'        Data0445.QUANTITY * Data0445.UNIT_PRICE * (1+' +
      'Data0445.TAX_2*0.01) AS amount_tax, '#13#10'        Data0022.STOCK_BAS' +
      'E * Data0445.QUANTITY AS Inventories,Data0017.STOCK_SELL,Data002' +
      '3.CODE,Data0023.ABBR_NAME, '#13#10'        Data0001.CURR_CODE,Data0445' +
      '.TAX_2,Data0022.tax_price*Data0456.exch_rate AS tax_price,Data04' +
      '56.exch_rate,case data0456.ttype when 1 then '#39#32534#30721#20837#20179#39' '#13#10'       whe' +
      'n 2 then '#39#26434#39033#20837#20179#39' when 3 then '#39#30452#25509#20837#20179#39' when 4 then '#39#35843#25300#20837#20179#39' when 5 the' +
      'n '#39'VMI'#20837#20179#39'  end as C_TTYPE,Data0016.LOCATION       '#13#10'FROM    Data' +
      '0445 INNER JOIN'#13#10'        Data0017 ON Data0445.INVENT_PTR = Data0' +
      '017.RKEY INNER JOIN'#13#10'        Data0022 ON Data0445.D0022_PTR = Da' +
      'ta0022.RKEY INNER JOIN'#13#10'        Data0496 ON Data0017.GROUP_PTR =' +
      ' Data0496.RKEY INNER JOIN'#13#10'        Data0456 ON Data0022.GRN_PTR ' +
      '= Data0456.RKEY INNER JOIN'#13#10'        Data0023 ON Data0456.SUPP_PT' +
      'R = Data0023.RKEY INNER JOIN'#13#10'        Data0002 ON Data0022.LOCAT' +
      'ION_PTR_FROM = Data0002.RKEY INNER JOIN'#13#10'        Data0001 ON Dat' +
      'a0456.currency_ptr = Data0001.RKEY INNER JOIN'#13#10'        Data0016 ' +
      'ON dbo.Data0022.LOCATION_PTR = Data0016.RKEY'#13#10'WHERE   (Data0445.' +
      'D0444_PTR = :vptr)'#13#10'ORDER BY Data0496.GROUP_NAME,Data0017.INV_PA' +
      'RT_NUMBER'#13#10#13#10#13#10
    Parameters = <
      item
        Name = 'vptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 32
    Top = 184
    object ADOQ445GROUP_NAME: TStringField
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object ADOQ445INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOQ445INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ADOQ445UNIT_CODE: TStringField
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object ADOQ445RECD_DATE: TDateTimeField
      FieldName = 'RECD_DATE'
    end
    object ADOQ445UNIT_PRICE: TFloatField
      DisplayLabel = #19981#21547#31246#20215'('#26412#24065')'
      FieldName = 'UNIT_PRICE'
    end
    object ADOQ445quantity: TFloatField
      FieldName = 'quantity'
    end
    object ADOQ445amount: TFloatField
      FieldName = 'amount'
      ReadOnly = True
    end
    object ADOQ445amount_tax: TBCDField
      FieldName = 'amount_tax'
      ReadOnly = True
      Precision = 32
      Size = 8
    end
    object ADOQ445Inventories: TBCDField
      FieldName = 'Inventories'
      ReadOnly = True
      Precision = 28
      Size = 8
    end
    object ADOQ445STOCK_SELL: TFloatField
      FieldName = 'STOCK_SELL'
    end
    object ADOQ445CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ADOQ445ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object ADOQ445CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADOQ445TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ADOQ445tax_price: TBCDField
      DisplayLabel = #21547#31246#20215'('#26412#24065')'
      FieldName = 'tax_price'
      ReadOnly = True
      Precision = 25
      Size = 11
    end
    object ADOQ445exch_rate: TBCDField
      FieldName = 'exch_rate'
      Precision = 12
      Size = 8
    end
    object ADOQ445EXPIRE_DATE: TDateTimeField
      DisplayLabel = #26377#25928#26399
      FieldName = 'EXPIRE_DATE'
    end
    object ADOQ445C_TTYPE: TStringField
      FieldName = 'C_TTYPE'
      ReadOnly = True
      Size = 8
    end
    object ADOQ445LOCATION: TStringField
      FieldName = 'LOCATION'
    end
  end
  object ADOS445: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'wzcx090;11'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@vptr'
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 96
    Top = 184
    object ADOS445INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOS445INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ADOS445UNIT_CODE: TStringField
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object ADOS445quantity: TFloatField
      FieldName = 'quantity'
      ReadOnly = True
    end
    object ADOS445amount: TFloatField
      FieldName = 'amount'
      ReadOnly = True
    end
    object ADOS445AVG_UNIT_PRICE: TFloatField
      FieldName = 'AVG_UNIT_PRICE'
      ReadOnly = True
    end
    object ADOS445amount_tax: TFloatField
      FieldKind = fkCalculated
      FieldName = 'amount_tax'
      Calculated = True
    end
    object ADOS445Inventories: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Inventories'
      Calculated = True
    end
    object ADOS445STOCK_SELL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'STOCK_SELL'
      Calculated = True
    end
    object ADOS445CODE: TStringField
      FieldKind = fkCalculated
      FieldName = 'CODE'
      Size = 8
      Calculated = True
    end
    object ADOS445ABBR_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'ABBR_NAME'
      Size = 50
      Calculated = True
    end
  end
  object ADOS462: TADODataSet
    Connection = ADOConnection1
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'wzcx090;13'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@vptr'
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 33
    Top = 240
    object ADOS462WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADOS462ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOS462DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADOS462INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOS462INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ADOS462UNIT_CODE: TStringField
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object ADOS462QUAN: TFloatField
      FieldName = 'QUAN'
    end
    object ADOS462STD_PRICE: TFloatField
      FieldName = 'STD_PRICE'
    end
  end
  object ADO17: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select cast(0 as bit) sel,inv_part_number,inv_part_description,r' +
      'key from data0017 where group_ptr= :group_ptr'
    Parameters = <
      item
        Name = 'group_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 240
    Top = 128
    object ADO17sel: TBooleanField
      FieldName = 'sel'
    end
    object ADO17inv_part_number: TStringField
      FieldName = 'inv_part_number'
      ReadOnly = True
      Size = 25
    end
    object ADO17inv_part_description: TStringField
      FieldName = 'inv_part_description'
      ReadOnly = True
      Size = 100
    end
    object ADO17rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object DSP517: TDataSetProvider
    DataSet = ADO17
    Left = 240
    Top = 184
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 304
    Top = 160
  end
end
