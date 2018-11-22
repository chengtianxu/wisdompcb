object dm: Tdm
  OldCreateOrder = False
  Left = 436
  Top = 148
  Height = 392
  Width = 567
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 16
  end
  object ADO37: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <
      item
        Name = 'part_name'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0037  where part_name=:part_name')
    Left = 120
    Top = 16
    object ADO37part_name: TStringField
      FieldName = 'part_name'
      Size = 10
    end
    object ADO37if_select: TBooleanField
      FieldName = 'if_select'
    end
    object ADO37OPT_LOT_SIZE: TIntegerField
      FieldName = 'OPT_LOT_SIZE'
    end
    object ADO37LAYERS: TIntegerField
      FieldName = 'LAYERS'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO037
    Left = 232
    Top = 16
  end
  object ADO42: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'part_name'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0042  where part_name=:part_name')
    Left = 112
    Top = 96
    object ADO42part_name: TStringField
      FieldName = 'part_name'
      Size = 10
    end
    object ADO42STEP_NUMBER: TSmallintField
      FieldName = 'STEP_NUMBER'
    end
    object ADO42DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADO42DEF_ROUT_INST: TStringField
      FieldName = 'DEF_ROUT_INST'
      Size = 400
    end
  end
  object DataSource2: TDataSource
    DataSet = ADS42
    Left = 232
    Top = 96
  end
  object ADO037: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select * from data0037')
    Left = 112
    Top = 160
    object ADO037part_name: TStringField
      FieldName = 'part_name'
      Size = 10
    end
    object ADO037if_select: TBooleanField
      FieldName = 'if_select'
    end
    object ADO037OPT_LOT_SIZE: TIntegerField
      FieldName = 'OPT_LOT_SIZE'
    end
    object ADO037LAYERS: TIntegerField
      FieldName = 'LAYERS'
    end
  end
  object ADS42: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    CommandText = 
      'select part_name, STEP_NUMBER, DEPT_PTR, DEF_ROUT_INST from DATA' +
      '0042 where part_name=:part_name order by step_number'
    IndexFieldNames = 'step_number'
    Parameters = <
      item
        Name = 'part_name'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    Left = 232
    Top = 176
    object ADS42STEP_NUMBER: TSmallintField
      FieldName = 'STEP_NUMBER'
    end
    object ADS42part_name: TStringField
      FieldName = 'part_name'
      Size = 10
    end
    object ADS42DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADS42DEF_ROUT_INST: TStringField
      FieldName = 'DEF_ROUT_INST'
      Size = 400
    end
    object ADS42DEPT_CODE: TStringField
      FieldKind = fkLookup
      FieldName = 'DEPT_CODE'
      LookupDataSet = ADO34
      LookupKeyFields = 'RKEY'
      LookupResultField = 'DEPT_CODE'
      KeyFields = 'DEPT_PTR'
      Size = 10
      Lookup = True
    end
    object ADS42DEPT_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'DEPT_NAME'
      LookupDataSet = ADO34
      LookupKeyFields = 'RKEY'
      LookupResultField = 'DEPT_NAME'
      KeyFields = 'DEPT_PTR'
      Size = 30
      Lookup = True
    end
    object ADS42BARCODE_ENTRY_FLAG: TStringField
      FieldKind = fkLookup
      FieldName = 'BARCODE_ENTRY_FLAG'
      LookupDataSet = ADO34
      LookupKeyFields = 'RKEY'
      LookupResultField = 'BARCODE_ENTRY_FLAG'
      KeyFields = 'DEPT_PTR'
      Size = 1
      Lookup = True
    end
  end
  object ADO34: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0034')
    Left = 112
    Top = 224
    object ADO34RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO34DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADO34TTYPE: TStringField
      FieldName = 'TTYPE'
      Size = 1
    end
    object ADO34OUT_SOURCE: TWordField
      FieldName = 'OUT_SOURCE'
    end
    object ADO34DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADO34ACTIVE_FLAG: TWordField
      FieldName = 'ACTIVE_FLAG'
    end
    object ADO34SUPERVISOR_PTR: TIntegerField
      FieldName = 'SUPERVISOR_PTR'
    end
    object ADO34PCS_AS_UNIT: TWordField
      FieldName = 'PCS_AS_UNIT'
    end
    object ADO34UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object ADO34BIG_DEPT_PTR: TIntegerField
      FieldName = 'BIG_DEPT_PTR'
    end
    object ADO34DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADO34GROUP_PTR: TIntegerField
      FieldName = 'GROUP_PTR'
    end
    object ADO34IS_COST_DEPT: TWordField
      FieldName = 'IS_COST_DEPT'
    end
    object ADO34COST_DEPT_PTR: TIntegerField
      FieldName = 'COST_DEPT_PTR'
    end
    object ADO34DEF_ROUT_INST: TStringField
      FieldName = 'DEF_ROUT_INST'
      Size = 200
    end
    object ADO34SCHEDULE_FLAG: TStringField
      FieldName = 'SCHEDULE_FLAG'
      Size = 1
    end
    object ADO34SEQ_NO: TIntegerField
      FieldName = 'SEQ_NO'
    end
    object ADO34BARCODE_ENTRY_FLAG: TStringField
      FieldName = 'BARCODE_ENTRY_FLAG'
      Size = 1
    end
    object ADO34ALLOW_SPLIT_LOTS: TStringField
      FieldName = 'ALLOW_SPLIT_LOTS'
      Size = 1
    end
    object ADO34PRINTING_RESOURCE: TStringField
      FieldName = 'PRINTING_RESOURCE'
      Size = 10
    end
    object ADO34SETUP_TIME_PER_LOT: TStringField
      FieldName = 'SETUP_TIME_PER_LOT'
      Size = 200
    end
    object ADO34QUEUE_TIME: TStringField
      FieldName = 'QUEUE_TIME'
      Size = 200
    end
    object ADO34PROCESS_TIME: TStringField
      FieldName = 'PROCESS_TIME'
      Size = 200
    end
    object ADO34PROCESS_TIME_B: TStringField
      FieldName = 'PROCESS_TIME_B'
      Size = 200
    end
    object ADO34IS_CYCLE: TWordField
      FieldName = 'IS_CYCLE'
    end
    object ADO34CYCLE_TIME: TStringField
      FieldName = 'CYCLE_TIME'
      Size = 200
    end
    object ADO34OVERHEAD_FORMULA: TStringField
      FieldName = 'OVERHEAD_FORMULA'
      Size = 200
    end
    object ADO34OVERHEAD2_FORMULA: TStringField
      FieldName = 'OVERHEAD2_FORMULA'
      Size = 200
    end
    object ADO34OVERHEAD3_FORMULA: TStringField
      FieldName = 'OVERHEAD3_FORMULA'
      Size = 200
    end
    object ADO34Inst_Flag: TStringField
      FieldName = 'Inst_Flag'
      Size = 1
    end
    object ADO34EQUIPMENT_PTR: TIntegerField
      FieldName = 'EQUIPMENT_PTR'
    end
    object ADO34QTY_EQP_LIMIT: TIntegerField
      FieldName = 'QTY_EQP_LIMIT'
    end
    object ADO34SETUP_SYS: TBCDField
      FieldName = 'SETUP_SYS'
      Precision = 6
    end
    object ADO34QUEUE_SYS: TBCDField
      FieldName = 'QUEUE_SYS'
      Precision = 6
    end
    object ADO34PROCESS_SYS: TBCDField
      FieldName = 'PROCESS_SYS'
      Precision = 6
    end
    object ADO34PROCESS_SYS_B: TBCDField
      FieldName = 'PROCESS_SYS_B'
      Precision = 6
    end
    object ADO34CYCLE_TIME_SYS: TBCDField
      FieldName = 'CYCLE_TIME_SYS'
      Precision = 6
    end
    object ADO34SEQ_NR: TIntegerField
      FieldName = 'SEQ_NR'
    end
    object ADO34PPC_TIME: TDateTimeField
      FieldName = 'PPC_TIME'
    end
    object ADO34PPC_BOM: TIntegerField
      FieldName = 'PPC_BOM'
    end
    object ADO34PPC_CYCLE_TIME: TIntegerField
      FieldName = 'PPC_CYCLE_TIME'
    end
    object ADO34PPC_CYCLE_LOT: TFloatField
      FieldName = 'PPC_CYCLE_LOT'
    end
    object ADO34PPC_LAST_LOT: TIntegerField
      FieldName = 'PPC_LAST_LOT'
    end
    object ADO34PPC_STATUS: TWordField
      FieldName = 'PPC_STATUS'
    end
    object ADO34PR_ID: TStringField
      FieldName = 'PR_ID'
      FixedChar = True
      Size = 2
    end
    object ADO34SPEC_FLAG: TWordField
      FieldName = 'SPEC_FLAG'
    end
    object ADO34PERMIT_SPLIT_LOT: TWordField
      FieldName = 'PERMIT_SPLIT_LOT'
    end
    object ADO34VISIBLE_IN_MI: TWordField
      FieldName = 'VISIBLE_IN_MI'
    end
    object ADO34WO_DAYS: TIntegerField
      FieldName = 'WO_DAYS'
    end
    object ADO34matl_cost_per_sq: TFloatField
      FieldName = 'matl_cost_per_sq'
    end
    object ADO34GL_ACCT_PTR: TIntegerField
      FieldName = 'GL_ACCT_PTR'
    end
    object ADO34output_flag: TWordField
      FieldName = 'output_flag'
    end
    object ADO34matcost_flag: TWordField
      FieldName = 'matcost_flag'
    end
    object ADO34cost_name: TStringField
      FieldName = 'cost_name'
      FixedChar = True
      Size = 15
    end
    object ADO34wage_flag: TBooleanField
      FieldName = 'wage_flag'
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 336
    Top = 40
  end
end
