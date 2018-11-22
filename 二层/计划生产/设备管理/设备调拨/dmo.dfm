object DM: TDM
  OldCreateOrder = False
  Left = 466
  Top = 164
  Height = 255
  Width = 273
  object ADOConn: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 56
  end
  object ADO573: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT DATA0573.rkey,DATA0573.allocate_number,DATA0417.FASSET_CO' +
      'DE,DATA0417.BOOK_DATE,DATA0417.FASSET_NAME,Data0514.FASSET_TYPE,' +
      #13#10'       Data0515.FASSET_ALT_TYPE,DATA0417.FASSET_DESC,Data0516.' +
      'FASSET_STATUS,Data0034.DEPT_NAME,DATA0417.LOCATION,'#13#10'       Data' +
      '0015.ABBR_NAME,DATA0417.supplier_name,DATA0573.allocate_date,DAT' +
      'A0573.alloccate_type,Data0005.EMPLOYEE_NAME,'#13#10'       DATA0573.en' +
      't_date,DATA0573.ORIGINAL_VALUE,DATA0573.SUMMED_DEPRE,DATA0573.NE' +
      'T_VALUE,DATA0573.EXPECTED_LIFE_MONTHS,'#13#10'       DATA0573.DEPRED_M' +
      'ONTHS,DATA0573.alloc_outfac,DATA0573.alloc_outdeptname,DATA0573.' +
      'outdeptname_empl,DATA0573.out_equipment,'#13#10'       DATA0573.alloc_' +
      'infac,DATA0573.alloc_indeptname,DATA0573.indeptname_empl,DATA057' +
      '3.in_equipment,Data0005_1.EMPL_CODE AS ck,'#13#10'       Data0005_2.EM' +
      'PLOYEE_NAME AS cw,Data0005_3.EMPLOYEE_NAME AS zjl,Data0005_4.EMP' +
      'LOYEE_NAME AS sbzj,DATA0573.warehouse_date,'#13#10'       DATA0573.fin' +
      'ancial_date,DATA0573.manage_date,DATA0573.chief_date,CASE DATA05' +
      '73.status WHEN '#39'0'#39' THEN '#39#35843#25320#30003#35831#39' '#13#10'       WHEN '#39'1'#39' THEN '#39#20179#24211#30830#35748#39' WHE' +
      'N '#39'2'#39' THEN '#39#36130#21153#22797#23457#39' WHEN '#39'3'#39' THEN '#39#24635#32463#29702#23457#26680#39' WHEN '#39'4'#39' THEN'#39#38598#22242#30830#35748#39' '#13#10'  ' +
      '     END AS statu,DATA0573.remark,Data0573.alloc_indept_ptr,Data' +
      '0573.fasset_ptr,Data0573.LOCATION AS LOCATION1      '#13#10'FROM   DAT' +
      'A0573 INNER JOIN'#13#10'       DATA0417 ON DATA0573.fasset_ptr = DATA0' +
      '417.RKEY LEFT OUTER JOIN'#13#10'       Data0517 ON DATA0417.FASSET_COD' +
      'E = Data0517.FASSET_CODE INNER JOIN'#13#10'       Data0005 ON DATA0573' +
      '.user_ptr = Data0005.RKEY LEFT OUTER JOIN'#13#10'       Data0015 ON DA' +
      'TA0417.warehouse_ptr = Data0015.RKEY LEFT OUTER JOIN'#13#10'       Dat' +
      'a0034 ON DATA0417.DEPT_PTR = Data0034.RKEY LEFT OUTER JOIN'#13#10'    ' +
      '   Data0005 AS Data0005_1 ON DATA0573.warehouse_user = Data0005_' +
      '1.RKEY LEFT OUTER JOIN'#13#10'       Data0005 AS Data0005_2 ON DATA057' +
      '3.financial_user = Data0005_2.RKEY LEFT OUTER JOIN'#13#10'       Data0' +
      '005 AS Data0005_3 ON DATA0573.manage_user = Data0005_3.RKEY LEFT' +
      ' OUTER JOIN'#13#10'       Data0005 AS Data0005_4 ON DATA0573.chief_use' +
      'r = Data0005_4.RKEY INNER JOIN'#13#10'       Data0514 ON DATA0417.FASS' +
      'ET_TYPE_PTR = Data0514.RKEY LEFT OUTER JOIN'#13#10'       Data0515 ON ' +
      'Data0517.ALT_TYPE_PTR = Data0515.RKEY LEFT OUTER JOIN'#13#10'       Da' +
      'ta0516 ON Data0517.STATUS_PTR = Data0516.RKEY'#13#10'WHERE 1=1'#13#10#13#10
    Parameters = <>
    Left = 112
    Top = 8
    object ADO573rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO573allocate_number: TStringField
      FieldName = 'allocate_number'
      Size = 10
    end
    object ADO573FASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
    end
    object ADO573BOOK_DATE: TDateTimeField
      FieldName = 'BOOK_DATE'
    end
    object ADO573FASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object ADO573FASSET_TYPE: TStringField
      FieldName = 'FASSET_TYPE'
    end
    object ADO573FASSET_ALT_TYPE: TStringField
      FieldName = 'FASSET_ALT_TYPE'
      FixedChar = True
    end
    object ADO573FASSET_DESC: TStringField
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object ADO573FASSET_STATUS: TStringField
      FieldName = 'FASSET_STATUS'
    end
    object ADO573DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADO573LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 40
    end
    object ADO573ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADO573supplier_name: TStringField
      FieldName = 'supplier_name'
      Size = 50
    end
    object ADO573allocate_date: TDateTimeField
      FieldName = 'allocate_date'
    end
    object ADO573alloccate_type: TStringField
      FieldName = 'alloccate_type'
      Size = 8
    end
    object ADO573EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO573ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object ADO573ORIGINAL_VALUE: TFloatField
      FieldName = 'ORIGINAL_VALUE'
    end
    object ADO573SUMMED_DEPRE: TFloatField
      FieldName = 'SUMMED_DEPRE'
    end
    object ADO573NET_VALUE: TFloatField
      FieldName = 'NET_VALUE'
    end
    object ADO573EXPECTED_LIFE_MONTHS: TFloatField
      FieldName = 'EXPECTED_LIFE_MONTHS'
    end
    object ADO573DEPRED_MONTHS: TFloatField
      FieldName = 'DEPRED_MONTHS'
    end
    object ADO573alloc_outfac: TStringField
      FieldName = 'alloc_outfac'
    end
    object ADO573alloc_outdeptname: TStringField
      FieldName = 'alloc_outdeptname'
      Size = 30
    end
    object ADO573outdeptname_empl: TStringField
      FieldName = 'outdeptname_empl'
    end
    object ADO573out_equipment: TStringField
      FieldName = 'out_equipment'
      Size = 10
    end
    object ADO573alloc_infac: TStringField
      FieldName = 'alloc_infac'
    end
    object ADO573alloc_indeptname: TStringField
      FieldName = 'alloc_indeptname'
      Size = 30
    end
    object ADO573indeptname_empl: TStringField
      FieldName = 'indeptname_empl'
    end
    object ADO573in_equipment: TStringField
      FieldName = 'in_equipment'
      Size = 10
    end
    object ADO573ck: TStringField
      FieldName = 'ck'
      Size = 10
    end
    object ADO573cw: TStringField
      FieldName = 'cw'
      Size = 16
    end
    object ADO573zjl: TStringField
      FieldName = 'zjl'
      Size = 16
    end
    object ADO573sbzj: TStringField
      FieldName = 'sbzj'
      Size = 16
    end
    object ADO573warehouse_date: TDateTimeField
      FieldName = 'warehouse_date'
    end
    object ADO573financial_date: TDateTimeField
      FieldName = 'financial_date'
    end
    object ADO573manage_date: TDateTimeField
      FieldName = 'manage_date'
    end
    object ADO573chief_date: TDateTimeField
      FieldName = 'chief_date'
    end
    object ADO573statu: TStringField
      FieldName = 'statu'
      ReadOnly = True
      Size = 10
    end
    object ADO573remark: TStringField
      FieldName = 'remark'
      Size = 300
    end
    object ADO573alloc_indept_ptr: TIntegerField
      FieldName = 'alloc_indept_ptr'
    end
    object ADO573fasset_ptr: TIntegerField
      FieldName = 'fasset_ptr'
    end
    object ADO573LOCATION1: TStringField
      FieldName = 'LOCATION1'
      Size = 40
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO573
    Left = 184
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 112
    Top = 64
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 112
    Top = 120
  end
end
