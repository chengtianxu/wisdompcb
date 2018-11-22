object dmcon: Tdmcon
  OldCreateOrder = False
  Left = 588
  Top = 147
  Height = 474
  Width = 707
  object ADOConnection1: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 32
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
  object adsWOInfo: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT D34.DEPT_CODE, D34.DEPT_NAME, D06.WORK_ORDER_NUMBER, D06.' +
      'CUT_NO, D06.Quan_Sch, D06.Quan_Rej,D25.parent_ptr,'#13#10'      D06.PA' +
      'NEL_A_B, D06.PROD_STATUS, D56.*, D06.QUAN_ALLREJ, D06.WIPMAT_STA' +
      'TUS,isnull(D06.CUTNO_WO,'#39#39') as cutno_wo,D06.SCH_COMPL_DATE,'#13#10'   ' +
      '   D06.wtype AS Wtype06, D06.BOM_PTR, D25.MANU_PART_NUMBER, D06.' +
      'rKey as rKey06,D06.PARTS_PER_PANEL,'#13#10'      D25.MANU_PART_DESC, D' +
      '06.SCH_COMPL_DATE, D492.TTYPE,isnull(DATEDIFF(day,getdate(), D06' +
      '.SCH_COMPL_DATE) ,0) AS '#20132#36135#21608#26399','#13#10'      D492.whouse_ptr,D34.ALLOW_S' +
      'PLIT_LOTS, D34.SETUP_TIME_PER_LOT,D34.QUEUE_TIME,D34.PROCESS_TIM' +
      'E,D34.PROCESS_TIME_B'#13#10'FROM dbo.Data0006 D06 INNER JOIN'#13#10'      db' +
      'o.Data0056 D56 ON D06.RKEY = D56.WO_PTR INNER JOIN'#13#10'      dbo.Da' +
      'ta0034 D34 ON D56.DEPT_PTR = D34.RKEY INNER JOIN'#13#10'      dbo.Data' +
      '0025 D25 ON D06.BOM_PTR = D25.RKEY INNER JOIN'#13#10'      dbo.data049' +
      '2 D492 ON D06.CUT_NO = D492.CUT_NO'#13#10'where D06.Work_Order_Number=' +
      ':F01'
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
    Top = 115
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
        'BER,'
      'D34.ALLOW_SPLIT_LOTS'
      'FROM dbo.Data0038 D38 INNER JOIN'
      '      dbo.Data0034 D34 ON D38.DEPT_PTR = D34.RKEY'
      
        'WHERE (D34.BARCODE_ENTRY_FLAG = '#39'Y'#39') and D38.Source_ptr=:F01 and' +
        ' D38.Step_Number>:F02'
      'order by Step_Number asc')
    Left = 546
    Top = 239
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
    Left = 104
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
  object aqTmp2: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 160
    Top = 240
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 224
    Top = 240
  end
  object DS: TDataSource
    DataSet = adsUserInfo
    Left = 192
    Top = 32
  end
  object aspWO_Split: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'WO_Split;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@OrgRkey'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@WONO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 30
        Value = Null
      end
      item
        Name = '@PCS'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@PNL'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@User_ptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Remark'
        Attributes = [paNullable]
        DataType = ftString
        Size = 150
        Value = Null
      end>
    Left = 256
    Top = 48
  end
  object tmpQry: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 264
    Top = 112
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
    Left = 582
    Top = 296
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
    Left = 482
    Top = 95
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
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 434
    Top = 310
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 510
    Top = 317
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 452
    Top = 365
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
    Left = 390
    Top = 142
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
      
        '                      where custpart_ptr=:rkey25  and  step_numb' +
        'er=:step_number and outp_spfc_flag='#39'Y'#39'  order by seq_no FOR XML ' +
        'PATH('#39#39')), 1, 1, '#39#39'),'#39#39')')
    Left = 472
    Top = 232
    object Para_Valuenames_value: TMemoField
      FieldName = 'names_value'
      ReadOnly = True
      BlobType = ftMemo
    end
  end
  object ADO101: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey34'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey25'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select  names_value=isnull(STUFF((SELECT '#39','#39'+'#39#20135#21697':'#39'+data0025.manu' +
        '_part_number+'#39','#24050#36807#25968#21040#24403#21069#36807#25968#24037#24207':'#39'+data0034.dept_name+'#39','#27492#20135#21697#22312#27492#24037#24207#26377#30456#20851#25237#35785','#27880#24847 +
        #21697#36136#25511#21046'!'#30456#20851#25237#35785#32534#21495':'#39'+ data0101.log_number+'#39','#20027#35201#32570#38519':'#39'+data0101.DEFECT_MAIN'
      '                      FROM  dbo.Data0101'
      
        '                      inner join data0118 on data0118.SOURCE_PTR' +
        '=data0101.rkey'
      
        '                      inner join data0025 on data0101.CUSTOMER_P' +
        'ART_PTR=data0025.rkey'
      
        '                      inner join data0034 on data0118.resp_dept_' +
        'ptr=data0034.rkey'
      
        '                      where data0118.RESP_DEPT_PTR=:rkey34 and d' +
        'ata0101.CUSTOMER_PART_PTR=:rkey25 and if_send=0 FOR XML PATH('#39#39')' +
        '), 1, 1, '#39#39'),'#39#39')'
      '')
    Left = 40
    Top = 336
    object ADO101names_value: TMemoField
      FieldName = 'names_value'
      ReadOnly = True
      BlobType = ftMemo
    end
  end
  object ADO014: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0014 where rkey=0')
    Left = 112
    Top = 344
    object ADO014rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO014MESSAGE: TStringField
      FieldName = 'MESSAGE'
      Size = 2000
    end
    object ADO014senddate: TDateTimeField
      FieldName = 'senddate'
    end
    object ADO014whosend: TIntegerField
      FieldName = 'whosend'
    end
  end
  object ADO314: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0314 where rkey=0')
    Left = 176
    Top = 348
    object ADO314rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO314emp_ptr: TIntegerField
      FieldName = 'emp_ptr'
    end
    object ADO314d14_ptr: TIntegerField
      FieldName = 'd14_ptr'
    end
    object ADO314hread: TStringField
      FieldName = 'hread'
      FixedChar = True
      Size = 1
    end
    object ADO314deleted: TStringField
      FieldName = 'deleted'
      FixedChar = True
      Size = 1
    end
    object ADO314if_note: TBooleanField
      FieldName = 'if_note'
    end
  end
end
