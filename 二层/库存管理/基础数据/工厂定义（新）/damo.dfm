object DM: TDM
  OldCreateOrder = False
  Left = 533
  Top = 176
  Height = 500
  Width = 467
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security In' +
      'fo=True;User ID=WZPCBConnect;Initial Catalog=demo2;Data Source=1' +
      '92.168.8.37;Use Procedure for Prepare=1;Auto Translate=True;Pack' +
      'et Size=4096;Workstation ID=MR-LI-PC;Use Encryption for Data=Fal' +
      'se;Tag with column collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 48
  end
  object ADS15: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT     RKEY, WAREHOUSE_CODE, WAREHOUSE_NAME, ENG_NAME, ABBR_' +
      'NAME, ADDRESS_LINE_1, ADDRESS_LINE_2, STATE, ADDRESS_LINE_3, ZIP' +
      ', PHONE, FAX, WEB, TELEX, active_flag ,EMPLOYEE_PTR_1, EMPLOYEE_' +
      'PTR_2,'#13#10'EMPLOYEE_PTR_3, WAREHOUSE_TYPE, o_warehouse_name, o_addr' +
      'ess_1,  o_eng_name, o_address_2, o_address_3, o_state, o_zip, o_' +
      'phone, o_fax, o_telex, o_web, purchase_order, o_purchase_order, ' +
      'picture, o_picture,  part_batch, part_templet,date_area,date_qua' +
      'ntity FROM dbo.Data0015 where 1=1'
    EnableBCD = False
    IndexFieldNames = 'WAREHOUSE_CODE'
    Parameters = <>
    Prepared = True
    Left = 88
    Top = 112
    object ADS15RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS15WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADS15WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object ADS15ENG_NAME: TStringField
      FieldName = 'ENG_NAME'
      Size = 70
    end
    object ADS15ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADS15ADDRESS_LINE_1: TStringField
      FieldName = 'ADDRESS_LINE_1'
      Size = 70
    end
    object ADS15ADDRESS_LINE_2: TStringField
      FieldName = 'ADDRESS_LINE_2'
      Size = 70
    end
    object ADS15STATE: TStringField
      FieldName = 'STATE'
      Size = 10
    end
    object ADS15ADDRESS_LINE_3: TStringField
      FieldName = 'ADDRESS_LINE_3'
      Size = 30
    end
    object ADS15ZIP: TStringField
      FieldName = 'ZIP'
      FixedChar = True
      Size = 10
    end
    object ADS15PHONE: TStringField
      FieldName = 'PHONE'
      Size = 50
    end
    object ADS15FAX: TStringField
      FieldName = 'FAX'
      Size = 50
    end
    object ADS15WEB: TStringField
      FieldName = 'WEB'
      Size = 50
    end
    object ADS15TELEX: TStringField
      FieldName = 'TELEX'
      Size = 30
    end
    object ADS15EMPLOYEE_PTR_1: TIntegerField
      FieldName = 'EMPLOYEE_PTR_1'
    end
    object ADS15EMPLOYEE_PTR_2: TIntegerField
      FieldName = 'EMPLOYEE_PTR_2'
    end
    object ADS15EMPLOYEE_PTR_3: TIntegerField
      FieldName = 'EMPLOYEE_PTR_3'
    end
    object ADS15WAREHOUSE_TYPE: TStringField
      FieldName = 'WAREHOUSE_TYPE'
      FixedChar = True
      Size = 2
    end
    object ADS15o_warehouse_name: TStringField
      FieldName = 'o_warehouse_name'
      Size = 70
    end
    object ADS15o_address_1: TStringField
      FieldName = 'o_address_1'
      Size = 70
    end
    object ADS15o_eng_name: TStringField
      FieldName = 'o_eng_name'
      Size = 70
    end
    object ADS15o_address_2: TStringField
      FieldName = 'o_address_2'
      Size = 70
    end
    object ADS15o_address_3: TStringField
      FieldName = 'o_address_3'
      Size = 70
    end
    object ADS15o_state: TStringField
      FieldName = 'o_state'
      FixedChar = True
      Size = 10
    end
    object ADS15o_zip: TStringField
      FieldName = 'o_zip'
      FixedChar = True
      Size = 10
    end
    object ADS15o_phone: TStringField
      FieldName = 'o_phone'
      FixedChar = True
      Size = 14
    end
    object ADS15o_fax: TStringField
      FieldName = 'o_fax'
      FixedChar = True
      Size = 14
    end
    object ADS15o_telex: TStringField
      FieldName = 'o_telex'
      Size = 30
    end
    object ADS15o_web: TStringField
      FieldName = 'o_web'
      Size = 50
    end
    object ADS15purchase_order: TStringField
      FieldName = 'purchase_order'
      Size = 15
    end
    object ADS15o_purchase_order: TStringField
      FieldName = 'o_purchase_order'
      Size = 15
    end
    object ADS15picture: TBlobField
      FieldName = 'picture'
    end
    object ADS15o_picture: TBlobField
      FieldName = 'o_picture'
    end
    object ADS15part_batch: TStringField
      FieldName = 'part_batch'
      Size = 5
    end
    object ADS15part_templet: TStringField
      FieldName = 'part_templet'
      Size = 5
    end
    object ADS15active_flag: TStringField
      FieldName = 'active_flag'
      FixedChar = True
      Size = 1
    end
    object ADS15date_area: TFloatField
      FieldName = 'date_area'
    end
    object ADS15date_quantity: TIntegerField
      FieldName = 'date_quantity'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS15
    Left = 24
    Top = 112
  end
  object AQ04: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select seed_value,seed_flag from  data0004 where rkey=19')
    Left = 21
    Top = 176
    object AQ04seed_value: TStringField
      FieldName = 'seed_value'
    end
    object AQ04seed_flag: TWordField
      FieldName = 'seed_flag'
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 272
    Top = 56
  end
  object ADS05: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'empl_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select empl_code,employee_name from data0005 where rkey=:empl_pt' +
        'r')
    Left = 88
    Top = 176
  end
end
