object dm: Tdm
  OldCreateOrder = False
  Left = 928
  Top = 354
  Height = 366
  Width = 454
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
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
      'ed as isselected,rkey,PROD_CODE,PRODUCT_NAME from data0008 where' +
      ' if_control<>0 order by PROD_CODE'
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
      FieldName = 'PROD_CODE'
      ReadOnly = True
      Size = 10
    end
    object ADS_pickitemcustomer_name: TStringField
      FieldName = 'PRODUCT_NAME'
      ReadOnly = True
      Size = 100
    end
  end
  object ADS100: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterOpen = ADS100AfterOpen
    AfterClose = ADS100AfterClose
    CommandText = 
      'select w100.csi_ptr,w100.proc_ptr,d73.user_login_name,d73.user_f' +
      'ull_name,d8.PROD_CODE,d8.PRODUCT_NAME,d8.PRODUCT_DESC   '#13#10'from d' +
      'ata0073 d73 inner join wzcp0100 w100 on d73.rkey=w100.csi_ptr'#13#10'i' +
      'nner join data0008 d8 on d8.rkey=w100.proc_ptr'#13#10'where 1=0'
    IndexFieldNames = 'PROD_CODE;user_login_name'
    Parameters = <>
    Left = 24
    Top = 64
    object ADS100csi_ptr: TIntegerField
      FieldName = 'csi_ptr'
    end
    object ADS100proc_ptr: TIntegerField
      FieldName = 'proc_ptr'
    end
    object ADS100user_login_name: TStringField
      FieldName = 'user_login_name'
      Size = 15
    end
    object ADS100user_full_name: TStringField
      FieldName = 'user_full_name'
      Size = 30
    end
    object ADS100PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 25
    end
    object ADS100PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADS100PRODUCT_DESC: TStringField
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
  end
  object AQ100: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from wzcp0100 w100')
    Left = 120
    Top = 64
  end
  object DSP_pickitem: TDataSetProvider
    DataSet = ADS_pickitem
    Left = 104
    Top = 120
  end
  object CDS_pickitem: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 112
  end
end
