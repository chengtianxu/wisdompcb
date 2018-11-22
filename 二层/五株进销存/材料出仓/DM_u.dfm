object DM: TDM
  OldCreateOrder = False
  Left = 452
  Top = 166
  Height = 374
  Width = 527
  object ADOCon: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security In' +
      'fo=True;User ID=wzsa;Initial Catalog=wisdompcb_u8sw;Data Source=' +
      '172.16.68.8'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 40
  end
  object ADOinvt_issue: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select * from invt_issue')
    Left = 64
    Top = 120
    object ADOinvt_issuerkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOinvt_issueGON_NUMBER: TStringField
      DisplayLabel = #20986#24211#21333#21495
      FieldName = 'GON_NUMBER'
    end
    object ADOinvt_issueTDATE: TDateTimeField
      DisplayLabel = #20986#24211#26085#26399
      FieldName = 'TDATE'
    end
    object ADOinvt_issuePO_NUMBER: TStringField
      DisplayLabel = #37319#36141#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ADOinvt_issueGROUP_DESC: TStringField
      DisplayLabel = #26448#26009#31867#22411
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object ADOinvt_issueINV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOinvt_issueINV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADOinvt_issueINV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADOinvt_issueUNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ADOinvt_issueQUANTITY: TBCDField
      DisplayLabel = #20986#24211#25968#37327
      FieldName = 'QUANTITY'
      OnChange = ADOinvt_issueQUANTITYChange
      Precision = 10
      Size = 2
    end
    object ADOinvt_issueCODE: TStringField
      DisplayLabel = #20379#24212#21830#32534#30721
      FieldName = 'CODE'
      Size = 50
    end
    object ADOinvt_issueABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object ADOinvt_issueEMPLOYEE_NAME: TStringField
      DisplayLabel = #39046#26009#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOinvt_issueLOCATION: TStringField
      DisplayLabel = #20179#24211
      FieldName = 'LOCATION'
    end
    object ADOinvt_issueWAREHOUSE_CODE: TStringField
      DisplayLabel = #39046#26009#24037#21378
      FieldName = 'WAREHOUSE_CODE'
      Size = 50
    end
    object ADOinvt_issueDEPT_NAME: TStringField
      DisplayLabel = #21457#25918#37096#38376
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADOinvt_issueissue_EMPLOYEENAME: TStringField
      DisplayLabel = #21457#26009#20154#21592
      FieldName = 'issue_EMPLOYEENAME'
      Size = 16
    end
    object ADOinvt_issueissue_area: TFloatField
      DisplayLabel = #21457#25918#38754#31215
      FieldName = 'issue_area'
    end
    object ADOinvt_issueissue_weight: TFloatField
      DisplayLabel = #21457#25918#37325#37327
      FieldName = 'issue_weight'
    end
    object ADOinvt_issueunit_sq: TFloatField
      FieldName = 'unit_sq'
      OnChange = ADOinvt_issueunit_sqChange
    end
    object ADOinvt_issueunit_weight: TFloatField
      FieldName = 'unit_weight'
      OnChange = ADOinvt_issueunit_weightChange
    end
  end
  object DS: TDataSource
    DataSet = ADOinvt_issue
    Left = 56
    Top = 192
  end
  object tmp: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 239
    Top = 92
  end
  object ADOinvt_issue1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'gon_number'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'select * from  invt_issue where gon_number=:gon_number')
    Left = 288
    Top = 168
    object ADOinvt_issue1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOinvt_issue1GON_NUMBER: TStringField
      FieldName = 'GON_NUMBER'
    end
    object ADOinvt_issue1TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object ADOinvt_issue1PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ADOinvt_issue1GROUP_DESC: TStringField
      FieldName = 'GROUP_DESC'
      Size = 70
    end
    object ADOinvt_issue1INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOinvt_issue1INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 100
    end
    object ADOinvt_issue1INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 200
    end
    object ADOinvt_issue1UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ADOinvt_issue1QUANTITY: TBCDField
      FieldName = 'QUANTITY'
      Precision = 10
      Size = 2
    end
    object ADOinvt_issue1CODE: TStringField
      FieldName = 'CODE'
      Size = 50
    end
    object ADOinvt_issue1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object ADOinvt_issue1EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOinvt_issue1LOCATION: TStringField
      FieldName = 'LOCATION'
    end
    object ADOinvt_issue1WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 50
    end
    object ADOinvt_issue1DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADOinvt_issue1issue_EMPLOYEENAME: TStringField
      FieldName = 'issue_EMPLOYEENAME'
      Size = 16
    end
    object ADOinvt_issue1issue_area: TFloatField
      FieldName = 'issue_area'
    end
    object ADOinvt_issue1issue_weight: TFloatField
      FieldName = 'issue_weight'
    end
    object ADOinvt_issue1unit_sq: TFloatField
      FieldName = 'unit_sq'
    end
    object ADOinvt_issue1unit_weight: TFloatField
      FieldName = 'unit_weight'
    end
  end
  object ADOnum: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select distinct gon_number from invt_issue ')
    Left = 152
    Top = 56
    object ADOnumgon_number: TStringField
      FieldName = 'gon_number'
    end
  end
end
