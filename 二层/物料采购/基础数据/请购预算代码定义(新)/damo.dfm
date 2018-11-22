object dm: Tdm
  OldCreateOrder = False
  Left = 880
  Top = 269
  Height = 378
  Width = 393
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = ADS362
    Left = 40
    Top = 96
  end
  object ADS362: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'select RKEY ,CODE,DESCRIPTION,bud_year '#13#10', BUDGET_PERIOD_1, BUDG' +
      'ET_PERIOD_2, '#13#10'BUDGET_PERIOD_3, BUDGET_PERIOD_4,'#13#10' BUDGET_PERIOD' +
      '_5, BUDGET_PERIOD_6, '#13#10'BUDGET_PERIOD_7, BUDGET_PERIOD_8, '#13#10'BUDGE' +
      'T_PERIOD_9, BUDGET_PERIOD_10, '#13#10'BUDGET_PERIOD_11, BUDGET_PERIOD_' +
      '12,'#13#10'USED_PERIOD_1, USED_PERIOD_2, USED_PERIOD_3,'#13#10' USED_PERIOD_' +
      '4, USED_PERIOD_5, USED_PERIOD_6,'#13#10' USED_PERIOD_7, USED_PERIOD_8,' +
      ' USED_PERIOD_9,'#13#10' USED_PERIOD_10, USED_PERIOD_11, USED_PERIOD_12' +
      #13#10'from data0362'#13#10'where 1=1'#13#10
    EnableBCD = False
    IndexFieldNames = 'code'
    Parameters = <>
    Prepared = True
    Left = 104
    Top = 96
    object ADS362RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS362CODE: TStringField
      DisplayLabel = #39044#31639#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object ADS362DESCRIPTION: TStringField
      DisplayLabel = #39044#31639#21517#31216
      FieldName = 'DESCRIPTION'
      Size = 40
    end
    object ADS362bud_year: TIntegerField
      DisplayLabel = #39044#31639#24180#24230
      FieldName = 'bud_year'
    end
    object ADS362BUDGET_PERIOD_1: TFloatField
      FieldName = 'BUDGET_PERIOD_1'
    end
    object ADS362BUDGET_PERIOD_2: TFloatField
      FieldName = 'BUDGET_PERIOD_2'
    end
    object ADS362BUDGET_PERIOD_3: TFloatField
      FieldName = 'BUDGET_PERIOD_3'
    end
    object ADS362BUDGET_PERIOD_4: TFloatField
      FieldName = 'BUDGET_PERIOD_4'
    end
    object ADS362BUDGET_PERIOD_5: TFloatField
      FieldName = 'BUDGET_PERIOD_5'
    end
    object ADS362BUDGET_PERIOD_6: TFloatField
      FieldName = 'BUDGET_PERIOD_6'
    end
    object ADS362BUDGET_PERIOD_7: TFloatField
      FieldName = 'BUDGET_PERIOD_7'
    end
    object ADS362BUDGET_PERIOD_8: TFloatField
      FieldName = 'BUDGET_PERIOD_8'
    end
    object ADS362BUDGET_PERIOD_9: TFloatField
      FieldName = 'BUDGET_PERIOD_9'
    end
    object ADS362BUDGET_PERIOD_10: TFloatField
      FieldName = 'BUDGET_PERIOD_10'
    end
    object ADS362BUDGET_PERIOD_11: TFloatField
      FieldName = 'BUDGET_PERIOD_11'
    end
    object ADS362BUDGET_PERIOD_12: TFloatField
      FieldName = 'BUDGET_PERIOD_12'
    end
    object ADS362USED_PERIOD_1: TFloatField
      FieldName = 'USED_PERIOD_1'
    end
    object ADS362USED_PERIOD_2: TFloatField
      FieldName = 'USED_PERIOD_2'
    end
    object ADS362USED_PERIOD_3: TFloatField
      FieldName = 'USED_PERIOD_3'
    end
    object ADS362USED_PERIOD_4: TFloatField
      FieldName = 'USED_PERIOD_4'
    end
    object ADS362USED_PERIOD_5: TFloatField
      FieldName = 'USED_PERIOD_5'
    end
    object ADS362USED_PERIOD_6: TFloatField
      FieldName = 'USED_PERIOD_6'
    end
    object ADS362USED_PERIOD_7: TFloatField
      FieldName = 'USED_PERIOD_7'
    end
    object ADS362USED_PERIOD_8: TFloatField
      FieldName = 'USED_PERIOD_8'
    end
    object ADS362USED_PERIOD_9: TFloatField
      FieldName = 'USED_PERIOD_9'
    end
    object ADS362USED_PERIOD_10: TFloatField
      FieldName = 'USED_PERIOD_10'
    end
    object ADS362USED_PERIOD_11: TFloatField
      FieldName = 'USED_PERIOD_11'
    end
    object ADS362USED_PERIOD_12: TFloatField
      FieldName = 'USED_PERIOD_12'
    end
  end
  object ads363: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT     Data0073.USER_FULL_NAME, Data0073.USER_LOGIN_NAME, '#13#10 +
      'case Data0073.ACTIVE_FLAG when '#39'1'#39' then '#39#31163#32844#20154#21592#39'  else '#39#22312#32844#20154#21592#39' end ' +
      ' as '#39'ACTIVE_FLAG'#39','#13#10'Data0363.USER_PTR,'#13#10'data0363.BUDGET_PTR'#13#10'FRO' +
      'M         '#13#10'Data0363 INNER JOIN '#13#10'Data0073 ON Data0363.USER_PTR ' +
      '= Data0073.RKEY'#13#10'where data0363.BUDGET_PTR = :RKEY'
    DataSource = DataSource1
    IndexFieldNames = 'BUDGET_PTR'
    MasterFields = 'RKEY'
    Parameters = <
      item
        Name = 'RKEY'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 196
      end>
    Left = 104
    Top = 152
    object ads363USER_FULL_NAME: TStringField
      DisplayLabel = #29992#21517#22995#21517
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ads363USER_LOGIN_NAME: TStringField
      DisplayLabel = #29992#25143#32534#30721
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object ads363USER_PTR: TIntegerField
      FieldName = 'USER_PTR'
    end
    object ads363BUDGET_PTR: TIntegerField
      FieldName = 'BUDGET_PTR'
    end
    object ads363ACTIVE_FLAG: TStringField
      FieldName = 'ACTIVE_FLAG'
      ReadOnly = True
      Size = 8
    end
  end
  object DataSource2: TDataSource
    DataSet = ads363
    Left = 40
    Top = 152
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 104
    Top = 216
  end
end
