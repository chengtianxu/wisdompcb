object DM: TDM
  OldCreateOrder = False
  Left = 617
  Top = 330
  Height = 333
  Width = 287
  object ADOConnection1: TADOConnection
    ConnectionTimeout = 25
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 5
  end
  object AQDS451: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT (SELECT COUNT(*)'#13#10'          FROM data0451 a'#13#10'          WH' +
      'ERE a.rkey <= data0451.rkey) AS no, '#13#10'dbo.Data0005.EMPLOYEE_NAME' +
      ','#13#10'dbo.Data0451.*'#13#10'FROM dbo.Data0005 INNER JOIN'#13#10'      dbo.Data0' +
      '451 ON dbo.Data0005.RKEY = dbo.Data0451.CLOSED_BY '#13#10'WHERE (dbo.D' +
      'ata0451.RKEY IS NOT NULL)'#13#10'and year(Data0451.CLOSED_DATE)=:v_yea' +
      'r'
    Parameters = <
      item
        Name = 'v_year'
        Size = -1
        Value = Null
      end>
    Left = 32
    Top = 61
    object AQDS451no: TIntegerField
      FieldName = 'no'
      ReadOnly = True
    end
    object AQDS451EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object AQDS451RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQDS451FM_DATE: TDateTimeField
      FieldName = 'FM_DATE'
    end
    object AQDS451END_DATE: TDateTimeField
      FieldName = 'END_DATE'
    end
    object AQDS451ACTUAL_FM_DATE: TDateTimeField
      FieldName = 'ACTUAL_FM_DATE'
    end
    object AQDS451ACTUAL_END_DATE: TDateTimeField
      FieldName = 'ACTUAL_END_DATE'
    end
    object AQDS451MATL_CST_IN_STOCK_OPEN: TBCDField
      FieldName = 'MATL_CST_IN_STOCK_OPEN'
      Precision = 18
      Size = 2
    end
    object AQDS451MATL_CST_IN_STOCK_CLOSED: TBCDField
      FieldName = 'MATL_CST_IN_STOCK_CLOSED'
      Precision = 18
      Size = 2
    end
    object AQDS451DMATL_CST_OUT: TBCDField
      FieldName = 'DMATL_CST_OUT'
      Precision = 18
      Size = 2
    end
    object AQDS451DMATL_CST_IN_DEPT_OPEN: TBCDField
      FieldName = 'DMATL_CST_IN_DEPT_OPEN'
      Precision = 18
      Size = 2
    end
    object AQDS451DMATL_CST_IN_DEPT_CLOSED: TBCDField
      FieldName = 'DMATL_CST_IN_DEPT_CLOSED'
      Precision = 18
      Size = 2
    end
    object AQDS451IDMATL_CST_OUT: TBCDField
      FieldName = 'IDMATL_CST_OUT'
      Precision = 18
      Size = 2
    end
    object AQDS451IDMATL_CST_IN_DEPT_OPEN: TBCDField
      FieldName = 'IDMATL_CST_IN_DEPT_OPEN'
      Precision = 18
      Size = 2
    end
    object AQDS451IDMATL_CST_IN_DEPT_CLOSED: TBCDField
      FieldName = 'IDMATL_CST_IN_DEPT_CLOSED'
      Precision = 18
      Size = 2
    end
    object AQDS451MATL_CST_IN_WIP_OPEN: TBCDField
      FieldName = 'MATL_CST_IN_WIP_OPEN'
      Precision = 18
      Size = 2
    end
    object AQDS451MATL_CST_IN_WIP_CLOSED: TBCDField
      FieldName = 'MATL_CST_IN_WIP_CLOSED'
      Precision = 18
      Size = 2
    end
    object AQDS451MATL_CST_IN_SFG_OPEN: TBCDField
      FieldName = 'MATL_CST_IN_SFG_OPEN'
      Precision = 18
      Size = 2
    end
    object AQDS451MATL_CST_IN_SFG_CLOSED: TBCDField
      FieldName = 'MATL_CST_IN_SFG_CLOSED'
      Precision = 18
      Size = 2
    end
    object AQDS451MATL_CST_IN_FG_OPEN: TBCDField
      FieldName = 'MATL_CST_IN_FG_OPEN'
      Precision = 18
      Size = 2
    end
    object AQDS451MATL_CST_IN_FG_CLOSED: TBCDField
      FieldName = 'MATL_CST_IN_FG_CLOSED'
      Precision = 18
      Size = 2
    end
    object AQDS451TOTAL_MATL_CST: TBCDField
      FieldName = 'TOTAL_MATL_CST'
      Precision = 18
      Size = 2
    end
    object AQDS451OVHD_CST_IN_WIP_OPEN: TBCDField
      FieldName = 'OVHD_CST_IN_WIP_OPEN'
      Precision = 18
      Size = 2
    end
    object AQDS451OVHD_CST_IN_WIP_CLOSED: TBCDField
      FieldName = 'OVHD_CST_IN_WIP_CLOSED'
      Precision = 18
      Size = 2
    end
    object AQDS451OVHD_CST_IN_WIP_OCCURED: TBCDField
      FieldName = 'OVHD_CST_IN_WIP_OCCURED'
      Precision = 18
      Size = 2
    end
    object AQDS451OVHD_CST_IN_SFG_OPEN: TBCDField
      FieldName = 'OVHD_CST_IN_SFG_OPEN'
      Precision = 18
      Size = 2
    end
    object AQDS451OVHD_CST_IN_SFG_CLOSED: TBCDField
      FieldName = 'OVHD_CST_IN_SFG_CLOSED'
      Precision = 18
      Size = 2
    end
    object AQDS451OVHD_CST_IN_FG_OPEN: TBCDField
      FieldName = 'OVHD_CST_IN_FG_OPEN'
      Precision = 18
      Size = 2
    end
    object AQDS451OVHD_CST_IN_FG_CLOSED: TBCDField
      FieldName = 'OVHD_CST_IN_FG_CLOSED'
      Precision = 18
      Size = 2
    end
    object AQDS451TOTAL_OVHD_CST: TBCDField
      FieldName = 'TOTAL_OVHD_CST'
      Precision = 18
      Size = 2
    end
    object AQDS451YIELD_IN_SQFT: TFloatField
      FieldName = 'YIELD_IN_SQFT'
    end
    object AQDS451YIELD_IN_AMOUNT: TBCDField
      FieldName = 'YIELD_IN_AMOUNT'
      Precision = 18
      Size = 2
    end
    object AQDS451CLOSED_BY: TIntegerField
      FieldName = 'CLOSED_BY'
    end
    object AQDS451CLOSED_DATE: TDateTimeField
      FieldName = 'CLOSED_DATE'
    end
    object AQDS451SELECTED: TSmallintField
      FieldName = 'SELECTED'
    end
    object AQDS451YLD_IN_AMT_REJUST: TFloatField
      FieldName = 'YLD_IN_AMT_REJUST'
    end
    object AQDS451YLD_IN_SQFT_REJUST: TFloatField
      FieldName = 'YLD_IN_SQFT_REJUST'
    end
    object AQDS451MATL_GL_DATE: TDateTimeField
      FieldName = 'MATL_GL_DATE'
    end
    object AQDS451MATL_GL_PTR: TIntegerField
      FieldName = 'MATL_GL_PTR'
    end
    object AQDS451MATL_GL_BY: TIntegerField
      FieldName = 'MATL_GL_BY'
    end
    object AQDS451WIP_GL_DATE: TDateTimeField
      FieldName = 'WIP_GL_DATE'
    end
    object AQDS451WIP_GL_PTR: TIntegerField
      FieldName = 'WIP_GL_PTR'
    end
    object AQDS451WIP_GL_BY: TIntegerField
      FieldName = 'WIP_GL_BY'
    end
    object AQDS451FG_GL_DATE: TDateTimeField
      FieldName = 'FG_GL_DATE'
    end
    object AQDS451FG_GL_PTR: TIntegerField
      FieldName = 'FG_GL_PTR'
    end
    object AQDS451FG_GL_BY: TIntegerField
      FieldName = 'FG_GL_BY'
    end
    object AQDS451wo_closed: TStringField
      FieldName = 'wo_closed'
      FixedChar = True
      Size = 1
    end
    object AQDS451stock_matl_cost: TBCDField
      FieldName = 'stock_matl_cost'
      Precision = 19
    end
    object AQDS451stock_matl_in_wip_cost: TBCDField
      FieldName = 'stock_matl_in_wip_cost'
      Precision = 19
    end
    object AQDS451purchased_matl_cost: TBCDField
      FieldName = 'purchased_matl_cost'
      Precision = 19
    end
    object AQDS451misc_used_matl_cost: TBCDField
      FieldName = 'misc_used_matl_cost'
      Precision = 19
    end
    object AQDS451closed_stock_matl_cost: TBCDField
      FieldName = 'closed_stock_matl_cost'
      Precision = 19
    end
    object AQDS451closed_stock_matl_in_wip_cost: TBCDField
      FieldName = 'closed_stock_matl_in_wip_cost'
      Precision = 19
    end
    object AQDS451ovhd1_cost: TBCDField
      FieldName = 'ovhd1_cost'
      Precision = 19
    end
    object AQDS451ovhd2_cost: TBCDField
      FieldName = 'ovhd2_cost'
      Precision = 19
    end
    object AQDS451ovhd3_cost: TBCDField
      FieldName = 'ovhd3_cost'
      Precision = 19
    end
    object AQDS451open_wip_cost: TBCDField
      FieldName = 'open_wip_cost'
      Precision = 19
    end
    object AQDS451closed_wip_cost: TBCDField
      FieldName = 'closed_wip_cost'
      Precision = 19
    end
    object AQDS451open_fg_cost: TBCDField
      FieldName = 'open_fg_cost'
      Precision = 19
    end
    object AQDS451closed_fg_cost: TBCDField
      FieldName = 'closed_fg_cost'
      Precision = 19
    end
    object AQDS451closed_stock_matl_in_wip_cost1: TBCDField
      FieldName = 'closed_stock_matl_in_wip_cost1'
      Precision = 19
    end
    object AQDS451SFG_GL_DATE: TDateTimeField
      FieldName = 'SFG_GL_DATE'
    end
    object AQDS451wo_ptr: TIntegerField
      FieldName = 'wo_ptr'
    end
    object AQDS451returned_matl_cost: TBCDField
      FieldName = 'returned_matl_cost'
      Precision = 19
    end
  end
  object AQDSAP451: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    OnCalcFields = AQDSAP451CalcFields
    CommandText = 'SELECT * FROM DATA0451'#13#10'WHERE rkey is null'
    Parameters = <>
    Left = 173
    Top = 64
    object AQDSAP451RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQDSAP451FM_DATE: TDateTimeField
      FieldName = 'FM_DATE'
    end
    object AQDSAP451END_DATE: TDateTimeField
      FieldName = 'END_DATE'
    end
    object AQDSAP451ACTUAL_FM_DATE: TDateTimeField
      FieldName = 'ACTUAL_FM_DATE'
    end
    object AQDSAP451ACTUAL_END_DATE: TDateTimeField
      FieldName = 'ACTUAL_END_DATE'
    end
    object AQDSAP451MATL_CST_IN_STOCK_OPEN: TBCDField
      FieldName = 'MATL_CST_IN_STOCK_OPEN'
      Precision = 18
      Size = 2
    end
    object AQDSAP451MATL_CST_IN_STOCK_CLOSED: TBCDField
      FieldName = 'MATL_CST_IN_STOCK_CLOSED'
      Precision = 18
      Size = 2
    end
    object AQDSAP451DMATL_CST_OUT: TBCDField
      FieldName = 'DMATL_CST_OUT'
      Precision = 18
      Size = 2
    end
    object AQDSAP451DMATL_CST_IN_DEPT_OPEN: TBCDField
      FieldName = 'DMATL_CST_IN_DEPT_OPEN'
      Precision = 18
      Size = 2
    end
    object AQDSAP451DMATL_CST_IN_DEPT_CLOSED: TBCDField
      FieldName = 'DMATL_CST_IN_DEPT_CLOSED'
      Precision = 18
      Size = 2
    end
    object AQDSAP451IDMATL_CST_OUT: TBCDField
      FieldName = 'IDMATL_CST_OUT'
      Precision = 18
      Size = 2
    end
    object AQDSAP451IDMATL_CST_IN_DEPT_OPEN: TBCDField
      FieldName = 'IDMATL_CST_IN_DEPT_OPEN'
      Precision = 18
      Size = 2
    end
    object AQDSAP451IDMATL_CST_IN_DEPT_CLOSED: TBCDField
      FieldName = 'IDMATL_CST_IN_DEPT_CLOSED'
      Precision = 18
      Size = 2
    end
    object AQDSAP451MATL_CST_IN_WIP_OPEN: TBCDField
      FieldName = 'MATL_CST_IN_WIP_OPEN'
      Precision = 18
      Size = 2
    end
    object AQDSAP451MATL_CST_IN_WIP_CLOSED: TBCDField
      FieldName = 'MATL_CST_IN_WIP_CLOSED'
      Precision = 18
      Size = 2
    end
    object AQDSAP451MATL_CST_IN_SFG_OPEN: TBCDField
      FieldName = 'MATL_CST_IN_SFG_OPEN'
      Precision = 18
      Size = 2
    end
    object AQDSAP451MATL_CST_IN_SFG_CLOSED: TBCDField
      FieldName = 'MATL_CST_IN_SFG_CLOSED'
      Precision = 18
      Size = 2
    end
    object AQDSAP451MATL_CST_IN_FG_OPEN: TBCDField
      FieldName = 'MATL_CST_IN_FG_OPEN'
      Precision = 18
      Size = 2
    end
    object AQDSAP451MATL_CST_IN_FG_CLOSED: TBCDField
      FieldName = 'MATL_CST_IN_FG_CLOSED'
      Precision = 18
      Size = 2
    end
    object AQDSAP451TOTAL_MATL_CST: TBCDField
      FieldName = 'TOTAL_MATL_CST'
      Precision = 18
      Size = 2
    end
    object AQDSAP451OVHD_CST_IN_WIP_OPEN: TBCDField
      FieldName = 'OVHD_CST_IN_WIP_OPEN'
      Precision = 18
      Size = 2
    end
    object AQDSAP451OVHD_CST_IN_WIP_CLOSED: TBCDField
      FieldName = 'OVHD_CST_IN_WIP_CLOSED'
      Precision = 18
      Size = 2
    end
    object AQDSAP451OVHD_CST_IN_WIP_OCCURED: TBCDField
      FieldName = 'OVHD_CST_IN_WIP_OCCURED'
      Precision = 18
      Size = 2
    end
    object AQDSAP451OVHD_CST_IN_SFG_OPEN: TBCDField
      FieldName = 'OVHD_CST_IN_SFG_OPEN'
      Precision = 18
      Size = 2
    end
    object AQDSAP451OVHD_CST_IN_SFG_CLOSED: TBCDField
      FieldName = 'OVHD_CST_IN_SFG_CLOSED'
      Precision = 18
      Size = 2
    end
    object AQDSAP451OVHD_CST_IN_FG_OPEN: TBCDField
      FieldName = 'OVHD_CST_IN_FG_OPEN'
      Precision = 18
      Size = 2
    end
    object AQDSAP451OVHD_CST_IN_FG_CLOSED: TBCDField
      FieldName = 'OVHD_CST_IN_FG_CLOSED'
      Precision = 18
      Size = 2
    end
    object AQDSAP451TOTAL_OVHD_CST: TBCDField
      FieldName = 'TOTAL_OVHD_CST'
      Precision = 18
      Size = 2
    end
    object AQDSAP451YIELD_IN_SQFT: TFloatField
      FieldName = 'YIELD_IN_SQFT'
    end
    object AQDSAP451YIELD_IN_AMOUNT: TBCDField
      FieldName = 'YIELD_IN_AMOUNT'
      Precision = 18
      Size = 2
    end
    object AQDSAP451CLOSED_BY: TIntegerField
      FieldName = 'CLOSED_BY'
    end
    object AQDSAP451CLOSED_DATE: TDateTimeField
      FieldName = 'CLOSED_DATE'
    end
    object AQDSAP451SELECTED: TSmallintField
      FieldName = 'SELECTED'
    end
    object AQDSAP451YLD_IN_AMT_REJUST: TFloatField
      FieldName = 'YLD_IN_AMT_REJUST'
    end
    object AQDSAP451YLD_IN_SQFT_REJUST: TFloatField
      FieldName = 'YLD_IN_SQFT_REJUST'
    end
    object AQDSAP451MATL_GL_DATE: TDateTimeField
      FieldName = 'MATL_GL_DATE'
    end
    object AQDSAP451MATL_GL_PTR: TIntegerField
      FieldName = 'MATL_GL_PTR'
    end
    object AQDSAP451MATL_GL_BY: TIntegerField
      FieldName = 'MATL_GL_BY'
    end
    object AQDSAP451WIP_GL_DATE: TDateTimeField
      FieldName = 'WIP_GL_DATE'
    end
    object AQDSAP451WIP_GL_PTR: TIntegerField
      FieldName = 'WIP_GL_PTR'
    end
    object AQDSAP451WIP_GL_BY: TIntegerField
      FieldName = 'WIP_GL_BY'
    end
    object AQDSAP451FG_GL_DATE: TDateTimeField
      FieldName = 'FG_GL_DATE'
    end
    object AQDSAP451FG_GL_PTR: TIntegerField
      FieldName = 'FG_GL_PTR'
    end
    object AQDSAP451FG_GL_BY: TIntegerField
      FieldName = 'FG_GL_BY'
    end
    object AQDSAP451wo_closed: TStringField
      FieldName = 'wo_closed'
      FixedChar = True
      Size = 1
    end
    object AQDSAP451stock_matl_cost: TBCDField
      FieldName = 'stock_matl_cost'
      Precision = 19
    end
    object AQDSAP451stock_matl_in_wip_cost: TBCDField
      FieldName = 'stock_matl_in_wip_cost'
      Precision = 19
    end
    object AQDSAP451purchased_matl_cost: TBCDField
      FieldName = 'purchased_matl_cost'
      Precision = 19
    end
    object AQDSAP451misc_used_matl_cost: TBCDField
      FieldName = 'misc_used_matl_cost'
      Precision = 19
    end
    object AQDSAP451closed_stock_matl_cost: TBCDField
      FieldName = 'closed_stock_matl_cost'
      Precision = 19
    end
    object AQDSAP451closed_stock_matl_in_wip_cost: TBCDField
      FieldName = 'closed_stock_matl_in_wip_cost'
      Precision = 19
    end
    object AQDSAP451ovhd1_cost: TBCDField
      FieldName = 'ovhd1_cost'
      Precision = 19
    end
    object AQDSAP451ovhd2_cost: TBCDField
      FieldName = 'ovhd2_cost'
      Precision = 19
    end
    object AQDSAP451ovhd3_cost: TBCDField
      FieldName = 'ovhd3_cost'
      Precision = 19
    end
    object AQDSAP451open_wip_cost: TBCDField
      FieldName = 'open_wip_cost'
      Precision = 19
    end
    object AQDSAP451closed_wip_cost: TBCDField
      FieldName = 'closed_wip_cost'
      Precision = 19
    end
    object AQDSAP451open_fg_cost: TBCDField
      FieldName = 'open_fg_cost'
      Precision = 19
    end
    object AQDSAP451closed_fg_cost: TBCDField
      FieldName = 'closed_fg_cost'
      Precision = 19
    end
    object AQDSAP451closed_stock_matl_in_wip_cost1: TBCDField
      FieldName = 'closed_stock_matl_in_wip_cost1'
      Precision = 19
    end
    object AQDSAP451SFG_GL_DATE: TDateTimeField
      FieldName = 'SFG_GL_DATE'
    end
    object AQDSAP451wo_ptr: TIntegerField
      FieldName = 'wo_ptr'
    end
    object AQDSAP451returned_matl_cost: TBCDField
      FieldName = 'returned_matl_cost'
      Precision = 19
    end
    object AQDSAP451SALES_COST: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'SALES_COST'
      currency = False
      Calculated = True
    end
    object AQDSAP451cost_scale: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'cost_scale'
      currency = False
      Calculated = True
    end
  end
  object DataSource1: TDataSource
    DataSet = AQDSAP451
    Left = 106
    Top = 63
  end
  object aqd453: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME, '#13#10'      d' +
      'bo.Data0453.BUDGET_COST, dbo.Data0453.ACTUAL_COST, '#13#10'      dbo.D' +
      'ata0453.YIELD_SQFT'#13#10'FROM dbo.Data0034 INNER JOIN'#13#10'      dbo.Data' +
      '0453 ON dbo.Data0034.RKEY = dbo.Data0453.COST_DEPT_PTR'#13#10'where da' +
      'ta0453.d0451_ptr=:rkey'#13#10'order by data0034.seq_nr'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 32
    Top = 184
    object aqd453DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object aqd453DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object aqd453BUDGET_COST: TBCDField
      FieldName = 'BUDGET_COST'
      Precision = 18
      Size = 2
    end
    object aqd453ACTUAL_COST: TBCDField
      FieldName = 'ACTUAL_COST'
      Precision = 18
      Size = 2
    end
    object aqd453YIELD_SQFT: TFloatField
      FieldName = 'YIELD_SQFT'
    end
  end
  object aqd424: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME, '#13#10' Data04' +
      '24.ovhd_1+Data0424.ovhd_2+Data0424.ovhd_3 as ovhd,'#13#10' Data0424.st' +
      'd_ovhd_1+Data0424.std_ovhd_2+Data0424.std_ovhd_3  as std_ovhd,'#13#10 +
      #13#10'      dbo.Data0424.YIELD_SQFT'#13#10'FROM dbo.Data0034 INNER JOIN'#13#10' ' +
      '     dbo.Data0424 ON dbo.Data0034.RKEY = dbo.Data0424.DEPT_PTR'#13#10 +
      'where data0424.d0451_ptr=:rkey'#13#10'order by data0034.seq_nr'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 147
    Top = 184
    object aqd424DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object aqd424DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object aqd424ovhd: TBCDField
      FieldName = 'ovhd'
      ReadOnly = True
      Precision = 20
      Size = 2
    end
    object aqd424std_ovhd: TBCDField
      FieldName = 'std_ovhd'
      ReadOnly = True
      Precision = 20
      Size = 2
    end
    object aqd424YIELD_SQFT: TBCDField
      FieldName = 'YIELD_SQFT'
      Precision = 19
    end
  end
  object aqd452: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0496.GROUP_NAME, dbo.Data0496.GROUP_DESC, '#13#10'     ' +
      ' dbo.Data0452.BUDGET_COST, dbo.Data0452.ACTUAL_COST'#13#10'FROM dbo.Da' +
      'ta0452 INNER JOIN'#13#10'      dbo.Data0496 ON dbo.Data0452.GROUP_PTR ' +
      '= dbo.Data0496.RKEY'#13#10'where data0452.d0451_ptr=:rkey'#13#10'order by Da' +
      'ta0496.GROUP_NAME'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 90
    Top = 184
    object aqd452GROUP_NAME: TStringField
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object aqd452GROUP_DESC: TStringField
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object aqd452BUDGET_COST: TBCDField
      FieldName = 'BUDGET_COST'
      Precision = 18
      Size = 2
    end
    object aqd452ACTUAL_COST: TBCDField
      FieldName = 'ACTUAL_COST'
      Precision = 18
      Size = 2
    end
  end
  object AD441: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0441.D0451_PTR, '#13#10'    round(Data0451.YIELD_IN_SQF' +
      'T,2) as YIELD_IN_SQFT, '#13#10'    Data0451.YIELD_IN_AMOUNT, '#13#10'    SUM' +
      '(dbo.Data0441.QTY_REJECTED) AS quantity, '#13#10'      round(SUM(dbo.D' +
      'ata0441.SQFT_REJECTED),2) AS sqft, '#13#10'      round(SUM(dbo.Data044' +
      '1.TOT_STD_MATL_COST + dbo.Data0441.TOT_STD_OVHD_COST) ,2)'#13#10'     ' +
      ' AS rej_cost, ROUND(SUM(dbo.Data0441.SQFT_REJECTED) '#13#10'      / db' +
      'o.Data0451.YIELD_IN_SQFT * 100, 2) AS sqft_bl, '#13#10'      ROUND(SUM' +
      '(dbo.Data0441.TOT_STD_MATL_COST + dbo.Data0441.TOT_STD_OVHD_COST' +
      ')'#13#10'       / dbo.Data0451.YIELD_IN_AMOUNT * 100, 2) AS amount_bl'#13 +
      #10'FROM dbo.Data0441 INNER JOIN'#13#10'      dbo.Data0451 ON dbo.Data044' +
      '1.D0451_PTR = dbo.Data0451.RKEY'#13#10'WHERE dbo.Data0441.D0451_PTR = ' +
      ':rkey'#13#10'GROUP BY dbo.Data0451.YIELD_IN_SQFT, dbo.Data0451.YIELD_I' +
      'N_AMOUNT, '#13#10'      dbo.Data0441.D0451_PTR'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 202
    Top = 184
    object AD441D0451_PTR: TIntegerField
      FieldName = 'D0451_PTR'
    end
    object AD441YIELD_IN_SQFT: TFloatField
      FieldName = 'YIELD_IN_SQFT'
      DisplayFormat = '0.00'
    end
    object AD441YIELD_IN_AMOUNT: TBCDField
      FieldName = 'YIELD_IN_AMOUNT'
      Precision = 18
      Size = 2
    end
    object AD441quantity: TIntegerField
      FieldName = 'quantity'
    end
    object AD441sqft: TFloatField
      FieldName = 'sqft'
    end
    object AD441rej_cost: TBCDField
      FieldName = 'rej_cost'
      Precision = 32
      Size = 2
    end
    object AD441sqft_bl: TFloatField
      FieldName = 'sqft_bl'
      ReadOnly = True
    end
    object AD441amount_bl: TBCDField
      FieldName = 'amount_bl'
      ReadOnly = True
      Precision = 32
      Size = 6
    end
  end
end
