object DM: TDM
  OldCreateOrder = False
  Left = 381
  Top = 306
  Height = 435
  Width = 443
  object DataSource1: TDataSource
    DataSet = ADS203
    Left = 24
    Top = 76
  end
  object DataSource3: TDataSource
    DataSet = ads252
    Left = 24
    Top = 197
  end
  object ads252: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select data0006.WORK_ORDER_NUMBER'#9'as '#24037#21333#21495','#13#10'data0006.CUT_NO'#9' as '#37197 +
      #26009#21333#21495','#13#10'data0056.WO_PTR'#9'as '#20316#19994#21333#25351#38024','#13#10'data0025.manu_part_number as '#26412#21378 +
      #32534#21495','#13#10'data0056.DEPT_PTR'#9#9'as '#24403#21069#24037#24207','#13#10'data0056.UNIT_PTR'#9#9'as '#25552#20132#26102#36873#25321#30340#38144#21806 +
      #35746#21333','#13#10'data0005.employee_name  as '#24403#21069#36807#25968#20154#21592','#13#10'data0034.dept_name     ' +
      'as '#24403#21069#24037#24207#21517#31216','#13#10'data0056.EMPLOYEE_PTR'#9'as '#24403#21069#36807#25968#20154#25351#38024','#13#10'data0056.FLOW_NO'#9 +
      #9#9'as '#27969#31243#21495','#13#10'data0056.STEP'#9#9#9'as '#24403#21069#27493#39588','#13#10'data0056.QTY_BACKLOG'#9#9'as '#24403#21069 +
      #22312#32447#25968#37327'PCS,'#13#10'data0056.PANELS'#9#9#9'as '#24403#21069#22312#32447#25968#37327'pan,'#13#10'data0056.INTIME'#9#9#9'as ' +
      #25509#25910#26102#38388','#13#10'data0056.TO_BE_STOCKED'#9'as '#24453#20837#24211#25968#37327','#13#10'data0056.TDATE'#9#9#9'as '#21019#24314#26085 +
      #26399','#13#10'data0056.LOC_PTR'#9#9'as '#20020#26102#24037#21378#25351#38024','#13#10'data0015.abbr_name      as '#20020#26102#24037 +
      #21378#21517#31216','#13#10'data0056.WTYPE'#9#9#9'as '#36820#24037#20043#21069#27493#39588#21495','#13#10'data0056.REFERENCE'#9#9'as '#22791#27880','#13#10 +
      'data0056.TO_BE_CANCD'#9'as '#24453#20837#24211'PNL'#25968','#13#10'data0056.PUT_TYPE'#9#9'as '#27491#24120#37325#26816#21019#24314#30340#22312 +
      #32447','#13#10'data0056.OUTSOURCE'#9#9'as '#20837#24211#23457#26680#26102#26159#21542#36873#25321','#13#10'data0056.tobestock_date'#9'a' +
      's '#25552#20132#20837#24211#26085#26399','#13#10'data0056.PO_NUMBER'#9#9'as '#23458#25143#35746#21333#21495','#13#10'data0203.rkey'#13#10'from  d' +
      'ata0056  join  data0006 on  data0056.WO_PTR=data0006.rkey'#13#10'     ' +
      '           join  data0252 on  data0006.rkey=data0252.rkey06'#13#10'   ' +
      '             join  data0203 on  data0252.rkey203=data0203.rkey'#13#10 +
      '           left join  data0005 on  data0005.rkey=data0056.EMPLOY' +
      'EE_PTR'#13#10'                join  data0034 on  data0034.rkey=data005' +
      '6.DEPT_PTR'#13#10'                join  data0025 on  data0203.CUST_PAR' +
      'T_PTR=data0025.rkey'#13#10'           left join  data0015 on  data0056' +
      '.LOC_PTR=data0015.rkey'#13#10'where data0252.rkey203=:rkey203'
    MasterFields = 'rkey203'
    Parameters = <
      item
        Name = 'rkey203'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 81
    Top = 197
    object ads252DSDesigner: TStringField
      FieldName = #24037#21333#21495
      Size = 22
    end
    object ads252DSDesigner2: TStringField
      FieldName = #37197#26009#21333#21495
      FixedChar = True
      Size = 12
    end
    object ads252DSDesigner3: TIntegerField
      FieldName = #20316#19994#21333#25351#38024
    end
    object ads252DSDesigner4: TStringField
      FieldName = #26412#21378#32534#21495
    end
    object ads252DSDesigner5: TIntegerField
      FieldName = #24403#21069#24037#24207
    end
    object ads252DSDesigner6: TIntegerField
      FieldName = #25552#20132#26102#36873#25321#30340#38144#21806#35746#21333
    end
    object ads252DSDesigner7: TStringField
      FieldName = #24403#21069#36807#25968#20154#21592
      Size = 16
    end
    object ads252DSDesigner8: TStringField
      FieldName = #24403#21069#24037#24207#21517#31216
      Size = 30
    end
    object ads252DSDesigner9: TIntegerField
      FieldName = #24403#21069#36807#25968#20154#25351#38024
    end
    object ads252DSDesigner10: TSmallintField
      FieldName = #27969#31243#21495
    end
    object ads252DSDesigner11: TSmallintField
      FieldName = #24403#21069#27493#39588
    end
    object ads252PCS: TFloatField
      FieldName = #24403#21069#22312#32447#25968#37327'PCS'
    end
    object ads252pan: TIntegerField
      FieldName = #24403#21069#22312#32447#25968#37327'pan'
    end
    object ads252DSDesigner12: TDateTimeField
      FieldName = #25509#25910#26102#38388
    end
    object ads252DSDesigner13: TFloatField
      FieldName = #24453#20837#24211#25968#37327
    end
    object ads252DSDesigner14: TDateTimeField
      FieldName = #21019#24314#26085#26399
    end
    object ads252DSDesigner15: TIntegerField
      FieldName = #20020#26102#24037#21378#25351#38024
    end
    object ads252DSDesigner16: TStringField
      FieldName = #20020#26102#24037#21378#21517#31216
      Size = 10
    end
    object ads252DSDesigner17: TSmallintField
      FieldName = #36820#24037#20043#21069#27493#39588#21495
    end
    object ads252DSDesigner18: TStringField
      FieldName = #22791#27880
    end
    object ads252PNL: TIntegerField
      FieldName = #24453#20837#24211'PNL'#25968
    end
    object ads252DSDesigner19: TWordField
      FieldName = #27491#24120#37325#26816#21019#24314#30340#22312#32447
    end
    object ads252DSDesigner20: TBooleanField
      FieldName = #20837#24211#23457#26680#26102#26159#21542#36873#25321
    end
    object ads252DSDesigner21: TDateTimeField
      FieldName = #25552#20132#20837#24211#26085#26399
    end
    object ads252DSDesigner22: TStringField
      FieldName = #23458#25143#35746#21333#21495
      Size = 25
    end
    object ads252rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object DataSource4: TDataSource
    DataSet = ads239
    Left = 17
    Top = 265
  end
  object ads239: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select data0239.rkey203,'#13#10'data0239.DEPT_PTR,'#13#10'data0239.DEF_ROUT_' +
      'INST,'#13#10'data0239.STEP_NUMBER,'#13#10'data0239.tooling_rev,'#13#10'data0239.TO' +
      'OL_REMARK,'#13#10'data0239.Old_Step_NO,'#13#10'data0034.dept_name'#13#10'from data' +
      '0239 join data0034 '#13#10'on data0239.dept_ptr=data0034.rkey'#13#10'where d' +
      'ata0239.rkey203=:rkey203'#13#10
    MasterFields = 'rkey203'
    Parameters = <
      item
        Size = -1
        Value = Null
      end>
    Left = 81
    Top = 265
    object ads239rkey203: TIntegerField
      FieldName = 'rkey203'
    end
    object ads239DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ads239DEF_ROUT_INST: TStringField
      FieldName = 'DEF_ROUT_INST'
      Size = 400
    end
    object ads239STEP_NUMBER: TSmallintField
      FieldName = 'STEP_NUMBER'
    end
    object ads239tooling_rev: TStringField
      FieldName = 'tooling_rev'
      FixedChar = True
      Size = 10
    end
    object ads239TOOL_REMARK: TStringField
      FieldName = 'TOOL_REMARK'
      Size = 50
    end
    object ads239Old_Step_NO: TIntegerField
      FieldName = 'Old_Step_NO'
    end
    object ads239dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
  end
  object DataSource2: TDataSource
    DataSet = ads260
    Left = 24
    Top = 133
  end
  object ads260: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select  '#13#10'data0260.rkey203,'#13#10'data0260.dept_ptr,data0034.dept_nam' +
      'e,'#13#10'data0260.user_ptr,data0005.employee_name,data0005.PHONE,'#13#10'da' +
      'ta0260.auth_date,'#13#10'data0260.PUTH_INFO,'#13#10'data0260.seq_no,'#13#10'data02' +
      '60.Information,'#13#10'data0260.auth_flag '#13#10'from data0260 '#13#10'left join ' +
      'data0005 on data0260.user_ptr=data0005.rkey'#13#10'join data0034 on  d' +
      'ata0260.dept_ptr=data0034.rkey'#13#10'join data0203 on data0260.rkey20' +
      '3=data0203.rkey'#13#10'where data0260.rkey203 =:rkey203'#13#10'order by data' +
      '0260.seq_no'
    DataSource = DataSource1
    MasterFields = 'rkey203'
    Parameters = <
      item
        Name = 'rkey203'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 80
    Top = 133
    object ads260rkey203: TIntegerField
      FieldName = 'rkey203'
    end
    object ads260dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ads260dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object ads260user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ads260employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ads260auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object ads260PUTH_INFO: TStringField
      FieldName = 'PUTH_INFO'
      Size = 50
    end
    object ads260seq_no: TIntegerField
      FieldName = 'seq_no'
    end
    object ads260auth_flag: TBooleanField
      FieldName = 'auth_flag'
    end
    object ads260Information: TIntegerField
      FieldName = 'Information'
    end
  end
  object ADOConnection1: TADOConnection
    ConnectionTimeout = 25
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 34
    Top = 12
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 245
    Top = 11
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 309
    Top = 11
  end
  object ADS203: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select DATA0203.rkey as rkey203,'#13#10'DATA0203.return_code,'#13#10'DATA020' +
      '3.user_ptr as user_ptr_203,data0005.employee_name,'#13#10'DATA0203.ENT' +
      '_DATE,'#13#10'DATA0203.submit,DATA0203.CUST_PART_PTR,data0025.manu_par' +
      't_number,'#13#10'DATA0203.dept_ptr,data0034.dept_name,'#13#10'DATA0203.v_tty' +
      'pe,data0257.remark as vttyperemark ,'#13#10'DATA0203.status,'#13#10'case DAT' +
      'A0203.status when 0 then '#39#26410#25552#20132#39' '#13#10'when 1 then '#39#24453#23457#25209#39#13#10'when 2 then ' +
      #39#24050#23457#25209#39' '#13#10'when 3 then '#39#34987#36864#22238#39' '#13#10'end as t_status,'#13#10'DATA0203.WTYPE_ste' +
      'p,'#13#10'DATA0203.describe,DATA0203.reason,'#13#10'DATA0203.[scheme],DATA02' +
      '03.panel_qty,'#13#10'DATA0203.pcs_qty,data0260.auth_flag,data0260.auth' +
      '_date,'#13#10'data0260.seq_no,data0260.user_ptr as user_ptr260,data026' +
      '0.puth_info'#13#10' from data0203 join data0034 on data0203.dept_ptr=d' +
      'ata0034.rkey'#13#10'left join data0257 on data0203.v_ttype=data0257.v_' +
      'ttype'#13#10' join data0025 on data0203.CUST_PART_PTR=data0025.rkey '#13#10 +
      'left join data0005 on data0005.rkey=data0203.user_ptr'#13#10' join dat' +
      'a0260 on data0260.rkey203=data0203.rkey'#13#10'where ((data0260.dept_p' +
      'tr=:rkey1 and data0260.auth_flag=1) or'#13#10'      (data0260.dept_ptr' +
      '=:rkey2 and data0260.user_ptr=:rkey3)'#13#10'or   (data0260.dept_ptr=:' +
      'rkey4 and data0260.user_ptr is null )'#13#10'       )'#13#10'and DATA0203.st' +
      'atus=1'#13#10
    Parameters = <
      item
        Name = 'rkey1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey2'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey3'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey4'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 80
    Top = 80
    object ADS203rkey203: TAutoIncField
      FieldName = 'rkey203'
      ReadOnly = True
    end
    object ADS203return_code: TStringField
      FieldName = 'return_code'
      Size = 10
    end
    object ADS203user_ptr_203: TIntegerField
      FieldName = 'user_ptr_203'
    end
    object ADS203employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADS203ENT_DATE: TDateTimeField
      FieldName = 'ENT_DATE'
    end
    object ADS203submit: TDateTimeField
      FieldName = 'submit'
    end
    object ADS203CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object ADS203manu_part_number: TStringField
      FieldName = 'manu_part_number'
    end
    object ADS203dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ADS203dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object ADS203v_ttype: TStringField
      FieldName = 'v_ttype'
    end
    object ADS203vttyperemark: TWideStringField
      FieldName = 'vttyperemark'
      Size = 100
    end
    object ADS203status: TWordField
      FieldName = 'status'
    end
    object ADS203t_status: TStringField
      FieldName = 't_status'
      ReadOnly = True
      Size = 6
    end
    object ADS203WTYPE_step: TIntegerField
      FieldName = 'WTYPE_step'
    end
    object ADS203describe: TWideStringField
      FieldName = 'describe'
      Size = 200
    end
    object ADS203reason: TWideStringField
      FieldName = 'reason'
      Size = 200
    end
    object ADS203scheme: TWideStringField
      FieldName = 'scheme'
      Size = 200
    end
    object ADS203panel_qty: TIntegerField
      FieldName = 'panel_qty'
    end
    object ADS203pcs_qty: TIntegerField
      FieldName = 'pcs_qty'
    end
    object ADS203auth_flag: TBooleanField
      FieldName = 'auth_flag'
    end
    object ADS203auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object ADS203seq_no: TIntegerField
      FieldName = 'seq_no'
    end
    object ADS203user_ptr260: TIntegerField
      FieldName = 'user_ptr260'
    end
    object ADS203puth_info: TStringField
      FieldName = 'puth_info'
      Size = 50
    end
  end
  object qry1: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'rkey203'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @rkey203 int'
      'set @rkey203=:rkey203'
      ''
      'insert into data0238'
      'select data0252.rkey06,'
      'data0239.DEPT_PTR,data0239.DEF_ROUT_INST,data0239.STEP_NUMBER,'
      'data0239.tooling_rev,data0239.TOOL_REMARK,data0239.Old_Step_NO'
      'from data0239 join data0203 on data0239.rkey203=data0203.rkey'
      'join data0252 on data0252.rkey203= data0203.rkey'
      'where data0203.rkey=@rkey203'
      'and not exists'
      
        '(select data0238.rkey from data0238 join data0252 on data0252.rk' +
        'ey06= data0238.wo_ptr'
      
        '                        join data0203 on data0203.rkey=data0252.' +
        'rkey203'
      'where data0203.rkey=@rkey203)'
      ''
      ''
      ''
      'update data0056'
      
        'set dept_ptr=(select top 1 dept_ptr from data0239 where rkey203=' +
        '@rkey203  order by step_number),'
      #9'step=1,'
      
        #9'wtype=(select top 1 wtype_step from data0203 where rkey=@rkey20' +
        '3)'
      'where wo_ptr in '
      '(select rkey06 from data0252 where rkey203=@rkey203)'
      ''
      '')
    Left = 280
    Top = 136
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 324
    Top = 72
  end
  object ADOQuery4: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey203'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * FROM Data0260'
      'where rkey203 = :rkey203')
    Left = 268
    Top = 200
    object ADOQuery4rkey203: TIntegerField
      FieldName = 'rkey203'
    end
    object ADOQuery4dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ADOQuery4user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADOQuery4auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object ADOQuery4PUTH_INFO: TStringField
      FieldName = 'PUTH_INFO'
      Size = 50
    end
    object ADOQuery4seq_no: TIntegerField
      FieldName = 'seq_no'
    end
    object ADOQuery4auth_flag: TBooleanField
      FieldName = 'auth_flag'
    end
    object ADOQuery4Information: TIntegerField
      FieldName = 'Information'
    end
  end
  object ADO239: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'rkey203'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * FROM DATA0239 WHERE rkey203 = :rkey203')
    Left = 284
    Top = 272
  end
  object qry2: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'rkey203'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @rkey203 int'
      'set @rkey203=:rkey203'
      ''
      'insert into data0238'
      'select data0252.rkey06,'
      'data0239.DEPT_PTR,data0239.DEF_ROUT_INST,data0239.STEP_NUMBER,'
      'data0239.tooling_rev,data0239.TOOL_REMARK,data0239.Old_Step_NO'
      'from data0239 join data0203 on data0239.rkey203=data0203.rkey'
      'join data0252 on data0252.rkey203= data0203.rkey'
      'where data0203.rkey=@rkey203'
      'and not exists'
      
        '(select data0238.rkey from data0238 join data0252 on data0252.rk' +
        'ey06= data0238.wo_ptr'
      
        '                        join data0203 on data0203.rkey=data0252.' +
        'rkey203'
      'where data0203.rkey=@rkey203)'
      ''
      '')
    Left = 344
    Top = 272
  end
  object del: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'RKEY'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0005.PHONE, dbo.Data0005.EMPLOYEE_NAME, dbo.D' +
        'ata0073.RKEY'
      'FROM         dbo.Data0005 INNER JOIN'
      
        '                      dbo.Data0073 ON dbo.Data0005.RKEY = dbo.Da' +
        'ta0073.EMPLOYEE_PTR'
      'WHERE dbo.Data0073.RKEY =:RKEY')
    Left = 176
    Top = 224
    object delPHONE: TStringField
      FieldName = 'PHONE'
      Size = 14
    end
    object delEMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object delRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 176
    Top = 12
  end
  object tmp1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 176
    Top = 68
  end
end
