object DM1: TDM1
  OldCreateOrder = False
  Left = 539
  Top = 303
  Height = 286
  Width = 372
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 24
  end
  object adsFrmMain: TADODataSet
    Connection = con1
    CursorType = ctStatic
    CommandText = 
      'SELECT D25.MANU_PART_NUMBER,D25.MANU_PART_DESC,D549.MRB_NO, D06.' +
      'WORK_ORDER_NUMBER, D549.QTY_REJECT,D549.D58_PTR AS RKey58,'#13#10'D549' +
      '.RKey AS RKey549,D549.WO_PTR as Rkey06,'#13#10'D05_SQ.EMPLOYEE_NAME AS' +
      ' SQR, D549.SQTime,D549.SQNote,'#13#10'D05_SH.EMPLOYEE_NAME AS SHR, D54' +
      '9.SHTime,D549.SHNote,'#13#10'D05_JS.EMPLOYEE_NAME AS JSR, D549.JSTime,' +
      'D549.JSNote,'#13#10'D34.DEPT_CODE,D34.RKey AS RKey34,'#13#10'CASE D549.Statu' +
      's WHEN 0 THEN '#39#24453#23457#26680#39#13#10'WHEN 1 THEN '#39#24050#23457#26680#39' WHEN 2 THEN '#39#24050#25509#21463','#21453#23457#26680#32467#26463#39#13#10 +
      'WHEN -1 THEN '#39#36864#22238#65292#23457#26680#26410#36890#36807#39' WHEN -2 THEN '#39#36864#22238#65292#25509#21463#26410#36890#36807#39' END AS Status'#13#10'F' +
      'ROM Data0549 D549'#13#10'LEFT JOIN Data0005 D05_SQ ON D549.SQ_D05_PTR ' +
      '= D05_SQ.RKey'#13#10'LEFT JOIN Data0005 D05_SH ON D549.SH_D05_PTR = D0' +
      '5_SH.RKey'#13#10'LEFT JOIN Data0005 D05_JS ON D549.JS_D05_PTR = D05_JS' +
      '.RKey'#13#10'LEFT JOIN Data0006 D06 ON D549.WO_PTR = D06.RKey'#13#10'LEFT JO' +
      'IN Data0056 D56 ON D56.WO_PTR=D549.WO_PTR'#13#10'LEFT JOIN Data0025 D2' +
      '5 ON D06.BOM_PTR = D25.RKey'#13#10'LEFT JOIN ('#13#10'SELECT CASE WHEN (D549' +
      '.Status= 0 OR D549.Status =-1) THEN ISNULL(D56.DEPT_PTR,D549.JS_' +
      'D34_PTR) '#13#10'WHEN D549.Status =1 THEN D549.JS_D34_PTR END AS t34Rk' +
      'ey, D549.Rkey AS TRkey '#13#10'FROM Data0549 D549 LEFT JOIN Data0056 D' +
      '56 ON D549.WO_PTR = D56.WO_PTR) T1'#13#10'ON D549.RKey = T1.TRkey'#13#10'LEF' +
      'T JOIN Data0034 D34 ON T1.t34Rkey = D34.Rkey'
    Parameters = <>
    Left = 80
    Top = 24
    object strngfldFrmMainMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object strngfldFrmMainMANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object strngfldFrmMainMRB_NO: TStringField
      FieldName = 'MRB_NO'
      Size = 10
    end
    object strngfldFrmMainWORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object intgrfldFrmMainQTY_REJECT: TIntegerField
      FieldName = 'QTY_REJECT'
    end
    object intgrfldFrmMainRKey58: TIntegerField
      FieldName = 'RKey58'
    end
    object atncfldFrmMainRKey549: TAutoIncField
      FieldName = 'RKey549'
      ReadOnly = True
    end
    object strngfldFrmMainSQR: TStringField
      FieldName = 'SQR'
      Size = 16
    end
    object dtmfldFrmMainSQTime: TDateTimeField
      FieldName = 'SQTime'
    end
    object strngfldFrmMainSQNote: TStringField
      FieldName = 'SQNote'
      Size = 50
    end
    object strngfldFrmMainSHR: TStringField
      FieldName = 'SHR'
      Size = 16
    end
    object dtmfldFrmMainSHTime: TDateTimeField
      FieldName = 'SHTime'
    end
    object strngfldFrmMainSHNote: TStringField
      FieldName = 'SHNote'
      Size = 200
    end
    object strngfldFrmMainJSR: TStringField
      FieldName = 'JSR'
      Size = 16
    end
    object dtmfldFrmMainJSTime: TDateTimeField
      FieldName = 'JSTime'
    end
    object strngfldFrmMainJSNote: TStringField
      FieldName = 'JSNote'
      Size = 200
    end
    object strngfldFrmMainDEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object atncfldFrmMainRKey34: TAutoIncField
      FieldName = 'RKey34'
      ReadOnly = True
    end
    object strngfldFrmMainStatus: TStringField
      FieldName = 'Status'
      ReadOnly = True
      Size = 17
    end
    object intgrfldFrmMainRkey06: TIntegerField
      FieldName = 'Rkey06'
    end
  end
  object qrytmp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 80
    Top = 80
  end
end
