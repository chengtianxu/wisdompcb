object DM: TDM
  OldCreateOrder = False
  Left = 440
  Top = 307
  Height = 291
  Width = 387
  object ADOCon: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdompcb1077;Persist Security Info' +
      '=True;User ID=sa;Initial Catalog=wisdompcb_bak;Data Source=172.1' +
      '6.68.8'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 36
    Top = 14
  end
  object wzdata306: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterOpen = wzdata306AfterScroll
    AfterScroll = wzdata306AfterScroll
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'SELECT wzdata306.*,'
      '      Data0034.DEPT_NAME, Data0034.DEPT_CODE, Data0023.CODE,'
      '      Data0023.SUPPLIER_NAME, Data0023.ABBR_NAME,    '
      '      dbo.Data0005.EMPL_CODE, dbo.Data0005.EMPLOYEE_NAME,'
      'd5.EMPL_CODE EMPL_CODE_A, d5.EMPLOYEE_NAME EMPLOYEE_NAME_A,'
      'case  when wzdata306.status=1 then '#39#26410#25552#20132#39
      '         when wzdata306.status=2 then '#39#24453#23457#25209#39
      '         when wzdata306.status=3 then  '#39#24050#25209#20934#39
      '         when wzdata306.status=4 then '#39#24050#25910#36135#39
      '         when wzdata306.status=5 then '#39#34987#36864#22238#39
      'end   v_status ,wzdata303.deliver_number      '
      'FROM dbo.Data0023 INNER JOIN'
      
        '      dbo.WZDATA306 ON dbo.Data0023.RKEY = WZDATA306.supp_ptr IN' +
        'NER JOIN'
      
        '      dbo.Data0034 ON dbo.WZDATA306.dept_ptr = dbo.Data0034.RKEY' +
        ' INNER JOIN'
      
        '      dbo.wzData303 ON dbo.WZDATA306.deliver_ptr = dbo.wzData303' +
        '.RKEY INNER JOIN'
      
        '      dbo.Data0005 ON dbo.WZDATA306.empl_ptr = dbo.Data0005.RKEY' +
        '  left JOIN'
      '      dbo.Data0005 d5 ON dbo.WZDATA306.auth_empl = d5.RKEY  ')
    Left = 187
    Top = 10
    object wzdata306rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object wzdata306rejected_number: TStringField
      DisplayLabel = #36864#36135#21333#21495
      FieldName = 'rejected_number'
      Size = 15
    end
    object wzdata306DELIVER_PTR: TIntegerField
      FieldName = 'DELIVER_PTR'
    end
    object wzdata306supp_ptr: TIntegerField
      FieldName = 'supp_ptr'
    end
    object wzdata306DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object wzdata306EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object wzdata306return_date: TDateTimeField
      DisplayLabel = #36864#36135#26085#26399
      FieldName = 'return_date'
    end
    object wzdata306ENT_DATE: TDateTimeField
      DisplayLabel = #21019#24314#26085#26399
      FieldName = 'ENT_DATE'
    end
    object wzdata306STATUS: TWordField
      FieldName = 'STATUS'
    end
    object wzdata306REMARK: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REMARK'
      Size = 100
    end
    object wzdata306return_qty: TIntegerField
      DisplayLabel = #36864#36135#24635#25968
      FieldName = 'return_qty'
    end
    object wzdata306AUTH_EMPL: TIntegerField
      FieldName = 'AUTH_EMPL'
    end
    object wzdata306AUTH_DATE: TDateTimeField
      DisplayLabel = #23457#26680#26085#26399
      FieldName = 'AUTH_DATE'
    end
    object wzdata306DEPT_NAME: TStringField
      DisplayLabel = #24037#24207#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object wzdata306DEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object wzdata306CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object wzdata306SUPPLIER_NAME: TStringField
      DisplayLabel = #20379#24212#21830#20840#31216
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object wzdata306ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object wzdata306EMPL_CODE: TStringField
      DisplayLabel = #21019#24314#20154#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object wzdata306EMPLOYEE_NAME: TStringField
      DisplayLabel = #21019#24314#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object wzdata306EMPL_CODE_A: TStringField
      DisplayLabel = #23457#26680#20154#20195#30721
      FieldName = 'EMPL_CODE_A'
      Size = 10
    end
    object wzdata306EMPLOYEE_NAME_A: TStringField
      DisplayLabel = #23457#26680#20154
      FieldName = 'EMPLOYEE_NAME_A'
      Size = 16
    end
    object wzdata306v_status: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'v_status'
      ReadOnly = True
      Size = 6
    end
    object wzdata306deliver_number: TStringField
      DisplayLabel = #20837#24211#21333#21495
      FieldName = 'deliver_number'
      Size = 15
    end
  end
  object DS1: TDataSource
    DataSet = wzdata306
    Left = 123
    Top = 10
  end
  object adowz307: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'key306'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select WZDATA307.*,data0025.manu_part_number  from WZDATA307 inn' +
        'er join data0025 on WZDATA307.custpart_ptr=data0025.rkey'
      'where   WZDATA307.rejected_ptr=:key306')
    Left = 187
    Top = 63
    object adowz307RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object adowz307rejected_ptr: TIntegerField
      FieldName = 'rejected_ptr'
    end
    object adowz307received_ptr: TIntegerField
      FieldName = 'received_ptr'
    end
    object adowz307CUSTPART_PTR: TIntegerField
      FieldName = 'CUSTPART_PTR'
    end
    object adowz307STANDARD: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'STANDARD'
      Size = 30
    end
    object adowz307rework_qry: TIntegerField
      DisplayLabel = #36820#24037#25968#37327
      FieldName = 'rework_qry'
    end
    object adowz307UNIT_NAME: TStringField
      DisplayLabel = #36864#36135#21333#20301
      FieldName = 'UNIT_NAME'
      Size = 50
    end
    object adowz307received_qty: TIntegerField
      DisplayLabel = #36820#24037#24050#25509#21463#25968
      FieldName = 'received_qty'
    end
    object adowz307particulars_REMARK: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'particulars_REMARK'
      Size = 50
    end
    object adowz307manu_part_number: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'manu_part_number'
    end
  end
  object DS2: TDataSource
    DataSet = adowz307
    Left = 124
    Top = 71
  end
  object Tmp: TADOQuery
    Connection = ADOCon
    LockType = ltPessimistic
    ParamCheck = False
    Parameters = <>
    Left = 47
    Top = 121
  end
end
