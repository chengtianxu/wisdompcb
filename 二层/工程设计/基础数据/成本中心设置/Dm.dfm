object dmCon: TdmCon
  OldCreateOrder = False
  Left = 321
  Top = 301
  Height = 360
  Width = 438
  object adsMainMatrl: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterOpen = adsMainMatrlAfterOpen
    BeforeInsert = adsMainMatrlBeforeInsert
    BeforeEdit = adsMainMatrlBeforeEdit
    BeforePost = adsMainMatrlBeforePost
    AfterPost = adsMainMatrlAfterOpen
    BeforeDelete = adsMainMatrlBeforeDelete
    AfterDelete = adsMainMatrlAfterOpen
    AfterScroll = adsMainMatrlAfterScroll
    OnNewRecord = adsMainMatrlNewRecord
    CommandText = 'select * from data0498 '#13#10'where dept_ptr=:F01'#13#10'order by seq_no'
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 27
    Top = 72
    object adsMainMatrlRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object adsMainMatrlMtrl_Group_Name: TStringField
      FieldKind = fkLookup
      FieldName = 'Mtrl_Group_Name'
      LookupDataSet = aqMatrlGroup
      LookupKeyFields = 'rKey'
      LookupResultField = 'Group_Name'
      KeyFields = 'INV_GROUP_PTR'
      ReadOnly = True
      Lookup = True
    end
    object adsMainMatrlMtrl_Group_Desc: TStringField
      FieldKind = fkLookup
      FieldName = 'Mtrl_Group_Desc'
      LookupDataSet = aqMatrlGroup
      LookupKeyFields = 'rKey'
      LookupResultField = 'Group_Desc'
      KeyFields = 'INV_GROUP_PTR'
      ReadOnly = True
      Size = 30
      Lookup = True
    end
    object adsMainMatrlINV_GROUP_PTR: TIntegerField
      FieldName = 'INV_GROUP_PTR'
    end
    object adsMainMatrlDEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object adsMainMatrlBOM_NAME: TStringField
      FieldName = 'BOM_NAME'
      FixedChar = True
      Size = 10
    end
    object adsMainMatrlDOC_FLAG: TStringField
      FieldName = 'DOC_FLAG'
      FixedChar = True
      Size = 1
    end
    object adsMainMatrlFORMULA: TMemoField
      FieldName = 'FORMULA'
      BlobType = ftMemo
    end
    object adsMainMatrlSEQ_NO: TWordField
      FieldName = 'SEQ_NO'
      OnChange = adsMainMatrlSEQ_NOChange
      OnValidate = adsMainMatrlSEQ_NOValidate
    end
    object adsMainMatrlrequired: TStringField
      FieldName = 'required'
      FixedChar = True
      Size = 1
    end
  end
  object dsMainMatrl: TDataSource
    DataSet = adsMainMatrl
    Left = 99
    Top = 72
  end
  object adsMaster: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterScroll = adsMasterAfterScroll
    CommandText = 'select * from data0034 where ttype=1 and rKey=:F01'
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 27
    Top = 15
    object adsMasterRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object adsMasterDEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object adsMasterTTYPE: TStringField
      FieldName = 'TTYPE'
      Size = 1
    end
    object adsMasterOUT_SOURCE: TWordField
      FieldName = 'OUT_SOURCE'
    end
    object adsMasterDEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object adsMasterACTIVE_FLAG: TWordField
      FieldName = 'ACTIVE_FLAG'
    end
    object adsMasterSUPERVISOR_PTR: TIntegerField
      FieldName = 'SUPERVISOR_PTR'
    end
    object adsMasterPCS_AS_UNIT: TWordField
      FieldName = 'PCS_AS_UNIT'
    end
    object adsMasterUNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object adsMasterBIG_DEPT_PTR: TIntegerField
      FieldName = 'BIG_DEPT_PTR'
    end
    object adsMasterDEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object adsMasterGROUP_PTR: TIntegerField
      FieldName = 'GROUP_PTR'
    end
    object adsMasterIS_COST_DEPT: TWordField
      FieldName = 'IS_COST_DEPT'
    end
    object adsMasterCOST_DEPT_PTR: TIntegerField
      FieldName = 'COST_DEPT_PTR'
    end
    object adsMasterDEF_ROUT_INST: TStringField
      FieldName = 'DEF_ROUT_INST'
      Size = 200
    end
    object adsMasterSCHEDULE_FLAG: TStringField
      FieldName = 'SCHEDULE_FLAG'
      Size = 1
    end
    object adsMasterSEQ_NO: TIntegerField
      FieldName = 'SEQ_NO'
    end
    object adsMasterBARCODE_ENTRY_FLAG: TStringField
      FieldName = 'BARCODE_ENTRY_FLAG'
      Size = 1
    end
    object adsMasterALLOW_SPLIT_LOTS: TStringField
      FieldName = 'ALLOW_SPLIT_LOTS'
      Size = 1
    end
    object adsMasterPRINTING_RESOURCE: TStringField
      FieldName = 'PRINTING_RESOURCE'
      Size = 10
    end
    object adsMasterSETUP_TIME_PER_LOT: TStringField
      FieldName = 'SETUP_TIME_PER_LOT'
      Size = 200
    end
    object adsMasterQUEUE_TIME: TStringField
      FieldName = 'QUEUE_TIME'
      Size = 200
    end
    object adsMasterPROCESS_TIME: TStringField
      FieldName = 'PROCESS_TIME'
      Size = 200
    end
    object adsMasterPROCESS_TIME_B: TStringField
      FieldName = 'PROCESS_TIME_B'
      Size = 200
    end
    object adsMasterIS_CYCLE: TWordField
      FieldName = 'IS_CYCLE'
    end
    object adsMasterCYCLE_TIME: TStringField
      FieldName = 'CYCLE_TIME'
      Size = 200
    end
    object adsMasterOVERHEAD_FORMULA: TStringField
      FieldName = 'OVERHEAD_FORMULA'
      Size = 200
    end
    object adsMasterOVERHEAD2_FORMULA: TStringField
      FieldName = 'OVERHEAD2_FORMULA'
      Size = 200
    end
    object adsMasterOVERHEAD3_FORMULA: TStringField
      FieldName = 'OVERHEAD3_FORMULA'
      Size = 200
    end
    object adsMasterInst_Flag: TStringField
      FieldName = 'Inst_Flag'
      Size = 1
    end
    object adsMasterEQUIPMENT_PTR: TIntegerField
      FieldName = 'EQUIPMENT_PTR'
    end
    object adsMasterQTY_EQP_LIMIT: TIntegerField
      FieldName = 'QTY_EQP_LIMIT'
    end
    object adsMasterSETUP_SYS: TBCDField
      FieldName = 'SETUP_SYS'
      Precision = 6
    end
    object adsMasterQUEUE_SYS: TBCDField
      FieldName = 'QUEUE_SYS'
      Precision = 6
    end
    object adsMasterPROCESS_SYS: TBCDField
      FieldName = 'PROCESS_SYS'
      Precision = 6
    end
    object adsMasterPROCESS_SYS_B: TBCDField
      FieldName = 'PROCESS_SYS_B'
      Precision = 6
    end
    object adsMasterCYCLE_TIME_SYS: TBCDField
      FieldName = 'CYCLE_TIME_SYS'
      Precision = 6
    end
    object adsMasterSEQ_NR: TIntegerField
      FieldName = 'SEQ_NR'
    end
    object adsMasterPPC_TIME: TDateTimeField
      FieldName = 'PPC_TIME'
    end
    object adsMasterPPC_BOM: TIntegerField
      FieldName = 'PPC_BOM'
    end
    object adsMasterPPC_CYCLE_TIME: TIntegerField
      FieldName = 'PPC_CYCLE_TIME'
    end
    object adsMasterPPC_CYCLE_LOT: TFloatField
      FieldName = 'PPC_CYCLE_LOT'
    end
    object adsMasterPPC_LAST_LOT: TIntegerField
      FieldName = 'PPC_LAST_LOT'
    end
    object adsMasterPPC_STATUS: TWordField
      FieldName = 'PPC_STATUS'
    end
    object adsMasterPR_ID: TStringField
      FieldName = 'PR_ID'
      FixedChar = True
      Size = 2
    end
    object adsMasterSPEC_FLAG: TWordField
      FieldName = 'SPEC_FLAG'
    end
    object adsMasterPERMIT_SPLIT_LOT: TWordField
      FieldName = 'PERMIT_SPLIT_LOT'
    end
    object adsMasterVISIBLE_IN_MI: TWordField
      FieldName = 'VISIBLE_IN_MI'
    end
    object adsMasterWO_DAYS: TIntegerField
      FieldName = 'WO_DAYS'
    end
    object adsMastermatl_cost_per_sq: TFloatField
      FieldName = 'matl_cost_per_sq'
    end
    object adsMasterGL_ACCT_PTR: TIntegerField
      FieldName = 'GL_ACCT_PTR'
    end
    object adsMasteroutput_flag: TWordField
      FieldName = 'output_flag'
    end
    object adsMastermatcost_flag: TWordField
      FieldName = 'matcost_flag'
    end
    object adsMastercost_name: TStringField
      FieldName = 'cost_name'
      FixedChar = True
      Size = 15
    end
    object adsMasterwage_flag: TBooleanField
      FieldName = 'wage_flag'
    end
    object adsMasterWork_Para: TStringField
      FieldName = 'Work_Para'
      Size = 500
    end
    object adsMasterOVERHEAD4_FORMULA: TStringField
      FieldName = 'OVERHEAD4_FORMULA'
      Size = 200
    end
    object adsMasterOVERHEAD5_FORMULA: TStringField
      FieldName = 'OVERHEAD5_FORMULA'
      Size = 200
    end
  end
  object dsMaster: TDataSource
    DataSet = adsMaster
    OnStateChange = dsMasterStateChange
    OnDataChange = dsMasterDataChange
    Left = 83
    Top = 15
  end
  object adsIESParams: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select * from data0506 m left join '#13#10'(select rKey,Parameter_Name' +
      ',Parameter_Desc, case Data_Type when 1 then '#39#25968#23383#22411#39' when 2 then '#39#23383 +
      #31526#22411#39' end as DataType from data0278) p'#13#10'on m.PARAMETER_PTR=p.rkey ' +
      #13#10'where m.ttype=3 and m.source_ptr=:F01'#13#10'order by m.SEQ_NO'#13#10
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 155
    Top = 15
  end
  object dsIESParams: TDataSource
    DataSet = adsIESParams
    Left = 235
    Top = 15
  end
  object adsSecondaryMatrl: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeInsert = adsMainMatrlBeforeEdit
    BeforeEdit = adsSecondaryMatrlBeforeEdit
    BeforeDelete = adsMainMatrlBeforeEdit
    OnCalcFields = adsSecondaryMatrlCalcFields
    OnNewRecord = adsSecondaryMatrlNewRecord
    CommandText = 'select * from data0495 where dept_ptr=:F01'#13#10'ORDER by seq_no'
    EnableBCD = False
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 41
      end>
    Left = 199
    Top = 72
    object adsSecondaryMatrlRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object adsSecondaryMatrlDEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object adsSecondaryMatrlINVENT_PTR: TIntegerField
      FieldName = 'INVENT_PTR'
    end
    object adsSecondaryMatrlSEQ_NO: TSmallintField
      FieldName = 'SEQ_NO'
    end
    object adsSecondaryMatrlGroupName: TStringField
      FieldKind = fkCalculated
      FieldName = 'GroupName'
      Size = 30
      Calculated = True
    end
    object adsSecondaryMatrlINV_PART_NUMBER: TStringField
      FieldKind = fkCalculated
      FieldName = 'INV_PART_NUMBER'
      Size = 30
      Calculated = True
    end
    object adsSecondaryMatrlINV_PART_DESCRIPTION: TStringField
      FieldKind = fkCalculated
      FieldName = 'INV_PART_DESCRIPTION'
      Size = 40
      Calculated = True
    end
    object adsSecondaryMatrlUnitCode: TStringField
      FieldKind = fkCalculated
      FieldName = 'UnitCode'
      Calculated = True
    end
    object adsSecondaryMatrlQTY_BOM_PER_SQFT: TFloatField
      FieldName = 'QTY_BOM_PER_SQFT'
      DisplayFormat = '0.#########'
    end
  end
  object dsSecondaryMatrl: TDataSource
    DataSet = adsSecondaryMatrl
    Left = 311
    Top = 72
  end
  object aqMatrlGroup: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select rKey,Group_Name,Group_Desc from data0496')
    Left = 203
    Top = 151
  end
  object aqMatrl: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select m.rKey, m.Inv_Part_number,m.Inv_Part_Description,g.Group_' +
      'Name,g.Group_Desc,u.Unit_Code from data0017 m left join data0496' +
      ' g on m.group_ptr=g.rkey'#13#10'left join data0002 U on m.stock_unit_p' +
      'tr=u.rKey'#13#10'where m.rKey=:F01'#13#10
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 123
    Top = 151
  end
  object aqIESParamsList: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select m.*,d.parameter_name from data0499 m inner join data0278 ' +
        'd on m.parameter_ptr=d.rkey '
      'where INV_Group_PTR=:F01')
    Left = 43
    Top = 151
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'C:\Program Files\Common Files\System\Ole DB\Data Links\8.112.udl'
    Left = 315
    Top = 7
  end
  object cdsTmp: TADODataSet
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 275
    Top = 135
  end
  object qryTmp: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    EnableBCD = False
    Parameters = <>
    Left = 264
    Top = 200
  end
end
