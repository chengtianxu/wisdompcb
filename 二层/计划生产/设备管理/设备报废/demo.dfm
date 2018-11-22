object dm: Tdm
  OldCreateOrder = False
  Left = 369
  Top = 167
  Height = 403
  Width = 487
  object ADOCon: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security In' +
      'fo=True;User ID=wzsa;Initial Catalog=wisdompcb_bak;Data Source=1' +
      '72.16.68.8'
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 16
  end
  object temp: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 152
    Top = 24
  end
  object ADO574: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey574'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0574 where rkey=:rkey574')
    Left = 128
    Top = 200
    object ADO574rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO574allocate_number: TStringField
      FieldName = 'allocate_number'
      Size = 10
    end
    object ADO574fasset_ptr: TIntegerField
      FieldName = 'fasset_ptr'
    end
    object ADO574allocate_date: TDateTimeField
      FieldName = 'allocate_date'
    end
    object ADO574user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADO574ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object ADO574ORIGINAL_VALUE: TFloatField
      FieldName = 'ORIGINAL_VALUE'
    end
    object ADO574SUMMED_DEPRE: TFloatField
      FieldName = 'SUMMED_DEPRE'
    end
    object ADO574NET_VALUE: TFloatField
      FieldName = 'NET_VALUE'
    end
    object ADO574EXPECTED_LIFE_MONTHS: TFloatField
      FieldName = 'EXPECTED_LIFE_MONTHS'
    end
    object ADO574DEPRED_MONTHS: TFloatField
      FieldName = 'DEPRED_MONTHS'
    end
    object ADO574outdeptname_empl: TStringField
      FieldName = 'outdeptname_empl'
    end
    object ADO574out_equipment: TStringField
      FieldName = 'out_equipment'
      Size = 10
    end
    object ADO574warehouse_user: TIntegerField
      FieldName = 'warehouse_user'
    end
    object ADO574financial_user: TIntegerField
      FieldName = 'financial_user'
    end
    object ADO574manage_user: TIntegerField
      FieldName = 'manage_user'
    end
    object ADO574warehouse_date: TDateTimeField
      FieldName = 'warehouse_date'
    end
    object ADO574financial_date: TDateTimeField
      FieldName = 'financial_date'
    end
    object ADO574manage_date: TDateTimeField
      FieldName = 'manage_date'
    end
    object ADO574status: TWordField
      FieldName = 'status'
    end
    object ADO574remark: TStringField
      FieldName = 'remark'
      Size = 200
    end
    object ADO574detection_remark: TStringField
      FieldName = 'detection_remark'
      Size = 200
    end
    object ADO574scrap_remark: TStringField
      FieldName = 'scrap_remark'
      Size = 200
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS574
    Left = 176
    Top = 120
  end
  object DataSource2: TDataSource
    DataSet = ADO574
    Left = 304
    Top = 88
  end
  object ADS574: TADODataSet
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.DATA0574.rkey, dbo.DATA0574.allocate_number, dbo.' +
      'DATA0574.fasset_ptr, dbo.DATA0574.allocate_date, dbo.DATA0574.us' +
      'er_ptr, '#13#10'                      dbo.DATA0574.ent_date, dbo.DATA0' +
      '574.ORIGINAL_VALUE, dbo.DATA0574.SUMMED_DEPRE, dbo.DATA0574.NET_' +
      'VALUE, '#13#10'                      dbo.DATA0574.EXPECTED_LIFE_MONTHS' +
      ', dbo.DATA0574.DEPRED_MONTHS, dbo.DATA0574.out_equipment, dbo.DA' +
      'TA0574.outdeptname_empl, '#13#10'                      dbo.DATA0574.wa' +
      'rehouse_user, dbo.DATA0574.financial_user, dbo.DATA0574.manage_u' +
      'ser, dbo.DATA0574.warehouse_date, '#13#10'                      dbo.DA' +
      'TA0574.manage_date, dbo.DATA0574.financial_date, dbo.DATA0574.st' +
      'atus, dbo.DATA0574.remark, dbo.DATA0574.detection_remark, '#13#10'    ' +
      '                  dbo.DATA0574.scrap_remark, dbo.DATA0417.FASSET' +
      '_CODE, dbo.DATA0417.FASSET_NAME, dbo.DATA0417.FASSET_DESC,'#13#10'    ' +
      '                  dbo.data0015.warehouse_code,dbo.data0015.abbr_' +
      'name,'#13#10'                      case'#13#10'                      when da' +
      'ta0574.status=0 then '#39#25253#24223#30003#35831#39#13#10'                      when data0574' +
      '.status=1 then '#39#20179#24211#30830#35748#39#13#10'                      when data0574.statu' +
      's=2 then '#39#36130#21153#22797#23457#39#13#10'                      when data0574.status=3 th' +
      'en '#39#24635#32463#29702#23457#26680#39' end as status_u,'#13#10'                      data0005.empl' +
      'oyee_name,data0005_1.employee_name as employee_name_1,data0005_2' +
      '.employee_name as employee_name_2,data0005_3.employee_name as em' +
      'ployee_name_3'#13#10'FROM         dbo.DATA0574 INNER JOIN'#13#10'           ' +
      '           dbo.DATA0417 ON dbo.DATA0574.fasset_ptr = dbo.DATA041' +
      '7.RKEY  inner join'#13#10'                       data0015 on data0417.' +
      'warehouse_ptr=data0015.rkey  left outer join'#13#10'                  ' +
      '    data0005 on data0574.user_ptr=data0005.rkey left outer join'#13 +
      #10'                      data0005 as data0005_1 on data0574.wareho' +
      'use_user=data0005_1.rkey left outer join'#13#10'                      ' +
      'data0005 as data0005_2 on data0574.financial_user=data0005_2.rke' +
      'y left outer join'#13#10'                      data0005 as data0005_3 ' +
      'on data0574.manage_user=data0005_3.rkey'#13#10'where          data0574' +
      '.ent_date>=:dtpk1 and data0574.ent_date<=:dtpk2'
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    Prepared = True
    Left = 96
    Top = 88
    object ADS574rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS574allocate_number: TStringField
      FieldName = 'allocate_number'
      Size = 10
    end
    object ADS574fasset_ptr: TIntegerField
      FieldName = 'fasset_ptr'
    end
    object ADS574allocate_date: TDateTimeField
      FieldName = 'allocate_date'
    end
    object ADS574user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADS574ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object ADS574ORIGINAL_VALUE: TFloatField
      FieldName = 'ORIGINAL_VALUE'
    end
    object ADS574SUMMED_DEPRE: TFloatField
      FieldName = 'SUMMED_DEPRE'
    end
    object ADS574NET_VALUE: TFloatField
      FieldName = 'NET_VALUE'
    end
    object ADS574EXPECTED_LIFE_MONTHS: TFloatField
      FieldName = 'EXPECTED_LIFE_MONTHS'
    end
    object ADS574DEPRED_MONTHS: TFloatField
      FieldName = 'DEPRED_MONTHS'
    end
    object ADS574out_equipment: TStringField
      FieldName = 'out_equipment'
      Size = 10
    end
    object ADS574outdeptname_empl: TStringField
      FieldName = 'outdeptname_empl'
    end
    object ADS574warehouse_user: TIntegerField
      FieldName = 'warehouse_user'
    end
    object ADS574financial_user: TIntegerField
      FieldName = 'financial_user'
    end
    object ADS574manage_user: TIntegerField
      FieldName = 'manage_user'
    end
    object ADS574warehouse_date: TDateTimeField
      FieldName = 'warehouse_date'
    end
    object ADS574manage_date: TDateTimeField
      FieldName = 'manage_date'
    end
    object ADS574financial_date: TDateTimeField
      FieldName = 'financial_date'
    end
    object ADS574status: TWordField
      FieldName = 'status'
    end
    object ADS574remark: TStringField
      FieldName = 'remark'
      Size = 200
    end
    object ADS574detection_remark: TStringField
      FieldName = 'detection_remark'
      Size = 200
    end
    object ADS574scrap_remark: TStringField
      FieldName = 'scrap_remark'
      Size = 200
    end
    object ADS574FASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
    end
    object ADS574FASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object ADS574FASSET_DESC: TStringField
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object ADS574status_u: TStringField
      FieldName = 'status_u'
      ReadOnly = True
      Size = 10
    end
    object ADS574employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADS574employee_name_1: TStringField
      FieldName = 'employee_name_1'
      Size = 16
    end
    object ADS574employee_name_2: TStringField
      FieldName = 'employee_name_2'
      Size = 16
    end
    object ADS574employee_name_3: TStringField
      FieldName = 'employee_name_3'
      Size = 16
    end
    object ADS574warehouse_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
    object ADS574abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
  end
  object ADO517: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'fasset_code'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0517  where FASSET_CODE=:fasset_code')
    Left = 296
    Top = 176
    object ADO517RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO517FASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
    end
    object ADO517FASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object ADO517FASSET_DESC: TStringField
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object ADO517FASSET_TYPE_PTR: TSmallintField
      FieldName = 'FASSET_TYPE_PTR'
    end
    object ADO517DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADO517ALT_TYPE_PTR: TSmallintField
      FieldName = 'ALT_TYPE_PTR'
    end
    object ADO517STATUS_PTR: TSmallintField
      FieldName = 'STATUS_PTR'
    end
    object ADO517ORIGINAL_VALUE: TFloatField
      FieldName = 'ORIGINAL_VALUE'
    end
    object ADO517SUMMED_DEPRE: TFloatField
      FieldName = 'SUMMED_DEPRE'
    end
    object ADO517NET_VALUE: TFloatField
      FieldName = 'NET_VALUE'
    end
    object ADO517LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 40
    end
    object ADO517BOOK_DATE: TDateTimeField
      FieldName = 'BOOK_DATE'
    end
    object ADO517SURPLUS_RATE: TFloatField
      FieldName = 'SURPLUS_RATE'
    end
    object ADO517SURPLUS: TFloatField
      FieldName = 'SURPLUS'
    end
    object ADO517DEPRE_MTHD_PTR: TSmallintField
      FieldName = 'DEPRE_MTHD_PTR'
    end
    object ADO517EXPECTED_LIFE_MONTHS: TFloatField
      FieldName = 'EXPECTED_LIFE_MONTHS'
    end
    object ADO517DEPRED_MONTHS: TFloatField
      FieldName = 'DEPRED_MONTHS'
    end
    object ADO517LOADING_UNIT: TStringField
      FieldName = 'LOADING_UNIT'
      FixedChar = True
      Size = 10
    end
    object ADO517MONTH_DEPRE_RATE: TFloatField
      FieldName = 'MONTH_DEPRE_RATE'
    end
    object ADO517MONTH_DEPRE_AMT: TBCDField
      FieldName = 'MONTH_DEPRE_AMT'
      Precision = 19
      Size = 2
    end
    object ADO517DEPRE_ACCT_PTR: TIntegerField
      FieldName = 'DEPRE_ACCT_PTR'
    end
    object ADO517YEAR_ORGI_VALUE_OPEN: TFloatField
      FieldName = 'YEAR_ORGI_VALUE_OPEN'
    end
    object ADO517YEAR_ORGI_VALUE_INCREASE: TFloatField
      FieldName = 'YEAR_ORGI_VALUE_INCREASE'
    end
    object ADO517YEAR_ORGI_VALUE_DECREASE: TFloatField
      FieldName = 'YEAR_ORGI_VALUE_DECREASE'
    end
    object ADO517YEAR_DEPRE_SUMMED_OPEN: TFloatField
      FieldName = 'YEAR_DEPRE_SUMMED_OPEN'
    end
    object ADO517YEAR_DEPRE_SUMMED_INCREASE: TFloatField
      FieldName = 'YEAR_DEPRE_SUMMED_INCREASE'
    end
    object ADO517YEAR_DEPRE_SUMMED_DECREASE: TFloatField
      FieldName = 'YEAR_DEPRE_SUMMED_DECREASE'
    end
    object ADO517REMARK: TStringField
      FieldName = 'REMARK'
      Size = 100
    end
    object ADO517active_flag: TBooleanField
      FieldName = 'active_flag'
    end
    object ADO517fasset_gl_ptr: TIntegerField
      FieldName = 'fasset_gl_ptr'
    end
    object ADO517faccu_depr_gl_ptr: TIntegerField
      FieldName = 'faccu_depr_gl_ptr'
    end
    object ADO517depr_rate_method: TWordField
      FieldName = 'depr_rate_method'
    end
    object ADO517voucher_ptr: TIntegerField
      FieldName = 'voucher_ptr'
    end
    object ADO517id_code: TStringField
      FieldName = 'id_code'
      Size = 15
    end
    object ADO517ORIG_SUMMED_DEPRE: TFloatField
      FieldName = 'ORIG_SUMMED_DEPRE'
    end
    object ADO517orig_original_value: TFloatField
      FieldName = 'orig_original_value'
    end
    object ADO517USER_DATE: TDateTimeField
      FieldName = 'USER_DATE'
    end
    object ADO517warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ADO517VOUCHER: TStringField
      FieldName = 'VOUCHER'
      Size = 12
    end
    object ADO517supplier_name: TStringField
      FieldName = 'supplier_name'
      Size = 50
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 256
    Top = 16
  end
end
