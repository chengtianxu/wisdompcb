object DM: TDM
  OldCreateOrder = False
  Left = 375
  Top = 214
  Height = 403
  Width = 382
  object ADOCon: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 24
  end
  object ADO517: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    AfterOpen = ADO517AfterScroll
    AfterScroll = ADO517AfterScroll
    Parameters = <>
    SQL.Strings = (
      
        'select rkey,fasset_code,fasset_name,fasset_desc,book_date from d' +
        'ata0517 where active_flag=1')
    Left = 32
    Top = 112
    object ADO517rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO517fasset_code: TStringField
      DisplayLabel = #21345#29255#21495
      FieldName = 'fasset_code'
      Size = 10
    end
    object ADO517fasset_name: TStringField
      DisplayLabel = #36164#20135#21517#31216
      FieldName = 'fasset_name'
      Size = 30
    end
    object ADO517fasset_desc: TStringField
      DisplayLabel = #36164#20135#35268#26684
      FieldName = 'fasset_desc'
      Size = 40
    end
    object ADO517book_date: TDateTimeField
      DisplayLabel = #20837#24080#26085#26399
      FieldName = 'book_date'
    end
  end
  object ADO517_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey517'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0517.RKEY, dbo.Data0517.FASSET_CODE, dbo.Data' +
        '0517.FASSET_NAME, dbo.Data0517.FASSET_DESC, dbo.Data0514.FASSET_' +
        'TYPE, '
      
        '                      dbo.Data0517.FASSET_TYPE_PTR, dbo.Data0517' +
        '.ALT_TYPE_PTR, dbo.Data0515.FASSET_ALT_TYPE, dbo.Data0517.STATUS' +
        '_PTR, '
      
        '                      dbo.Data0516.FASSET_STATUS, dbo.Data0517.O' +
        'RIGINAL_VALUE, dbo.Data0517.SUMMED_DEPRE, dbo.Data0517.NET_VALUE' +
        ', '
      
        '                      dbo.Data0517.LOCATION, dbo.Data0517.BOOK_D' +
        'ATE, dbo.Data0517.SURPLUS_RATE, dbo.Data0517.SURPLUS, dbo.Data05' +
        '17.DEPRE_MTHD_PTR, '
      
        '                      dbo.Data0517.EXPECTED_LIFE_MONTHS, dbo.Dat' +
        'a0517.DEPRED_MONTHS, dbo.Data0517.MONTH_DEPRE_RATE, '
      
        '                      dbo.Data0517.MONTH_DEPRE_AMT, dbo.Data0517' +
        '.REMARK, dbo.Data0517.id_code, dbo.Data0517.orig_original_value,' +
        ' dbo.Data0517.USER_DATE, '
      
        '                      dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.' +
        'abbr_NAME, dbo.Data0103.GL_ACC_NUMBER, dbo.Data0103.GL_DESCRIPTI' +
        'ON,'
      
        '                      D103.GL_ACC_NUMBER Depre_GL_ACC_NUMBER, D1' +
        '03.GL_DESCRIPTION depre_GL_DESCRIPTION,dbo.Data0517.depre_acct_p' +
        'tr,dbo.Data0517.warehouse_ptr'
      'FROM         dbo.Data0517 INNER JOIN'
      
        '                      dbo.Data0514 ON dbo.Data0517.FASSET_TYPE_P' +
        'TR = dbo.Data0514.RKEY INNER JOIN'
      
        '                      dbo.Data0515 ON dbo.Data0517.ALT_TYPE_PTR ' +
        '= dbo.Data0515.RKEY INNER JOIN'
      
        '                      dbo.Data0516 ON dbo.Data0517.STATUS_PTR = ' +
        'dbo.Data0516.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.Data0517.warehouse_ptr' +
        ' = dbo.Data0015.RKEY INNER JOIN'
      
        '                      dbo.Data0103 ON dbo.Data0517.fasset_gl_ptr' +
        ' = dbo.Data0103.RKEY   INNER JOIN'
      
        '                       dbo.Data0103 D103 ON dbo.Data0517.depre_a' +
        'cct_ptr = D103.RKEY'
      '                    '
      'where data0517.rkey=:rkey517')
    Left = 32
    Top = 184
    object ADO517_1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO517_1FASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
      Size = 10
    end
    object ADO517_1FASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object ADO517_1FASSET_DESC: TStringField
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object ADO517_1FASSET_TYPE: TStringField
      DisplayLabel = 'l'#31867#21035
      FieldName = 'FASSET_TYPE'
    end
    object ADO517_1FASSET_TYPE_PTR: TSmallintField
      FieldName = 'FASSET_TYPE_PTR'
    end
    object ADO517_1ALT_TYPE_PTR: TSmallintField
      FieldName = 'ALT_TYPE_PTR'
    end
    object ADO517_1FASSET_ALT_TYPE: TStringField
      DisplayLabel = #22686#20943#26041#24335
      FieldName = 'FASSET_ALT_TYPE'
      FixedChar = True
    end
    object ADO517_1STATUS_PTR: TSmallintField
      FieldName = 'STATUS_PTR'
    end
    object ADO517_1FASSET_STATUS: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'FASSET_STATUS'
    end
    object ADO517_1ORIGINAL_VALUE: TFloatField
      DisplayLabel = #21407#20540
      FieldName = 'ORIGINAL_VALUE'
      DisplayFormat = '#,###.00'
    end
    object ADO517_1SUMMED_DEPRE: TFloatField
      DisplayLabel = #32047#35745#25240#26087
      FieldName = 'SUMMED_DEPRE'
      DisplayFormat = '#,###.00'
    end
    object ADO517_1NET_VALUE: TFloatField
      DisplayLabel = #20928#20540
      FieldName = 'NET_VALUE'
      DisplayFormat = '#,###.00'
    end
    object ADO517_1LOCATION: TStringField
      DisplayLabel = #20301#32622
      FieldName = 'LOCATION'
      Size = 40
    end
    object ADO517_1BOOK_DATE: TDateTimeField
      DisplayLabel = #20837#24080#26085#26399
      FieldName = 'BOOK_DATE'
    end
    object ADO517_1SURPLUS_RATE: TFloatField
      DisplayLabel = #27531#20540#29575
      FieldName = 'SURPLUS_RATE'
    end
    object ADO517_1SURPLUS: TFloatField
      DisplayLabel = #20928#27531#20540
      FieldName = 'SURPLUS'
      DisplayFormat = '#,###.00'
    end
    object ADO517_1DEPRE_MTHD_PTR: TSmallintField
      FieldName = 'DEPRE_MTHD_PTR'
      OnGetText = ADO517_1DEPRE_MTHD_PTRGetText
    end
    object ADO517_1EXPECTED_LIFE_MONTHS: TFloatField
      DisplayLabel = #39044#35745#20351#29992#26376#20221
      FieldName = 'EXPECTED_LIFE_MONTHS'
    end
    object ADO517_1DEPRED_MONTHS: TFloatField
      DisplayLabel = #24050#35745#25552#26376#20221
      FieldName = 'DEPRED_MONTHS'
    end
    object ADO517_1MONTH_DEPRE_RATE: TFloatField
      DisplayLabel = #26376#25240#26087#29575
      FieldName = 'MONTH_DEPRE_RATE'
      DisplayFormat = '#,##0.0000'
    end
    object ADO517_1MONTH_DEPRE_AMT: TBCDField
      DisplayLabel = #26376#25240#26087#39069
      FieldName = 'MONTH_DEPRE_AMT'
      DisplayFormat = '#,###.00'
      Precision = 19
      Size = 2
    end
    object ADO517_1GL_ACC_NUMBER: TStringField
      DisplayLabel = #22266#23450#36164#20135#31185#30446
      FieldName = 'GL_ACC_NUMBER'
      Size = 18
    end
    object ADO517_1GL_DESCRIPTION: TStringField
      DisplayLabel = #22266#23450#36164#20135#31185#30446#21517#31216
      FieldName = 'GL_DESCRIPTION'
      Size = 50
    end
    object ADO517_1REMARK: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REMARK'
      Size = 100
    end
    object ADO517_1id_code: TStringField
      DisplayLabel = #36164#20135#32534#21495
      FieldName = 'id_code'
      Size = 15
    end
    object ADO517_1orig_original_value: TFloatField
      DisplayLabel = #26368#21021#36755#20837#21407#20540
      FieldName = 'orig_original_value'
      DisplayFormat = '#,###.00'
    end
    object ADO517_1USER_DATE: TDateTimeField
      DisplayLabel = #36141#20837#26085#26399
      FieldName = 'USER_DATE'
    end
    object ADO517_1WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADO517_1abbr_NAME: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'abbr_NAME'
      Size = 10
    end
    object ADO517_1Depre_GL_ACC_NUMBER: TStringField
      FieldName = 'Depre_GL_ACC_NUMBER'
      Size = 18
    end
    object ADO517_1depre_GL_DESCRIPTION: TStringField
      FieldName = 'depre_GL_DESCRIPTION'
      Size = 50
    end
    object ADO517_1depre_acct_ptr: TIntegerField
      FieldName = 'depre_acct_ptr'
    end
    object ADO517_1warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
  end
  object ADO325: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey517'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.data0325.rkey, dbo.data0325.fasset_ptr, dbo.data0' +
        '325.curr_ptr, dbo.Data0001.CURR_CODE, dbo.data0325.ex_rate, '
      
        '                      dbo.data0325.orig_curr_orig_value,dbo.data' +
        '0325.orig_curr_orig_value*dbo.data0325.ex_rate curr_value'
      'FROM         dbo.data0325 INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.data0325.curr_ptr = db' +
        'o.Data0001.RKEY'
      'where data0325.fasset_ptr=:rkey517 and data0325.chgtype=0')
    Left = 120
    Top = 112
    object ADO325CURR_CODE: TStringField
      DisplayLabel = #21407#24065
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADO325ex_rate: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'ex_rate'
    end
    object ADO325orig_curr_orig_value: TBCDField
      DisplayLabel = #21407#24065#37329#39069
      FieldName = 'orig_curr_orig_value'
      Precision = 19
    end
    object ADO325curr_value: TFloatField
      DisplayLabel = #26412#20301#24065#37329#39069
      FieldName = 'curr_value'
      ReadOnly = True
    end
    object ADO325curr_ptr: TIntegerField
      FieldName = 'curr_ptr'
    end
    object ADO325fasset_ptr: TIntegerField
      FieldName = 'fasset_ptr'
    end
    object ADO325rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object ADO326: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey517'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME, dbo.d' +
        'ata0326.dept_ptr, dbo.data0326.FACCU_DEPT_GL_PTR, '
      
        '                      dbo.Data0103.GL_ACC_NUMBER, dbo.Data0103.G' +
        'L_DESCRIPTION, dbo.data0326.PERCENTS,  dbo.data0326.fasset_ptr,'
      '                  dbo.data0326.rkey'
      'FROM         dbo.data0326 INNER JOIN'
      
        '                      dbo.Data0034 ON dbo.data0326.dept_ptr = db' +
        'o.Data0034.RKEY INNER JOIN'
      
        '                      dbo.Data0103 ON dbo.data0326.FACCU_DEPT_GL' +
        '_PTR = dbo.Data0103.RKEY'
      'where data0326.fasset_ptr=:rkey517 and data0326.chgtype=0')
    Left = 192
    Top = 112
    object ADO326DEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADO326DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADO326GL_ACC_NUMBER: TStringField
      DisplayLabel = #25240#26087#31185#30446
      FieldName = 'GL_ACC_NUMBER'
      Size = 18
    end
    object ADO326GL_DESCRIPTION: TStringField
      DisplayLabel = #31185#30446#21517#31216
      FieldName = 'GL_DESCRIPTION'
      Size = 50
    end
    object ADO326PERCENTS: TFloatField
      DisplayLabel = '%'#27604
      FieldName = 'PERCENTS'
    end
    object ADO326FACCU_DEPT_GL_PTR: TIntegerField
      FieldName = 'FACCU_DEPT_GL_PTR'
    end
    object ADO326fasset_ptr: TIntegerField
      FieldName = 'fasset_ptr'
    end
    object ADO326dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ADO326rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
  end
  object ADO327: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey517'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select d327.rkey,d327.alter_date,d327.alter_type,(case when d327' +
        '.alter_type=1 then '#39#21407#20540#21464#21160#39' '
      
        '                                            when d327.alter_type' +
        '=2 then '#39#37096#38376#21464#21160#39' '
      
        '                                           when d327.alter_type=' +
        '3 then '#39#20854#23427#21464#21160#39'  end)  alter_type_name,'
      'reason ,data0005.employee_name'
      
        'from data0327  d327 left join data0005 on d327.alter_by_ptr=data' +
        '0005.rkey '
      ' where d327.fasset_ptr=:rkey517 order by d327.rkey')
    Left = 272
    Top = 112
    object ADO327alter_date: TDateTimeField
      DisplayLabel = #21464#21160#26085#26399
      FieldName = 'alter_date'
    end
    object ADO327alter_type_name: TStringField
      DisplayLabel = #21464#21160#31867#22411
      FieldName = 'alter_type_name'
      ReadOnly = True
      Size = 8
    end
    object ADO327reason: TStringField
      DisplayLabel = #21464#21160#21407#22240
      FieldName = 'reason'
      Size = 100
    end
    object ADO327employee_name: TStringField
      DisplayLabel = #21464#26356#20154#21592
      FieldName = 'employee_name'
      Size = 16
    end
    object ADO327alter_type: TWordField
      FieldName = 'alter_type'
    end
    object ADO327rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
  end
  object tmp: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 216
    Top = 32
  end
  object ADO327_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey327'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select *  from data0327 where rkey=:rkey327 ')
    Left = 272
    Top = 192
    object ADO327_1EXPECTED_LIFE_MONTHS_1: TFloatField
      FieldName = 'EXPECTED_LIFE_MONTHS_1'
      OnValidate = ADO327_1EXPECTED_LIFE_MONTHS_1Validate
    end
    object ADO327_1SURPLUS_RATE_1: TFloatField
      Tag = 1
      FieldName = 'SURPLUS_RATE_1'
      OnValidate = ADO327_1EXPECTED_LIFE_MONTHS_1Validate
    end
    object ADO327_1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO327_1fasset_ptr: TIntegerField
      FieldName = 'fasset_ptr'
    end
    object ADO327_1alter_date: TDateTimeField
      FieldName = 'alter_date'
    end
    object ADO327_1alter_type: TWordField
      FieldName = 'alter_type'
    end
    object ADO327_1Reason: TStringField
      FieldName = 'Reason'
      Size = 100
    end
    object ADO327_1increased_orig_value: TFloatField
      FieldName = 'increased_orig_value'
    end
    object ADO327_1increased_surplus_value: TFloatField
      FieldName = 'increased_surplus_value'
    end
    object ADO327_1ORIGINAL_VALUE: TFloatField
      FieldName = 'ORIGINAL_VALUE'
      DisplayFormat = '#,###.00'
    end
    object ADO327_1SUMMED_DEPRE: TFloatField
      FieldName = 'SUMMED_DEPRE'
      DisplayFormat = '#,###.00'
    end
    object ADO327_1NET_VALUE: TFloatField
      FieldName = 'NET_VALUE'
      DisplayFormat = '#,###.00'
    end
    object ADO327_1LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 40
    end
    object ADO327_1SURPLUS_RATE: TFloatField
      FieldName = 'SURPLUS_RATE'
      DisplayFormat = '#,##0.0000'
    end
    object ADO327_1SURPLUS: TFloatField
      FieldName = 'SURPLUS'
      DisplayFormat = '#,###.00'
    end
    object ADO327_1DEPRE_MTHD_PTR: TSmallintField
      FieldName = 'DEPRE_MTHD_PTR'
    end
    object ADO327_1EXPECTED_LIFE_MONTHS: TFloatField
      FieldName = 'EXPECTED_LIFE_MONTHS'
    end
    object ADO327_1DEPRED_MONTHS: TFloatField
      FieldName = 'DEPRED_MONTHS'
    end
    object ADO327_1LOADING_UNIT: TStringField
      FieldName = 'LOADING_UNIT'
      Size = 10
    end
    object ADO327_1MONTH_DEPRE_RATE: TFloatField
      FieldName = 'MONTH_DEPRE_RATE'
      DisplayFormat = '#,##0.0000'
    end
    object ADO327_1MONTH_DEPRE_AMT: TBCDField
      FieldName = 'MONTH_DEPRE_AMT'
      DisplayFormat = '#,###.00'
      Precision = 18
      Size = 2
    end
    object ADO327_1DEPRE_ACCT_PTR: TIntegerField
      FieldName = 'DEPRE_ACCT_PTR'
    end
    object ADO327_1depr_rate_method: TWordField
      FieldName = 'depr_rate_method'
    end
    object ADO327_1alter_by_ptr: TIntegerField
      FieldName = 'alter_by_ptr'
    end
    object ADO327_1voucher_ptr: TIntegerField
      FieldName = 'voucher_ptr'
    end
    object ADO327_1fasset_type_ptr: TIntegerField
      FieldName = 'fasset_type_ptr'
    end
    object ADO327_1status_ptr: TIntegerField
      FieldName = 'status_ptr'
    end
    object ADO327_1DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADO327_1dept_ptr_1: TIntegerField
      FieldName = 'dept_ptr_1'
    end
    object ADO327_1fasset_type_ptr_1: TIntegerField
      FieldName = 'fasset_type_ptr_1'
    end
    object ADO327_1status_ptr_1: TIntegerField
      FieldName = 'status_ptr_1'
    end
    object ADO327_1ORIGINAL_VALUE_1: TFloatField
      FieldName = 'ORIGINAL_VALUE_1'
      DisplayFormat = '#,###.00'
    end
    object ADO327_1SUMMED_DEPRE_1: TFloatField
      FieldName = 'SUMMED_DEPRE_1'
      DisplayFormat = '#,###.00'
    end
    object ADO327_1NET_VALUE_1: TFloatField
      FieldName = 'NET_VALUE_1'
      DisplayFormat = '#,###.00'
    end
    object ADO327_1LOCATION_1: TStringField
      FieldName = 'LOCATION_1'
      Size = 40
    end
    object ADO327_1SURPLUS_1: TFloatField
      FieldName = 'SURPLUS_1'
      DisplayFormat = '#,###.00'
    end
    object ADO327_1DEPRE_MTHD_PTR_1: TSmallintField
      FieldName = 'DEPRE_MTHD_PTR_1'
    end
    object ADO327_1DEPRED_MONTHS_1: TFloatField
      FieldName = 'DEPRED_MONTHS_1'
    end
    object ADO327_1LOADING_UNIT_1: TStringField
      FieldName = 'LOADING_UNIT_1'
      Size = 10
    end
    object ADO327_1MONTH_DEPRE_RATE_1: TFloatField
      FieldName = 'MONTH_DEPRE_RATE_1'
      DisplayFormat = '#,##0.####'
    end
    object ADO327_1MONTH_DEPRE_AMT_1: TBCDField
      FieldName = 'MONTH_DEPRE_AMT_1'
      DisplayFormat = '#,###.00'
      Precision = 18
      Size = 2
    end
    object ADO327_1DEPRE_ACCT_PTR_1: TIntegerField
      FieldName = 'DEPRE_ACCT_PTR_1'
    end
    object ADO327_1depr_rate_method_1: TWordField
      FieldName = 'depr_rate_method_1'
    end
  end
  object ADO325_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterPost = ADO325_1AfterPost
    AfterDelete = ADO325_1AfterPost
    OnCalcFields = ADO325_1CalcFields
    Parameters = <
      item
        Name = 'rkey517'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'd327'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'chgtype'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT  *  from data0325'
      
        'where (fasset_ptr=:rkey517  or d327_ptr=:d327) and chgtype=:chgt' +
        'ype ')
    Left = 120
    Top = 192
    object ADO325_1CURR_CODE: TStringField
      DisplayLabel = #21407#24065
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'CURR_CODE'
      Calculated = True
    end
    object ADO325_1orig_curr_orig_value: TBCDField
      DisplayLabel = #21407#24065#37329#39069
      DisplayWidth = 10
      FieldName = 'orig_curr_orig_value'
      Precision = 19
    end
    object ADO325_1ex_rate: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'ex_rate'
    end
    object ADO325_1curr_value: TFloatField
      DisplayLabel = #26412#20301#24065#37329#39069
      FieldKind = fkCalculated
      FieldName = 'curr_value'
      Calculated = True
    end
    object ADO325_1curr_ptr: TIntegerField
      FieldName = 'curr_ptr'
      Visible = False
    end
    object ADO325_1d327_ptr: TIntegerField
      FieldName = 'd327_ptr'
      Visible = False
    end
    object ADO325_1chgType: TIntegerField
      FieldName = 'chgType'
      Visible = False
    end
    object ADO325_1rkey: TAutoIncField
      FieldName = 'rkey'
      Visible = False
    end
    object ADO325_1fasset_ptr: TIntegerField
      FieldName = 'fasset_ptr'
      Visible = False
    end
  end
  object ADO326_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    OnCalcFields = ADO326_1CalcFields
    Parameters = <
      item
        Name = 'rkey517'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'd327'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'chgtype'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT  *  from data0326'
      
        'where  (fasset_ptr=:rkey517  or d327_ptr=:d327)  and chgtype=:ch' +
        'gtype')
    Left = 192
    Top = 192
    object ADO326_1DEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'DEPT_CODE'
      Calculated = True
    end
    object ADO326_1DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'DEPT_NAME'
      Calculated = True
    end
    object ADO326_1PERCENTS: TFloatField
      DisplayLabel = '%'#27604
      DisplayWidth = 6
      FieldName = 'PERCENTS'
      OnValidate = ADO326_1PERCENTSValidate
    end
    object ADO326_1GL_ACC_NUMBER: TStringField
      DisplayLabel = #31185#30446#20195#30721
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'GL_ACC_NUMBER'
      Calculated = True
    end
    object ADO326_1GL_DESCRIPTION: TStringField
      DisplayLabel = #31185#30446#21517#31216
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'GL_DESCRIPTION'
      Calculated = True
    end
    object ADO326_1FACCU_DEPT_GL_PTR: TIntegerField
      FieldName = 'FACCU_DEPT_GL_PTR'
      Visible = False
    end
    object ADO326_1rkey: TAutoIncField
      FieldName = 'rkey'
      Visible = False
    end
    object ADO326_1fasset_ptr: TIntegerField
      FieldName = 'fasset_ptr'
      Visible = False
    end
    object ADO326_1dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
      Visible = False
    end
    object ADO326_1d327_ptr: TIntegerField
      FieldName = 'd327_ptr'
      Visible = False
    end
    object ADO326_1chgType: TIntegerField
      FieldName = 'chgType'
      Visible = False
    end
  end
  object ADO327_2: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey327'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0327.RKEY, dbo.Data0517.FASSET_CODE, dbo.Data' +
        '0517.FASSET_NAME, dbo.Data0517.FASSET_DESC, dbo.Data0514.FASSET_' +
        'TYPE, '
      
        '                       dbo.Data0515.FASSET_ALT_TYPE, data0517.DE' +
        'PRE_MTHD_PTR,'
      
        '                      dbo.Data0516.FASSET_STATUS, dbo.Data0327.O' +
        'RIGINAL_VALUE, dbo.Data0327.SUMMED_DEPRE, dbo.Data0327.NET_VALUE' +
        ', '
      
        '                      dbo.Data0327.LOCATION, dbo.Data0517.BOOK_D' +
        'ATE, dbo.Data0327.SURPLUS_RATE, dbo.Data0327.SURPLUS,'
      
        '                      dbo.Data0327.EXPECTED_LIFE_MONTHS, dbo.Dat' +
        'a0327.DEPRED_MONTHS, '
      
        '                     cast(data0327.MONTH_DEPRE_RATE as numeric(1' +
        '5,4)) MONTH_DEPRE_RATE , '
      ''
      
        '                      dbo.Data0327.MONTH_DEPRE_AMT, dbo.Data0517' +
        '.REMARK, dbo.Data0517.id_code, dbo.Data0517.orig_original_value,' +
        ' dbo.Data0517.USER_DATE, '
      
        '                      dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.' +
        'abbr_NAME, dbo.Data0103.GL_ACC_NUMBER, dbo.Data0103.GL_DESCRIPTI' +
        'ON,'
      
        '                      D103.GL_ACC_NUMBER Depre_GL_ACC_NUMBER, D1' +
        '03.GL_DESCRIPTION depre_GL_DESCRIPTION,dbo.Data0327.depre_acct_p' +
        'tr,dbo.Data0327.dept_ptr'
      'FROM         dbo.Data0327 INNER JOIN'
      
        '                      dbo.Data0514 ON dbo.Data0327.FASSET_TYPE_P' +
        'TR = dbo.Data0514.RKEY INNER JOIN'
      
        '                       data0517 on data0327.fasset_ptr=data0517.' +
        'rkey inner join '
      
        '                      dbo.Data0515 ON dbo.Data0517.ALT_TYPE_PTR ' +
        '= dbo.Data0515.RKEY INNER JOIN'
      
        '                      dbo.Data0516 ON dbo.Data0327.STATUS_PTR = ' +
        'dbo.Data0516.RKEY left  JOIN'
      
        '                      dbo.Data0015 ON dbo.Data0327.dept_ptr = db' +
        'o.Data0015.RKEY INNER JOIN'
      
        '                      dbo.Data0103 ON dbo.Data0517.fasset_gl_ptr' +
        ' = dbo.Data0103.RKEY   INNER JOIN'
      
        '                       dbo.Data0103 D103 ON dbo.Data0327.depre_a' +
        'cct_ptr = D103.RKEY                    '
      'where Data0327.rkey=:rkey327')
    Left = 272
    Top = 264
    object ADO327_2RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO327_2FASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
      Size = 10
    end
    object ADO327_2FASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object ADO327_2FASSET_DESC: TStringField
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object ADO327_2FASSET_TYPE: TStringField
      FieldName = 'FASSET_TYPE'
    end
    object ADO327_2FASSET_ALT_TYPE: TStringField
      FieldName = 'FASSET_ALT_TYPE'
      FixedChar = True
    end
    object ADO327_2DEPRE_MTHD_PTR: TSmallintField
      FieldName = 'DEPRE_MTHD_PTR'
    end
    object ADO327_2FASSET_STATUS: TStringField
      FieldName = 'FASSET_STATUS'
    end
    object ADO327_2ORIGINAL_VALUE: TFloatField
      FieldName = 'ORIGINAL_VALUE'
      DisplayFormat = '#,###.00'
    end
    object ADO327_2SUMMED_DEPRE: TFloatField
      FieldName = 'SUMMED_DEPRE'
      DisplayFormat = '#,###.00'
    end
    object ADO327_2NET_VALUE: TFloatField
      FieldName = 'NET_VALUE'
      DisplayFormat = '#,###.00'
    end
    object ADO327_2LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 40
    end
    object ADO327_2BOOK_DATE: TDateTimeField
      FieldName = 'BOOK_DATE'
    end
    object ADO327_2SURPLUS_RATE: TFloatField
      FieldName = 'SURPLUS_RATE'
      DisplayFormat = '#,##0.0000'
    end
    object ADO327_2SURPLUS: TFloatField
      FieldName = 'SURPLUS'
      DisplayFormat = '#,###.00'
    end
    object ADO327_2EXPECTED_LIFE_MONTHS: TFloatField
      FieldName = 'EXPECTED_LIFE_MONTHS'
    end
    object ADO327_2DEPRED_MONTHS: TFloatField
      FieldName = 'DEPRED_MONTHS'
    end
    object ADO327_2MONTH_DEPRE_RATE: TBCDField
      FieldName = 'MONTH_DEPRE_RATE'
      ReadOnly = True
      DisplayFormat = '#,##0.0000'
      Precision = 15
    end
    object ADO327_2MONTH_DEPRE_AMT: TBCDField
      FieldName = 'MONTH_DEPRE_AMT'
      DisplayFormat = '#,###.00'
      Precision = 18
      Size = 2
    end
    object ADO327_2REMARK: TStringField
      FieldName = 'REMARK'
      Size = 100
    end
    object ADO327_2id_code: TStringField
      FieldName = 'id_code'
      Size = 15
    end
    object ADO327_2orig_original_value: TFloatField
      FieldName = 'orig_original_value'
      DisplayFormat = '#,###.00'
    end
    object ADO327_2USER_DATE: TDateTimeField
      FieldName = 'USER_DATE'
    end
    object ADO327_2WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADO327_2abbr_NAME: TStringField
      FieldName = 'abbr_NAME'
      Size = 10
    end
    object ADO327_2GL_ACC_NUMBER: TStringField
      FieldName = 'GL_ACC_NUMBER'
      Size = 18
    end
    object ADO327_2GL_DESCRIPTION: TStringField
      FieldName = 'GL_DESCRIPTION'
      Size = 50
    end
    object ADO327_2Depre_GL_ACC_NUMBER: TStringField
      FieldName = 'Depre_GL_ACC_NUMBER'
      Size = 18
    end
    object ADO327_2depre_GL_DESCRIPTION: TStringField
      FieldName = 'depre_GL_DESCRIPTION'
      Size = 50
    end
    object ADO327_2depre_acct_ptr: TIntegerField
      FieldName = 'depre_acct_ptr'
    end
    object ADO327_2dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
  end
  object ADO325_2: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey517'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'd327'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'chgtype'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.data0325.rkey, dbo.data0325.fasset_ptr, dbo.data0' +
        '325.curr_ptr, dbo.Data0001.CURR_CODE, dbo.data0325.ex_rate, '
      
        '                      dbo.data0325.orig_curr_orig_value,dbo.data' +
        '0325.orig_curr_orig_value*dbo.data0325.ex_rate curr_value'
      'FROM         dbo.data0325 INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.data0325.curr_ptr = db' +
        'o.Data0001.RKEY'
      
        'where (data0325.fasset_ptr=:rkey517 or data0325.d327_ptr=:d327) ' +
        'and data0325.chgtype=:chgtype')
    Left = 120
    Top = 264
    object StringField1: TStringField
      DisplayLabel = #21407#24065
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object FloatField1: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'ex_rate'
    end
    object BCDField1: TBCDField
      DisplayLabel = #21407#24065#37329#39069
      FieldName = 'orig_curr_orig_value'
      Precision = 19
    end
    object FloatField2: TFloatField
      DisplayLabel = #26412#20301#24065#37329#39069
      FieldName = 'curr_value'
      ReadOnly = True
    end
    object IntegerField1: TIntegerField
      FieldName = 'curr_ptr'
    end
    object IntegerField2: TIntegerField
      FieldName = 'fasset_ptr'
    end
    object AutoIncField1: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object ADO326_2: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey517'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'd327'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'chgtype'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME, dbo.d' +
        'ata0326.dept_ptr, dbo.data0326.FACCU_DEPT_GL_PTR, '
      
        '                      dbo.Data0103.GL_ACC_NUMBER, dbo.Data0103.G' +
        'L_DESCRIPTION, dbo.data0326.PERCENTS,  dbo.data0326.fasset_ptr,'
      '                  dbo.data0326.rkey'
      'FROM         dbo.data0326 INNER JOIN'
      
        '                      dbo.Data0034 ON dbo.data0326.dept_ptr = db' +
        'o.Data0034.RKEY INNER JOIN'
      
        '                      dbo.Data0103 ON dbo.data0326.FACCU_DEPT_GL' +
        '_PTR = dbo.Data0103.RKEY'
      
        'where (data0326.fasset_ptr=:rkey517 or data0326.d327_ptr=:d327) ' +
        'and data0326.chgtype=:chgtype')
    Left = 200
    Top = 264
    object StringField2: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object StringField3: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object StringField4: TStringField
      DisplayLabel = #25240#26087#31185#30446
      FieldName = 'GL_ACC_NUMBER'
      Size = 18
    end
    object StringField5: TStringField
      DisplayLabel = #31185#30446#21517#31216
      FieldName = 'GL_DESCRIPTION'
      Size = 50
    end
    object FloatField3: TFloatField
      DisplayLabel = '%'#27604
      FieldName = 'PERCENTS'
    end
    object IntegerField3: TIntegerField
      FieldName = 'FACCU_DEPT_GL_PTR'
    end
    object IntegerField4: TIntegerField
      FieldName = 'fasset_ptr'
    end
    object IntegerField5: TIntegerField
      FieldName = 'dept_ptr'
    end
    object IntegerField6: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
  end
end
