object DM: TDM
  OldCreateOrder = False
  Left = 298
  Top = 195
  Height = 325
  Width = 340
  object ADOConnection: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 32
  end
  object ADS569: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.DATA0569.formula_number, '#13#10'CASE dbo.DATA0569.ttyp' +
      'e WHEN 0 THEN '#39#29289#26009#28040#32791#39' WHEN 1 THEN '#39#20135#20540#32479#35745#39' END AS v_type, '#13#10'       ' +
      '               dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME,DA' +
      'TA0569.dept_ptr,'#13#10'                      dbo.DATA0569.theorycalc_' +
      'meth, dbo.DATA0569.measurecalc_meth1, '#13#10'                      db' +
      'o.DATA0569.measurecalc_meth2, dbo.DATA0569.measurecalc_meth3,'#13#10'P' +
      'ARA_PTR_0, PARA_PTR_1, PARA_PTR_2, PARA_PTR_3, PARA_PTR_4, '#13#10'PAR' +
      'A_PTR_5, PARA_PTR_6, PARA_PTR_7, PARA_PTR_8, PARA_PTR_9'#13#10'FROM   ' +
      '      dbo.DATA0569 INNER JOIN'#13#10'                      dbo.Data003' +
      '4 ON dbo.DATA0569.dept_ptr = dbo.Data0034.RKEY'
    IndexFieldNames = 'formula_number'
    Parameters = <>
    Left = 120
    Top = 96
    object ADS569formula_number: TStringField
      DisplayLabel = #20844#24335#32534#30721
      FieldName = 'formula_number'
      Size = 10
    end
    object ADS569v_type: TStringField
      DisplayLabel = #31867#22411#13#10
      FieldName = 'v_type'
      ReadOnly = True
      Size = 8
    end
    object ADS569DEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721#13#10
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADS569DEPT_NAME: TStringField
      DisplayLabel = #24037#24207#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADS569theorycalc_meth: TStringField
      DisplayLabel = #29702#35770#20844#24335
      FieldName = 'theorycalc_meth'
      Size = 400
    end
    object ADS569measurecalc_meth1: TStringField
      DisplayLabel = #26368#22823#20540#20844#24335
      FieldName = 'measurecalc_meth1'
      Size = 400
    end
    object ADS569measurecalc_meth2: TStringField
      DisplayLabel = #26368#23567#20540#20844#24335
      FieldName = 'measurecalc_meth2'
      Size = 400
    end
    object ADS569measurecalc_meth3: TStringField
      DisplayLabel = #24179#22343#20540#20844#24335
      FieldName = 'measurecalc_meth3'
      Size = 400
    end
    object ADS569dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ADS569PARA_PTR_0: TIntegerField
      FieldName = 'PARA_PTR_0'
    end
    object ADS569PARA_PTR_1: TIntegerField
      FieldName = 'PARA_PTR_1'
    end
    object ADS569PARA_PTR_2: TIntegerField
      FieldName = 'PARA_PTR_2'
    end
    object ADS569PARA_PTR_3: TIntegerField
      FieldName = 'PARA_PTR_3'
    end
    object ADS569PARA_PTR_4: TIntegerField
      FieldName = 'PARA_PTR_4'
    end
    object ADS569PARA_PTR_5: TIntegerField
      FieldName = 'PARA_PTR_5'
    end
    object ADS569PARA_PTR_6: TIntegerField
      FieldName = 'PARA_PTR_6'
    end
    object ADS569PARA_PTR_7: TIntegerField
      FieldName = 'PARA_PTR_7'
    end
    object ADS569PARA_PTR_8: TIntegerField
      FieldName = 'PARA_PTR_8'
    end
    object ADS569PARA_PTR_9: TIntegerField
      FieldName = 'PARA_PTR_9'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS569
    Left = 56
    Top = 96
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 232
    Top = 48
  end
end
