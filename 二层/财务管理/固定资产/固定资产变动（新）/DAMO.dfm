object DM: TDM
  OldCreateOrder = False
  Left = 495
  Top = 222
  Height = 480
  Width = 620
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 152
    Top = 32
  end
  object adoMain: TADODataSet
    Connection = ADOConnection1
    LockType = ltReadOnly
    AfterScroll = adoMainAfterScroll
    OnCalcFields = adoMainCalcFields
    CommandText = 
      'select  d517.rkey,d327.rkey as rkey327,d517.id_code,d517.fasset_' +
      'code,d517.fasset_name,d517.fasset_desc'#13#10#9#9',d517.book_date,d327.a' +
      'lter_date,d327.alter_type,d327.Reason,d05.employee_name'#13#10#9'    ,c' +
      'ase d327.alter_type when 1 then '#39#21407#20540#21464#21160#39' when 2 then '#39#37096#38376#21464#21160#39' '#13#10#9#9'wh' +
      'en 3 then '#39#20854#23427#21464#21160#39' end as typename,'#13#10#9#9'd514.FASSET_TYPE,d517.FASSE' +
      'T_TYPE_PTR, d517.ALT_TYPE_PTR,'#13#10#9#9'dbo.Data0515.FASSET_ALT_TYPE, ' +
      'd517.STATUS_PTR,dbo.Data0516.FASSET_STATUS, '#13#10'        d517.ORIGI' +
      'NAL_VALUE, d517.SUMMED_DEPRE, d517.NET_VALUE, '#13#10'        d517.LOC' +
      'ATION, d517.BOOK_DATE, d517.SURPLUS_RATE,'#13#10'       d517.SURPLUS, ' +
      'd517.DEPRE_MTHD_PTR,d517.EXPECTED_LIFE_MONTHS, '#13#10'       d517.DEP' +
      'RED_MONTHS, d517.MONTH_DEPRE_RATE, d517.MONTH_DEPRE_AMT,'#13#10'      ' +
      ' d517.REMARK, d517.orig_original_value,d517.warehouse_ptr,'#13#10'    ' +
      '   d517.USER_DATE,d015.WAREHOUSE_CODE, d015.abbr_NAME, dbo.Data0' +
      '103.GL_ACC_NUMBER, '#13#10'       dbo.Data0103.GL_DESCRIPTION,D103.GL_' +
      'ACC_NUMBER Depre_GL_ACC_NUMBER,'#13#10'       D103.GL_DESCRIPTION depr' +
      'e_GL_DESCRIPTION,d517.depre_acct_ptr,'#13#10'       case d517.DEPRE_MT' +
      'HD_PTR when 0 then '#39#19981#25552#25240#26087#39' when 1 then '#39#24179#22343#24180#38480#27861#39' '#13#10#9#9'when 2 then '#39#24037 +
      #20316#37327#27861#39' when 3 then '#39#21452#20493#20313#39069#36882#20943#27861#39' when 4 then '#39#24037#20316#24180#38480#27861#39' end as MONTH,'#13#10#9#9 +
      'd327.ORIGINAL_VALUE as f_value,d327.ORIGINAL_VALUE_1 as b_value'#13 +
      #10'from data0327 d327 inner join '#13#10#9#9'data0005 d05 on d327.alter_by' +
      '_ptr = d05.RKEY inner join '#13#10#9#9'data0517 d517 on d327.fasset_ptr=' +
      'd517.rkey inner join'#13#10#9#9'Data0516 ON d517.STATUS_PTR = dbo.Data05' +
      '16.RKEY INNER JOIN '#13#10#9#9'Data0515 ON d517.ALT_TYPE_PTR = dbo.Data0' +
      '515.RKEY INNER JOIN '#13#10#9#9'Data0514 d514 on d517.FASSET_TYPE_PTR=d5' +
      '14.RKEY inner join'#13#10#9#9'Data0015 d015 on d517.warehouse_ptr=d015.R' +
      'KEY INNER JOIN'#13#10'        Data0103 ON d517.fasset_gl_ptr = dbo.Dat' +
      'a0103.RKEY   INNER JOIN'#13#10'        Data0103 D103 ON d517.depre_acc' +
      't_ptr = D103.RKEY '#13#10'where d327.alter_date>=:start and d327.alter' +
      '_date<=:end  '#13#10
    Parameters = <
      item
        Name = 'start'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'end'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    Left = 40
    Top = 96
    object adoMainrkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adoMainfasset_code: TStringField
      DisplayLabel = #21345#29255#21495
      FieldName = 'fasset_code'
      Size = 10
    end
    object adoMainfasset_name: TStringField
      DisplayLabel = #36164#20135#21517#31216
      FieldName = 'fasset_name'
      Size = 30
    end
    object adoMainfasset_desc: TStringField
      DisplayLabel = #36164#20135#35268#26684
      FieldName = 'fasset_desc'
      Size = 40
    end
    object adoMainbook_date: TDateTimeField
      DisplayLabel = #20837#24080#26085#26399
      FieldName = 'book_date'
    end
    object adoMainalter_date: TDateTimeField
      DisplayLabel = #21464#21160#26085#26399
      FieldName = 'alter_date'
    end
    object adoMainalter_type: TWordField
      FieldName = 'alter_type'
    end
    object adoMainReason: TStringField
      DisplayLabel = #21464#21160#21407#22240
      FieldName = 'Reason'
      Size = 100
    end
    object adoMaintypename: TStringField
      DisplayLabel = #21464#21160#31867#22411
      FieldName = 'typename'
      ReadOnly = True
      Size = 8
    end
    object adoMainid_code: TStringField
      DisplayLabel = #36164#20135#32534#21495
      FieldName = 'id_code'
      Size = 15
    end
    object adoMainFASSET_TYPE: TStringField
      FieldName = 'FASSET_TYPE'
    end
    object adoMainFASSET_TYPE_PTR: TSmallintField
      FieldName = 'FASSET_TYPE_PTR'
    end
    object adoMainALT_TYPE_PTR: TIntegerField
      FieldName = 'ALT_TYPE_PTR'
    end
    object adoMainFASSET_ALT_TYPE: TStringField
      FieldName = 'FASSET_ALT_TYPE'
    end
    object adoMainSTATUS_PTR: TSmallintField
      FieldName = 'STATUS_PTR'
    end
    object adoMainFASSET_STATUS: TStringField
      FieldName = 'FASSET_STATUS'
    end
    object adoMainORIGINAL_VALUE: TBCDField
      FieldName = 'ORIGINAL_VALUE'
      DisplayFormat = '#,##0.00'
      Precision = 12
      Size = 2
    end
    object adoMainSUMMED_DEPRE: TBCDField
      FieldName = 'SUMMED_DEPRE'
      DisplayFormat = '#,##0.00'
      Precision = 12
      Size = 2
    end
    object adoMainNET_VALUE: TBCDField
      FieldName = 'NET_VALUE'
      DisplayFormat = '#,##0.00'
      Precision = 12
      Size = 2
    end
    object adoMainLOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 40
    end
    object adoMainBOOK_DATE_1: TDateTimeField
      FieldName = 'BOOK_DATE_1'
    end
    object adoMainSURPLUS_RATE: TFloatField
      FieldName = 'SURPLUS_RATE'
      DisplayFormat = '#,##0.00'
    end
    object adoMainSURPLUS: TFloatField
      FieldName = 'SURPLUS'
      DisplayFormat = '#,##0.00'
    end
    object adoMainDEPRE_MTHD_PTR: TSmallintField
      FieldName = 'DEPRE_MTHD_PTR'
    end
    object adoMainEXPECTED_LIFE_MONTHS: TFloatField
      FieldName = 'EXPECTED_LIFE_MONTHS'
    end
    object adoMainDEPRED_MONTHS: TFloatField
      FieldName = 'DEPRED_MONTHS'
    end
    object adoMainMONTH_DEPRE_RATE: TFloatField
      FieldName = 'MONTH_DEPRE_RATE'
      DisplayFormat = '#,##0.0000'
    end
    object adoMainMONTH_DEPRE_AMT: TBCDField
      FieldName = 'MONTH_DEPRE_AMT'
      DisplayFormat = '#,##0.00'
      Precision = 19
      Size = 2
    end
    object adoMainREMARK: TStringField
      FieldName = 'REMARK'
      Size = 100
    end
    object adoMainorig_original_value: TFloatField
      FieldName = 'orig_original_value'
      DisplayFormat = '#,##0.00'
    end
    object adoMainUSER_DATE: TDateTimeField
      FieldName = 'USER_DATE'
    end
    object adoMainWAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object adoMainGL_ACC_NUMBER: TStringField
      FieldName = 'GL_ACC_NUMBER'
      Size = 18
    end
    object adoMainGL_DESCRIPTION: TStringField
      FieldName = 'GL_DESCRIPTION'
      Size = 50
    end
    object adoMainDepre_GL_ACC_NUMBER: TStringField
      FieldName = 'Depre_GL_ACC_NUMBER'
      Size = 18
    end
    object adoMaindepre_GL_DESCRIPTION: TStringField
      FieldName = 'depre_GL_DESCRIPTION'
      Size = 50
    end
    object adoMaindepre_acct_ptr: TIntegerField
      FieldName = 'depre_acct_ptr'
    end
    object adoMainMONTH: TStringField
      FieldName = 'MONTH'
      ReadOnly = True
      Size = 14
    end
    object adoMainemployee_name: TStringField
      DisplayLabel = #21464#26356#20154#21592
      FieldName = 'employee_name'
      Size = 16
    end
    object adoMainabbr_NAME: TStringField
      FieldName = 'abbr_NAME'
      Size = 10
    end
    object adoMainwarehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object adoMainrkey327: TIntegerField
      FieldName = 'rkey327'
      ReadOnly = True
    end
    object adoMainf_value: TFloatField
      DisplayLabel = #21464#26356#21069#21407#20540
      FieldName = 'f_value'
      DisplayFormat = '#,##0.00'
    end
    object adoMainb_value: TFloatField
      DisplayLabel = #21464#26356#21518#21407#20540
      FieldName = 'b_value'
      DisplayFormat = '#,##0.00'
    end
    object adoMainF_DEPT_VALUE: TStringField
      DisplayLabel = #21464#26356#21069
      FieldKind = fkCalculated
      FieldName = 'F_DEPT_VALUE'
      Size = 50
      Calculated = True
    end
    object adoMainB_DEPT_VALUE: TStringField
      DisplayLabel = #21464#26356#21518
      FieldKind = fkCalculated
      FieldName = 'B_DEPT_VALUE'
      Size = 50
      Calculated = True
    end
  end
  object adoTmp: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 552
    Top = 144
  end
  object DataSource1: TDataSource
    DataSet = adoMain
    Left = 112
    Top = 96
  end
  object ado325: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    DataSource = DataSource1
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
        '325.curr_ptr, '
      
        #9#9#9'dbo.Data0001.CURR_CODE, dbo.data0325.ex_rate,dbo.data0325.ori' +
        'g_curr_orig_value,'
      
        #9#9#9'dbo.data0325.orig_curr_orig_value*dbo.data0325.ex_rate curr_v' +
        'alue'
      'FROM         dbo.data0325 INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.data0325.curr_ptr = db' +
        'o.Data0001.RKEY'
      ''
      'where data0325.fasset_ptr= :rkey517  and data0325.chgtype=0')
    Left = 40
    Top = 152
    object ado325rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ado325fasset_ptr: TIntegerField
      FieldName = 'fasset_ptr'
    end
    object ado325curr_ptr: TIntegerField
      FieldName = 'curr_ptr'
    end
    object ado325CURR_CODE: TStringField
      DisplayLabel = #21407#24065
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ado325ex_rate: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'ex_rate'
    end
    object ado325orig_curr_orig_value: TBCDField
      DisplayLabel = #21407#24065#37329#39069
      FieldName = 'orig_curr_orig_value'
      Precision = 19
    end
    object ado325curr_value: TFloatField
      DisplayLabel = #26412#20301#24065#37329#39069
      FieldName = 'curr_value'
      ReadOnly = True
    end
  end
  object DataSource2: TDataSource
    DataSet = ado325
    Left = 112
    Top = 152
  end
  object ado326: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <
      item
        Name = '517rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME, dbo.d' +
        'ata0326.dept_ptr,'
      
        #9#9#9' dbo.data0326.FACCU_DEPT_GL_PTR, dbo.Data0103.GL_ACC_NUMBER, ' +
        'dbo.Data0103.GL_DESCRIPTION,'
      
        '            dbo.data0326.PERCENTS,  dbo.data0326.fasset_ptr,dbo.' +
        'data0326.rkey'
      'FROM         dbo.data0326 INNER JOIN'
      
        '                      dbo.Data0034 ON dbo.data0326.dept_ptr = db' +
        'o.Data0034.RKEY INNER JOIN'
      
        '                      dbo.Data0103 ON dbo.data0326.FACCU_DEPT_GL' +
        '_PTR = dbo.Data0103.RKEY'
      ''
      'where data0326.fasset_ptr=:517rkey  and data0326.chgtype=0')
    Left = 40
    Top = 208
    object ado326DEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ado326DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ado326dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ado326FACCU_DEPT_GL_PTR: TIntegerField
      FieldName = 'FACCU_DEPT_GL_PTR'
    end
    object ado326GL_ACC_NUMBER: TStringField
      DisplayLabel = #25240#26087#31185#30446
      FieldName = 'GL_ACC_NUMBER'
      Size = 18
    end
    object ado326GL_DESCRIPTION: TStringField
      DisplayLabel = #25240#26087#21517#31216
      FieldName = 'GL_DESCRIPTION'
      Size = 50
    end
    object ado326PERCENTS: TFloatField
      DisplayLabel = #30334#20998#27604
      FieldName = 'PERCENTS'
    end
    object ado326fasset_ptr: TIntegerField
      FieldName = 'fasset_ptr'
    end
    object ado326rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object DataSource3: TDataSource
    DataSet = ado326
    Left = 112
    Top = 208
  end
  object ado327: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
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
      
        'select  d517.rkey,d517.id_code,d517.fasset_code,d517.fasset_name' +
        ',d517.fasset_desc'
      #9#9',d517.book_date,'
      #9#9'd514.FASSET_TYPE,d517.FASSET_TYPE_PTR, d517.ALT_TYPE_PTR,'
      
        #9#9'dbo.Data0515.FASSET_ALT_TYPE, d517.STATUS_PTR,dbo.Data0516.FAS' +
        'SET_STATUS, '
      '        d517.ORIGINAL_VALUE, d517.SUMMED_DEPRE, d517.NET_VALUE, '
      '        d517.LOCATION, d517.BOOK_DATE, d517.SURPLUS_RATE,'
      
        '       d517.SURPLUS, d517.DEPRE_MTHD_PTR,d517.EXPECTED_LIFE_MONT' +
        'HS, '
      
        '       d517.DEPRED_MONTHS, d517.MONTH_DEPRE_RATE, d517.MONTH_DEP' +
        'RE_AMT,'
      
        '       d517.REMARK, d517.id_code, d517.orig_original_value,d517.' +
        'warehouse_ptr,'
      
        '       d517.USER_DATE,d015.WAREHOUSE_CODE, d015.abbr_NAME, dbo.D' +
        'ata0103.GL_ACC_NUMBER, '
      
        '       dbo.Data0103.GL_DESCRIPTION,D103.GL_ACC_NUMBER Depre_GL_A' +
        'CC_NUMBER,'
      
        '       D103.GL_DESCRIPTION depre_GL_DESCRIPTION,d517.depre_acct_' +
        'ptr,'
      
        '       case d517.DEPRE_MTHD_PTR when 0 then '#39#19981#25552#25240#26087#39' when 1 then '#39 +
        #24179#22343#24180#38480#27861#39' '
      
        #9#9'when 2 then '#39#24037#20316#37327#27861#39' when 3 then '#39#21452#20493#20313#39069#36882#20943#27861#39' when 4 then '#39#24037#20316#24180#38480#27861#39' e' +
        'nd as MONTH'
      'from '#9'data0517 d517  inner join'
      #9#9'Data0516 ON d517.STATUS_PTR = dbo.Data0516.RKEY INNER JOIN '
      #9#9'Data0515 ON d517.ALT_TYPE_PTR = dbo.Data0515.RKEY INNER JOIN '
      #9#9'Data0514 d514 on d517.FASSET_TYPE_PTR=d514.RKEY inner join'
      #9#9'Data0015 d015 on d517.warehouse_ptr=d015.RKEY INNER JOIN'
      
        '        Data0103 ON d517.fasset_gl_ptr = dbo.Data0103.RKEY   INN' +
        'ER JOIN'
      '        Data0103 D103 ON d517.depre_acct_ptr = D103.RKEY'
      'where d517.RKEY=:rkey517')
    Left = 48
    Top = 312
    object ado327rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ado327id_code: TStringField
      FieldName = 'id_code'
      Size = 15
    end
    object ado327fasset_code: TStringField
      FieldName = 'fasset_code'
      Size = 10
    end
    object ado327fasset_name: TStringField
      FieldName = 'fasset_name'
      Size = 30
    end
    object ado327fasset_desc: TStringField
      FieldName = 'fasset_desc'
      Size = 40
    end
    object ado327book_date: TDateTimeField
      FieldName = 'book_date'
    end
    object ado327FASSET_TYPE: TStringField
      FieldName = 'FASSET_TYPE'
    end
    object ado327FASSET_TYPE_PTR: TSmallintField
      FieldName = 'FASSET_TYPE_PTR'
    end
    object ado327ALT_TYPE_PTR: TIntegerField
      FieldName = 'ALT_TYPE_PTR'
    end
    object ado327FASSET_ALT_TYPE: TStringField
      FieldName = 'FASSET_ALT_TYPE'
    end
    object ado327STATUS_PTR: TSmallintField
      FieldName = 'STATUS_PTR'
    end
    object ado327FASSET_STATUS: TStringField
      FieldName = 'FASSET_STATUS'
    end
    object ado327ORIGINAL_VALUE: TBCDField
      FieldName = 'ORIGINAL_VALUE'
      DisplayFormat = '#,##0.00'
      Precision = 12
      Size = 2
    end
    object ado327SUMMED_DEPRE: TBCDField
      FieldName = 'SUMMED_DEPRE'
      DisplayFormat = '#,##0.00'
      Precision = 12
      Size = 2
    end
    object ado327NET_VALUE: TBCDField
      FieldName = 'NET_VALUE'
      DisplayFormat = '#,##0.00'
      Precision = 12
      Size = 2
    end
    object ado327LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 40
    end
    object ado327BOOK_DATE_1: TDateTimeField
      FieldName = 'BOOK_DATE_1'
    end
    object ado327SURPLUS_RATE: TFloatField
      FieldName = 'SURPLUS_RATE'
      DisplayFormat = '#,##0.00'
    end
    object ado327SURPLUS: TFloatField
      FieldName = 'SURPLUS'
      DisplayFormat = '#,##0.00'
    end
    object ado327DEPRE_MTHD_PTR: TSmallintField
      FieldName = 'DEPRE_MTHD_PTR'
    end
    object ado327EXPECTED_LIFE_MONTHS: TFloatField
      FieldName = 'EXPECTED_LIFE_MONTHS'
    end
    object ado327DEPRED_MONTHS: TFloatField
      FieldName = 'DEPRED_MONTHS'
    end
    object ado327MONTH_DEPRE_RATE: TFloatField
      FieldName = 'MONTH_DEPRE_RATE'
      DisplayFormat = '#,##0.0000'
    end
    object ado327MONTH_DEPRE_AMT: TBCDField
      FieldName = 'MONTH_DEPRE_AMT'
      DisplayFormat = '#,##0.00'
      Precision = 19
      Size = 2
    end
    object ado327REMARK: TStringField
      FieldName = 'REMARK'
      Size = 100
    end
    object ado327id_code_1: TStringField
      FieldName = 'id_code_1'
      Size = 15
    end
    object ado327orig_original_value: TFloatField
      FieldName = 'orig_original_value'
      DisplayFormat = '#,##0.00'
    end
    object ado327warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ado327USER_DATE: TDateTimeField
      FieldName = 'USER_DATE'
    end
    object ado327WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ado327GL_ACC_NUMBER: TStringField
      FieldName = 'GL_ACC_NUMBER'
      Size = 18
    end
    object ado327GL_DESCRIPTION: TStringField
      FieldName = 'GL_DESCRIPTION'
      Size = 50
    end
    object ado327Depre_GL_ACC_NUMBER: TStringField
      FieldName = 'Depre_GL_ACC_NUMBER'
      Size = 18
    end
    object ado327depre_GL_DESCRIPTION: TStringField
      FieldName = 'depre_GL_DESCRIPTION'
      Size = 50
    end
    object ado327depre_acct_ptr: TIntegerField
      FieldName = 'depre_acct_ptr'
    end
    object ado327MONTH: TStringField
      FieldName = 'MONTH'
      ReadOnly = True
      Size = 14
    end
    object ado327abbr_NAME: TStringField
      FieldName = 'abbr_NAME'
      Size = 10
    end
  end
  object DataSource4: TDataSource
    DataSet = ado327
    Left = 112
    Top = 312
  end
  object ado325_1: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    AfterPost = ado325_1AfterPost
    OnCalcFields = ado325_1CalcFields
    Parameters = <
      item
        Name = '517key'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = '327key'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'type'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT  rkey, fasset_ptr, curr_ptr, d327_ptr, ex_rate, orig_curr' +
        '_orig_value, chgType  from data0325  '
      
        'where  (fasset_ptr=:517key  or d327_ptr=:327key)  and chgtype=:t' +
        'ype ')
    Left = 328
    Top = 320
    object ado325_1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ado325_1fasset_ptr: TIntegerField
      FieldName = 'fasset_ptr'
    end
    object ado325_1curr_ptr: TIntegerField
      FieldName = 'curr_ptr'
    end
    object ado325_1d327_ptr: TIntegerField
      FieldName = 'd327_ptr'
    end
    object ado325_1ex_rate: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'ex_rate'
    end
    object ado325_1orig_curr_orig_value: TBCDField
      DisplayLabel = #21407#24065#37329#39069
      FieldName = 'orig_curr_orig_value'
      Precision = 19
    end
    object ado325_1chgType: TIntegerField
      FieldName = 'chgType'
    end
    object ado325_1CURR_CODE: TStringField
      DisplayLabel = #21407#24065
      FieldKind = fkCalculated
      FieldName = 'CURR_CODE'
      Calculated = True
    end
    object ado325_1CURR_VALUE: TBCDField
      DisplayLabel = #26412#20301#24065#37329#39069
      FieldKind = fkCalculated
      FieldName = 'CURR_VALUE'
      Calculated = True
    end
  end
  object DataSource5: TDataSource
    DataSet = ado325_2
    Left = 248
    Top = 312
  end
  object ado326_1: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    OnCalcFields = ado326_1CalcFields
    Parameters = <
      item
        Name = '517key'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = '327key'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'type'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT  rkey, fasset_ptr, dept_ptr, FACCU_DEPT_GL_PTR, d327_ptr,' +
        ' PERCENTS, chgType  from data0326'
      
        'where  (fasset_ptr=:517key  or d327_ptr=:327key)  and chgtype=:t' +
        'ype')
    Left = 328
    Top = 368
    object ado326_1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ado326_1fasset_ptr: TIntegerField
      FieldName = 'fasset_ptr'
    end
    object ado326_1dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ado326_1FACCU_DEPT_GL_PTR: TIntegerField
      FieldName = 'FACCU_DEPT_GL_PTR'
    end
    object ado326_1d327_ptr: TIntegerField
      FieldName = 'd327_ptr'
    end
    object ado326_1PERCENTS: TFloatField
      DisplayLabel = #30334#20998#27604
      FieldName = 'PERCENTS'
    end
    object ado326_1chgType: TIntegerField
      FieldName = 'chgType'
    end
    object ado326_1DEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldKind = fkCalculated
      FieldName = 'DEPT_CODE'
      Calculated = True
    end
    object ado326_1DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldKind = fkCalculated
      FieldName = 'DEPT_NAME'
      Calculated = True
    end
    object ado326_1GL_ACC_NUMBER: TStringField
      DisplayLabel = #25240#26087#31185#30446
      FieldKind = fkCalculated
      FieldName = 'GL_ACC_NUMBER'
      Calculated = True
    end
    object ado326_1GL_DESCRIPTION: TStringField
      DisplayLabel = #31185#30446#21517#31216
      FieldKind = fkCalculated
      FieldName = 'GL_DESCRIPTION'
      Calculated = True
    end
  end
  object DataSource6: TDataSource
    DataSet = ado326_2
    Left = 248
    Top = 368
  end
  object ado327_1: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select rkey, fasset_ptr, alter_date, alter_type, Reason, increas' +
        'ed_orig_value,'
      
        #9#9'increased_surplus_value, ORIGINAL_VALUE, SUMMED_DEPRE, NET_VAL' +
        'UE, LOCATION,'
      
        #9#9'SURPLUS_RATE, SURPLUS, DEPRE_MTHD_PTR, EXPECTED_LIFE_MONTHS, D' +
        'EPRED_MONTHS,'
      
        #9#9'LOADING_UNIT, MONTH_DEPRE_RATE, MONTH_DEPRE_AMT, DEPRE_ACCT_PT' +
        'R, '
      
        #9#9'YEAR_ORGI_VALUE_OPEN, YEAR_ORGI_VALUE_INCREASE, YEAR_ORGI_VALU' +
        'E_DECREASE,'
      
        #9#9'YEAR_DEPRE_SUMMED_OPEN, YEAR_DEPRE_SUMMED_INCREASE, YEAR_DEPRE' +
        '_SUMMED_DECREASE,'
      
        #9#9'depr_rate_method, alter_by_ptr, voucher_ptr, fasset_type_ptr, ' +
        'status_ptr,'
      
        #9#9'DEPT_PTR, dept_ptr_1, fasset_type_ptr_1, status_ptr_1, ORIGINA' +
        'L_VALUE_1, '
      
        #9#9'SUMMED_DEPRE_1, NET_VALUE_1, LOCATION_1, SURPLUS_RATE_1, SURPL' +
        'US_1,'
      
        #9#9'DEPRE_MTHD_PTR_1, EXPECTED_LIFE_MONTHS_1, DEPRED_MONTHS_1, LOA' +
        'DING_UNIT_1,'
      
        #9#9'MONTH_DEPRE_RATE_1, MONTH_DEPRE_AMT_1, DEPRE_ACCT_PTR_1, YEAR_' +
        'ORGI_VALUE_OPEN_1,'
      
        #9#9'YEAR_ORGI_VALUE_INCREASE_1, YEAR_ORGI_VALUE_DECREASE_1, YEAR_D' +
        'EPRE_SUMMED_OPEN_1, '
      
        #9#9'YEAR_DEPRE_SUMMED_INCREASE_1, YEAR_DEPRE_SUMMED_DECREASE_1, de' +
        'pr_rate_method_1  '
      'from data0327'
      'where rkey = :rkey')
    Left = 48
    Top = 368
    object ado327_1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ado327_1fasset_ptr: TIntegerField
      FieldName = 'fasset_ptr'
    end
    object ado327_1alter_date: TDateTimeField
      FieldName = 'alter_date'
    end
    object ado327_1alter_type: TWordField
      FieldName = 'alter_type'
    end
    object ado327_1Reason: TStringField
      FieldName = 'Reason'
      Size = 100
    end
    object ado327_1increased_orig_value: TFloatField
      FieldName = 'increased_orig_value'
    end
    object ado327_1increased_surplus_value: TFloatField
      FieldName = 'increased_surplus_value'
    end
    object ado327_1ORIGINAL_VALUE: TFloatField
      FieldName = 'ORIGINAL_VALUE'
      DisplayFormat = '#,##0.00'
    end
    object ado327_1SUMMED_DEPRE: TFloatField
      FieldName = 'SUMMED_DEPRE'
      DisplayFormat = '#,##0.00'
    end
    object ado327_1NET_VALUE: TFloatField
      FieldName = 'NET_VALUE'
      DisplayFormat = '#,##0.00'
    end
    object ado327_1LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 40
    end
    object ado327_1SURPLUS_RATE: TFloatField
      FieldName = 'SURPLUS_RATE'
      DisplayFormat = '#,##0.00'
    end
    object ado327_1SURPLUS: TFloatField
      FieldName = 'SURPLUS'
      DisplayFormat = '#,##0.00'
    end
    object ado327_1DEPRE_MTHD_PTR: TSmallintField
      FieldName = 'DEPRE_MTHD_PTR'
    end
    object ado327_1EXPECTED_LIFE_MONTHS: TFloatField
      FieldName = 'EXPECTED_LIFE_MONTHS'
    end
    object ado327_1DEPRED_MONTHS: TFloatField
      FieldName = 'DEPRED_MONTHS'
    end
    object ado327_1LOADING_UNIT: TStringField
      FieldName = 'LOADING_UNIT'
      Size = 10
    end
    object ado327_1MONTH_DEPRE_RATE: TFloatField
      FieldName = 'MONTH_DEPRE_RATE'
      DisplayFormat = '#,##0.0000'
    end
    object ado327_1MONTH_DEPRE_AMT: TBCDField
      FieldName = 'MONTH_DEPRE_AMT'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object ado327_1DEPRE_ACCT_PTR: TIntegerField
      FieldName = 'DEPRE_ACCT_PTR'
    end
    object ado327_1YEAR_ORGI_VALUE_OPEN: TFloatField
      FieldName = 'YEAR_ORGI_VALUE_OPEN'
    end
    object ado327_1YEAR_ORGI_VALUE_INCREASE: TFloatField
      FieldName = 'YEAR_ORGI_VALUE_INCREASE'
    end
    object ado327_1YEAR_ORGI_VALUE_DECREASE: TFloatField
      FieldName = 'YEAR_ORGI_VALUE_DECREASE'
    end
    object ado327_1YEAR_DEPRE_SUMMED_OPEN: TFloatField
      FieldName = 'YEAR_DEPRE_SUMMED_OPEN'
    end
    object ado327_1YEAR_DEPRE_SUMMED_INCREASE: TFloatField
      FieldName = 'YEAR_DEPRE_SUMMED_INCREASE'
    end
    object ado327_1YEAR_DEPRE_SUMMED_DECREASE: TFloatField
      FieldName = 'YEAR_DEPRE_SUMMED_DECREASE'
    end
    object ado327_1depr_rate_method: TWordField
      FieldName = 'depr_rate_method'
    end
    object ado327_1alter_by_ptr: TIntegerField
      FieldName = 'alter_by_ptr'
    end
    object ado327_1voucher_ptr: TIntegerField
      FieldName = 'voucher_ptr'
    end
    object ado327_1fasset_type_ptr: TIntegerField
      FieldName = 'fasset_type_ptr'
    end
    object ado327_1status_ptr: TIntegerField
      FieldName = 'status_ptr'
    end
    object ado327_1DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ado327_1dept_ptr_1: TIntegerField
      FieldName = 'dept_ptr_1'
    end
    object ado327_1fasset_type_ptr_1: TIntegerField
      FieldName = 'fasset_type_ptr_1'
    end
    object ado327_1status_ptr_1: TIntegerField
      FieldName = 'status_ptr_1'
    end
    object ado327_1ORIGINAL_VALUE_1: TFloatField
      FieldName = 'ORIGINAL_VALUE_1'
      DisplayFormat = '#,##0.00'
    end
    object ado327_1SUMMED_DEPRE_1: TFloatField
      FieldName = 'SUMMED_DEPRE_1'
      DisplayFormat = '#,##0.00'
    end
    object ado327_1NET_VALUE_1: TFloatField
      FieldName = 'NET_VALUE_1'
      DisplayFormat = '#,##0.00'
    end
    object ado327_1LOCATION_1: TStringField
      FieldName = 'LOCATION_1'
      Size = 40
    end
    object ado327_1SURPLUS_RATE_1: TFloatField
      Tag = 1
      FieldName = 'SURPLUS_RATE_1'
      OnValidate = ado327_1EXPECTED_LIFE_MONTHS_1Validate
      DisplayFormat = '#,##0.00'
    end
    object ado327_1SURPLUS_1: TFloatField
      FieldName = 'SURPLUS_1'
      DisplayFormat = '#,##0.00'
    end
    object ado327_1DEPRE_MTHD_PTR_1: TSmallintField
      FieldName = 'DEPRE_MTHD_PTR_1'
    end
    object ado327_1EXPECTED_LIFE_MONTHS_1: TFloatField
      FieldName = 'EXPECTED_LIFE_MONTHS_1'
      OnValidate = ado327_1EXPECTED_LIFE_MONTHS_1Validate
    end
    object ado327_1DEPRED_MONTHS_1: TFloatField
      FieldName = 'DEPRED_MONTHS_1'
    end
    object ado327_1LOADING_UNIT_1: TStringField
      FieldName = 'LOADING_UNIT_1'
      Size = 10
    end
    object ado327_1MONTH_DEPRE_RATE_1: TFloatField
      FieldName = 'MONTH_DEPRE_RATE_1'
      DisplayFormat = '#,##0.0000'
    end
    object ado327_1MONTH_DEPRE_AMT_1: TBCDField
      FieldName = 'MONTH_DEPRE_AMT_1'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object ado327_1DEPRE_ACCT_PTR_1: TIntegerField
      FieldName = 'DEPRE_ACCT_PTR_1'
    end
    object ado327_1YEAR_ORGI_VALUE_OPEN_1: TFloatField
      FieldName = 'YEAR_ORGI_VALUE_OPEN_1'
    end
    object ado327_1YEAR_ORGI_VALUE_INCREASE_1: TFloatField
      FieldName = 'YEAR_ORGI_VALUE_INCREASE_1'
    end
    object ado327_1YEAR_ORGI_VALUE_DECREASE_1: TFloatField
      FieldName = 'YEAR_ORGI_VALUE_DECREASE_1'
    end
    object ado327_1YEAR_DEPRE_SUMMED_OPEN_1: TFloatField
      FieldName = 'YEAR_DEPRE_SUMMED_OPEN_1'
    end
    object ado327_1YEAR_DEPRE_SUMMED_INCREASE_1: TFloatField
      FieldName = 'YEAR_DEPRE_SUMMED_INCREASE_1'
    end
    object ado327_1YEAR_DEPRE_SUMMED_DECREASE_1: TFloatField
      FieldName = 'YEAR_DEPRE_SUMMED_DECREASE_1'
    end
    object ado327_1depr_rate_method_1: TWordField
      FieldName = 'depr_rate_method_1'
    end
  end
  object DataSource7: TDataSource
    DataSet = ado327_1
    Left = 112
    Top = 368
  end
  object ado325_2: TADOQuery
    Connection = ADOConnection1
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
        Name = 'rkey327'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'type'
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
      
        'where (data0325.fasset_ptr=:rkey517 or data0325.d327_ptr=:rkey32' +
        '7) and data0325.chgtype=:type')
    Left = 184
    Top = 320
    object ado325_2rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ado325_2fasset_ptr: TIntegerField
      FieldName = 'fasset_ptr'
    end
    object ado325_2curr_ptr: TIntegerField
      FieldName = 'curr_ptr'
    end
    object ado325_2CURR_CODE: TStringField
      DisplayLabel = #21407#24065
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ado325_2ex_rate: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'ex_rate'
    end
    object ado325_2orig_curr_orig_value: TBCDField
      DisplayLabel = #21407#24065#37329#39069
      FieldName = 'orig_curr_orig_value'
      Precision = 19
    end
    object ado325_2curr_value: TFloatField
      DisplayLabel = #26412#20301#24065#37329#39069
      FieldName = 'curr_value'
      ReadOnly = True
    end
  end
  object ado326_2: TADOQuery
    Connection = ADOConnection1
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
        Name = 'rkey327'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'type'
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
      
        'where (data0326.fasset_ptr=:rkey517 or data0326.d327_ptr=:rkey32' +
        '7) and data0326.chgtype=:type')
    Left = 184
    Top = 368
    object ado326_2DEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ado326_2DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ado326_2dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ado326_2FACCU_DEPT_GL_PTR: TIntegerField
      FieldName = 'FACCU_DEPT_GL_PTR'
    end
    object ado326_2GL_ACC_NUMBER: TStringField
      DisplayLabel = #25240#26087#31185#30446
      FieldName = 'GL_ACC_NUMBER'
      Size = 18
    end
    object ado326_2GL_DESCRIPTION: TStringField
      DisplayLabel = #31185#30446#21517#31216
      FieldName = 'GL_DESCRIPTION'
      Size = 50
    end
    object ado326_2PERCENTS: TFloatField
      DisplayLabel = #30334#20998#27604
      FieldName = 'PERCENTS'
    end
    object ado326_2fasset_ptr: TIntegerField
      FieldName = 'fasset_ptr'
    end
    object ado326_2rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object DataSource8: TDataSource
    DataSet = ado326_1
    Left = 440
    Top = 352
  end
end
