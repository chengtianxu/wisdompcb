object DM: TDM
  OldCreateOrder = False
  Left = 571
  Top = 233
  Height = 374
  Width = 384
  object ADOConnection1: TADOConnection
    CommandTimeout = 180
    ConnectionTimeout = 30
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 32
  end
  object DataSource1: TDataSource
    DataSet = AqD451
    Left = 48
    Top = 96
  end
  object AqD451: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = AqD451CalcFields
    CommandText = 
      'SELECT  dbo.Data0451.RKEY, '#13#10'      dbo.Data0451.FM_DATE, dbo.Dat' +
      'a0451.END_DATE, '#13#10'      dbo.Data0451.ACTUAL_FM_DATE, dbo.Data045' +
      '1.ACTUAL_END_DATE, '#13#10'      dbo.Data0005.EMPLOYEE_NAME, dbo.Data0' +
      '451.CLOSED_DATE, '#13#10'      dbo.Data0444.CLOSED,Data0451.CLOSED_BY'#13 +
      #10'FROM dbo.Data0005 INNER JOIN'#13#10'      dbo.Data0451 ON dbo.Data000' +
      '5.RKEY = dbo.Data0451.CLOSED_BY INNER JOIN'#13#10'      dbo.Data0444 O' +
      'N dbo.Data0451.END_DATE = dbo.Data0444.CUT_DATE'#13#10'WHERE (dbo.Data' +
      '0451.RKEY IS NOT NULL)'#13#10
    IndexFieldNames = 'FM_DATE'
    Parameters = <>
    Left = 133
    Top = 96
    object AqD451RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AqD451FM_DATE: TDateTimeField
      DisplayLabel = #24320#22987#26085#26399
      FieldName = 'FM_DATE'
    end
    object AqD451END_DATE: TDateTimeField
      DisplayLabel = #32467#26463#26085#26399
      FieldName = 'END_DATE'
    end
    object AqD451ACTUAL_FM_DATE: TDateTimeField
      DisplayLabel = #24320#22987#26085#26399#26102#38388
      FieldName = 'ACTUAL_FM_DATE'
    end
    object AqD451ACTUAL_END_DATE: TDateTimeField
      DisplayLabel = #32467#26463#26085#26399#26102#38388
      FieldName = 'ACTUAL_END_DATE'
    end
    object AqD451EMPLOYEE_NAME: TStringField
      DisplayLabel = #26680#31639#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object AqD451CLOSED_DATE: TDateTimeField
      DisplayLabel = #26680#31639#26102#38388
      FieldName = 'CLOSED_DATE'
    end
    object AqD451CLOSED: TStringField
      FieldName = 'CLOSED'
      FixedChar = True
      Size = 1
    end
    object AqD451NO: TIntegerField
      DisplayLabel = #24207#21495
      FieldKind = fkCalculated
      FieldName = 'NO'
      Calculated = True
    end
    object AqD451CLOSED_BY: TIntegerField
      FieldName = 'CLOSED_BY'
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 128
    Top = 32
  end
  object ADO451: TADOQuery
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
      'select * from data0451'
      'where rkey=:rkey')
    Left = 184
    Top = 32
    object ADO451RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO451FM_DATE: TDateTimeField
      FieldName = 'FM_DATE'
    end
    object ADO451END_DATE: TDateTimeField
      FieldName = 'END_DATE'
    end
    object ADO451ACTUAL_FM_DATE: TDateTimeField
      FieldName = 'ACTUAL_FM_DATE'
    end
    object ADO451ACTUAL_END_DATE: TDateTimeField
      FieldName = 'ACTUAL_END_DATE'
    end
    object ADO451MATL_CST_IN_STOCK_OPEN: TBCDField
      FieldName = 'MATL_CST_IN_STOCK_OPEN'
      Precision = 18
      Size = 2
    end
    object ADO451MATL_CST_IN_STOCK_CLOSED: TBCDField
      FieldName = 'MATL_CST_IN_STOCK_CLOSED'
      Precision = 18
      Size = 2
    end
    object ADO451DMATL_CST_OUT: TBCDField
      FieldName = 'DMATL_CST_OUT'
      Precision = 18
      Size = 2
    end
    object ADO451DMATL_CST_IN_DEPT_OPEN: TBCDField
      FieldName = 'DMATL_CST_IN_DEPT_OPEN'
      Precision = 18
      Size = 2
    end
    object ADO451DMATL_CST_IN_DEPT_CLOSED: TBCDField
      FieldName = 'DMATL_CST_IN_DEPT_CLOSED'
      Precision = 18
      Size = 2
    end
    object ADO451IDMATL_CST_OUT: TBCDField
      FieldName = 'IDMATL_CST_OUT'
      Precision = 18
      Size = 2
    end
    object ADO451IDMATL_CST_IN_DEPT_OPEN: TBCDField
      FieldName = 'IDMATL_CST_IN_DEPT_OPEN'
      Precision = 18
      Size = 2
    end
    object ADO451IDMATL_CST_IN_DEPT_CLOSED: TBCDField
      FieldName = 'IDMATL_CST_IN_DEPT_CLOSED'
      Precision = 18
      Size = 2
    end
    object ADO451MATL_CST_IN_WIP_OPEN: TBCDField
      FieldName = 'MATL_CST_IN_WIP_OPEN'
      Precision = 18
      Size = 2
    end
    object ADO451MATL_CST_IN_WIP_CLOSED: TBCDField
      FieldName = 'MATL_CST_IN_WIP_CLOSED'
      Precision = 18
      Size = 2
    end
    object ADO451MATL_CST_IN_SFG_OPEN: TBCDField
      FieldName = 'MATL_CST_IN_SFG_OPEN'
      Precision = 18
      Size = 2
    end
    object ADO451MATL_CST_IN_SFG_CLOSED: TBCDField
      FieldName = 'MATL_CST_IN_SFG_CLOSED'
      Precision = 18
      Size = 2
    end
    object ADO451MATL_CST_IN_FG_OPEN: TBCDField
      FieldName = 'MATL_CST_IN_FG_OPEN'
      Precision = 18
      Size = 2
    end
    object ADO451MATL_CST_IN_FG_CLOSED: TBCDField
      FieldName = 'MATL_CST_IN_FG_CLOSED'
      Precision = 18
      Size = 2
    end
    object ADO451TOTAL_MATL_CST: TBCDField
      FieldName = 'TOTAL_MATL_CST'
      Precision = 18
      Size = 2
    end
    object ADO451OVHD_CST_IN_WIP_OPEN: TBCDField
      FieldName = 'OVHD_CST_IN_WIP_OPEN'
      Precision = 18
      Size = 2
    end
    object ADO451OVHD_CST_IN_WIP_CLOSED: TBCDField
      FieldName = 'OVHD_CST_IN_WIP_CLOSED'
      Precision = 18
      Size = 2
    end
    object ADO451OVHD_CST_IN_WIP_OCCURED: TBCDField
      FieldName = 'OVHD_CST_IN_WIP_OCCURED'
      Precision = 18
      Size = 2
    end
    object ADO451OVHD_CST_IN_SFG_OPEN: TBCDField
      FieldName = 'OVHD_CST_IN_SFG_OPEN'
      Precision = 18
      Size = 2
    end
    object ADO451OVHD_CST_IN_SFG_CLOSED: TBCDField
      FieldName = 'OVHD_CST_IN_SFG_CLOSED'
      Precision = 18
      Size = 2
    end
    object ADO451OVHD_CST_IN_FG_OPEN: TBCDField
      FieldName = 'OVHD_CST_IN_FG_OPEN'
      Precision = 18
      Size = 2
    end
    object ADO451OVHD_CST_IN_FG_CLOSED: TBCDField
      FieldName = 'OVHD_CST_IN_FG_CLOSED'
      Precision = 18
      Size = 2
    end
    object ADO451TOTAL_OVHD_CST: TBCDField
      FieldName = 'TOTAL_OVHD_CST'
      Precision = 18
      Size = 2
    end
    object ADO451YIELD_IN_SQFT: TFloatField
      FieldName = 'YIELD_IN_SQFT'
    end
    object ADO451YIELD_IN_AMOUNT: TBCDField
      FieldName = 'YIELD_IN_AMOUNT'
      Precision = 18
      Size = 2
    end
    object ADO451CLOSED_BY: TIntegerField
      FieldName = 'CLOSED_BY'
    end
    object ADO451CLOSED_DATE: TDateTimeField
      FieldName = 'CLOSED_DATE'
    end
    object ADO451SELECTED: TSmallintField
      FieldName = 'SELECTED'
    end
    object ADO451YLD_IN_AMT_REJUST: TFloatField
      FieldName = 'YLD_IN_AMT_REJUST'
    end
    object ADO451YLD_IN_SQFT_REJUST: TFloatField
      FieldName = 'YLD_IN_SQFT_REJUST'
    end
    object ADO451MATL_GL_DATE: TDateTimeField
      FieldName = 'MATL_GL_DATE'
    end
    object ADO451MATL_GL_PTR: TIntegerField
      FieldName = 'MATL_GL_PTR'
    end
    object ADO451MATL_GL_BY: TIntegerField
      FieldName = 'MATL_GL_BY'
    end
    object ADO451WIP_GL_DATE: TDateTimeField
      FieldName = 'WIP_GL_DATE'
    end
    object ADO451WIP_GL_PTR: TIntegerField
      FieldName = 'WIP_GL_PTR'
    end
    object ADO451WIP_GL_BY: TIntegerField
      FieldName = 'WIP_GL_BY'
    end
    object ADO451FG_GL_DATE: TDateTimeField
      FieldName = 'FG_GL_DATE'
    end
    object ADO451FG_GL_PTR: TIntegerField
      FieldName = 'FG_GL_PTR'
    end
    object ADO451FG_GL_BY: TIntegerField
      FieldName = 'FG_GL_BY'
    end
    object ADO451wo_closed: TStringField
      FieldName = 'wo_closed'
      FixedChar = True
      Size = 1
    end
    object ADO451stock_matl_cost: TBCDField
      FieldName = 'stock_matl_cost'
      Precision = 19
    end
    object ADO451stock_matl_in_wip_cost: TBCDField
      FieldName = 'stock_matl_in_wip_cost'
      Precision = 19
    end
    object ADO451purchased_matl_cost: TBCDField
      FieldName = 'purchased_matl_cost'
      Precision = 19
    end
    object ADO451misc_used_matl_cost: TBCDField
      FieldName = 'misc_used_matl_cost'
      Precision = 19
    end
    object ADO451closed_stock_matl_cost: TBCDField
      FieldName = 'closed_stock_matl_cost'
      Precision = 19
    end
    object ADO451closed_stock_matl_in_wip_cost: TBCDField
      FieldName = 'closed_stock_matl_in_wip_cost'
      Precision = 19
    end
    object ADO451ovhd1_cost: TBCDField
      FieldName = 'ovhd1_cost'
      Precision = 19
    end
    object ADO451ovhd2_cost: TBCDField
      FieldName = 'ovhd2_cost'
      Precision = 19
    end
    object ADO451ovhd3_cost: TBCDField
      FieldName = 'ovhd3_cost'
      Precision = 19
    end
    object ADO451open_wip_cost: TBCDField
      FieldName = 'open_wip_cost'
      Precision = 19
    end
    object ADO451closed_wip_cost: TBCDField
      FieldName = 'closed_wip_cost'
      Precision = 19
    end
    object ADO451open_fg_cost: TBCDField
      FieldName = 'open_fg_cost'
      Precision = 19
    end
    object ADO451closed_fg_cost: TBCDField
      FieldName = 'closed_fg_cost'
      Precision = 19
    end
    object ADO451closed_stock_matl_in_wip_cost1: TBCDField
      FieldName = 'closed_stock_matl_in_wip_cost1'
      Precision = 19
    end
    object ADO451SFG_GL_DATE: TDateTimeField
      FieldName = 'SFG_GL_DATE'
    end
    object ADO451wo_ptr: TIntegerField
      FieldName = 'wo_ptr'
    end
    object ADO451returned_matl_cost: TBCDField
      FieldName = 'returned_matl_cost'
      Precision = 19
    end
  end
  object aqdupdate: TADOStoredProc
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    LockType = ltPessimistic
    CommandTimeout = 180
    Parameters = <>
    Left = 189
    Top = 98
  end
  object ADS410: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'wzpr451;10'
    CommandTimeout = 60
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
        Name = '@rkey451'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 251
      end>
    Left = 48
    Top = 168
    object ADS410WO_PTR: TIntegerField
      FieldName = 'WO_PTR'
    end
    object ADS410STEP: TIntegerField
      FieldName = 'STEP'
    end
    object ADS410QTY: TIntegerField
      FieldName = 'QTY'
    end
    object ADS410bring_matl_pcs: TFloatField
      FieldName = 'bring_matl_pcs'
    end
    object ADS410bring_ovhd_pcs: TFloatField
      FieldName = 'bring_ovhd_pcs'
    end
  end
  object ADS489: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'wzpr451;11'
    CommandTimeout = 120
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
        Name = '@rkey451'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 251
      end>
    Left = 128
    Top = 168
    object ADS489WO_PTR: TIntegerField
      FieldName = 'WO_PTR'
    end
    object ADS489STEP: TIntegerField
      FieldName = 'STEP'
    end
    object ADS489QTY: TIntegerField
      FieldName = 'QTY'
    end
    object ADS489bring_matl_pcs: TFloatField
      FieldName = 'bring_matl_pcs'
    end
    object ADS489bring_ovhd_pcs: TFloatField
      FieldName = 'bring_ovhd_pcs'
    end
  end
  object ADSSUM410: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'wzpr451;12'
    CommandTimeout = 60
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
        Name = '@rkey06'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end
      item
        Name = '@step'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end>
    Left = 184
    Top = 168
    object ADSSUM410matl: TFloatField
      FieldName = 'matl'
    end
    object ADSSUM410ovhd: TFloatField
      FieldName = 'ovhd'
    end
  end
  object ADOD424: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select data0034.dept_code,data0034.dept_name,data0424.*,data0015' +
      '.abbr_name'#13#10'from data0424 inner join data0034'#13#10' on data0424.dept' +
      '_ptr=data0034.rkey inner join data0015 on data0424.warehouse_ptr' +
      '=data0015.rkey'#13#10'where'#13#10'  data0424.d0451_ptr=:vptr'#13#10'ORDER by data' +
      '0034.dept_code'
    Parameters = <
      item
        Name = 'vptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 280
    Top = 104
    object ADOD424dept_code: TStringField
      DisplayLabel = #36164#28304#32534#21495
      FieldName = 'dept_code'
      Size = 10
    end
    object ADOD424dept_name: TStringField
      DisplayLabel = #36164#28304#21517#31216
      FieldName = 'dept_name'
      Size = 30
    end
    object ADOD424RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOD424D0451_PTR: TIntegerField
      FieldName = 'D0451_PTR'
    end
    object ADOD424DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADOD424OVHD_1: TBCDField
      FieldName = 'OVHD_1'
      Precision = 18
      Size = 2
    end
    object ADOD424OVHD_2: TBCDField
      FieldName = 'OVHD_2'
      Precision = 18
      Size = 2
    end
    object ADOD424OVHD_3: TBCDField
      FieldName = 'OVHD_3'
      Precision = 18
      Size = 2
    end
    object ADOD424yield_sqft: TBCDField
      DisplayLabel = #20135#20986#38754#31215
      FieldName = 'yield_sqft'
      Precision = 19
    end
    object ADOD424yield_amount: TBCDField
      FieldName = 'yield_amount'
      Precision = 19
    end
    object ADOD424STD_OVHD_1: TBCDField
      FieldName = 'STD_OVHD_1'
      Precision = 18
      Size = 2
    end
    object ADOD424STD_OVHD_2: TBCDField
      FieldName = 'STD_OVHD_2'
      Precision = 18
      Size = 2
    end
    object ADOD424STD_OVHD_3: TBCDField
      FieldName = 'STD_OVHD_3'
      Precision = 18
      Size = 2
    end
    object ADOD424STD_MTAL_1: TBCDField
      FieldName = 'STD_MTAL_1'
      Precision = 12
      Size = 2
    end
    object ADOD424STD_MTAL_2: TBCDField
      FieldName = 'STD_MTAL_2'
      Precision = 12
      Size = 2
    end
    object ADOD424OVHD_MTAL_1: TBCDField
      FieldName = 'OVHD_MTAL_1'
      Precision = 12
      Size = 2
    end
    object ADOD424abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 48
    Top = 240
  end
end
