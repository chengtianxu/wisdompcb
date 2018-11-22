object dm: Tdm
  OldCreateOrder = True
  Left = 1104
  Top = 110
  Height = 250
  VerticalOffset = 4
  Width = 363
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLNCLI.1'
    Left = 32
    Top = 8
  end
  object DS100: TDataSource
    DataSet = ADS100
    Left = 72
    Top = 64
  end
  object AQTMP: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 24
    Top = 168
  end
  object DS_pickitem: TDataSource
    DataSet = CDS_pickitem
    Left = 256
    Top = 120
  end
  object ADS_pickitem: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterOpen = ADS_pickitemAfterOpen
    CommandText = 
      'declare @isselected bit '#13#10'select @isselected=0'#13#10'select @isselect' +
      'ed as isselected,rkey,cust_code,customer_name, ABBR_NAME from da' +
      'ta0010 order by cust_code'#13#10
    Parameters = <>
    Left = 24
    Top = 120
    object ADS_pickitemisselected: TBooleanField
      FieldName = 'isselected'
    end
    object ADS_pickitemrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS_pickitemcust_code: TStringField
      FieldName = 'cust_code'
      ReadOnly = True
      Size = 10
    end
    object ADS_pickitemcustomer_name: TStringField
      FieldName = 'customer_name'
      ReadOnly = True
      Size = 100
    end
    object ADS_pickitemABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
  end
  object ADS100: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterOpen = ADS100AfterOpen
    AfterClose = ADS100AfterClose
    CommandText = 
      'select d100.csi_ptr,d100.customer_ptr,d73.user_login_name,d73.us' +
      'er_full_name,d10.cust_code,d10.customer_name, ABBR_NAME'#13#10'from da' +
      'ta0073 d73 inner join data0100 d100 on d73.rkey=d100.csi_ptr'#13#10'in' +
      'ner join data0010 d10 on d10.rkey=d100.customer_ptr'#13#10'where 1=0'
    IndexFieldNames = 'cust_code;user_login_name'
    Parameters = <>
    Left = 24
    Top = 64
    object ADS100csi_ptr: TIntegerField
      FieldName = 'csi_ptr'
    end
    object ADS100customer_ptr: TIntegerField
      FieldName = 'customer_ptr'
    end
    object ADS100user_login_name: TStringField
      FieldName = 'user_login_name'
      Size = 15
    end
    object ADS100user_full_name: TStringField
      FieldName = 'user_full_name'
      Size = 30
    end
    object ADS100cust_code: TStringField
      FieldName = 'cust_code'
      Size = 10
    end
    object ADS100customer_name: TStringField
      FieldName = 'customer_name'
      Size = 100
    end
    object ADS100ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
  end
  object AQ100: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0100 d100')
    Left = 120
    Top = 64
  end
  object CDS_pickitem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_pickitem'
    Left = 184
    Top = 120
    object CDS_pickitemisselected: TBooleanField
      FieldName = 'isselected'
    end
    object CDS_pickitemrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object CDS_pickitemcust_code: TStringField
      FieldName = 'cust_code'
      ReadOnly = True
      Size = 10
    end
    object CDS_pickitemcustomer_name: TStringField
      FieldName = 'customer_name'
      ReadOnly = True
      Size = 100
    end
    object CDS_pickitemABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
  end
  object DSP_pickitem: TDataSetProvider
    DataSet = ADS_pickitem
    Left = 104
    Top = 120
  end
end
