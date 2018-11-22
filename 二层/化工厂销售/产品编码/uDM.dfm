object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 380
  Top = 199
  Height = 195
  Width = 246
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    IndexFieldNames = 'rkey'
    TableName = 'Data0008'
    Left = 88
    Top = 80
    object ADOTable1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOTable1PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADOTable1PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADOTable1PR_GRP_POINTER: TIntegerField
      FieldName = 'PR_GRP_POINTER'
    end
    object ADOTable1unit_ptr: TIntegerField
      FieldName = 'unit_ptr'
    end
    object ADOTable1new_price: TBCDField
      FieldName = 'new_price'
      Precision = 8
      Size = 2
    end
    object ADOTable1qty_onhand: TBCDField
      FieldName = 'qty_onhand'
      Precision = 10
      Size = 3
    end
    object ADOTable1min_qty: TBCDField
      FieldName = 'min_qty'
      Precision = 10
      Size = 3
    end
    object ADOTable1max_qty: TBCDField
      FieldName = 'max_qty'
      Precision = 10
      Size = 3
    end
  end
  object ADOTabl_search: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    TableName = 'Data0007'
    Left = 88
    Top = 8
    object ADOTabl_searchRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOTabl_searchPR_GRP_CODE: TStringField
      FieldName = 'PR_GRP_CODE'
      Size = 5
    end
    object ADOTabl_searchPRODUCT_GROUP_NAME: TStringField
      FieldName = 'PRODUCT_GROUP_NAME'
      Size = 30
    end
  end
  object ADODataSet1: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    OnDeleteError = ADODataSet1DeleteError
    CommandText = 
      'SELECT Data0008.*, Data0002.UNIT_NAME AS cpdw, data0002.unit_cod' +
      'e,data0007.pr_grp_code,'#13#10'      Data0007.PRODUCT_GROUP_NAME AS cp' +
      'item'#13#10'FROM Data0008 INNER JOIN'#13#10'      Data0002 ON Data0008.unit_' +
      'ptr = Data0002.RKEY INNER JOIN'#13#10'      Data0007 ON Data0008.PR_GR' +
      'P_POINTER = Data0007.RKEY'
    Parameters = <>
    Left = 24
    Top = 80
    object ADODataSet1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADODataSet1PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADODataSet1PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADODataSet1PR_GRP_POINTER: TIntegerField
      FieldName = 'PR_GRP_POINTER'
    end
    object ADODataSet1unit_ptr: TIntegerField
      FieldName = 'unit_ptr'
    end
    object ADODataSet1new_price: TBCDField
      FieldName = 'new_price'
      Precision = 8
      Size = 2
    end
    object ADODataSet1qty_onhand: TBCDField
      FieldName = 'qty_onhand'
      Precision = 10
      Size = 3
    end
    object ADODataSet1min_qty: TBCDField
      FieldName = 'min_qty'
      Precision = 10
      Size = 3
    end
    object ADODataSet1max_qty: TBCDField
      FieldName = 'max_qty'
      Precision = 10
      Size = 3
    end
    object ADODataSet1cpdw: TStringField
      FieldName = 'cpdw'
    end
    object ADODataSet1cpitem: TStringField
      FieldName = 'cpitem'
      Size = 30
    end
    object ADODataSet1unit_code: TStringField
      FieldName = 'unit_code'
      Size = 5
    end
    object ADODataSet1pr_grp_code: TStringField
      FieldName = 'pr_grp_code'
      Size = 5
    end
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sa;Initi' +
      'al Catalog=SJ_V20_LIVE_2;Data Source=WINXP'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 8
  end
  object ADODSCW: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    OnDeleteError = ADODataSet1DeleteError
    CommandText = 
      'SELECT Data0002.MAX_UNIT_VALUE, Data0016.RKEY, Data0016.CODE, '#13#10 +
      '      Data0016.LOCATION, Data0016.LOCATION_TYPE, Data0016.whouse' +
      '_ptr'#13#10'FROM Data0002 RIGHT OUTER JOIN'#13#10'      Data0016 ON Data0002' +
      '.RKEY = Data0016.RKEY'
    Parameters = <>
    Left = 192
    Top = 40
    object ADODSCWMAX_UNIT_VALUE: TFloatField
      FieldName = 'MAX_UNIT_VALUE'
    end
    object ADODSCWRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADODSCWLOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 10
    end
  end
  object ADOTBKCMX: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    TableName = 'WZCP0001'
    Left = 144
    Top = 96
    object ADOTBKCMXrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOTBKCMXproc_ptr: TIntegerField
      FieldName = 'proc_ptr'
    end
    object ADOTBKCMXlocation_ptr: TIntegerField
      FieldName = 'location_ptr'
    end
    object ADOTBKCMXqty_on_hand: TBCDField
      FieldName = 'qty_on_hand'
      Precision = 10
      Size = 3
    end
  end
end
