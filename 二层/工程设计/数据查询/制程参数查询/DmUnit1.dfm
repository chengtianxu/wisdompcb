object DM: TDM
  OldCreateOrder = False
  Left = 581
  Top = 298
  Height = 403
  Width = 367
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT data0278.rkey,Data0278.PARAMETER_NAME, Data0278.PARAMETER' +
        '_DESC,'
      '      Data0494.PARAMETER_VALUE, Data0494.after_flag,'
      
        '      Data0034.DEPT_CODE, Data0034.DEPT_NAME,data0025.ANALYSIS_C' +
        'ODE_2,data0025.ANALYSIS_CODE_1,'
      '      Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC,'
      
        '      Data0010.CUST_CODE, Data0025.ttype, CASE Data0025.ttype WH' +
        'EN 0 THEN '#39#25209#37327#39' WHEN 1 THEN '#39#26679#26495#39' END as Myttype,'
      '      Data0025.LAYERS,'
      
        '      Data0025.green_flag, Data0025.PARENT_PTR,case when Data002' +
        '5.PARENT_PTR is null then '#39#22806#23618#39' else '#39#20869#23618#39' end As MyPARENT_PTR,dat' +
        'a0025.set_qty'
      ''
      'FROM Data0494 INNER JOIN'
      
        '      Data0038 ON Data0494.custpart_ptr = Data0038.SOURCE_PTR AN' +
        'D'
      '      Data0494.step_number = Data0038.STEP_NUMBER INNER JOIN'
      '      Data0278 ON'
      '      Data0494.PARAMETER_PTR = Data0278.RKEY INNER JOIN'
      '      Data0034 ON Data0038.DEPT_PTR = Data0034.RKEY INNER JOIN'
      '      Data0025 ON Data0038.SOURCE_PTR = Data0025.RKEY INNER JOIN'
      '      Data0010 ON Data0025.CUSTOMER_PTR = Data0010.RKEY'
      'WHERE 1 = 1')
    Left = 144
    Top = 16
    object ADOQuery1PARAMETER_NAME: TStringField
      DisplayLabel = #21442#25968#20195#30721
      FieldName = 'PARAMETER_NAME'
      Size = 10
    end
    object ADOQuery1PARAMETER_DESC: TStringField
      DisplayLabel = #21442#25968#21517#31216
      FieldName = 'PARAMETER_DESC'
    end
    object ADOQuery1PARAMETER_VALUE: TStringField
      DisplayLabel = #21442#25968#20540
      FieldName = 'PARAMETER_VALUE'
      Size = 30
    end
    object ADOQuery1after_flag: TStringField
      DisplayLabel = #21518#34917
      FieldName = 'after_flag'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1DEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADOQuery1DEPT_NAME: TStringField
      DisplayLabel = #24037#24207#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADOQuery1MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQuery1MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADOQuery1CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADOQuery1ttype: TWordField
      FieldName = 'ttype'
    end
    object ADOQuery1Myttype: TStringField
      DisplayLabel = #25209#37327#31867#22411
      FieldName = 'Myttype'
      ReadOnly = True
      Size = 4
    end
    object ADOQuery1LAYERS: TWordField
      DisplayLabel = #23618#25968
      FieldName = 'LAYERS'
    end
    object ADOQuery1green_flag: TStringField
      DisplayLabel = #29615#20445#20135#21697
      FieldName = 'green_flag'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1PARENT_PTR: TIntegerField
      FieldName = 'PARENT_PTR'
    end
    object ADOQuery1MyPARENT_PTR: TStringField
      DisplayLabel = #20869#22806#23618
      FieldName = 'MyPARENT_PTR'
      ReadOnly = True
      Size = 4
    end
    object ADOQuery1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1set_qty: TIntegerField
      FieldName = 'set_qty'
    end
    object strngfldADOQuery1ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 80
    end
    object strngfldADOQuery1ANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
      Size = 30
    end
  end
end
