object dm1: Tdm1
  OldCreateOrder = False
  Left = 403
  Top = 423
  Height = 269
  Width = 354
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 16
  end
  object adsFrmMain: TADODataSet
    Connection = con1
    CursorType = ctStatic
    CommandText = 
      ' SELECT DISTINCT '#13#10' D25.MANU_PART_NUMBER, D25.MANU_PART_DESC,D58' +
      '.MRB_NO,D06.WORK_ORDER_NUMBER,'#13#10' D58.QTY_ORG_REJ, D58.PANELS, D5' +
      '8.QTY_REJECT,D39.REJECT_DESCRIPTION,D39.REJ_CODE, '#13#10' D34SQ.DEPT_' +
      'CODE AS SQDEPTCODE, D34SQ.DEPT_NAME AS SQDEPTNAME,D34FS.DEPT_COD' +
      'E AS FSSEPTCODE, D34FS.DEPT_NAME AS FSDEPTNAME,'#13#10' D58.TDATETIME,' +
      'D05SQ.EMPLOYEE_NAME AS SQEMPLOYNAME,D58.AUDIT_DATETIME, D05PZ.EM' +
      'PLOYEE_NAME AS PZEMPLOYEENAME,'#13#10' D15.ABBR_NAME, D58.REFERENCE, D' +
      '58.RKey AS RKey58, D06.Rkey AS RKey06,'#13#10' D58.STEPNOW , D15.WAREH' +
      'OUSE_CODE ,d60.SALES_ORDER,d60.PARTS_ORDERED,d492.ISSUED_QTY,'#13#10' ' +
      '(SELECT MAX(STATUS) AS D549Status FROM Data0549 D549 where d549.' +
      'D58_PTR = D58.RKey GROUP BY D549.D58_PTR) AS D549Status '#13#10' FROM ' +
      'Data0058 D58 INNER JOIN Data0006 D06 ON D58.WO_PTR = D06.RKey'#13#10' ' +
      'INNER JOIN Data0025 D25 ON D06.BOM_PTR = D25.RKey'#13#10' INNER JOIN D' +
      'ata0034 D34SQ ON D58.DEPT_PTR = D34SQ.RKey'#13#10' INNER JOIN Data0034' +
      ' D34FS ON D58.RESP_DEPT_PTR = D34FS.RKey'#13#10' INNER JOIN Data0039 D' +
      '39 ON D58.REJECT_PTR = D39.RKey'#13#10' INNER JOIN Data0005 D05SQ ON D' +
      '58.EMPL_PTR = D05SQ.RKey'#13#10' INNER JOIN Data0005 D05PZ ON D58.AUDI' +
      'T_EMPL_PTR = D05PZ.RKey'#13#10' INNER JOIN Data0015 D15 ON D58.warehou' +
      'se_ptr = D15.RKey'#13#10'LEFT JOIN data0492 d492 ON D06.CUT_NO = d492.' +
      'CUT_NO'#13#10'LEFT JOIN Data0060 d60 ON d60.SALES_ORDER = d492.SO_NO'
    Parameters = <>
    Prepared = True
    Left = 72
    Top = 16
    object strngfldFrmMainMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object strngfldFrmMainMANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object strngfldFrmMainMRB_NO: TStringField
      FieldName = 'MRB_NO'
      FixedChar = True
      Size = 10
    end
    object strngfldFrmMainWORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object intgrfldFrmMainQTY_ORG_REJ: TIntegerField
      FieldName = 'QTY_ORG_REJ'
    end
    object intgrfldFrmMainPANELS: TIntegerField
      FieldName = 'PANELS'
    end
    object fltfldFrmMainQTY_REJECT: TFloatField
      FieldName = 'QTY_REJECT'
    end
    object strngfldFrmMainREJECT_DESCRIPTION: TStringField
      FieldName = 'REJECT_DESCRIPTION'
      Size = 30
    end
    object strngfldFrmMainREJ_CODE: TStringField
      FieldName = 'REJ_CODE'
      Size = 5
    end
    object strngfldFrmMainSQDEPTCODE: TStringField
      FieldName = 'SQDEPTCODE'
      Size = 10
    end
    object strngfldFrmMainSQDEPTNAME: TStringField
      FieldName = 'SQDEPTNAME'
      Size = 30
    end
    object strngfldFrmMainFSSEPTCODE: TStringField
      FieldName = 'FSSEPTCODE'
      Size = 10
    end
    object strngfldFrmMainFSDEPTNAME: TStringField
      FieldName = 'FSDEPTNAME'
      Size = 30
    end
    object dtmfldFrmMainTDATETIME: TDateTimeField
      FieldName = 'TDATETIME'
    end
    object strngfldFrmMainSQEMPLOYNAME: TStringField
      FieldName = 'SQEMPLOYNAME'
      Size = 16
    end
    object dtmfldFrmMainAUDIT_DATETIME: TDateTimeField
      FieldName = 'AUDIT_DATETIME'
    end
    object strngfldFrmMainPZEMPLOYEENAME: TStringField
      FieldName = 'PZEMPLOYEENAME'
      Size = 16
    end
    object strngfldFrmMainABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object strngfldFrmMainREFERENCE: TStringField
      FieldName = 'REFERENCE'
      Size = 30
    end
    object atncfldFrmMainRKey58: TAutoIncField
      FieldName = 'RKey58'
      ReadOnly = True
    end
    object atncfldFrmMainRKey06: TAutoIncField
      FieldName = 'RKey06'
      ReadOnly = True
    end
    object intgrfldFrmMainSTEPNOW: TIntegerField
      FieldName = 'STEPNOW'
    end
    object strngfldFrmMainWAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object intgrfldFrmMainD549Status: TIntegerField
      FieldName = 'D549Status'
      ReadOnly = True
    end
    object adsFrmMainSALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object adsFrmMainPARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object adsFrmMainISSUED_QTY: TIntegerField
      FieldName = 'ISSUED_QTY'
    end
  end
  object qrytmp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 72
    Top = 96
  end
  object ds1: TDataSource
    DataSet = ads1
    Left = 272
    Top = 8
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
