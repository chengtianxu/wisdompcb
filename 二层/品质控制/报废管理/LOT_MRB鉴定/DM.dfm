object DM1: TDM1
  OldCreateOrder = False
  Left = 405
  Top = 284
  Height = 369
  Width = 445
  object con1: TADOConnection
    CommandTimeout = 90
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 16
    Top = 16
  end
  object qrytmp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 376
    Top = 16
  end
  object adsFrmMain: TADODataSet
    Connection = con1
    CursorType = ctStatic
    CommandText = 
      'SELECT D06.* , (case when D06.wtype = 0 then '#39#27491#24120#39' when D06.wtype' +
      ' = 1 then '#39#23614#25968#39' when D06.wtype = 2 then '#39#24453#36820#24037#39' when D06.wtype = 3 ' +
      'then '#39#36820#24037#39' when D06.wtype = 4 then '#39#24453#25253#24223#39' when D06.wtype = 5 then ' +
      #39#24050#25253#24223#39' end) AS LOTSTATUS,'#13#10'(case when D06.PROD_STATUS = 2 then '#39#24453 +
      #21457#25918#39' when D06.PROD_STATUS = 3 then '#39#29983#20135#20013#39' when D06.PROD_STATUS = 4' +
      ' then '#39#22806#21457#29983#20135#39' when D06.PROD_STATUS = 5 then '#39#24453#20837#20179#39' when D06.PROD_S' +
      'TATUS = 6 then '#39#24453#20998#37197#39' when D06.PROD_STATUS = 9 then '#39#29983#20135#32467#26463#39#13#10'when ' +
      'D06.PROD_STATUS = 102 then '#39#29983#20135#21069#26242#32531#39' when D06.PROD_STATUS = 103 th' +
      'en '#39#29983#20135#20013#26242#32531#39' when D06.PROD_STATUS = 202 then '#39#21462#28040#25110#21512#24182#39' end) AS ProdS' +
      'tatus,'#13#10'D06.quan_allrej AS RejPcs, D06.quan_allpnl AS RejPnl,'#13#10'D' +
      '492.Cut_NO, (case when D492.TTYPE = 0 then '#39#27491#24120#25237#20135#39' when D492.TTYP' +
      'E = 1 then '#39#34917#26009#25237#20135#39' when D492.TTYPE = 2 then '#39#25353'MRB'#37325#25237#39' when D492.TT' +
      'YPE = 3 then '#39#25353'MRB'#36820#24037#39' when D492.TTYPE = 4 then '#39#25353#29256#21495#25237#20135#39' end ) as ' +
      'D492TType ,'#13#10'D492.SO_NO,D25.Manu_Part_Number, D25.Manu_Part_Desc' +
      ',D34Now.Dept_Name AS NowDept, D34Now.RKey AS NowDeptRKey,'#13#10'D56.Q' +
      'ty_BackLog AS OnlinePcs, D56.Panels AS OnlinePNL,D56.STEP AS Now' +
      'Step,'#13#10'D15.Abbr_Name, D15.RKey AS BFGCRKey FROM Data0006 D06'#13#10'IN' +
      'NER JOIN Data0492 D492 ON D492.Cut_NO =D06.Cut_NO'#13#10'INNER JOIN Da' +
      'ta0025 D25 ON D06.BOM_PTR = D25.RKey'#13#10'INNER JOIN Data0056 D56 ON' +
      ' D56.WO_PTR = D06.RKey'#13#10'INNER JOIN Data0034 D34Now ON D56.Dept_P' +
      'tr = D34Now.RKey'#13#10'INNER JOIN Data0015 D15 ON D56.LOC_PTR = D15.R' +
      'Key'
    Parameters = <>
    Left = 72
    Top = 16
    object atncfldFrmMainRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object strngfldFrmMainWORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object strngfldFrmMainCUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object smlntfldFrmMainBEGIN_STEP_NO: TSmallintField
      FieldName = 'BEGIN_STEP_NO'
    end
    object intgrfldFrmMainPANEL_A_B: TIntegerField
      FieldName = 'PANEL_A_B'
    end
    object intgrfldFrmMainWHOUSE_PTR: TIntegerField
      FieldName = 'WHOUSE_PTR'
    end
    object intgrfldFrmMainUSER_PTR: TIntegerField
      FieldName = 'USER_PTR'
    end
    object intgrfldFrmMainEMPLOYEE_PTR: TIntegerField
      FieldName = 'EMPLOYEE_PTR'
    end
    object intgrfldFrmMainBOM_PTR: TIntegerField
      FieldName = 'BOM_PTR'
    end
    object smlntfldFrmMainSUB_LEVELS: TSmallintField
      FieldName = 'SUB_LEVELS'
    end
    object wrdfldFrmMainPRIORITY_CODE: TWordField
      FieldName = 'PRIORITY_CODE'
    end
    object smlntfldFrmMainENGG_STATUS: TSmallintField
      FieldName = 'ENGG_STATUS'
    end
    object smlntfldFrmMainPROD_STATUS: TSmallintField
      FieldName = 'PROD_STATUS'
    end
    object smlntfldFrmMainENGG_PROD_FLAG: TSmallintField
      FieldName = 'ENGG_PROD_FLAG'
    end
    object fltfldFrmMainQUAN_SCH: TFloatField
      FieldName = 'QUAN_SCH'
    end
    object fltfldFrmMainQUAN_REJ: TFloatField
      FieldName = 'QUAN_REJ'
    end
    object fltfldFrmMainQUAN_PROD: TFloatField
      FieldName = 'QUAN_PROD'
    end
    object intgrfldFrmMainPANELS: TIntegerField
      FieldName = 'PANELS'
    end
    object fltfldFrmMainREMARK_PNLS: TFloatField
      FieldName = 'REMARK_PNLS'
    end
    object dtmfldFrmMainENT_DATETIME: TDateTimeField
      FieldName = 'ENT_DATETIME'
    end
    object dtmfldFrmMainSCH_COMPL_DATE: TDateTimeField
      FieldName = 'SCH_COMPL_DATE'
    end
    object dtmfldFrmMainPROJ_START_DATE: TDateTimeField
      FieldName = 'PROJ_START_DATE'
    end
    object dtmfldFrmMainPROJ_COMPL_DATE: TDateTimeField
      FieldName = 'PROJ_COMPL_DATE'
    end
    object dtmfldFrmMainCANCEL_HOLD_DATE: TDateTimeField
      FieldName = 'CANCEL_HOLD_DATE'
    end
    object dtmfldFrmMainACT_COMPL_DATE: TDateTimeField
      FieldName = 'ACT_COMPL_DATE'
    end
    object intgrfldFrmMainRMA_PTR: TIntegerField
      FieldName = 'RMA_PTR'
    end
    object fltfldFrmMainPARTS_PER_PANEL: TFloatField
      FieldName = 'PARTS_PER_PANEL'
    end
    object intgrfldFrmMainEDITED_BY: TIntegerField
      FieldName = 'EDITED_BY'
    end
    object fltfldFrmMainPLANNED_QTY: TFloatField
      FieldName = 'PLANNED_QTY'
    end
    object dtmfldFrmMainRELEASE_DATE: TDateTimeField
      FieldName = 'RELEASE_DATE'
    end
    object intgrfldFrmMainTRAV_PRINTED_BY_PTR: TIntegerField
      FieldName = 'TRAV_PRINTED_BY_PTR'
    end
    object smlntfldFrmMainFLOW_NO: TSmallintField
      FieldName = 'FLOW_NO'
    end
    object smlntfldFrmMainWIPMAT_STATUS: TSmallintField
      FieldName = 'WIPMAT_STATUS'
    end
    object smlntfldFrmMainPPC_FLAG: TSmallintField
      FieldName = 'PPC_FLAG'
    end
    object intgrfldFrmMainREFERENCE_PTR: TIntegerField
      FieldName = 'REFERENCE_PTR'
    end
    object fltfldFrmMainpanel_ln: TFloatField
      FieldName = 'panel_ln'
    end
    object fltfldFrmMainpanel_wd: TFloatField
      FieldName = 'panel_wd'
    end
    object wrdfldFrmMainwtype: TWordField
      FieldName = 'wtype'
    end
    object wrdfldFrmMainput_type: TWordField
      FieldName = 'put_type'
    end
    object fltfldFrmMainMATL_COST: TFloatField
      FieldName = 'MATL_COST'
    end
    object fltfldFrmMainOVHD_COST: TFloatField
      FieldName = 'OVHD_COST'
    end
    object strngfldFrmMainpnl_size: TStringField
      FieldName = 'pnl_size'
    end
    object intgrfldFrmMainfrom_wo_ptr: TIntegerField
      FieldName = 'from_wo_ptr'
    end
    object intgrfldFrmMainQUAN_ALLREJ: TIntegerField
      FieldName = 'QUAN_ALLREJ'
    end
    object intgrfldFrmMainQUAN_ALLPNL: TIntegerField
      FieldName = 'QUAN_ALLPNL'
    end
    object strngfldFrmMainLOT_NUMBER: TStringField
      FieldName = 'LOT_NUMBER'
      Size = 4
    end
    object strngfldFrmMainCUTNO_WO: TStringField
      FieldName = 'CUTNO_WO'
      Size = 22
    end
    object strngfldFrmMainLOTSTATUS: TStringField
      FieldName = 'LOTSTATUS'
      ReadOnly = True
      Size = 6
    end
    object strngfldFrmMainProdStatus: TStringField
      FieldName = 'ProdStatus'
      ReadOnly = True
      Size = 10
    end
    object intgrfldFrmMainRejPcs: TIntegerField
      FieldName = 'RejPcs'
    end
    object intgrfldFrmMainRejPnl: TIntegerField
      FieldName = 'RejPnl'
    end
    object strngfldFrmMainCut_NO_1: TStringField
      FieldName = 'Cut_NO_1'
      FixedChar = True
      Size = 12
    end
    object strngfldFrmMainD492TType: TStringField
      FieldName = 'D492TType'
      ReadOnly = True
      Size = 10
    end
    object strngfldFrmMainSO_NO: TStringField
      FieldName = 'SO_NO'
      FixedChar = True
      Size = 12
    end
    object strngfldFrmMainManu_Part_Number: TStringField
      FieldName = 'Manu_Part_Number'
    end
    object strngfldFrmMainManu_Part_Desc: TStringField
      FieldName = 'Manu_Part_Desc'
      Size = 80
    end
    object strngfldFrmMainNowDept: TStringField
      FieldName = 'NowDept'
      Size = 30
    end
    object atncfldFrmMainNowDeptRKey: TAutoIncField
      FieldName = 'NowDeptRKey'
      ReadOnly = True
    end
    object fltfldFrmMainOnlinePcs: TFloatField
      FieldName = 'OnlinePcs'
    end
    object intgrfldFrmMainOnlinePNL: TIntegerField
      FieldName = 'OnlinePNL'
    end
    object smlntfldFrmMainNowStep: TSmallintField
      FieldName = 'NowStep'
    end
    object strngfldFrmMainAbbr_Name: TStringField
      FieldName = 'Abbr_Name'
      Size = 10
    end
    object atncfldFrmMainBFGCRKey: TAutoIncField
      FieldName = 'BFGCRKey'
      ReadOnly = True
    end
  end
  object adsTmpSql: TADODataSet
    CommandText = 
      'SELECT WORK_ORDER_NUMBER, MANU_PART_NUMBER, MANU_PART_DESC, Dept' +
      '_Name,'#13#10'(case when D06.wtype = 0 then '#39#27491#24120#39' when D06.wtype = 1 th' +
      'en '#39#23614#25968#39' when D06.wtype = 2 then '#39#24453#36820#24037#39' when D06.wtype = 3 then '#39#36820 +
      #24037#39' when D06.wtype = 4 then '#39#24453#25253#24223#39' when D06.wtype = 5 then '#39#24050#25253#24223#39' e' +
      'nd) AS LOTSTATUS,'#13#10'D06.WTYPE,D06.PROD_STATUS,'#13#10'(case when D06.PR' +
      'OD_STATUS = 2 then '#39#24453#21457#25918#39' when D06.PROD_STATUS = 3 then '#39#29983#20135#20013#39' whe' +
      'n D06.PROD_STATUS = 4 then '#39#22806#21457#29983#20135#39' when D06.PROD_STATUS = 5 then ' +
      #39#24453#20837#20179#39' when D06.PROD_STATUS = 6 then '#39#24453#20998#37197#39' when D06.PROD_STATUS =' +
      ' 9 then '#39#29983#20135#32467#26463#39#13#10'when D06.PROD_STATUS = 102 then '#39#29983#20135#21069#26242#32531#39' when D06' +
      '.PROD_STATUS = 103 then '#39#29983#20135#20013#26242#32531#39' when D06.PROD_STATUS = 202 then ' +
      #39#21462#28040#25110#21512#24182#39' end) AS ProdStatus,'#13#10'Abbr_Name'#13#10'FROM Data0006 D06'#13#10'INNER' +
      ' JOIN data0025 D25 ON D06.BOM_PTR = D25.RKey'#13#10'INNER JOIN Data005' +
      '6 D56 ON D56.WO_PTR = D06.RKey'#13#10'INNER JOIN Data0034 D34Now ON D5' +
      '6.Dept_Ptr = D34Now.RKey'#13#10'INNER JOIN Data0015 D15 ON D56.LOC_PTR' +
      ' = D15.RKey'#13#10'WHERE D06.wtype in (2,4) and D06.PROD_STATUS in (3,' +
      '4,5,6) '
    Parameters = <>
    Left = 328
    Top = 256
  end
  object ads1: TADODataSet
    Connection = con1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT D06.RKey,D06.WORK_ORDER_NUMBER, D25.MANU_PART_NUMBER,D25.' +
      'MANU_PART_DESC'#13#10#9#9', (CASE D56.WTYPE WHEN 0 THEN '#39#39' ELSE '#39#36820#24037#39' END' +
      ') AS FGZ, D15.ABBR_NAME, D56.STEP'#13#10#9#9', isnull(D56.QTY_BACKLOG,0)' +
      ' as QTY_BACKLOG ,D56.REFERENCE , D34.DEPT_CODE, D34.DEPT_NAME '#13#10 +
      'FROM Data0006 D06 INNER JOIN '#13#10#9#9#9'Data0025 D25 ON D06.BOM_PTR=D2' +
      '5.RKey LEFT JOIN '#13#10#9#9#9'Data0056 D56 ON D06.RKey=D56.WO_PTR LEFT J' +
      'OIN '#13#10#9#9#9'Data0034 D34 ON D56.DEPT_PTR=D34.RKey LEFT JOIN '#13#10#9#9#9'Da' +
      'ta0015 D15 ON D56.LOC_PTR=D15.RKey '#13#10'WHERE D06.PROD_STATUS in (3' +
      ',5,6,103,9) '#13#10'and D06.wtype <> 2 and D06.wtype <> 4 '#13#10'and D25.Is' +
      'Spell<1 '#13#10'and d25.PARENT_PTR is not null'#13#10'AND D06.ENT_DATETIME B' +
      'ETWEEN  :s  AND :e'
    Parameters = <
      item
        Name = 's'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 42845d
      end
      item
        Name = 'e'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 41750d
      end>
    Left = 232
    Top = 8
    object ads1RKey: TAutoIncField
      FieldName = 'RKey'
      ReadOnly = True
    end
    object ads1WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ads1MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ads1MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ads1FGZ: TStringField
      DisplayLabel = #36820#24037#29366#24577
      FieldName = 'FGZ'
      ReadOnly = True
      Size = 4
    end
    object ads1ABBR_NAME: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ads1STEP: TSmallintField
      DisplayLabel = #27493#39588#21495
      FieldName = 'STEP'
    end
    object ads1QTY_BACKLOG: TFloatField
      DisplayLabel = #22312#32447#25968#37327
      FieldName = 'QTY_BACKLOG'
    end
    object ads1REFERENCE: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REFERENCE'
    end
    object ads1DEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ads1DEPT_NAME: TStringField
      DisplayLabel = #24037#24207#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
  end
  object ds1: TDataSource
    DataSet = ads1
    Left = 272
    Top = 8
  end
  object adsIN: TADODataSet
    Connection = con1
    CursorType = ctStatic
    CommandText = 
      ';WITH CTE as'#13#10'('#13#10#9'SELECT D489.SOURCE_PTR FROM Data0489 D489 WHER' +
      'E D489.WO_PTR = :OUT06'#13#10#9'UNION ALL'#9#13#10#9'SELECT D489.SOURCE_PTR FRO' +
      'M Data0489 D489 '#13#10#9#9#9'INNER JOIN CTE'#9'ON CTE.SOURCE_PTR = D489.WO_' +
      'PTR'#13#10') '#13#10'SELECT D25.MANU_PART_NUMBER,D58.QTY_REJECT,D34.DEPT_NAM' +
      'E'#13#10#9',D58.PANELS,D39.REJ_CODE,D39.REJECT_DESCRIPTION,D06.WORK_ORD' +
      'ER_NUMBER'#13#10'FROM Data0058IN D58 INNER JOIN '#13#10#9#9#9'CTE ON D58.WO_PTR' +
      ' = CTE.SOURCE_PTR INNER JOIN '#13#10#9#9#9'Data0034 D34 ON D34.RKEY=D58.R' +
      'ESP_DEPT_PTR INNER JOIN '#13#10#9#9#9'Data0006 D06 ON D58.WO_PTR = D06.RK' +
      'EY INNER JOIN '#13#10#9#9#9'Data0025 D25 ON D06.BOM_PTR = D25.RKEY INNER ' +
      'JOIN  '#13#10#9#9#9'Data0039 D39 ON D39.RKEY = D58.REJECT_PTR '
    Parameters = <
      item
        Name = 'OUT06'
        DataType = ftString
        Size = 7
        Value = '1383704'
      end>
    Left = 232
    Top = 72
    object adsINMANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object adsINQTY_REJECT: TFloatField
      DisplayLabel = 'PCS'#25968
      FieldName = 'QTY_REJECT'
    end
    object adsINPANELS: TIntegerField
      DisplayLabel = 'PANEL'#25968
      FieldName = 'PANELS'
    end
    object adsINREJ_CODE: TStringField
      DisplayLabel = #32570#38519#20195#30721
      FieldName = 'REJ_CODE'
      Size = 5
    end
    object adsINREJECT_DESCRIPTION: TStringField
      DisplayLabel = #32570#38519#21517#31216
      FieldName = 'REJECT_DESCRIPTION'
      Size = 30
    end
    object adsINWORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20869#23618#20316#19994#21333
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object adsINDEPT_NAME: TStringField
      DisplayLabel = #36131#20219#24037#24207
      FieldName = 'DEPT_NAME'
      Size = 30
    end
  end
  object dsIN: TDataSource
    DataSet = adsIN
    Left = 272
    Top = 72
  end
end
