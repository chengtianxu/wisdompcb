object dmcon: Tdmcon
  OldCreateOrder = False
  Left = 265
  Top = 156
  Height = 536
  Width = 649
  object adsMatrlGroupList: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    AfterScroll = adsMatrlGroupListAfterScroll
    OnCalcFields = adsMatrlGroupListCalcFields
    CommandText = 
      'SELECT D34.RKey,D34.DEPT_CODE, D34.DEPT_NAME, D498.INV_GROUP_PTR' +
      ', D498.BOM_NAME, '#13#10'      D498.FORMULA, D498.SEQ_NO, D496.GROUP_N' +
      'AME, D496.GROUP_DESC, D496.SPEC_RKEY, '#13#10'      D498.DOC_FLAG, D38' +
      '.STEP_NUMBER, D498.RKEY AS MGRkey, D38.RKEY AS EFRkey, '#13#10'      D' +
      '34.IS_COST_DEPT,D498.required'#13#10'FROM dbo.Data0038 D38 INNER JOIN'#13 +
      #10'      dbo.Data0034 D34 ON D38.DEPT_PTR = D34.RKEY INNER JOIN'#13#10' ' +
      '     dbo.Data0498 D498 ON D34.RKEY = D498.DEPT_PTR INNER JOIN'#13#10' ' +
      '     dbo.Data0496 D496 ON D498.INV_GROUP_PTR = D496.RKEY'#13#10'WHERE ' +
      '(D34.IS_COST_DEPT = 1) and D38.Source_Ptr=:F01'#13#10'order by D38.STE' +
      'P_NUMBER,D34.dept_code,D498.Seq_No'
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 32
    Top = 16
    object adsMatrlGroupListDEPT_CODE: TStringField
      DisplayWidth = 15
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object adsMatrlGroupListDEPT_NAME: TStringField
      DisplayWidth = 30
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object adsMatrlGroupListINV_GROUP_PTR: TIntegerField
      DisplayWidth = 10
      FieldName = 'INV_GROUP_PTR'
    end
    object adsMatrlGroupListBOM_NAME: TStringField
      DisplayWidth = 10
      FieldName = 'BOM_NAME'
      FixedChar = True
      Size = 10
    end
    object adsMatrlGroupListFORMULA: TMemoField
      DisplayWidth = 10
      FieldName = 'FORMULA'
      BlobType = ftMemo
    end
    object adsMatrlGroupListSEQ_NO: TWordField
      DisplayWidth = 10
      FieldName = 'SEQ_NO'
    end
    object adsMatrlGroupListGROUP_DESC: TStringField
      DisplayWidth = 30
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object adsMatrlGroupListGROUP_NAME: TStringField
      DisplayWidth = 10
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object adsMatrlGroupListSTEP_NUMBER: TSmallintField
      DisplayWidth = 10
      FieldName = 'STEP_NUMBER'
    end
    object adsMatrlGroupListDOC_FLAG: TStringField
      DisplayWidth = 1
      FieldName = 'DOC_FLAG'
      FixedChar = True
      Size = 1
    end
    object adsMatrlGroupListMGRkey: TAutoIncField
      DisplayWidth = 10
      FieldName = 'MGRkey'
      ReadOnly = True
    end
    object adsMatrlGroupListEFRkey: TAutoIncField
      DisplayWidth = 10
      FieldName = 'EFRkey'
      ReadOnly = True
    end
    object adsMatrlGroupListIS_COST_DEPT: TWordField
      DisplayWidth = 10
      FieldName = 'IS_COST_DEPT'
    end
    object adsMatrlGroupListSPEC_RKEY: TStringField
      FieldName = 'SPEC_RKEY'
      FixedChar = True
      Size = 1
    end
    object adsMatrlGroupListRKey: TAutoIncField
      FieldName = 'RKey'
      ReadOnly = True
    end
    object adsMatrlGroupListRec: TIntegerField
      DisplayLabel = #24207#21495
      FieldKind = fkCalculated
      FieldName = 'Rec'
      Calculated = True
    end
    object adsMatrlGroupListrequired: TStringField
      FieldName = 'required'
      FixedChar = True
      Size = 1
    end
  end
  object dsMatrlGroupList: TDataSource
    DataSet = adsMatrlGroupList
    Left = 136
    Top = 16
  end
  object adsBOMParams: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterScroll = adsBOMParamsAfterScroll
    OnNewRecord = adsBOMParamsNewRecord
    CommandText = 
      'select  * from data0497 '#13#10'where Route_Step_ptr in (select rkey f' +
      'rom data0038 where source_ptr=:F01)'#13#10
    Parameters = <
      item
        Name = 'F01'
        DataType = ftInteger
        Size = -1
        Value = 0
      end>
    Left = 32
    Top = 72
    object adsBOMParamsRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object adsBOMParamsPARAMETER_PTR: TIntegerField
      FieldName = 'PARAMETER_PTR'
    end
    object adsBOMParamsPARAMETER_VALUE: TStringField
      FieldName = 'PARAMETER_VALUE'
      OnValidate = adsBOMParamsPARAMETER_VALUEValidate
      Size = 30
    end
    object adsBOMParamsSOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object adsBOMParamsFLOW_NO: TSmallintField
      FieldName = 'FLOW_NO'
    end
    object adsBOMParamsROUTE_STEP_PTR: TIntegerField
      FieldName = 'ROUTE_STEP_PTR'
    end
    object adsBOMParamsSEQ_NO: TIntegerField
      FieldName = 'SEQ_NO'
    end
    object adsBOMParamsParam_Name: TStringField
      FieldKind = fkLookup
      FieldName = 'Parameter_name'
      LookupDataSet = adsParamsInfo
      LookupKeyFields = 'rKey'
      LookupResultField = 'Parameter_name'
      KeyFields = 'PARAMETER_PTR'
      Lookup = True
    end
    object adsBOMParamsParam_Desc: TStringField
      FieldKind = fkLookup
      FieldName = 'Param_Desc'
      LookupDataSet = adsParamsInfo
      LookupKeyFields = 'rKey'
      LookupResultField = 'Parameter_Desc'
      KeyFields = 'PARAMETER_PTR'
      Lookup = True
    end
    object adsBOMParamsDataType: TStringField
      FieldKind = fkLookup
      FieldName = 'DataType'
      LookupDataSet = adsParamsInfo
      LookupKeyFields = 'rKey'
      LookupResultField = 'DataType'
      KeyFields = 'PARAMETER_PTR'
      Lookup = True
    end
    object adsBOMParamsUnit: TStringField
      FieldKind = fkLookup
      FieldName = 'Unit'
      LookupDataSet = adsParamsInfo
      LookupKeyFields = 'rKey'
      LookupResultField = 'unit_Code'
      KeyFields = 'PARAMETER_PTR'
      Lookup = True
    end
    object adsBOMParamsSpec_rKey: TStringField
      FieldKind = fkLookup
      FieldName = 'Spec_rKey'
      LookupDataSet = adsParamsInfo
      LookupKeyFields = 'rKey'
      LookupResultField = 'Spec_Rkey'
      KeyFields = 'PARAMETER_PTR'
      Lookup = True
    end
    object adsBOMParamsData_Type: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Data_Type'
      LookupDataSet = adsParamsInfo
      LookupKeyFields = 'rKey'
      LookupResultField = 'Data_Type'
      KeyFields = 'PARAMETER_PTR'
      Lookup = True
    end
  end
  object dsBOMParams: TDataSource
    DataSet = adsBOMParams
    Left = 120
    Top = 70
  end
  object aqGroupParam: TADOQuery
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
      'select * from data0499 M inner join'
      '('
      'SELECT distinct D496.Rkey,D38.STEP_NUMBER'
      'FROM dbo.Data0038 D38 INNER JOIN'
      '      dbo.Data0034 D34 ON D38.DEPT_PTR = D34.RKEY INNER JOIN'
      '      dbo.Data0498 D498 ON D34.RKEY = D498.DEPT_PTR INNER JOIN'
      '      dbo.Data0496 D496 ON D498.INV_GROUP_PTR = D496.RKEY'
      'WHERE (D34.IS_COST_DEPT = 1) and D38.Source_Ptr=:F01'
      ') D on D.rkey=M.Inv_Group_ptr')
    Left = 32
    Top = 128
  end
  object aqIESParams: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      
        'select D494.*,D278.Parameter_Name,D278.Data_Type from data0494 D' +
        '494 inner join Data0278 D278 on D494.Parameter_ptr=D278.rKey'
      'where custpart_ptr=:F01')
    Left = 104
    Top = 128
  end
  object aqDrillersValue: TADOQuery
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
      'select * from data0029 where Source_ptr=:F01')
    Left = 168
    Top = 128
  end
  object aqMaterials: TADOQuery
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
      'select rkey,inv_part_number from data0017 where group_ptr=:F01')
    Left = 216
    Top = 152
  end
  object aqEngTable: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        ' select *, FXY=IsNull(Eng_table_name,'#39#39')+'#39'( '#39'+ rtrim(IsNull((sel' +
        'ect Parameter_name from data0278 where rkey=M.FX),'#39#39'))+'#39' , '#39'+ rt' +
        'rim(IsNull((select Parameter_name from data0278 where rkey=M.FY)' +
        ','#39'1'#39'))+'#39' )'#39' from data0280 M order by Eng_table_name ')
    Left = 280
    Top = 128
  end
  object aqPubParams: TADOQuery
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
      
        'select D279.*,D278.Parameter_Name ,D278.Data_Type from data0279 ' +
        'D279 '
      'inner join data0278 D278 on D279.Parameter_ptr=D278.rKey'
      'where  d279.ies_prod=1 and  D279.source_ptr=:F01')
    Left = 336
    Top = 80
  end
  object aqParamValueList: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * from data0338 '
      'order by Sequence_No')
    Left = 392
    Top = 128
  end
  object adsParamsInfo: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select  M.rKey,M.Parameter_name,M.Parameter_Desc, M.Spec_Rkey,ca' +
      'se M.Data_Type when 1 then '#39#25968#23383#22411#39' when 2 then '#39#23383#31526#22411#39' end as DataTy' +
      'pe,M.Data_Type,'#13#10'U.unit_Code from data0278 M inner join Data0002' +
      ' U on M.Unit_ptr=U.Rkey'#13#10
    Parameters = <>
    Left = 240
    Top = 8
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 520
    Top = 16
  end
  object adsBOM: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    OnCalcFields = adsBOMCalcFields
    CommandText = 'SELECT *   FROM dbo.Data0026 WHERE Manu_BOM_Ptr=:F01'
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 368
    Top = 24
    object adsBOMRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object adsBOMMANU_BOM_PTR: TIntegerField
      FieldName = 'MANU_BOM_PTR'
    end
    object adsBOMDEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object adsBOMINVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object adsBOMQTY_BOM: TFloatField
      FieldName = 'QTY_BOM'
      DisplayFormat = '##0.#00000000'
    end
    object adsBOMFLOW_NO: TSmallintField
      FieldName = 'FLOW_NO'
    end
    object adsBOMROUTE_STEP_NO: TSmallintField
      FieldName = 'ROUTE_STEP_NO'
    end
    object adsBOMDOC_FLAG: TStringField
      FieldName = 'DOC_FLAG'
      FixedChar = True
      Size = 1
    end
    object adsBOMDeptName: TStringField
      FieldKind = fkCalculated
      FieldName = 'DeptName'
      Size = 30
      Calculated = True
    end
    object adsBOMPartNo: TStringField
      DisplayWidth = 200
      FieldKind = fkCalculated
      FieldName = 'PartNo'
      Size = 200
      Calculated = True
    end
    object adsBOMPartName: TStringField
      FieldKind = fkCalculated
      FieldName = 'PartName'
      Size = 40
      Calculated = True
    end
    object adsBOMUnitCode: TStringField
      FieldKind = fkCalculated
      FieldName = 'UnitCode'
      Size = 30
      Calculated = True
    end
  end
  object adsProdLists: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT D25.RKEY, D10.CUST_CODE, D25.CUSTOMER_PTR, D25.MANU_PART_' +
      'NUMBER, D10.ABBR_NAME,D25.TSTATUS,D25.BOM_STATUS,'#13#10'      D25.MAN' +
      'U_PART_DESC, D25.LAST_MODIFIED_DATE, '#13#10'case D25.BOM_STATUS when ' +
      '0 then '#39'MI'#24453#21518#34917#39' '#13#10'                                         when 1' +
      ' then '#39'BOM'#24453#23457#39' '#13#10'                                         when 2 ' +
      'then '#39'BOM'#24453#21046#39' '#13#10'                                         when 4 t' +
      'hen '#39'BOM'#24050#23457#39'                                        '#13#10'end as BOM_' +
      'Status_CN, '#13#10'D25.BOM_APPR_DATE, D25.BOM_APPR_BY, case D25.TSTATU' +
      'S when 0 then '#39#24453#21046#20316#39' when 1 then '#39#24050#23457#26680#39' when 2 then '#39#23457#36864#22238#39#13#10'when 3 ' +
      'then '#39#24453#26816#26597#39' when 4 then '#39#24453#23457#26680#39' when 5 then '#39#26816#36864#22238#39' when 6 then '#39#26410#25552#20132#39 +
      ' end as MI_Status, D25.AUDITED_BY_PTR, '#13#10'      D25.AUDITED_DATE,' +
      ' D25.COST_APPR_BY, '#13#10'      dbo.Data0005.EMPLOYEE_NAME,d15.WAREHO' +
      'USE_CODE, d15.ABBR_NAME as  ABBR_NAME1,d5_0.EMPLOYEE_NAME candid' +
      'ate,D25.candidate_DATE,D25.LAST_SO_DATE'#13#10'FROM dbo.Data0025 D25 I' +
      'NNER JOIN'#13#10'      dbo.Data0010 D10 ON D25.CUSTOMER_PTR = D10.RKEY' +
      ' left outer JOIN'#13#10'      dbo.Data0005 ON D25.BOM_APPR_BY = dbo.Da' +
      'ta0005.RKEY '#13#10'left join data0015 d15'#13#10'on D25.PROD_ROUTE_PTR=d15.' +
      'rkey left join data0005 d5_0 on'#13#10'D25.candidate_BY = d5_0.RKEY '#13#10 +
      'Where PARENT_PTR IS NULL and D25.TSTATUS=1'
    Parameters = <>
    Left = 112
    Top = 216
  end
  object DataSource1: TDataSource
    DataSet = adsProdLists
    Left = 200
    Top = 200
  end
  object ADODataSet2: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from data0038 where source_ptr=:F01'
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 296
    Top = 184
  end
  object dsBOM: TDataSource
    DataSet = adsBOM
    Left = 424
    Top = 16
  end
  object aqTmp: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 32
    Top = 184
  end
  object aqBOMCalcTmp: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT D.rKey as Mrkey,D.Inv_Part_Number,(D.inv_name + D.inv_des' +
      'cription) as INV_Name ,D.Unit_Code  FROM dbo.Data0026 M left joi' +
      'n '#13#10'('#13#10'select M.rKey,Inv_Part_Number,Inv_Part_Description,U.Unit' +
      '_Code,inv_description,inv_name from data0017 M inner join data00' +
      '02 U on M.STOCK_UNIT_PTR=U.rKey '#13#10') D on M.INVENTORY_PTR=d.rKey'#13 +
      #10#13#10'WHERE Manu_BOM_Ptr=:F01'
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 216
    Top = 72
  end
  object AQY0025: TADOQuery
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
      
        'SELECT D25 .MANU_PART_NUMBER, D25 .MANU_PART_DESC, D25 .PARENT_P' +
        'TR,D25 .QTY_BOM, D25 .BOM_STEP,'
      
        '      D25 .CREATED_BY_EMPL_PTR, D25 .ENG_ROUTE_PTR, D25 .REMARK,' +
        ' D25 .ENG_NOTE, D25 .memo_text, '
      
        '      D25 .PROD_CODE_PTR, D25 .OPT_LOT_SIZE, D25 .EST_SCRAP, D25' +
        ' .SHELF_LIFE, D25 .REVIEW_DAYS, '
      
        '      D25 .PARTS_NUM, D25 .SAMPLE_NR, D25 .QTY_ON_HAND, D25 .CUS' +
        'TOMER_PTR, D25 .MFG_LEAD_TIME, '
      
        '      D25 .LAST_SO_DATE, D25 .REPORT_UNIT_VALUE1, D25 .TSTATUS, ' +
        'D25 .CHECK_BY_PTR, D25 .CHECK_DATE, '
      
        '      D25 .AUDITED_BY_PTR, D25 .AUDITED_DATE, D25 .ALLOW_EDIT_FL' +
        'AG, D25 .ONHOLD_SALES_FLAG, '
      
        '      D25 .ONHOLD_RELEASE_FLAG, D25 .ONHOLD_PLANNING_FLAG, D25 .' +
        'CUSTPART_ENT_DATE, '
      
        '      D25 .LAST_MODIFIED_BY_PTR, D25 .LAST_MODIFIED_DATE, D25 .A' +
        'NALYSIS_CODE_2, '
      
        '      D25 .ANALYSIS_CODE_3,  D25 .LAYERS, D25 .green_flag, D25 .' +
        'set_lngth, D25 .set_width, '
      
        '      D25 .set_qty, D25 .unit_sq, D25 .ANALYSIS_CODE_1, D25 .pcs' +
        '_lngth, D25 .pcs_width, D25 .pcs_sq, '
      
        '      D25 .ANALYSIS_CODE_5, D25 .spell_lngth, D25 .spell_width, ' +
        'D25 .spell_qty, D25 .spell_sq, '
      
        '      D25 .ANALYSIS_CODE_4, D25 .SO_UNIT, D25 .ttype, D25 .RKEY,' +
        'D25 .layers_info,d25.layers_image,'
      ''
      
        '     d15.WAREHOUSE_CODE, d15.ABBR_NAME,d25.BOM_APPR_BY,d25.BOM_A' +
        'PPR_DATE,d25.BOM_STATUS,d25.MinRing'
      ''
      'FROM dbo.Data0025 D25 left join data0015 d15'
      'on D25.PROD_ROUTE_PTR=d15.rkey'
      'where D25.rkey=:rkey'
      ' ')
    Left = 88
    Top = 272
    object AQY0025RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQY0025MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object AQY0025MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object AQY0025PARENT_PTR: TIntegerField
      FieldName = 'PARENT_PTR'
    end
    object AQY0025QTY_BOM: TWordField
      FieldName = 'QTY_BOM'
    end
    object AQY0025BOM_STEP: TWordField
      FieldName = 'BOM_STEP'
    end
    object AQY0025CREATED_BY_EMPL_PTR: TIntegerField
      FieldName = 'CREATED_BY_EMPL_PTR'
    end
    object AQY0025ENG_ROUTE_PTR: TIntegerField
      FieldName = 'ENG_ROUTE_PTR'
    end
    object AQY0025REMARK: TMemoField
      FieldName = 'REMARK'
      BlobType = ftMemo
    end
    object AQY0025ENG_NOTE: TStringField
      FieldName = 'ENG_NOTE'
      Size = 200
    end
    object AQY0025memo_text: TMemoField
      FieldName = 'memo_text'
      BlobType = ftMemo
    end
    object AQY0025PROD_CODE_PTR: TIntegerField
      FieldName = 'PROD_CODE_PTR'
    end
    object AQY0025OPT_LOT_SIZE: TIntegerField
      FieldName = 'OPT_LOT_SIZE'
    end
    object AQY0025EST_SCRAP: TFloatField
      FieldName = 'EST_SCRAP'
    end
    object AQY0025SHELF_LIFE: TIntegerField
      FieldName = 'SHELF_LIFE'
    end
    object AQY0025REVIEW_DAYS: TSmallintField
      FieldName = 'REVIEW_DAYS'
    end
    object AQY0025PARTS_NUM: TIntegerField
      FieldName = 'PARTS_NUM'
    end
    object AQY0025SAMPLE_NR: TStringField
      FieldName = 'SAMPLE_NR'
      Size = 15
    end
    object AQY0025QTY_ON_HAND: TIntegerField
      FieldName = 'QTY_ON_HAND'
    end
    object AQY0025CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object AQY0025MFG_LEAD_TIME: TSmallintField
      FieldName = 'MFG_LEAD_TIME'
    end
    object AQY0025LAST_SO_DATE: TDateTimeField
      FieldName = 'LAST_SO_DATE'
    end
    object AQY0025REPORT_UNIT_VALUE1: TBCDField
      FieldName = 'REPORT_UNIT_VALUE1'
      Precision = 9
    end
    object AQY0025TSTATUS: TWordField
      FieldName = 'TSTATUS'
    end
    object AQY0025CHECK_BY_PTR: TIntegerField
      FieldName = 'CHECK_BY_PTR'
    end
    object AQY0025CHECK_DATE: TDateTimeField
      FieldName = 'CHECK_DATE'
    end
    object AQY0025AUDITED_BY_PTR: TIntegerField
      FieldName = 'AUDITED_BY_PTR'
    end
    object AQY0025AUDITED_DATE: TDateTimeField
      FieldName = 'AUDITED_DATE'
    end
    object AQY0025ALLOW_EDIT_FLAG: TStringField
      FieldName = 'ALLOW_EDIT_FLAG'
      FixedChar = True
      Size = 1
    end
    object AQY0025ONHOLD_SALES_FLAG: TWordField
      FieldName = 'ONHOLD_SALES_FLAG'
    end
    object AQY0025ONHOLD_RELEASE_FLAG: TWordField
      FieldName = 'ONHOLD_RELEASE_FLAG'
    end
    object AQY0025ONHOLD_PLANNING_FLAG: TWordField
      FieldName = 'ONHOLD_PLANNING_FLAG'
    end
    object AQY0025CUSTPART_ENT_DATE: TDateTimeField
      FieldName = 'CUSTPART_ENT_DATE'
    end
    object AQY0025LAST_MODIFIED_BY_PTR: TIntegerField
      FieldName = 'LAST_MODIFIED_BY_PTR'
    end
    object AQY0025LAST_MODIFIED_DATE: TDateTimeField
      FieldName = 'LAST_MODIFIED_DATE'
    end
    object AQY0025ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 50
    end
    object AQY0025ANALYSIS_CODE_3: TStringField
      FieldName = 'ANALYSIS_CODE_3'
      Size = 50
    end
    object AQY0025LAYERS: TWordField
      FieldName = 'LAYERS'
    end
    object AQY0025green_flag: TStringField
      FieldName = 'green_flag'
      FixedChar = True
      Size = 1
    end
    object AQY0025set_lngth: TBCDField
      FieldName = 'set_lngth'
      Precision = 6
      Size = 2
    end
    object AQY0025set_width: TBCDField
      FieldName = 'set_width'
      Precision = 6
      Size = 2
    end
    object AQY0025set_qty: TIntegerField
      FieldName = 'set_qty'
    end
    object AQY0025unit_sq: TFloatField
      FieldName = 'unit_sq'
    end
    object AQY0025ANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
      Size = 30
    end
    object AQY0025pcs_lngth: TBCDField
      FieldName = 'pcs_lngth'
      Precision = 6
      Size = 2
    end
    object AQY0025pcs_width: TBCDField
      FieldName = 'pcs_width'
      Precision = 6
      Size = 2
    end
    object AQY0025pcs_sq: TFloatField
      FieldName = 'pcs_sq'
    end
    object AQY0025ANALYSIS_CODE_5: TStringField
      FieldName = 'ANALYSIS_CODE_5'
      Size = 30
    end
    object AQY0025spell_lngth: TBCDField
      FieldName = 'spell_lngth'
      Precision = 6
      Size = 2
    end
    object AQY0025spell_width: TBCDField
      FieldName = 'spell_width'
      Precision = 6
      Size = 2
    end
    object AQY0025spell_qty: TIntegerField
      FieldName = 'spell_qty'
    end
    object AQY0025spell_sq: TFloatField
      FieldName = 'spell_sq'
    end
    object AQY0025ANALYSIS_CODE_4: TStringField
      FieldName = 'ANALYSIS_CODE_4'
      Size = 30
    end
    object AQY0025SO_UNIT: TStringField
      FieldName = 'SO_UNIT'
      Size = 6
    end
    object AQY0025ttype: TWordField
      FieldName = 'ttype'
    end
    object AQY0025layers_info: TMemoField
      FieldName = 'layers_info'
      BlobType = ftMemo
    end
    object AQY0025WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object AQY0025ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object AQY0025BOM_APPR_BY: TIntegerField
      FieldName = 'BOM_APPR_BY'
    end
    object AQY0025BOM_APPR_DATE: TDateTimeField
      FieldName = 'BOM_APPR_DATE'
    end
    object AQY0025BOM_STATUS: TWordField
      FieldName = 'BOM_STATUS'
    end
    object AQY0025layers_image: TBlobField
      FieldName = 'layers_image'
    end
    object AQY0025MinRing: TBCDField
      FieldName = 'MinRing'
      Precision = 10
    end
  end
  object DataSource2: TDataSource
    DataSet = AQY0025
    Left = 24
    Top = 272
  end
  object ads502: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select *  from Data0502'#13#10'where source_ptr=:rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    Left = 24
    Top = 360
    object ads502source_ptr: TIntegerField
      FieldName = 'source_ptr'
    end
    object ads502sheet_BMP: TBlobField
      FieldName = 'sheet_BMP'
      BlobType = ftGraphic
    end
    object ads502pnl_bmp: TBlobField
      FieldName = 'pnl_bmp'
    end
    object ads502pnl2_bmp: TBlobField
      FieldName = 'pnl2_bmp'
    end
    object ads502TOTAL_PNLS_1: TSmallintField
      FieldName = 'TOTAL_PNLS_1'
    end
    object ads502TOTAL_PNLS_2: TSmallintField
      FieldName = 'TOTAL_PNLS_2'
    end
    object ads502UNIT_LEN: TFloatField
      FieldName = 'UNIT_LEN'
    end
    object ads502UNIT_WTH: TFloatField
      FieldName = 'UNIT_WTH'
    end
    object ads502UNIT_UNIT: TWordField
      FieldName = 'UNIT_UNIT'
    end
    object ads502UNIT_NUM: TIntegerField
      FieldName = 'UNIT_NUM'
    end
    object ads502SHT_LEN: TFloatField
      FieldName = 'SHT_LEN'
    end
    object ads502SHT_WTH: TFloatField
      FieldName = 'SHT_WTH'
    end
    object ads502TUSAGE: TBCDField
      FieldName = 'TUSAGE'
      Precision = 19
    end
    object ads502PNL_LEN: TFloatField
      FieldName = 'PNL_LEN'
    end
    object ads502PNL_WTH: TFloatField
      FieldName = 'PNL_WTH'
    end
    object ads502UPANEL: TSmallintField
      FieldName = 'UPANEL'
    end
    object ads502PNL_LEN_2: TFloatField
      FieldName = 'PNL_LEN_2'
    end
    object ads502PNL_WTH_2: TFloatField
      FieldName = 'PNL_WTH_2'
    end
    object ads502UPANEL_2: TSmallintField
      FieldName = 'UPANEL_2'
    end
    object ads502minspace1: TFloatField
      FieldName = 'minspace1'
    end
    object ads502minspace2: TFloatField
      FieldName = 'minspace2'
    end
  end
  object ads279: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select source_PTR, PARAMETER_PTR, PARAMETER_VALUE'#13#10', IES_PROD,IE' +
      'S_CRP'#13#10'from data0279'#13#10'where  IES_PROD=1 and'#13#10'            source_' +
      'ptr= :rkey'#13#10'order by IES_CRP'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 216
    Top = 256
    object ads279source_PTR: TIntegerField
      FieldName = 'source_PTR'
    end
    object ads279PARAMETER_PTR: TIntegerField
      FieldName = 'PARAMETER_PTR'
    end
    object ads279PARAMETER_VALUE: TStringField
      DisplayLabel = #21442#25968#20540
      FieldName = 'PARAMETER_VALUE'
      Size = 30
    end
    object ads279IES_PROD: TSmallintField
      FieldName = 'IES_PROD'
    end
    object ads279IES_CRP: TSmallintField
      FieldName = 'IES_CRP'
    end
    object ads279PARAMETER_NAME: TStringField
      DisplayLabel = #21442#25968#20195#30721
      FieldKind = fkLookup
      FieldName = 'PARAMETER_NAME'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'PARAMETER_NAME'
      KeyFields = 'PARAMETER_PTR'
      Size = 10
      Lookup = True
    end
    object ads279PARAMETER_DESC: TStringField
      DisplayLabel = #21442#25968#21517#31216
      FieldKind = fkLookup
      FieldName = 'PARAMETER_DESC'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'PARAMETER_DESC'
      KeyFields = 'PARAMETER_PTR'
      Lookup = True
    end
    object ads279SPEC_RKEY: TStringField
      FieldKind = fkLookup
      FieldName = 'SPEC_RKEY'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'SPEC_RKEY'
      KeyFields = 'PARAMETER_PTR'
      Size = 2
      Lookup = True
    end
    object ads279UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldKind = fkLookup
      FieldName = 'UNIT_NAME'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'UNIT_NAME'
      KeyFields = 'PARAMETER_PTR'
      Lookup = True
    end
    object ads279datatype: TStringField
      DisplayLabel = #31867#22411
      FieldKind = fkLookup
      FieldName = 'datatype'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'datatype'
      KeyFields = 'PARAMETER_PTR'
      Size = 4
      Lookup = True
    end
    object ads279status3: TWordField
      FieldKind = fkLookup
      FieldName = 'status3'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'STATUS3'
      KeyFields = 'PARAMETER_PTR'
      Lookup = True
    end
  end
  object DataSource3: TDataSource
    DataSet = ads279
    Left = 152
    Top = 272
  end
  object ads278: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select'#13#10' data0278.rkey,'#13#10' data0278.PARAMETER_NAME, '#13#10' data0278.P' +
      'ARAMETER_DESC,'#13#10' Data0278.SPEC_RKEY,'#13#10' data0002.UNIT_NAME,'#13#10'case' +
      ' data0278.DATA_TYPE'#13#10'when 1 then '#39#25968#23383#39' WHEN 2 THEN '#39#23383#31526#39#13#10'end as d' +
      'atatype,'#13#10'data0278.STATUS3'#13#10'from data0278 inner join data0002'#13#10'o' +
      'n Data0278.UNIT_PTR = Data0002.RKEY'#13#10'where CATEGORY_PTR<>1'
    Parameters = <>
    Left = 272
    Top = 264
    object ads278rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ads278PARAMETER_NAME: TStringField
      FieldName = 'PARAMETER_NAME'
      FixedChar = True
      Size = 10
    end
    object ads278PARAMETER_DESC: TStringField
      FieldName = 'PARAMETER_DESC'
      FixedChar = True
    end
    object ads278SPEC_RKEY: TStringField
      FieldName = 'SPEC_RKEY'
      FixedChar = True
      Size = 2
    end
    object ads278UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ads278datatype: TStringField
      FieldName = 'datatype'
      ReadOnly = True
      Size = 4
    end
    object ads278STATUS3: TWordField
      FieldName = 'STATUS3'
    end
  end
  object ADS38: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT SOURCE_PTR, DEPT_PTR, DEF_ROUT_INST, STEP_NUMBER, tooling' +
      '_rev, '#13#10'      OUTP_SPFC,tool_old_rev'#13#10'FROM Data0038'#13#10'where sourc' +
      'e_ptr=:rkey'
    IndexFieldNames = 'step_number'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 384
    Top = 240
    object ADS38SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object ADS38DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADS38DEF_ROUT_INST: TStringField
      FieldName = 'DEF_ROUT_INST'
      Size = 200
    end
    object ADS38STEP_NUMBER: TSmallintField
      DisplayLabel = #24207#21495
      FieldName = 'STEP_NUMBER'
    end
    object ADS38tooling_rev: TStringField
      DisplayLabel = #24037#20855#29256#26412
      FieldName = 'tooling_rev'
      FixedChar = True
      Size = 10
    end
    object ADS38OUTP_SPFC: TBCDField
      DisplayLabel = #20135#20986#31995#25968
      FieldName = 'OUTP_SPFC'
      Precision = 19
    end
    object ADS38tool_old_rev: TStringField
      FieldName = 'tool_old_rev'
      Size = 10
    end
    object ADS38DEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721
      FieldKind = fkLookup
      FieldName = 'DEPT_CODE'
      LookupDataSet = ads34
      LookupKeyFields = 'RKEY'
      LookupResultField = 'DEPT_CODE'
      KeyFields = 'DEPT_PTR'
      Size = 10
      Lookup = True
    end
    object ADS38DEPT_NAME: TStringField
      DisplayLabel = #24037#24207#21517#31216
      FieldKind = fkLookup
      FieldName = 'DEPT_NAME'
      LookupDataSet = ads34
      LookupKeyFields = 'RKEY'
      LookupResultField = 'DEPT_NAME'
      KeyFields = 'DEPT_PTR'
      Size = 30
      Lookup = True
    end
    object ADS38BARCODE_ENTRY_FLAG: TStringField
      DisplayLabel = #36807#25968
      FieldKind = fkLookup
      FieldName = 'BARCODE_ENTRY_FLAG'
      LookupDataSet = ads34
      LookupKeyFields = 'RKEY'
      LookupResultField = 'BARCODE_ENTRY_FLAG'
      KeyFields = 'DEPT_PTR'
      Size = 1
      Lookup = True
    end
  end
  object DataSource4: TDataSource
    DataSet = ADS38
    Left = 328
    Top = 240
  end
  object ads34: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select RKEY, DEPT_CODE, DEPT_NAME, BARCODE_ENTRY_FLAG'#13#10'from data' +
      '0034'#13#10'where TTYPE=1'
    Parameters = <>
    Left = 440
    Top = 240
  end
  object ads494: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    BeforeEdit = ads494BeforeEdit
    AfterPost = ads494AfterPost
    CommandText = 
      'SELECT PARAMETER_PTR,'#13#10' PARAMETER_VALUE,'#13#10' custpart_ptr,'#13#10' step_' +
      'number,'#13#10' seq_no, Doc_Flag, after_flag, flow_spfc_flag'#13#10'FROM dbo' +
      '.Data0494'#13#10'where custpart_ptr = :SOURCE_PTR '
    IndexFieldNames = 'step_number;seq_no'
    Parameters = <
      item
        Name = 'SOURCE_PTR'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 136
    Top = 360
    object ads494PARAMETER_PTR: TIntegerField
      FieldName = 'PARAMETER_PTR'
      ReadOnly = True
    end
    object ads494PARAMETER_VALUE: TStringField
      DisplayLabel = #21442#25968#20540
      FieldName = 'PARAMETER_VALUE'
      Size = 30
    end
    object ads494custpart_ptr: TIntegerField
      FieldName = 'custpart_ptr'
      ReadOnly = True
    end
    object ads494step_number: TSmallintField
      DisplayLabel = #27493#39588
      FieldName = 'step_number'
      ReadOnly = True
    end
    object ads494seq_no: TSmallintField
      DisplayLabel = #24207#21495
      FieldName = 'seq_no'
      ReadOnly = True
    end
    object ads494Doc_Flag: TStringField
      DisplayLabel = #25171#21360
      FieldName = 'Doc_Flag'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object ads494after_flag: TStringField
      DisplayLabel = #21518#34917
      FieldName = 'after_flag'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object ads494flow_spfc_flag: TStringField
      DisplayLabel = #37325#28857
      FieldName = 'flow_spfc_flag'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object ads494PARAMETER_NAME: TStringField
      DisplayLabel = #21442#25968#20195#30721
      FieldKind = fkLookup
      FieldName = 'PARAMETER_NAME'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'PARAMETER_NAME'
      KeyFields = 'PARAMETER_PTR'
      ReadOnly = True
      Size = 10
      Lookup = True
    end
    object ads494PARAMETER_DESC: TStringField
      DisplayLabel = #21442#25968#21517#31216
      FieldKind = fkLookup
      FieldName = 'PARAMETER_DESC'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'PARAMETER_DESC'
      KeyFields = 'PARAMETER_PTR'
      ReadOnly = True
      Lookup = True
    end
    object ads494SPEC_RKEY: TStringField
      FieldKind = fkLookup
      FieldName = 'SPEC_RKEY'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'SPEC_RKEY'
      KeyFields = 'PARAMETER_PTR'
      ReadOnly = True
      Size = 2
      Lookup = True
    end
    object ads494UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldKind = fkLookup
      FieldName = 'UNIT_NAME'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'UNIT_NAME'
      KeyFields = 'PARAMETER_PTR'
      ReadOnly = True
      Lookup = True
    end
    object ads494DATATYPE: TStringField
      DisplayLabel = #31867#22411
      FieldKind = fkLookup
      FieldName = 'DATATYPE'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'datatype'
      KeyFields = 'PARAMETER_PTR'
      ReadOnly = True
      Size = 4
      Lookup = True
    end
  end
  object DataSource5: TDataSource
    DataSet = ads494
    Left = 80
    Top = 360
  end
  object ads89: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT TOP 100 PERCENT dbo.Data0278.PARAMETER_NAME, '#13#10'      dbo.' +
      'Data0278.PARAMETER_DESC, dbo.data0089.tvalue, dbo.Data0002.UNIT_' +
      'NAME, '#13#10'      dbo.Data0278.SPEC_RKEY,'#13#10'case data0278.DATA_TYPE'#13#10 +
      'when 1 then '#39#25968#23383#39' WHEN 2 THEN '#39#23383#31526#39#13#10'end as datatype'#13#10'FROM dbo.dat' +
      'a0089 INNER JOIN'#13#10'      dbo.Data0278 ON dbo.data0089.parameter_p' +
      'tr = dbo.Data0278.RKEY INNER JOIN'#13#10'      dbo.Data0002 ON dbo.Dat' +
      'a0278.UNIT_PTR = dbo.Data0002.RKEY'#13#10'where cust_part_ptr=:rkey'#13#10'O' +
      'RDER BY dbo.data0089.rkey'#13#10
    DataSource = DataSource2
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 280
    Top = 352
    object ads89PARAMETER_NAME: TStringField
      DisplayLabel = #21442#25968#20195#30721
      FieldName = 'PARAMETER_NAME'
      FixedChar = True
      Size = 10
    end
    object ads89PARAMETER_DESC: TStringField
      DisplayLabel = #21442#25968#21517#31216
      FieldName = 'PARAMETER_DESC'
      FixedChar = True
    end
    object ads89tvalue: TStringField
      DisplayLabel = #21442#25968#20540
      FieldName = 'tvalue'
      Size = 50
    end
    object ads89UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ads89SPEC_RKEY: TStringField
      FieldName = 'SPEC_RKEY'
      FixedChar = True
      Size = 2
    end
    object ads89datatype: TStringField
      DisplayLabel = #31867#22411
      FieldName = 'datatype'
      ReadOnly = True
      Size = 4
    end
  end
  object DataSource6: TDataSource
    DataSet = ads89
    Left = 216
    Top = 360
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 448
    Top = 88
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 476
    Top = 137
  end
  object aqBOMView: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT M.Route_Step_NO,M.DOC_FLAG,M.Dept_ptr, Qty_BOM, D.Inv_Par' +
        't_Number,(D.inv_name + D.inv_description) as INV_Name ,D.Unit_Co' +
        'de,D34.Dept_Code  FROM dbo.Data0026 M left join '
      '('
      
        'select M.rKey,Inv_Part_Number,Inv_Part_Description,U.Unit_Code,i' +
        'nv_description,inv_name from data0017 M inner join data0002 U on' +
        ' M.STOCK_UNIT_PTR=U.rKey '
      ') D on M.INVENTORY_PTR=d.rKey'
      'left outer join data0034 D34 on M.Dept_ptr=D34.rKey '
      'WHERE Manu_BOM_Ptr=:F01')
    Left = 344
    Top = 352
    object aqBOMViewDept_ptr: TIntegerField
      FieldName = 'Dept_ptr'
    end
    object aqBOMViewInv_Part_Number: TStringField
      FieldName = 'Inv_Part_Number'
      Size = 25
    end
    object aqBOMViewINV_Name: TStringField
      FieldName = 'INV_Name'
      ReadOnly = True
      Size = 100
    end
    object aqBOMViewUnit_Code: TStringField
      FieldName = 'Unit_Code'
      Size = 5
    end
    object aqBOMViewDept_Code: TStringField
      FieldName = 'Dept_Code'
      Size = 10
    end
    object aqBOMViewDOC_FLAG: TStringField
      FieldName = 'DOC_FLAG'
      FixedChar = True
      Size = 1
    end
    object aqBOMViewQty_BOM: TFloatField
      FieldName = 'Qty_BOM'
      DisplayFormat = '##0.#00000000'
    end
    object aqBOMViewRoute_Step_NO: TSmallintField
      FieldName = 'Route_Step_NO'
    end
  end
  object dsBOMView: TDataSource
    DataSet = aqBOMView
    Left = 432
    Top = 344
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 504
    Top = 360
  end
  object tmp1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 504
    Top = 408
  end
end
