object dm: Tdm
  OldCreateOrder = False
  Left = 581
  Top = 215
  Height = 476
  Width = 421
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 32
  end
  object ADOdata0128: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select data0128.*,data0103.GL_ACC_NUMBER,data0103.GL_DESCRIPTION' +
      ','#13#10'          data0001.CURR_CODE,data0001.curr_name'#13#10'from data012' +
      '8 inner join data0001 on'#13#10'data0128.CURRENCY_PTR=data0001.rkey '#13#10 +
      ' LEFT OUTER JOIN data0103 on data0128.GL_ACCT_PTR=data0103.rkey '
    IndexFieldNames = 'BANK_NAME'
    Parameters = <>
    Left = 48
    Top = 120
    object ADOdata0128RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOdata0128BANK_NAME: TStringField
      FieldName = 'BANK_NAME'
      Size = 30
    end
    object ADOdata0128BANK_ANAME: TStringField
      FieldName = 'BANK_ANAME'
      Size = 10
    end
    object ADOdata0128BANK_ADDRESS_LINE1: TStringField
      FieldName = 'BANK_ADDRESS_LINE1'
      FixedChar = True
      Size = 30
    end
    object ADOdata0128BANK_ADDRESS_LINE2: TStringField
      FieldName = 'BANK_ADDRESS_LINE2'
      FixedChar = True
      Size = 30
    end
    object ADOdata0128BANK_ADDRESS_LINE3: TStringField
      FieldName = 'BANK_ADDRESS_LINE3'
      FixedChar = True
      Size = 30
    end
    object ADOdata0128BANK_ZIPCODE: TStringField
      FieldName = 'BANK_ZIPCODE'
      FixedChar = True
      Size = 10
    end
    object ADOdata0128BANK_PHONE: TStringField
      FieldName = 'BANK_PHONE'
      FixedChar = True
      Size = 14
    end
    object ADOdata0128BANK_FX: TStringField
      FieldName = 'BANK_FX'
      FixedChar = True
      Size = 14
    end
    object ADOdata0128BANK_ACCOUNT_NUMBER: TStringField
      FieldName = 'BANK_ACCOUNT_NUMBER'
      FixedChar = True
      Size = 14
    end
    object ADOdata0128BANK_CURRENT_CHECK: TStringField
      FieldName = 'BANK_CURRENT_CHECK'
      FixedChar = True
      Size = 10
    end
    object ADOdata0128BANK_CONTACT1: TStringField
      FieldName = 'BANK_CONTACT1'
      FixedChar = True
    end
    object ADOdata0128BANK_CONTACT2: TStringField
      FieldName = 'BANK_CONTACT2'
      FixedChar = True
    end
    object ADOdata0128BANK_CONTACT3: TStringField
      FieldName = 'BANK_CONTACT3'
      FixedChar = True
    end
    object ADOdata0128BANK_CON_PHONE1: TStringField
      FieldName = 'BANK_CON_PHONE1'
      FixedChar = True
      Size = 14
    end
    object ADOdata0128BANK_CON_PHONE2: TStringField
      FieldName = 'BANK_CON_PHONE2'
      FixedChar = True
      Size = 14
    end
    object ADOdata0128BANK_CON_PHONE3: TStringField
      FieldName = 'BANK_CON_PHONE3'
      FixedChar = True
      Size = 14
    end
    object ADOdata0128GL_ACCT_PTR: TIntegerField
      FieldName = 'GL_ACCT_PTR'
    end
    object ADOdata0128CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object ADOdata0128BAL_AMOUNT: TFloatField
      FieldName = 'BAL_AMOUNT'
    end
    object ADOdata0128GL_ACC_NUMBER: TStringField
      FieldName = 'GL_ACC_NUMBER'
      Size = 18
    end
    object ADOdata0128GL_DESCRIPTION: TStringField
      FieldName = 'GL_DESCRIPTION'
      Size = 50
    end
    object ADOdata0128CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADOdata0128curr_name: TStringField
      FieldName = 'curr_name'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOdata0128
    Left = 136
    Top = 120
  end
  object DataSource2: TDataSource
    DataSet = ADOData0520
    Left = 127
    Top = 200
  end
  object ADO0520: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <
      item
        Name = 'vptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT  * FROM  Data0520'
      'where rkey=:vptr')
    Left = 47
    Top = 272
  end
  object ADOData0520: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT  data0520.*,data0103.gl_acc_number,data0103.gl_descriptio' +
      'n,'#13#10'case data0520.ttype when 0 then '#39#25910#20837#39' when 1 then '#39#25903#20986#39' end as' +
      ' type'#13#10'FROM  Data0520'#13#10' LEFT OUTER JOIN data0103'#13#10'on data0520.gl' +
      '_acct_ptr=data0103.rkey'#13#10#13#10
    IndexFieldNames = 'NAME'
    Parameters = <>
    Left = 48
    Top = 192
    object ADOData0520RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOData0520TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object ADOData0520NAME: TStringField
      FieldName = 'NAME'
    end
    object ADOData0520DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 50
    end
    object ADOData0520GL_ACCT_PTR: TIntegerField
      FieldName = 'GL_ACCT_PTR'
    end
    object ADOData0520gl_acc_number: TStringField
      FieldName = 'gl_acc_number'
      Size = 18
    end
    object ADOData0520gl_description: TStringField
      FieldName = 'gl_description'
      Size = 50
    end
    object ADOData0520type: TStringField
      FieldName = 'type'
      ReadOnly = True
      Size = 4
    end
  end
  object aqtmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 248
    Top = 40
  end
end
