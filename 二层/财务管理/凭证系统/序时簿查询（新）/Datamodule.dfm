object DM: TDM
  OldCreateOrder = False
  Left = 551
  Top = 303
  Height = 318
  Width = 290
  object ADOCnn: TADOConnection
    ConnectionTimeout = 25
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 8
  end
  object tmp: TADOQuery
    Connection = ADOCnn
    LockType = ltReadOnly
    Parameters = <>
    Left = 88
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ADODS106
    Left = 49
    Top = 72
  end
  object ADODS106: TADOQuery
    Connection = ADOCnn
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADODS106CalcFields
    Parameters = <
      item
        Name = 'vDt1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'vDt2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
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
      end
      item
        Name = 'vstatus6'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0105.RKEY, dbo.Data0105.VOUCHER, dbo.Data0105' +
        '.ENTERED_DT, dbo.Data0105.ATTACHED,'
      
        'case dbo.Data0105.VOU_TYPE when 0 then '#39#36716#36134#20973#35777#39' when 1 then '#39#20184#27454#20973#35777#39 +
        ' when 2 then '#39#25910#27454#20973#35777#39' when 3 then '#39#25910'/'#20184#27454#20973#35777#39' when 4 then '#39#29305#27530#36716#36134#20973#35777#39' en' +
        'd as VOU_TYPE, '
      
        '                      case dbo.Data0105.STATUS when 0 then '#39#26410#23457#26680#39 +
        ' when 1 then '#39#20250#35745#24050#23457#39' when 2 then '#39#20027#31649#24050#23457#39' when 3 then '#39#24050#30331#24080#39' when 4 ' +
        'then '#39#20986#32435#24050#23457#39' when 5 then '#39#34987#20316#24223#39' end as sSTATUS,'
      '                      dbo.Data0105.AUDITED_BY_EMPL_PTR,'
      
        'case dbo.Data0105.TRANS_TYPE when 1 then '#39#26448#26009#24212#20184#20837#24080#39'  when 2 then '#39 +
        #26434#39033#24212#20184#20837#24080#39' when 3 then '#39#24212#20184#20184#27454#39' when 4 then '#39#20511#39033#22791#24536#39' when 5 then '#39#24212#25910#20837#24080#39 +
        ' when 6 then '#39#25910#27454#22788#29702#39' '
      
        'when 7 then '#39#36151#39033#22791#24536#39' when 8 then '#39#21457#20986#21830#21697#39' when 9 then '#39#20854#23427#39' when 10 t' +
        'hen '#39#38134#34892#36716#36134#39' when 12 then '#39#20379#24212#21830#31246#31080#20837#24080#39' end as TRANS_TYPE,'
      '                      dbo.Data0105.FYEAR, dbo.Data0105.PERIOD, '
      
        '                      dbo.Data0105.casher_ptr, dbo.Data0105.supe' +
        'rvisor_ptr, dbo.Data0005.EMPLOYEE_NAME AS entered, Data0005_1.EM' +
        'PLOYEE_NAME AS audited, '
      
        '                      Data0005_2.EMPLOYEE_NAME AS supervisor,Dat' +
        'a0005_3.EMPLOYEE_NAME AS casher,dbo.Data0105.BATCH_NUMBER,'
      
        '                      data0023.code,data0023.abbr_name as abbr_n' +
        'ame23,data0010.cust_code,data0010.abbr_name as abbr_name10, '
      
        '                      dbo.Data0103.GL_ACC_NUMBER,dbo.Data0103.GL' +
        '_DESCRIPTION, Data0103_1.GL_DESCRIPTION AS father_desc,Data0103_' +
        '2.GL_DESCRIPTION AS grandfather_desc, '
      
        '                      dbo.Data0001.CURR_CODE, CASE WHEN Data0106' +
        '.EXCH_RATE > 0 THEN round(1 / Data0106.EXCH_RATE, 4) ELSE 0 END ' +
        'AS exch_rate, dbo.Data0106.GL_HEADER_PTR, '
      
        '                      dbo.Data0106.RKEY AS Expr1, dbo.Data0106.G' +
        'L_ACCT_NO_PTR, dbo.Data0106.REF_NUMBER, dbo.Data0106.DESCRIPTION' +
        ', '
      
        '                      dbo.Data0106.SRCE_PTR, dbo.Data0106.AMOUNT' +
        ', case dbo.Data0106.D_C when '#39'D'#39' then '#39#20511#39' when '#39'C'#39' then '#39#36151#39' end ' +
        'as D_C, dbo.Data0106.FYEAR AS Expr2, dbo.Data0106.PERIOD AS Expr' +
        '3, '
      
        '                      dbo.Data0106.INV_PTR, dbo.Data0106.UNIT_PT' +
        'R, dbo.Data0106.CURR_PTR, dbo.Data0106.PRICE               '
      'FROM         dbo.Data0106 INNER JOIN'
      
        '                      dbo.Data0103 ON dbo.Data0106.GL_ACCT_NO_PT' +
        'R = dbo.Data0103.RKEY INNER JOIN'
      
        '                      dbo.Data0105 ON dbo.Data0106.GL_HEADER_PTR' +
        ' = dbo.Data0105.RKEY INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.Data0105.ENTERED_BY_EM' +
        'PL_PTR = dbo.Data0005.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0005 AS Data0005_3 ON dbo.Data0105' +
        '.casher_ptr = Data0005_3.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0005 AS Data0005_2 ON dbo.Data0105' +
        '.supervisor_ptr = Data0005_2.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0005 AS Data0005_1 ON dbo.Data0105' +
        '.AUDITED_BY_EMPL_PTR = Data0005_1.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0023 ON dbo.Data0105.SUPP_PTR = db' +
        'o.Data0023.RKEY  LEFT OUTER JOIN'
      
        '                      dbo.Data0010 ON dbo.Data0105.CUSTOMER_PTR ' +
        '= dbo.Data0010.RKEY INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.Data0106.CURR_PTR = db' +
        'o.Data0001.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0103 AS Data0103_2 RIGHT OUTER JOI' +
        'N'
      
        '                      dbo.Data0103 AS Data0103_1 ON Data0103_2.R' +
        'KEY = Data0103_1.PARENT_PTR ON dbo.Data0103.PARENT_PTR = Data010' +
        '3_1.RKEY'
      'where Data0105.ENTERED_DT >=:vDt1'
      'and Data0105.ENTERED_DT<:vDt2'
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
      'and Data0105.status <> :vstatus6')
    Left = 128
    Top = 72
    object ADODS106RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADODS106VOUCHER: TStringField
      FieldName = 'VOUCHER'
      Size = 12
    end
    object ADODS106ENTERED_DT: TDateTimeField
      FieldName = 'ENTERED_DT'
    end
    object ADODS106ATTACHED: TSmallintField
      FieldName = 'ATTACHED'
    end
    object ADODS106VOU_TYPE: TStringField
      FieldName = 'VOU_TYPE'
      ReadOnly = True
      Size = 12
    end
    object ADODS106sSTATUS: TStringField
      FieldName = 'sSTATUS'
      ReadOnly = True
      Size = 8
    end
    object ADODS106AUDITED_BY_EMPL_PTR: TIntegerField
      FieldName = 'AUDITED_BY_EMPL_PTR'
    end
    object ADODS106TRANS_TYPE: TStringField
      FieldName = 'TRANS_TYPE'
      ReadOnly = True
      Size = 14
    end
    object ADODS106FYEAR: TIntegerField
      FieldName = 'FYEAR'
    end
    object ADODS106PERIOD: TSmallintField
      FieldName = 'PERIOD'
    end
    object ADODS106casher_ptr: TIntegerField
      FieldName = 'casher_ptr'
    end
    object ADODS106supervisor_ptr: TIntegerField
      FieldName = 'supervisor_ptr'
    end
    object ADODS106entered: TStringField
      FieldName = 'entered'
      Size = 16
    end
    object ADODS106audited: TStringField
      FieldName = 'audited'
      Size = 16
    end
    object ADODS106supervisor: TStringField
      FieldName = 'supervisor'
      Size = 16
    end
    object ADODS106casher: TStringField
      FieldName = 'casher'
      Size = 16
    end
    object ADODS106BATCH_NUMBER: TStringField
      FieldName = 'BATCH_NUMBER'
      Size = 16
    end
    object ADODS106code: TStringField
      FieldName = 'code'
      Size = 10
    end
    object ADODS106abbr_name23: TStringField
      FieldName = 'abbr_name23'
      Size = 16
    end
    object ADODS106cust_code: TStringField
      FieldName = 'cust_code'
      Size = 10
    end
    object ADODS106abbr_name10: TStringField
      FieldName = 'abbr_name10'
      Size = 10
    end
    object ADODS106GL_ACC_NUMBER: TStringField
      FieldName = 'GL_ACC_NUMBER'
      Size = 18
    end
    object ADODS106GL_DESCRIPTION: TStringField
      FieldName = 'GL_DESCRIPTION'
      Size = 50
    end
    object ADODS106father_desc: TStringField
      FieldName = 'father_desc'
      Size = 50
    end
    object ADODS106grandfather_desc: TStringField
      FieldName = 'grandfather_desc'
      Size = 50
    end
    object ADODS106CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADODS106exch_rate: TBCDField
      FieldName = 'exch_rate'
      ReadOnly = True
      Precision = 22
      Size = 13
    end
    object ADODS106GL_HEADER_PTR: TIntegerField
      FieldName = 'GL_HEADER_PTR'
    end
    object ADODS106Expr1: TIntegerField
      FieldName = 'Expr1'
      ReadOnly = True
    end
    object ADODS106GL_ACCT_NO_PTR: TIntegerField
      FieldName = 'GL_ACCT_NO_PTR'
    end
    object ADODS106REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
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
      Precision = 14
      Size = 2
    end
    object ADODS106D_C: TStringField
      FieldName = 'D_C'
      ReadOnly = True
      Size = 2
    end
    object ADODS106Expr2: TIntegerField
      FieldName = 'Expr2'
    end
    object ADODS106Expr3: TSmallintField
      FieldName = 'Expr3'
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
    object ADODS106PRICE: TBCDField
      FieldName = 'PRICE'
      Precision = 14
      Size = 2
    end
    object ADODS106self_desc: TStringField
      FieldKind = fkCalculated
      FieldName = 'self_desc'
      Size = 150
      Calculated = True
    end
  end
end
