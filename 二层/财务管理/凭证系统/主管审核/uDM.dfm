object DM: TDM
  OldCreateOrder = False
  Left = 468
  Top = 182
  Height = 235
  Width = 237
  object ADOCnn: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=koimy1234;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=WISDOMPCB_BAK;Data Source=172.16.1.' +
      '57'
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 8
  end
  object ADOQ105: TADOQuery
    Connection = ADOCnn
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADOQ105CalcFields
    Parameters = <
      item
        Name = 'vYear'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'vMonth'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'vptr1'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'vptr2'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'vptr3'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'vptr4'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'vptr5'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'vstatus1'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'vstatus2'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'vstatus3'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'vstatus4'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'vstatus5'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Data0105.RKEY, Data0105.VOUCHER, Data0105.ENTERED_DT, '
      '      Data0105.ATTACHED, Data0105.VOU_TYPE, Data0105.STATUS, '
      
        '      Data0105.AUDITED_BY_EMPL_PTR, Data0105.TRANS_TYPE, Data010' +
        '5.FYEAR, '
      
        '      Data0105.PERIOD, Data0105.casher_ptr, Data0105.supervisor_' +
        'ptr, '
      
        '      Data0005.EMPLOYEE_NAME AS entered, Data0005_1.EMPLOYEE_NAM' +
        'E AS audited, '
      '      Data0005_2.EMPLOYEE_NAME AS supervisor,'
      
        'case when (data0010.cust_code is null) then '#39#20379#65306#39'+data0023.code+d' +
        'ata0023.abbr_name '
      'else '#39#23458#65306#39'+data0010.cust_code+data0010.abbr_name end as remark, '
      '      Data0005_3.EMPLOYEE_NAME AS casher'
      'FROM Data0105 INNER JOIN'
      '      Data0005 ON '
      
        '      Data0105.ENTERED_BY_EMPL_PTR = Data0005.RKEY LEFT OUTER JO' +
        'IN'
      '      Data0005 Data0005_3 ON '
      '      Data0105.casher_ptr = Data0005_3.RKEY LEFT OUTER JOIN'
      '      Data0005 Data0005_2 ON '
      '      Data0105.supervisor_ptr = Data0005_2.RKEY LEFT OUTER JOIN'
      '      Data0005 Data0005_1 ON '
      
        '      Data0105.AUDITED_BY_EMPL_PTR = Data0005_1.RKEY LEFT OUTER ' +
        'JOIN'
      
        '      Data0010 ON Data0105.CUSTOMER_PTR = Data0010.RKEY LEFT OUT' +
        'ER JOIN'
      '      Data0023 ON Data0105.SUPP_PTR = Data0023.RKEY'
      'where Data0105.FYEAR=:vYear'
      'and Data0105.PERIOD=:vMonth'
      'and Data0105.STATUS<>5'
      'and Data0105.vou_type<>:vptr1'
      'and Data0105.vou_type<>:vptr2'
      'and Data0105.vou_type<>:vptr3'
      'and Data0105.vou_type<>:vptr4'
      'and Data0105.vou_type<>:vptr5'
      'and Data0105.status<>:vstatus1'
      'and Data0105.status<>:vstatus2'
      'and Data0105.status<>:vstatus3'
      'and Data0105.status<>:vstatus4'
      'and Data0105.status<>:vstatus5'
      ''
      'order by  Data0105.VOUCHER')
    Left = 80
    Top = 64
    object ADOQ105rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQ105voucher: TStringField
      FieldName = 'voucher'
      FixedChar = True
      Size = 12
    end
    object ADOQ105entered_dt: TDateTimeField
      FieldName = 'entered_dt'
    end
    object ADOQ105employee_name: TStringField
      FieldName = 'entered'
      Size = 16
    end
    object ADOQ105vou_type: TSmallintField
      FieldName = 'vou_type'
    end
    object ADOQ105status: TSmallintField
      FieldName = 'status'
    end
    object ADOQ105audited_by_empl_ptr: TIntegerField
      FieldName = 'audited_by_empl_ptr'
    end
    object ADOQ105remark: TStringField
      FieldName = 'remark'
      ReadOnly = True
      Size = 24
    end
    object ADOQ105trans_type: TSmallintField
      FieldName = 'trans_type'
    end
    object ADOQ105fyear: TIntegerField
      FieldName = 'fyear'
    end
    object ADOQ105period: TSmallintField
      FieldName = 'period'
    end
    object ADOQ105ttype: TStringField
      FieldKind = fkCalculated
      FieldName = 'ttype'
      Calculated = True
    end
    object ADOQ105ctype: TStringField
      FieldKind = fkCalculated
      FieldName = 'ctype'
      Calculated = True
    end
    object ADOQ105cstatus: TStringField
      FieldKind = fkCalculated
      FieldName = 'cstatus'
      Calculated = True
    end
    object ADOQ105audited: TStringField
      FieldName = 'audited'
      Size = 16
    end
    object ADOQ105casher: TStringField
      FieldName = 'casher'
      Size = 16
    end
    object ADOQ105supervisor: TStringField
      FieldName = 'supervisor'
      Size = 16
    end
    object ADOQ105casher_ptr: TIntegerField
      FieldName = 'casher_ptr'
    end
    object ADOQ105supervisor_ptr: TIntegerField
      FieldName = 'supervisor_ptr'
    end
    object ADOQ105attached: TSmallintField
      FieldName = 'attached'
    end
  end
  object ADODS106: TADODataSet
    Connection = ADOCnn
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADODS106CalcFields
    CommandText = 
      'SELECT Data0103_3.GL_ACC_NUMBER, Data0103_3.GL_DESCRIPTION,Data0' +
      '001.CURR_NAME, Data0103_2.GL_DESCRIPTION AS tGL_DESCRIPTION,Data' +
      '0103_1.GL_DESCRIPTION AS pGL_DESCRIPTION, Data0106.GL_HEADER_PTR' +
      ',Data0106.RKEY, Data0106.GL_ACCT_NO_PTR, Data0106.REF_NUMBER,Dat' +
      'a0106.DESCRIPTION, Data0106.SRCE_PTR, Data0106.AMOUNT, Data0106.' +
      'D_C,Data0106.FYEAR, Data0106.PERIOD, Data0106.INV_PTR, Data0106.' +
      'UNIT_PTR,Data0106.CURR_PTR, Data0106.PRICE, Data0106.EXCH_RATE,D' +
      'ata0001.CURR_CODE FROM Data0103 Data0103_1 LEFT OUTER JOIN Data0' +
      '103 Data0103_2 ON  Data0103_1.PARENT_PTR = Data0103_2.RKEY RIGHT' +
      ' OUTER JOIN Data0103 Data0103_3 INNER JOIN Data0106 ON Data0103_' +
      '3.RKEY = Data0106.GL_ACCT_NO_PTR INNER JOIN Data0001 ON Data0106' +
      '.CURR_PTR = Data0001.RKEY ON Data0103_1.RKEY = Data0103_3.PARENT' +
      '_PTR WHERE (Data0106.GL_HEADER_PTR =:rkey)'#13#10
    DataSource = DataSource1
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 80
    Top = 112
    object ADODS106GL_ACC_NUMBER: TStringField
      FieldName = 'GL_ACC_NUMBER'
      FixedChar = True
      Size = 18
    end
    object ADODS106GL_DESCRIPTION: TStringField
      FieldName = 'GL_DESCRIPTION'
      Size = 50
    end
    object ADODS106CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ADODS106tGL_DESCRIPTION: TStringField
      FieldName = 'tGL_DESCRIPTION'
      Size = 50
    end
    object ADODS106pGL_DESCRIPTION: TStringField
      FieldName = 'pGL_DESCRIPTION'
      Size = 50
    end
    object ADODS106GL_HEADER_PTR: TIntegerField
      FieldName = 'GL_HEADER_PTR'
    end
    object ADODS106RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADODS106GL_ACCT_NO_PTR: TIntegerField
      FieldName = 'GL_ACCT_NO_PTR'
    end
    object ADODS106REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      Size = 10
    end
    object ADODS106DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 100
    end
    object ADODS106SRCE_PTR: TIntegerField
      FieldName = 'SRCE_PTR'
    end
    object ADODS106AMOUNT: TBCDField
      FieldName = 'AMOUNT'
      Precision = 18
      Size = 2
    end
    object ADODS106D_C: TStringField
      DisplayWidth = 5
      FieldName = 'D_C'
      FixedChar = True
      Size = 1
    end
    object ADODS106FYEAR: TIntegerField
      FieldName = 'FYEAR'
    end
    object ADODS106PERIOD: TSmallintField
      FieldName = 'PERIOD'
    end
    object ADODS106INV_PTR: TIntegerField
      FieldName = 'INV_PTR'
    end
    object ADODS106UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object ADODS106CURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
    object ADODS106PRICE: TFloatField
      FieldName = 'PRICE'
    end
    object ADODS106EXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
    end
    object ADODS106CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADODS106Cgl_Acc: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Cgl_Acc'
      Size = 152
      Calculated = True
    end
  end
  object ADOQ: TADOQuery
    Connection = ADOCnn
    Parameters = <>
    Left = 176
    Top = 112
  end
  object DataSource1: TDataSource
    DataSet = ADOQ105
    Left = 24
    Top = 64
  end
  object DataSource2: TDataSource
    DataSet = ADODS106
    Left = 24
    Top = 112
  end
end
