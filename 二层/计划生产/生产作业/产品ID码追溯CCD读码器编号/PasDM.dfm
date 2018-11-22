object DM: TDM
  OldCreateOrder = False
  Left = 365
  Top = 259
  Height = 300
  Width = 379
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 80
    Top = 32
  end
  object Ado1410s: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT Y1410.rkey,Y1410.ccd_code,Y1410.y1417_rkey,Y1410.ccd_sn,Y' +
        '1410.supplier,Y1410.install,Y1410.remark,Y1410.IPaddress,'
      'Y1417.*,data0015.ABBR_NAME,data0034.DEPT_CODE,data0034.DEPT_NAME'
      'FROM Y1410 inner join '
      'Y1417 on Y1410.y1417_rkey=Y1417.Rkey inner join'
      'data0015 on Y1417.warehouse_ptr=data0015.Rkey inner join '
      'data0034 on Y1417.DEPT_PTR=data0034.Rkey'
      '')
    Left = 200
    Top = 40
    object Ado1410srkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Ado1410sccd_code: TStringField
      FieldName = 'ccd_code'
      Size = 10
    end
    object Ado1410sy1417_rkey: TIntegerField
      FieldName = 'y1417_rkey'
    end
    object Ado1410sccd_sn: TStringField
      FieldName = 'ccd_sn'
      Size = 50
    end
    object Ado1410ssupplier: TStringField
      FieldName = 'supplier'
      Size = 100
    end
    object Ado1410sinstall: TDateTimeField
      FieldName = 'install'
    end
    object Ado1410sremark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
    object Ado1410sRKEY_1: TAutoIncField
      FieldName = 'RKEY_1'
      ReadOnly = True
    end
    object Ado1410sFASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
    end
    object Ado1410sFASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object Ado1410sFASSET_DESC: TStringField
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object Ado1410swarehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object Ado1410sDEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object Ado1410sLOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 40
    end
    object Ado1410sREMARK_1: TStringField
      FieldName = 'REMARK_1'
      Size = 100
    end
    object Ado1410sactive_flag: TWordField
      FieldName = 'active_flag'
    end
    object Ado1410sUSER_DATE: TDateTimeField
      FieldName = 'USER_DATE'
    end
    object Ado1410sUSER_PTR: TIntegerField
      FieldName = 'USER_PTR'
    end
    object Ado1410sequipment_grade: TStringField
      FieldName = 'equipment_grade'
      Size = 50
    end
    object Ado1410sCapacity: TStringField
      FieldName = 'Capacity'
      Size = 60
    end
    object Ado1410sCapa_UNIT_PTR: TIntegerField
      FieldName = 'Capa_UNIT_PTR'
    end
    object Ado1410sRateProd: TBCDField
      FieldName = 'RateProd'
      Precision = 9
      Size = 2
    end
    object Ado1410sRate_UNIT_PTR: TIntegerField
      FieldName = 'Rate_UNIT_PTR'
    end
    object Ado1410sScan_QTY: TIntegerField
      FieldName = 'Scan_QTY'
    end
    object Ado1410sABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object Ado1410sDEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object Ado1410sDEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object Ado1410sIPaddress: TStringField
      FieldName = 'IPaddress'
      Size = 15
    end
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 280
    Top = 40
  end
  object Ado1410: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT Y1410.rkey,Y1410.ccd_code,Y1410.y1417_rkey,Y1410.ccd_sn,Y' +
        '1410.supplier,Y1410.install,Y1410.remark,Y1410.IPaddress,'
      'Y1417.*,data0015.ABBR_NAME,data0034.DEPT_CODE,data0034.DEPT_NAME'
      'FROM Y1410 inner join '
      'Y1417 on Y1410.y1417_rkey=Y1417.Rkey inner join'
      'data0015 on Y1417.warehouse_ptr=data0015.Rkey inner join '
      'data0034 on Y1417.DEPT_PTR=data0034.Rkey')
    Left = 280
    Top = 104
    object Ado1410rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Ado1410ccd_code: TStringField
      FieldName = 'ccd_code'
      Size = 10
    end
    object Ado1410y1417_rkey: TIntegerField
      FieldName = 'y1417_rkey'
    end
    object Ado1410ccd_sn: TStringField
      FieldName = 'ccd_sn'
      Size = 50
    end
    object Ado1410supplier: TStringField
      FieldName = 'supplier'
      Size = 100
    end
    object Ado1410install: TDateTimeField
      FieldName = 'install'
    end
    object Ado1410remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
    object Ado1410RKEY_1: TAutoIncField
      FieldName = 'RKEY_1'
      ReadOnly = True
    end
    object Ado1410FASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
    end
    object Ado1410FASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object Ado1410FASSET_DESC: TStringField
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object Ado1410warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object Ado1410DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object Ado1410LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 40
    end
    object Ado1410REMARK_1: TStringField
      FieldName = 'REMARK_1'
      Size = 100
    end
    object Ado1410active_flag: TWordField
      FieldName = 'active_flag'
    end
    object Ado1410USER_DATE: TDateTimeField
      FieldName = 'USER_DATE'
    end
    object Ado1410USER_PTR: TIntegerField
      FieldName = 'USER_PTR'
    end
    object Ado1410equipment_grade: TStringField
      FieldName = 'equipment_grade'
      Size = 50
    end
    object Ado1410Capacity: TStringField
      FieldName = 'Capacity'
      Size = 60
    end
    object Ado1410Capa_UNIT_PTR: TIntegerField
      FieldName = 'Capa_UNIT_PTR'
    end
    object Ado1410RateProd: TBCDField
      FieldName = 'RateProd'
      Precision = 9
      Size = 2
    end
    object Ado1410Rate_UNIT_PTR: TIntegerField
      FieldName = 'Rate_UNIT_PTR'
    end
    object Ado1410Scan_QTY: TIntegerField
      FieldName = 'Scan_QTY'
    end
    object Ado1410ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object Ado1410DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object Ado1410DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object Ado1410IPaddress: TStringField
      FieldName = 'IPaddress'
      Size = 15
    end
  end
end
