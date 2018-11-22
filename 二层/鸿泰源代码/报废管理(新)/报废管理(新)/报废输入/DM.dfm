object dm1: Tdm1
  OldCreateOrder = False
  Left = 444
  Top = 247
  Height = 261
  Width = 347
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
      'SELECT DISTINCT '#13#10' D25.MANU_PART_NUMBER, D25.MANU_PART_DESC,D58.' +
      'MRB_NO,D06.WORK_ORDER_NUMBER,'#13#10' D58.QTY_ORG_REJ, D58.PANELS, D58' +
      '.QTY_REJECT,D39.REJECT_DESCRIPTION,D39.REJ_CODE, '#13#10' D34SQ.DEPT_C' +
      'ODE AS SQDEPTCODE, D34SQ.DEPT_NAME AS SQDEPTNAME,D34FS.DEPT_CODE' +
      ' AS FSSEPTCODE, D34FS.DEPT_NAME AS FSDEPTNAME,'#13#10' D58.TDATETIME,D' +
      '05SQ.EMPLOYEE_NAME AS SQEMPLOYNAME,D58.AUDIT_DATETIME, D05PZ.EMP' +
      'LOYEE_NAME AS PZEMPLOYEENAME,'#13#10' D15.ABBR_NAME, D58.REFERENCE, D5' +
      '8.RKey AS RKey58, D06.Rkey AS RKey06,'#13#10' D58.STEPNOW , D15.WAREHO' +
      'USE_CODE ,d60.SALES_ORDER,d60.PARTS_ORDERED,d492.ISSUED_QTY,'#13#10' (' +
      'SELECT MAX(STATUS) AS D549Status FROM Data0549 D549 where d549.D' +
      '58_PTR = D58.RKey GROUP BY D549.D58_PTR) AS D549Status,'#13#10' round(' +
      'D58.QTY_REJECT * d25.unit_sq,4) as sp1 '#13#10' FROM Data0058 D58 INNE' +
      'R JOIN Data0006 D06 ON D58.WO_PTR = D06.RKey'#13#10' INNER JOIN Data00' +
      '25 D25 ON D06.BOM_PTR = D25.RKey'#13#10' INNER JOIN Data0034 D34SQ ON ' +
      'D58.DEPT_PTR = D34SQ.RKey'#13#10' INNER JOIN Data0034 D34FS ON D58.RES' +
      'P_DEPT_PTR = D34FS.RKey'#13#10' INNER JOIN Data0039 D39 ON D58.REJECT_' +
      'PTR = D39.RKey'#13#10' INNER JOIN Data0005 D05SQ ON D58.EMPL_PTR = D05' +
      'SQ.RKey'#13#10' INNER JOIN Data0005 D05PZ ON D58.AUDIT_EMPL_PTR = D05P' +
      'Z.RKey'#13#10' INNER JOIN Data0015 D15 ON D58.warehouse_ptr = D15.RKey' +
      #13#10'LEFT JOIN data0492 d492 ON D06.CUT_NO = d492.CUT_NO'#13#10'LEFT JOIN' +
      ' Data0060 d60 ON d60.SALES_ORDER = d492.SO_NO'
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
    object adsFrmMainsp1: TFloatField
      FieldName = 'sp1'
    end
  end
  object qrytmp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 72
    Top = 96
  end
end
