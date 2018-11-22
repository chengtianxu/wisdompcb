object DM: TDM
  OldCreateOrder = False
  Left = 558
  Top = 194
  Height = 318
  Width = 219
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 35
    Top = 8
  end
  object ADS08: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterScroll = ADS08AfterScroll
    CommandText = 
      'select data0008.RKEY, data0008.PROD_CODE, data0008.PRODUCT_NAME,' +
      ' '#13#10'data0008.PR_GRP_POINTER,data0008. LEAD_TIME, data0008.OPT_LOT' +
      '_SIZE, '#13#10'data0008.MAX_DAYS_EARLY_BUILD, data0008.PROD_SEEDVALUE,' +
      ' '#13#10'data0008.PROD_INCREMENTBY, data0008.ANALYSIS_CODE1, '#13#10'data000' +
      '8.ANALYSIS_CODE2, data0008.ANALYSIS_CODE3, '#13#10'data0008.ANALYSIS_C' +
      'ODE4, data0008.ANALYSIS_CODE5, '#13#10'data0008.G_L_POINTER, data0008.' +
      'PRECHAR1, data0008.PRECHAR2, data0008.EST_SCRAP, '#13#10'data0008.EST_' +
      'SCRAP1, data0008.difficulty_grade, data0008.difficulty_grade_val' +
      'ue, '#13#10'data0008.est_scrap_ltm, data0008.est_scrap1_lmt, data0008.' +
      'DG_ADJ_PTH,'#13#10' data0008.DG_ADJ_NPTH, data0008.batch_flag, data000' +
      '8.former_flag, data0008.IESMODEL_PTR, '#13#10'data0008.layer_pre, data' +
      '0008.REVIEW_DAYS, data0008.category, data0008.active ,'#13#10'data0007' +
      '.PR_GRP_CODE,data0007.PRODUCT_GROUP_NAME,data0619.category_name'#13 +
      #10',case data0008.active when 1 then '#39#26159#39'  when null then '#39#39' when 0' +
      ' then '#39#21542#39' end as active2'#13#10'from data0008 inner join '#13#10'data0007 on' +
      ' data0007.rkey=data0008.PR_GRP_POINTER left join '#13#10'data0619 on d' +
      'ata0619.category=data0008.category'#13#10'where 1=1'
    IndexFieldNames = 'PROD_CODE'
    Parameters = <>
    Left = 96
    Top = 72
    object ADS08RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS08PROD_CODE: TStringField
      DisplayLabel = #31867#22411#20195#30721
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADS08PRODUCT_NAME: TStringField
      DisplayLabel = #31867#22411#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADS08PR_GRP_CODE: TStringField
      DisplayLabel = #20998#32452#20195#30721
      FieldName = 'PR_GRP_CODE'
      Size = 5
    end
    object ADS08PRODUCT_GROUP_NAME: TStringField
      DisplayLabel = #20998#32452#21517#31216
      FieldName = 'PRODUCT_GROUP_NAME'
      Size = 30
    end
    object ADS08category: TStringField
      DisplayLabel = #20135#21697#31867#21035
      FieldName = 'category'
      Size = 2
    end
    object ADS08category_name: TWideStringField
      DisplayLabel = #20135#21697#31867#21035#21517#31216
      FieldName = 'category_name'
      Size = 50
    end
    object ADS08difficulty_grade_value: TFloatField
      DisplayLabel = #38454#25968
      FieldName = 'difficulty_grade_value'
    end
    object ADS08LEAD_TIME: TSmallintField
      DisplayLabel = #29983#20135#21608#26399
      FieldName = 'LEAD_TIME'
    end
    object ADS08OPT_LOT_SIZE: TIntegerField
      DisplayLabel = #26368#20339#25209
      FieldName = 'OPT_LOT_SIZE'
    end
    object ADS08active: TBooleanField
      DisplayLabel = #26159#21542#26377#25928
      FieldName = 'active'
    end
    object ADS08REVIEW_DAYS: TSmallintField
      DisplayLabel = #26377#25928#26399#22825#25968'('#20837#24211#21518')'
      FieldName = 'REVIEW_DAYS'
    end
    object ADS08EST_SCRAP: TFloatField
      DisplayLabel = #37327#20135#25253#24223#29575'%'
      FieldName = 'EST_SCRAP'
    end
    object ADS08est_scrap_ltm: TFloatField
      DisplayLabel = #37327#20135#25253#24223#19978#38480'%'
      FieldName = 'est_scrap_ltm'
    end
    object ADS08MAX_DAYS_EARLY_BUILD: TSmallintField
      DisplayLabel = #21046#36896#25552#21069#26399
      FieldName = 'MAX_DAYS_EARLY_BUILD'
    end
    object ADS08PR_GRP_POINTER: TIntegerField
      FieldName = 'PR_GRP_POINTER'
    end
    object ADS08PROD_SEEDVALUE: TStringField
      FieldName = 'PROD_SEEDVALUE'
    end
    object ADS08PROD_INCREMENTBY: TSmallintField
      FieldName = 'PROD_INCREMENTBY'
    end
    object ADS08ANALYSIS_CODE1: TStringField
      FieldName = 'ANALYSIS_CODE1'
      FixedChar = True
    end
    object ADS08ANALYSIS_CODE2: TStringField
      FieldName = 'ANALYSIS_CODE2'
      FixedChar = True
    end
    object ADS08ANALYSIS_CODE3: TStringField
      FieldName = 'ANALYSIS_CODE3'
      FixedChar = True
    end
    object ADS08ANALYSIS_CODE4: TStringField
      FieldName = 'ANALYSIS_CODE4'
      FixedChar = True
    end
    object ADS08ANALYSIS_CODE5: TStringField
      FieldName = 'ANALYSIS_CODE5'
      FixedChar = True
    end
    object ADS08G_L_POINTER: TIntegerField
      FieldName = 'G_L_POINTER'
    end
    object ADS08PRECHAR1: TStringField
      FieldName = 'PRECHAR1'
      Size = 15
    end
    object ADS08PRECHAR2: TStringField
      FieldName = 'PRECHAR2'
      Size = 15
    end
    object ADS08EST_SCRAP1: TFloatField
      FieldName = 'EST_SCRAP1'
    end
    object ADS08difficulty_grade: TIntegerField
      FieldName = 'difficulty_grade'
    end
    object ADS08est_scrap1_lmt: TFloatField
      FieldName = 'est_scrap1_lmt'
    end
    object ADS08DG_ADJ_PTH: TBCDField
      FieldName = 'DG_ADJ_PTH'
      Precision = 6
      Size = 2
    end
    object ADS08DG_ADJ_NPTH: TBCDField
      FieldName = 'DG_ADJ_NPTH'
      Precision = 6
      Size = 2
    end
    object ADS08batch_flag: TBooleanField
      FieldName = 'batch_flag'
    end
    object ADS08former_flag: TBooleanField
      FieldName = 'former_flag'
    end
    object ADS08IESMODEL_PTR: TIntegerField
      FieldName = 'IESMODEL_PTR'
    end
    object ADS08layer_pre: TIntegerField
      FieldName = 'layer_pre'
    end
    object ADS08active2: TStringField
      DisplayLabel = #26377#25928
      FieldName = 'active2'
      ReadOnly = True
      Size = 2
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 32
    Top = 160
  end
  object DS08: TDataSource
    DataSet = ADS08
    Left = 32
    Top = 64
  end
  object ADO08: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        'select data0008.RKEY, data0008.PROD_CODE, data0008.PRODUCT_NAME,' +
        ' '
      
        'data0008.PR_GRP_POINTER,data0008. LEAD_TIME, data0008.OPT_LOT_SI' +
        'ZE, '
      'data0008.MAX_DAYS_EARLY_BUILD, data0008.PROD_SEEDVALUE, '
      'data0008.PROD_INCREMENTBY, data0008.ANALYSIS_CODE1,'
      'data0008.ANALYSIS_CODE2, data0008.ANALYSIS_CODE3, '
      'data0008.ANALYSIS_CODE4, data0008.ANALYSIS_CODE5, '
      
        'data0008.G_L_POINTER, data0008.PRECHAR1, data0008.PRECHAR2, data' +
        '0008.EST_SCRAP, '
      
        'data0008.EST_SCRAP1, data0008.difficulty_grade, data0008.difficu' +
        'lty_grade_value, '
      
        'data0008.est_scrap_ltm, data0008.est_scrap1_lmt, data0008.DG_ADJ' +
        '_PTH,'
      
        ' data0008.DG_ADJ_NPTH, data0008.batch_flag, data0008.former_flag' +
        ', data0008.IESMODEL_PTR, '
      
        'data0008.layer_pre, data0008.REVIEW_DAYS, data0008.category, dat' +
        'a0008.active '
      'from data0008'
      'where 1=1')
    Left = 104
    Top = 120
    object ADO08RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO08PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADO08PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADO08PR_GRP_POINTER: TIntegerField
      FieldName = 'PR_GRP_POINTER'
    end
    object ADO08LEAD_TIME: TSmallintField
      FieldName = 'LEAD_TIME'
    end
    object ADO08OPT_LOT_SIZE: TIntegerField
      FieldName = 'OPT_LOT_SIZE'
    end
    object ADO08MAX_DAYS_EARLY_BUILD: TSmallintField
      FieldName = 'MAX_DAYS_EARLY_BUILD'
    end
    object ADO08PROD_SEEDVALUE: TStringField
      FieldName = 'PROD_SEEDVALUE'
    end
    object ADO08PROD_INCREMENTBY: TSmallintField
      FieldName = 'PROD_INCREMENTBY'
    end
    object ADO08ANALYSIS_CODE1: TStringField
      FieldName = 'ANALYSIS_CODE1'
      FixedChar = True
    end
    object ADO08ANALYSIS_CODE2: TStringField
      FieldName = 'ANALYSIS_CODE2'
      FixedChar = True
    end
    object ADO08ANALYSIS_CODE3: TStringField
      FieldName = 'ANALYSIS_CODE3'
      FixedChar = True
    end
    object ADO08ANALYSIS_CODE4: TStringField
      FieldName = 'ANALYSIS_CODE4'
      FixedChar = True
    end
    object ADO08ANALYSIS_CODE5: TStringField
      FieldName = 'ANALYSIS_CODE5'
      FixedChar = True
    end
    object ADO08G_L_POINTER: TIntegerField
      FieldName = 'G_L_POINTER'
    end
    object ADO08PRECHAR1: TStringField
      FieldName = 'PRECHAR1'
      Size = 15
    end
    object ADO08PRECHAR2: TStringField
      FieldName = 'PRECHAR2'
      Size = 15
    end
    object ADO08EST_SCRAP: TFloatField
      FieldName = 'EST_SCRAP'
    end
    object ADO08EST_SCRAP1: TFloatField
      FieldName = 'EST_SCRAP1'
    end
    object ADO08difficulty_grade: TIntegerField
      FieldName = 'difficulty_grade'
    end
    object ADO08difficulty_grade_value: TFloatField
      FieldName = 'difficulty_grade_value'
    end
    object ADO08est_scrap_ltm: TFloatField
      FieldName = 'est_scrap_ltm'
    end
    object ADO08est_scrap1_lmt: TFloatField
      FieldName = 'est_scrap1_lmt'
    end
    object ADO08DG_ADJ_PTH: TBCDField
      FieldName = 'DG_ADJ_PTH'
      Precision = 6
      Size = 2
    end
    object ADO08DG_ADJ_NPTH: TBCDField
      FieldName = 'DG_ADJ_NPTH'
      Precision = 6
      Size = 2
    end
    object ADO08batch_flag: TBooleanField
      FieldName = 'batch_flag'
    end
    object ADO08former_flag: TBooleanField
      FieldName = 'former_flag'
    end
    object ADO08IESMODEL_PTR: TIntegerField
      FieldName = 'IESMODEL_PTR'
    end
    object ADO08layer_pre: TIntegerField
      FieldName = 'layer_pre'
    end
    object ADO08REVIEW_DAYS: TSmallintField
      FieldName = 'REVIEW_DAYS'
    end
    object ADO08category: TStringField
      FieldName = 'category'
      Size = 2
    end
    object ADO08active: TBooleanField
      FieldName = 'active'
    end
  end
  object DS8: TDataSource
    DataSet = ADO08
    Left = 32
    Top = 120
  end
  object DS620: TDataSource
    DataSet = ADS620
    Left = 40
    Top = 208
  end
  object ADS620: TADODataSet
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT     dbo.DATA0620.PROD_CODE, dbo.DATA0620.warehouse_ptr, d' +
      'bo.DATA0620.EST_SCRAP, dbo.DATA0620.est_scrap_ltm, dbo.Data0015.' +
      'WAREHOUSE_CODE, dbo.Data0015.ABBR_NAME,'#13#10'                      d' +
      'bo.Data0015.WAREHOUSE_NAME'#13#10'FROM         dbo.DATA0620 INNER JOIN' +
      #13#10'                      dbo.Data0015 ON dbo.DATA0620.warehouse_p' +
      'tr = dbo.Data0015.RKEY INNER JOIN'#13#10'                      dbo.Dat' +
      'a0008 ON dbo.DATA0620.PROD_CODE = dbo.Data0008.PROD_CODE'#13#10'where ' +
      ' DATA0620.PROD_CODE=:PROD_CODE'#13#10#13#10
    Parameters = <
      item
        Name = 'PROD_CODE'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    Left = 104
    Top = 216
    object ADS620PROD_CODE: TStringField
      DisplayLabel = #31867#22411#20195#30721
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADS620warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ADS620EST_SCRAP: TBCDField
      DisplayLabel = #25253#24223#29575
      FieldName = 'EST_SCRAP'
      Precision = 6
      Size = 2
    end
    object ADS620est_scrap_ltm: TBCDField
      DisplayLabel = #25253#24223#29575#19978#38480
      FieldName = 'est_scrap_ltm'
      Precision = 6
      Size = 2
    end
    object ADS620WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADS620WAREHOUSE_NAME: TStringField
      DisplayLabel = #24037#21378#21517#31216
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object ADS620ABBR_NAME: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
  end
end
