object dmcon: Tdmcon
  OldCreateOrder = False
  Left = 310
  Top = 236
  Height = 356
  Width = 471
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security In' +
      'fo=True;User ID=WZPCBConnect;Initial Catalog=demo2;Data Source=1' +
      '72.18.8.89'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 8
  end
  object adsAssetList: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    BeforeInsert = adsAssetListBeforeDelete
    BeforeDelete = adsAssetListBeforeDelete
    CommandText = 
      'SELECT Data0517.RKEY,Data0517.id_code, Data0517.BOOK_DATE,  Data' +
      '0517.USER_DATE,Data0517.FASSET_CODE, Data0517.orig_original_valu' +
      'e,'#13#10'      Data0517.FASSET_NAME,Data0517.FASSET_DESC, Data0514.FA' +
      'SSET_TYPE, Data0515.FASSET_ALT_TYPE, '#13#10'      Data0105.VOUCHER, D' +
      'ata0516.FASSET_STATUS, Data0517.ORIGINAL_VALUE, Data0517.REMARK,' +
      ' Data0517.VOUCHER as VOUCHER517 , '#13#10'      Data0517.SUMMED_DEPRE,' +
      ' Data0517.NET_VALUE, Data0517.SURPLUS_RATE as SURPLUS_RATE, '#13#10'  ' +
      '    Data0517.SURPLUS,Data0517.active_flag, data0105.VOUCHER,Data' +
      '0517.ORIG_SUMMED_DEPRE,'#13#10'     CASE WHEN (Data0517.DEPRE_MTHD_PTR' +
      ' = 0)  '#13#10'      THEN '#39#19981#35745#25552#25240#26087#39' WHEN (Data0517.DEPRE_MTHD_PTR = 1) '#13 +
      #10'      THEN '#39#24179#22343#24180#38480#27861#39' WHEN (Data0517.DEPRE_MTHD_PTR = 2) '#13#10'      T' +
      'HEN '#39#24037#20316#37327#27861#39' WHEN (Data0517.DEPRE_MTHD_PTR = 3) '#13#10'      THEN '#39#21452#20493#20313#39069 +
      #36882#20943#27861#39' WHEN (Data0517.DEPRE_MTHD_PTR = 3) '#13#10'      THEN '#39#24037#20316#24180#38480#27861#39' END' +
      ' AS DEPRE_MTHD_PTR, '#13#10'      Data0517.EXPECTED_LIFE_MONTHS, Data0' +
      '517.DEPRED_MONTHS, '#13#10'      Data0517.LOADING_UNIT, Data0517.MONTH' +
      '_DEPRE_RATE, '#13#10'      Data0517.MONTH_DEPRE_AMT, Data0517.LOCATION' +
      ', '#13#10'      case when Data0105.STATUS=0 then '#39#26410#23457#39#13#10'      when Data' +
      '0105.STATUS=1 then '#39#20250#35745#24050#23457#39#13#10'when Data0105.STATUS=2 then '#39#20027#31649#24050#23457#39#9#13#10 +
      'when Data0105.STATUS=3 then '#39#24050#30331#24080#39#13#10'when Data0105.STATUS=4 then '#39 +
      #20986#32435#23457#26680#39' end as STATUS ,'#13#10'd15.abbr_name,data0517.supplier_name,Data' +
      '0517.faccu_depr_gl_ptr'#13#10'FROM Data0517 INNER JOIN'#13#10'      Data0514' +
      ' ON Data0517.FASSET_TYPE_PTR = Data0514.RKEY INNER JOIN'#13#10'      D' +
      'ata0515 ON Data0517.ALT_TYPE_PTR = Data0515.RKEY INNER JOIN'#13#10'   ' +
      '   Data0516 ON Data0517.STATUS_PTR = Data0516.RKEY LEFT OUTER JO' +
      'IN'#13#10'      Data0105 ON Data0517.voucher_ptr = Data0105.RKEY left ' +
      'join data0015 d15 on'#13#10'data0517.warehouse_ptr=d15.rkey'#13#10' WHERE (1' +
      '=1)'#13#10'ORDER BY Data0517.FASSET_CODE'
    Parameters = <>
    Left = 192
    Top = 8
  end
  object dsAssetList: TDataSource
    DataSet = adsAssetList
    Left = 128
    Top = 8
  end
  object ads517: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterOpen = ads517AfterOpen
    BeforePost = ads517BeforePost
    AfterScroll = ads517AfterScroll
    OnCalcFields = ads517CalcFields
    OnNewRecord = ads517NewRecord
    CommandText = 'select * from data0517 where rKey=:F01'
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 24
    Top = 64
    object ads517RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ads517FASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
      Size = 10
    end
    object ads517FASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object ads517FASSET_DESC: TStringField
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object ads517FASSET_TYPE_PTR: TSmallintField
      FieldName = 'FASSET_TYPE_PTR'
      OnChange = ads517FASSET_TYPE_PTRChange
      OnGetText = ads517FASSET_TYPE_PTRGetText
      OnSetText = ads517FASSET_TYPE_PTRSetText
    end
    object ads517DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ads517ALT_TYPE_PTR: TSmallintField
      FieldName = 'ALT_TYPE_PTR'
      OnGetText = ads517ALT_TYPE_PTRGetText
      OnSetText = ads517ALT_TYPE_PTRSetText
    end
    object ads517STATUS_PTR: TSmallintField
      FieldName = 'STATUS_PTR'
      OnGetText = ads517STATUS_PTRGetText
      OnSetText = ads517STATUS_PTRSetText
    end
    object ads517ORIGINAL_VALUE: TFloatField
      DisplayLabel = #24403#21069#21407#20540
      FieldName = 'ORIGINAL_VALUE'
      OnChange = ads517ORIGINAL_VALUEChange
    end
    object ads517SUMMED_DEPRE: TFloatField
      FieldName = 'SUMMED_DEPRE'
      OnChange = ads517SUMMED_DEPREChange
    end
    object ads517NET_VALUE: TFloatField
      FieldName = 'NET_VALUE'
    end
    object ads517LOCATION: TStringField
      FieldName = 'LOCATION'
      FixedChar = True
      Size = 40
    end
    object ads517SURPLUS_RATE: TFloatField
      FieldName = 'SURPLUS_RATE'
      OnChange = ads517SURPLUS_RATEChange
      OnValidate = ads517SURPLUS_RATEValidate
    end
    object ads517SURPLUS: TFloatField
      FieldName = 'SURPLUS'
    end
    object ads517DEPRE_MTHD_PTR: TSmallintField
      FieldName = 'DEPRE_MTHD_PTR'
      OnGetText = ads517DEPRE_MTHD_PTRGetText
      OnSetText = ads517DEPRE_MTHD_PTRSetText
    end
    object ads517EXPECTED_LIFE_MONTHS: TFloatField
      FieldName = 'EXPECTED_LIFE_MONTHS'
      OnChange = ads517EXPECTED_LIFE_MONTHSChange
      OnValidate = ads517EXPECTED_LIFE_MONTHSValidate
    end
    object ads517DEPRED_MONTHS: TFloatField
      FieldName = 'DEPRED_MONTHS'
      OnChange = ads517DEPRED_MONTHSChange
      OnValidate = ads517DEPRED_MONTHSValidate
    end
    object ads517LOADING_UNIT: TStringField
      FieldName = 'LOADING_UNIT'
      FixedChar = True
      Size = 10
    end
    object ads517MONTH_DEPRE_RATE: TFloatField
      FieldName = 'MONTH_DEPRE_RATE'
      OnChange = ads517MONTH_DEPRE_RATEChange
    end
    object ads517MONTH_DEPRE_AMT: TBCDField
      FieldName = 'MONTH_DEPRE_AMT'
      OnChange = ads517MONTH_DEPRE_AMTChange
      Precision = 19
      Size = 2
    end
    object ads517DEPRE_ACCT_PTR: TIntegerField
      FieldName = 'DEPRE_ACCT_PTR'
    end
    object ads517YEAR_ORGI_VALUE_OPEN: TFloatField
      FieldName = 'YEAR_ORGI_VALUE_OPEN'
    end
    object ads517YEAR_ORGI_VALUE_INCREASE: TFloatField
      FieldName = 'YEAR_ORGI_VALUE_INCREASE'
    end
    object ads517YEAR_ORGI_VALUE_DECREASE: TFloatField
      FieldName = 'YEAR_ORGI_VALUE_DECREASE'
    end
    object ads517YEAR_DEPRE_SUMMED_OPEN: TFloatField
      FieldName = 'YEAR_DEPRE_SUMMED_OPEN'
    end
    object ads517YEAR_DEPRE_SUMMED_INCREASE: TFloatField
      FieldName = 'YEAR_DEPRE_SUMMED_INCREASE'
    end
    object ads517YEAR_DEPRE_SUMMED_DECREASE: TFloatField
      FieldName = 'YEAR_DEPRE_SUMMED_DECREASE'
    end
    object ads517REMARK: TStringField
      FieldName = 'REMARK'
      Size = 100
    end
    object ads517active_flag: TBooleanField
      FieldName = 'active_flag'
    end
    object ads517fasset_gl_ptr: TIntegerField
      FieldName = 'fasset_gl_ptr'
    end
    object ads517faccu_depr_gl_ptr: TIntegerField
      FieldName = 'faccu_depr_gl_ptr'
    end
    object ads517depr_rate_method: TWordField
      FieldName = 'depr_rate_method'
    end
    object ads517voucher_ptr: TIntegerField
      FieldName = 'voucher_ptr'
    end
    object ads517id_code: TStringField
      FieldName = 'id_code'
      FixedChar = True
      Size = 15
    end
    object ads517ORIG_SUMMED_DEPRE: TFloatField
      FieldName = 'ORIG_SUMMED_DEPRE'
    end
    object ads517orig_original_value: TFloatField
      DisplayLabel = #20837#24080#21407#20540
      FieldName = 'orig_original_value'
    end
    object ads517AcctItemNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'AcctItemNo'
      Calculated = True
    end
    object ads517AcctItemName: TStringField
      FieldKind = fkCalculated
      FieldName = 'AcctItemName'
      Size = 40
      Calculated = True
    end
    object ads517FixItemNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'FixItemNo'
      Calculated = True
    end
    object ads517FixItemName: TStringField
      FieldKind = fkCalculated
      FieldName = 'FixItemName'
      Calculated = True
    end
    object ads517BOOK_DATE: TDateTimeField
      FieldName = 'BOOK_DATE'
    end
    object ads517USER_DATE: TDateTimeField
      FieldName = 'USER_DATE'
    end
    object ads517warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ads517VOUCHER: TStringField
      FieldName = 'VOUCHER'
      Size = 12
    end
    object ads517supplier_name: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'supplier_name'
      Size = 50
    end
    object ads517orig_BOOK_DATE: TDateTimeField
      FieldName = 'orig_BOOK_DATE'
    end
  end
  object ds517: TDataSource
    DataSet = ads517
    OnStateChange = ds517StateChange
    Left = 77
    Top = 71
  end
  object qryAssetType: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        'select rKey,Fasset_Type,Expected_life,Expected_surplus_rate,Prec' +
        'har1 from data0514 ')
    Left = 24
    Top = 120
  end
  object qryAssetAddType: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * from data0515 where Alt_Flag=0')
    Left = 104
    Top = 120
  end
  object qryAssetStatus: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * from data0516')
    Left = 184
    Top = 120
  end
  object ads325: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeInsert = ads325BeforeEdit
    BeforeEdit = ads325BeforeEdit
    AfterPost = ads325AfterPost
    BeforeDelete = ads325BeforeEdit
    AfterDelete = ads325AfterPost
    OnCalcFields = ads325CalcFields
    CommandText = 
      'select * from data0325 where d327_ptr is NULL and fasset_ptr=:F0' +
      '1'
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 120
    Top = 64
    object ads325rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ads325fasset_ptr: TIntegerField
      FieldName = 'fasset_ptr'
    end
    object ads325curr_ptr: TIntegerField
      FieldName = 'curr_ptr'
      OnChange = ads325curr_ptrChange
    end
    object ads325d327_ptr: TIntegerField
      FieldName = 'd327_ptr'
    end
    object ads325ex_rate: TFloatField
      FieldName = 'ex_rate'
    end
    object ads325orig_curr_orig_value: TBCDField
      FieldName = 'orig_curr_orig_value'
      Precision = 19
    end
    object ads325Curr_Value: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Curr_Value'
      Calculated = True
    end
    object ads325Curr_Name: TStringField
      FieldKind = fkCalculated
      FieldName = 'Curr_Name'
      Calculated = True
    end
  end
  object ads326: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeInsert = ads325BeforeEdit
    BeforeEdit = ads325BeforeEdit
    BeforeDelete = ads325BeforeEdit
    OnCalcFields = ads326CalcFields
    CommandText = 'select * from data0326 where fasset_ptr=:F01'
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 240
    Top = 64
    object ads326rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ads326fasset_ptr: TIntegerField
      FieldName = 'fasset_ptr'
    end
    object ads326dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ads326FACCU_DEPT_GL_PTR: TIntegerField
      FieldName = 'FACCU_DEPT_GL_PTR'
    end
    object ads326d327_ptr: TIntegerField
      FieldName = 'd327_ptr'
    end
    object ads326PERCENTS: TFloatField
      FieldName = 'PERCENTS'
    end
    object ads326AcctItemNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'AcctItemNo'
      Calculated = True
    end
    object ads326AcctItemName: TStringField
      FieldKind = fkCalculated
      FieldName = 'AcctItemName'
      Size = 60
      Calculated = True
    end
    object ads326Dept_Name: TStringField
      FieldKind = fkCalculated
      FieldName = 'Dept_Name'
      Size = 30
      Calculated = True
    end
    object ads326dept_code: TStringField
      FieldKind = fkCalculated
      FieldName = 'dept_code'
      Size = 10
      Calculated = True
    end
    object ads326dept_costname: TStringField
      DisplayLabel = #25104#26412#20013#24515
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'dept_costname'
      Size = 30
      Calculated = True
    end
  end
  object ds325: TDataSource
    DataSet = ads325
    Left = 176
    Top = 64
  end
  object ds326: TDataSource
    DataSet = ads326
    Left = 296
    Top = 64
  end
  object aqCurrency: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select rKey,Curr_Code,Curr_Name,Exch_Rate from data0001')
    Left = 248
    Top = 120
  end
  object aqDepartment: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select  data0034 .rKey,'
      '     data0034 .Dept_Code,data0034 .Dept_Name ,'
      '    data0034_cost.cost_name as dept_costname'
      'from data0034 left join data0034 as data0034_cost'
      'on data0034.cost_dept_ptr=data0034_cost.rkey')
    Left = 384
    Top = 52
    object aqDepartmentrKey: TAutoIncField
      FieldName = 'rKey'
      ReadOnly = True
    end
    object aqDepartmentDept_Code: TStringField
      FieldName = 'Dept_Code'
      Size = 10
    end
    object aqDepartmentDept_Name: TStringField
      FieldName = 'Dept_Name'
      Size = 30
    end
    object aqDepartmentdept_costname: TStringField
      FieldName = 'dept_costname'
      Size = 30
    end
  end
  object aqAcctItem: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT dbo.Data0103.RKEY, dbo.Data0103.CURR_TP, dbo.Data0103.CUR' +
        'R_PTR,'
      
        '      CASE data0103.db_cr WHEN '#39'D'#39' THEN '#39#20511#26041#39' WHEN '#39'C'#39' THEN '#39#36151#26041#39' ' +
        'END AS '#31867#22411','
      '      case data0103.curr_tp when 0 then '#39#19981#26680#31639#39
      '                            when 1 then '#39#26680#31639#39
      '                            when 2 then '#39#26680#31639#21333#19968#39
      '      end  as '#22806#24065#26680#31639','
      
        '      Data0103.GL_ACC_NUMBER, ISNULL(Data0103_1.GL_DESCRIPTION, ' +
        #39#39')'
      '      +'#39'-'#39'+ Data0103.GL_DESCRIPTION AS description_2,'
      '      Data0103_2.GL_DESCRIPTION'
      'FROM dbo.Data0103 Data0103_2 RIGHT OUTER JOIN'
      '      dbo.Data0103 Data0103_1 ON '
      '      Data0103_2.RKEY = Data0103_1.PARENT_PTR RIGHT OUTER JOIN'
      '      dbo.Data0103 ON Data0103_1.RKEY = dbo.Data0103.PARENT_PTR'
      'WHERE (dbo.Data0103.HAS_CHILD = 0)')
    Left = 384
    Top = 112
  end
  object qryTmp: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 272
    Top = 8
  end
  object ads04: TADODataSet
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    CommandText = 'select * from data0004 where rKey=27'
    Parameters = <>
    Left = 24
    Top = 176
  end
  object qryTmp2: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 80
    Top = 176
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 176
    Top = 184
  end
end
