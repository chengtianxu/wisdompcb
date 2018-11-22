object dmcon: Tdmcon
  OldCreateOrder = False
  Left = 358
  Top = 171
  Height = 479
  Width = 686
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 32
  end
  object adsWOInfo: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterScroll = adsWOInfoAfterScroll
    CommandText = 
      'SELECT D34.DEPT_CODE, D34.DEPT_NAME, D06.WORK_ORDER_NUMBER, D06.' +
      'CUT_NO, D06.Quan_Sch, D06.Quan_Rej,D25.parent_ptr,'#13#10'      D06.PA' +
      'NEL_A_B, D06.PROD_STATUS, D56.*, D06.QUAN_ALLREJ, D06.WIPMAT_STA' +
      'TUS,isnull(D06.CUTNO_WO,'#39#39') as cutno_wo,D06.SCH_COMPL_DATE,'#13#10'   ' +
      '   D06.wtype AS Wtype06, D06.BOM_PTR, D25.MANU_PART_NUMBER, D06.' +
      'rKey as rKey06,D06.PARTS_PER_PANEL,'#13#10'      D25.MANU_PART_DESC, D' +
      '06.SCH_COMPL_DATE, D492.TTYPE,DATEDIFF(day, D56.INTIME, D06.SCH_' +
      'COMPL_DATE) AS '#20132#36135#21608#26399','#13#10'      D492.whouse_ptr,D34.ALLOW_SPLIT_LOTS' +
      ', D34.SETUP_TIME_PER_LOT,D34.QUEUE_TIME,D34.PROCESS_TIME,D34.PRO' +
      'CESS_TIME_B'#13#10'FROM dbo.Data0006 D06 INNER JOIN'#13#10'      dbo.Data005' +
      '6 D56 ON D06.RKEY = D56.WO_PTR INNER JOIN'#13#10'      dbo.Data0034 D3' +
      '4 ON D56.DEPT_PTR = D34.RKEY INNER JOIN'#13#10'      dbo.Data0025 D25 ' +
      'ON D06.BOM_PTR = D25.RKEY INNER JOIN'#13#10'      dbo.data0492 D492 ON' +
      ' D06.CUT_NO = D492.CUT_NO'#13#10'where D06.Work_Order_Number=:F01'
    Parameters = <
      item
        Name = 'F01'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 22
        Value = Null
      end>
    Left = 40
    Top = 112
  end
  object dsWOInfo: TDataSource
    DataSet = adsWOInfo
    Left = 104
    Top = 112
  end
  object aqNextStepNO: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'F02'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT top 1 D34.rKey,D34.DEPT_CODE, D34.DEPT_NAME, D38.STEP_NUM' +
        'BER'
      'FROM dbo.Data0038 D38 INNER JOIN'
      '      dbo.Data0034 D34 ON D38.DEPT_PTR = D34.RKEY'
      
        'WHERE (D34.BARCODE_ENTRY_FLAG = '#39'Y'#39') and D38.Source_ptr=:F01 and' +
        ' D38.Step_Number>:F02'
      'order by Step_Number asc')
    Left = 184
    Top = 112
  end
  object adsEmployee: TADODataSet
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    CommandText = 
      'select data0005.rkey,data0005.empl_code,data0005.employee_name,d' +
      'ata0034.rkey as rkey34'#13#10'from data0005 left join data0034'#13#10'on dat' +
      'a0005.employee_id=data0034.big_dept_ptr'#13#10'and data0005.Active_Fla' +
      'g='#39'Y'#39#13#10'and data0034.rkey=:F01'#13#10'order by empl_code'
    Parameters = <
      item
        Name = 'F01'
        Size = -1
        Value = Null
      end>
    Left = 40
    Top = 176
  end
  object aqBasicParam: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select ppc_control12,ppc_control23 from data0192')
    Left = 176
    Top = 176
  end
  object aqTmp: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 248
    Top = 176
  end
  object dsEmployee: TDataSource
    DataSet = adsEmployee
    Left = 96
    Top = 176
  end
  object ads0041: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from data0041 where rkey=NULL'
    Parameters = <>
    Left = 40
    Top = 232
  end
  object ads0048: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from data0048 where rkey=NULL'
    Parameters = <>
    Left = 96
    Top = 232
  end
  object adsFlowList: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterOpen = adsFlowListAfterOpen
    CommandText = 
      'SELECT  D34.DEPT_CODE, D34.DEPT_NAME, D34.BIG_DEPT_PTR, '#13#10'      ' +
      'D34.BARCODE_ENTRY_FLAG, D38.STEP_NUMBER, D38.DEPT_PTR, D06.rKey ' +
      'as rKey06,'#13#10'      D06.WORK_ORDER_NUMBER, D48.*,D05.employee_name' +
      #13#10'FROM dbo.Data0034 D34 INNER JOIN'#13#10'      dbo.Data0038 D38 ON D3' +
      '4.RKEY = D38.DEPT_PTR INNER JOIN'#13#10'      dbo.Data0006 D06 ON D38.' +
      'SOURCE_PTR = D06.BOM_PTR Left outer JOIN'#13#10'      dbo.Data0048 D48' +
      ' ON D06.RKEY = D48.WO_PTR AND '#13#10'      D38.DEPT_PTR = D48.FM_DEPT' +
      '_PTR and D38.STEP_NUMBER=D48.Step_No'#13#10'      left outer join data' +
      '0005 D05 on D48.empl_ptr=d05.rkey'#13#10'WHERE D06.WORK_ORDER_NUMBER =' +
      ' :F01'#13#10'Order by D38.STEP_NUMBER'
    Parameters = <
      item
        Name = 'F01'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 22
        Value = Null
      end>
    Left = 432
    Top = 8
  end
  object dsFlowList: TDataSource
    DataSet = adsFlowList
    Left = 344
    Top = 16
  end
  object ads0056: TADODataSet
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    CommandText = 'select * from data0056 where wo_ptr=:F01'
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 288
    Top = 120
  end
  object aqTmp2: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 248
    Top = 232
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 304
    Top = 232
  end
  object NextStep_238: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'F02'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      
        'select top 1 d34.rkey,d34.dept_code,d34.dept_name,d238.step_numb' +
        'er,'
      'd34.allow_split_lots'
      'from data0238 d238 inner join '
      '     data0034 d34 on d238.dept_ptr=d34.rkey'
      
        'where (d34.barcode_entry_flag='#39'Y'#39') and d238.wo_ptr=:F01 and d238' +
        '.step_number>:F02'
      'order by step_number asc')
    Left = 182
    Top = 304
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 434
    Top = 382
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 510
    Top = 389
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 364
    Top = 381
  end
  object Para_Value: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey25'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'step_number'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'select names_value=isnull(STUFF((SELECT '#39','#39' + PARAMETER_VALUE'
      '                      FROM  dbo.Data0494'
      
        '                      where custpart_ptr=:rkey25 and step_number' +
        '=:step_number and outp_spfc_flag='#39'Y'#39' FOR XML PATH('#39#39')), 1, 1, '#39#39 +
        '),'#39#39')')
    Left = 480
    Top = 232
    object Para_Valuenames_value: TMemoField
      FieldName = 'names_value'
      ReadOnly = True
      BlobType = ftMemo
    end
  end
  object WoClamp: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <
      item
        Name = 'cutno_wo'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 22
        Value = Null
      end
      item
        Name = 'step'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'SELECT'
      
        '          dbo.Data0006.WORK_ORDER_NUMBER, dbo.Data0006.CUT_NO, d' +
        'bo.Data0006.PANEL_A_B, dbo.Data0006.BEGIN_STEP_NO, '
      
        '          dbo.Data0006.SUB_LEVELS, dbo.Data0006.PRIORITY_CODE, d' +
        'bo.Data0006.PROD_STATUS, dbo.Data0006.ENGG_STATUS, '
      
        '          dbo.Data0006.ENGG_PROD_FLAG, dbo.Data0006.QUAN_SCH, db' +
        'o.Data0006.QUAN_REJ, dbo.Data0006.QUAN_PROD, dbo.Data0006.PANELS' +
        ', '
      
        '          dbo.Data0006.REMARK_PNLS, dbo.Data0006.PLANNED_QTY, db' +
        'o.Data0006.FLOW_NO, dbo.Data0006.WIPMAT_STATUS, dbo.Data0006.wty' +
        'pe, '
      
        '          dbo.Data0006.put_type, dbo.Data0006.MATL_COST, dbo.Dat' +
        'a0006.OVHD_COST, dbo.Data0006.from_wo_ptr,isnull(dbo.Data0006.CU' +
        'TNO_WO,'#39#39') as cutno_wo, '
      
        '          dbo.Data0006.LOT_NUMBER, dbo.Data0006.QUAN_ALLPNL, dbo' +
        '.Data0006.RKEY AS rkey06, dbo.Data0056.RKEY, dbo.Data0056.STEP, '
      
        '          dbo.Data0056.QTY_BACKLOG, dbo.Data0056.PANELS AS panel' +
        's56, dbo.Data0056.INTIME, '
      
        '          dbo.Data0056.TO_BE_STOCKED, dbo.Data0056.WTYPE AS wtyp' +
        'e56, dbo.Data0056.REFERENCE, dbo.Data0056.TO_BE_CANCD, '
      '          dbo.Data0056.OUTSOURCE, dbo.Data0056.PO_NUMBER'
      'FROM         dbo.Data0006 INNER JOIN'
      
        '                   dbo.Data0056 ON dbo.Data0006.RKEY = dbo.Data0' +
        '056.WO_PTR'
      'WHERE      dbo.Data0006.cutno_wo=:cutno_wo '
      '                  and dbo.Data0056.step=:step'
      '                  and dbo.Data0006.prod_status in (3,5,6)'
      '                  and dbo.Data0006.wtype in (0,1,3)'
      '                  '
      '          ')
    Left = 530
    Top = 71
    object WoClampWORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object WoClampCUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object WoClampPANEL_A_B: TIntegerField
      FieldName = 'PANEL_A_B'
    end
    object WoClampBEGIN_STEP_NO: TSmallintField
      FieldName = 'BEGIN_STEP_NO'
    end
    object WoClampSUB_LEVELS: TSmallintField
      FieldName = 'SUB_LEVELS'
    end
    object WoClampPRIORITY_CODE: TWordField
      FieldName = 'PRIORITY_CODE'
    end
    object WoClampPROD_STATUS: TSmallintField
      FieldName = 'PROD_STATUS'
    end
    object WoClampENGG_STATUS: TSmallintField
      FieldName = 'ENGG_STATUS'
    end
    object WoClampENGG_PROD_FLAG: TSmallintField
      FieldName = 'ENGG_PROD_FLAG'
    end
    object WoClampQUAN_SCH: TFloatField
      FieldName = 'QUAN_SCH'
    end
    object WoClampQUAN_REJ: TFloatField
      FieldName = 'QUAN_REJ'
    end
    object WoClampQUAN_PROD: TFloatField
      FieldName = 'QUAN_PROD'
    end
    object WoClampPANELS: TIntegerField
      FieldName = 'PANELS'
    end
    object WoClampREMARK_PNLS: TFloatField
      FieldName = 'REMARK_PNLS'
    end
    object WoClampPLANNED_QTY: TFloatField
      FieldName = 'PLANNED_QTY'
    end
    object WoClampFLOW_NO: TSmallintField
      FieldName = 'FLOW_NO'
    end
    object WoClampWIPMAT_STATUS: TSmallintField
      FieldName = 'WIPMAT_STATUS'
    end
    object WoClampwtype: TWordField
      FieldName = 'wtype'
    end
    object WoClampput_type: TWordField
      FieldName = 'put_type'
    end
    object WoClampMATL_COST: TFloatField
      FieldName = 'MATL_COST'
    end
    object WoClampOVHD_COST: TFloatField
      FieldName = 'OVHD_COST'
    end
    object WoClampfrom_wo_ptr: TIntegerField
      FieldName = 'from_wo_ptr'
    end
    object WoClampCUTNO_WO: TStringField
      FieldName = 'CUTNO_WO'
      Size = 22
    end
    object WoClampLOT_NUMBER: TStringField
      FieldName = 'LOT_NUMBER'
      Size = 4
    end
    object WoClampQUAN_ALLPNL: TIntegerField
      FieldName = 'QUAN_ALLPNL'
    end
    object WoClamprkey06: TAutoIncField
      FieldName = 'rkey06'
      ReadOnly = True
    end
    object WoClampRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object WoClampSTEP: TSmallintField
      FieldName = 'STEP'
    end
    object WoClampQTY_BACKLOG: TFloatField
      FieldName = 'QTY_BACKLOG'
    end
    object WoClamppanels56: TIntegerField
      FieldName = 'panels56'
    end
    object WoClampINTIME: TDateTimeField
      FieldName = 'INTIME'
    end
    object WoClampTO_BE_STOCKED: TFloatField
      FieldName = 'TO_BE_STOCKED'
    end
    object WoClampwtype56: TSmallintField
      FieldName = 'wtype56'
    end
    object WoClampREFERENCE: TStringField
      FieldName = 'REFERENCE'
    end
    object WoClampTO_BE_CANCD: TIntegerField
      FieldName = 'TO_BE_CANCD'
    end
    object WoClampOUTSOURCE: TBooleanField
      FieldName = 'OUTSOURCE'
    end
    object WoClampPO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
  end
  object WoClampIn: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <
      item
        Name = 'step'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'SELECT'
      
        '          dbo.Data0006.WORK_ORDER_NUMBER, dbo.Data0006.CUT_NO, d' +
        'bo.Data0006.PANEL_A_B, dbo.Data0006.BEGIN_STEP_NO, '
      
        '          dbo.Data0006.SUB_LEVELS, dbo.Data0006.PRIORITY_CODE, d' +
        'bo.Data0006.PROD_STATUS, dbo.Data0006.ENGG_STATUS, '
      
        '          dbo.Data0006.ENGG_PROD_FLAG, dbo.Data0006.QUAN_SCH, db' +
        'o.Data0006.QUAN_REJ, dbo.Data0006.QUAN_PROD, dbo.Data0006.PANELS' +
        ', '
      
        '          dbo.Data0006.REMARK_PNLS, dbo.Data0006.PLANNED_QTY, db' +
        'o.Data0006.FLOW_NO, dbo.Data0006.WIPMAT_STATUS, dbo.Data0006.wty' +
        'pe, '
      
        '          dbo.Data0006.put_type, dbo.Data0006.MATL_COST, dbo.Dat' +
        'a0006.OVHD_COST, dbo.Data0006.from_wo_ptr,isnull(dbo.Data0006.CU' +
        'TNO_WO,'#39#39') as cutno_wo, '
      
        '          dbo.Data0006.LOT_NUMBER, dbo.Data0006.QUAN_ALLPNL, dbo' +
        '.Data0006.RKEY AS rkey06, dbo.Data0056.RKEY, dbo.Data0056.STEP, '
      
        '          dbo.Data0056.QTY_BACKLOG, dbo.Data0056.PANELS AS panel' +
        's56, dbo.Data0056.INTIME, '
      
        '          dbo.Data0056.TO_BE_STOCKED, dbo.Data0056.WTYPE AS wtyp' +
        'e56, dbo.Data0056.REFERENCE, dbo.Data0056.TO_BE_CANCD, '
      '          dbo.Data0056.OUTSOURCE, dbo.Data0056.PO_NUMBER'
      'FROM         dbo.Data0006 INNER JOIN'
      
        '                   dbo.Data0056 ON dbo.Data0006.RKEY = dbo.Data0' +
        '056.WO_PTR'
      'WHERE       dbo.Data0056.step=:step'
      '                  and dbo.Data0006.prod_status in (3,5,6)'
      '                  and dbo.Data0006.wtype in (0,1,3)'
      ''
      '          ')
    Left = 534
    Top = 134
    object WoClampInWORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object WoClampInCUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object WoClampInPANEL_A_B: TIntegerField
      FieldName = 'PANEL_A_B'
    end
    object WoClampInBEGIN_STEP_NO: TSmallintField
      FieldName = 'BEGIN_STEP_NO'
    end
    object WoClampInSUB_LEVELS: TSmallintField
      FieldName = 'SUB_LEVELS'
    end
    object WoClampInPRIORITY_CODE: TWordField
      FieldName = 'PRIORITY_CODE'
    end
    object WoClampInPROD_STATUS: TSmallintField
      FieldName = 'PROD_STATUS'
    end
    object WoClampInENGG_STATUS: TSmallintField
      FieldName = 'ENGG_STATUS'
    end
    object WoClampInENGG_PROD_FLAG: TSmallintField
      FieldName = 'ENGG_PROD_FLAG'
    end
    object WoClampInQUAN_SCH: TFloatField
      FieldName = 'QUAN_SCH'
    end
    object WoClampInQUAN_REJ: TFloatField
      FieldName = 'QUAN_REJ'
    end
    object WoClampInQUAN_PROD: TFloatField
      FieldName = 'QUAN_PROD'
    end
    object WoClampInPANELS: TIntegerField
      FieldName = 'PANELS'
    end
    object WoClampInREMARK_PNLS: TFloatField
      FieldName = 'REMARK_PNLS'
    end
    object WoClampInPLANNED_QTY: TFloatField
      FieldName = 'PLANNED_QTY'
    end
    object WoClampInFLOW_NO: TSmallintField
      FieldName = 'FLOW_NO'
    end
    object WoClampInWIPMAT_STATUS: TSmallintField
      FieldName = 'WIPMAT_STATUS'
    end
    object WoClampInwtype: TWordField
      FieldName = 'wtype'
    end
    object WoClampInput_type: TWordField
      FieldName = 'put_type'
    end
    object WoClampInMATL_COST: TFloatField
      FieldName = 'MATL_COST'
    end
    object WoClampInOVHD_COST: TFloatField
      FieldName = 'OVHD_COST'
    end
    object WoClampInfrom_wo_ptr: TIntegerField
      FieldName = 'from_wo_ptr'
    end
    object WoClampInCUTNO_WO: TStringField
      FieldName = 'CUTNO_WO'
      Size = 22
    end
    object WoClampInLOT_NUMBER: TStringField
      FieldName = 'LOT_NUMBER'
      Size = 4
    end
    object WoClampInQUAN_ALLPNL: TIntegerField
      FieldName = 'QUAN_ALLPNL'
    end
    object WoClampInrkey06: TAutoIncField
      FieldName = 'rkey06'
      ReadOnly = True
    end
    object WoClampInRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object WoClampInSTEP: TSmallintField
      FieldName = 'STEP'
    end
    object WoClampInQTY_BACKLOG: TFloatField
      FieldName = 'QTY_BACKLOG'
    end
    object WoClampInpanels56: TIntegerField
      FieldName = 'panels56'
    end
    object WoClampInINTIME: TDateTimeField
      FieldName = 'INTIME'
    end
    object WoClampInTO_BE_STOCKED: TFloatField
      FieldName = 'TO_BE_STOCKED'
    end
    object WoClampInwtype56: TSmallintField
      FieldName = 'wtype56'
    end
    object WoClampInREFERENCE: TStringField
      FieldName = 'REFERENCE'
    end
    object WoClampInTO_BE_CANCD: TIntegerField
      FieldName = 'TO_BE_CANCD'
    end
    object WoClampInOUTSOURCE: TBooleanField
      FieldName = 'OUTSOURCE'
    end
    object WoClampInPO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
  end
  object ads238FlowList: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterOpen = adsFlowListAfterOpen
    CommandText = 
      'SELECT  D34.DEPT_CODE, D34.DEPT_NAME, D34.BIG_DEPT_PTR, '#13#10'      ' +
      'D34.BARCODE_ENTRY_FLAG, D238.STEP_NUMBER, D238.DEPT_PTR, D06.rKe' +
      'y as rKey06,'#13#10'      D06.WORK_ORDER_NUMBER, D48.*,D05.employee_na' +
      'me'#13#10'FROM dbo.Data0034 D34 INNER JOIN'#13#10'      dbo.Data0238 D238 ON' +
      ' D34.RKEY = D238.DEPT_PTR INNER JOIN'#13#10'      dbo.Data0006 D06 ON ' +
      'D238.WO_PTR = D06.RKEY Left outer JOIN'#13#10'      dbo.Data0048 D48 O' +
      'N D06.RKEY = D48.WO_PTR AND '#13#10'      D238.DEPT_PTR = D48.FM_DEPT_' +
      'PTR and D238.STEP_NUMBER=D48.Step_No'#13#10'      left outer join data' +
      '0005 D05 on D48.empl_ptr=d05.rkey'#13#10'WHERE D06.WORK_ORDER_NUMBER =' +
      ' :F01'#13#10'Order by D238.STEP_NUMBER'
    Parameters = <
      item
        Name = 'F01'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 22
        Value = Null
      end>
    Left = 432
    Top = 72
  end
  object tmpQry: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 560
    Top = 336
  end
  object adsUserInfo: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select data0486.*,data0005.active_flag from data0486,data0005 wh' +
      'ere data0486.empl_ptr=data0005.rkey and '#13#10'LOGIN_NAME=:F01'
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    Left = 120
    Top = 32
  end
end
