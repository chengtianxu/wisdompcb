object damo: Tdamo
  OldCreateOrder = False
  Left = 588
  Top = 280
  Height = 356
  Width = 365
  object ds72: TDataSource
    DataSet = qry72
    Left = 144
    Top = 24
  end
  object qry72: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    AfterScroll = qry72AfterScroll
    Parameters = <>
    SQL.Strings = (
      
        'select WZCP0072.rkey,WZCP0072.rkey_492,WZCP0072.work_date,ent_da' +
        'te,ent_userptr,'
      'WZCP0072.auth_date,WZCP0072.auth_usreptr, status,'
      'case when status = 0 then '#39#26410#23457#26680#39
      'when status = 1 then '#39#24050#23457#26680#39
      'when status = 2 then '#39#24050#21462#28040#39
      'end statusname,WZCP0072.total_workhouse,WZCP0072.remark, '
      'data0492.cut_no,data05ent.employee_name as entname,'
      'data05auth.employee_name as authname ,'
      
        'data0008.prod_code,data0008.product_name,product_desc,data05ent.' +
        'rkey rkey05'
      
        'from WZCP0072 inner join data0492 on WZCP0072.rkey_492=data0492.' +
        'rkey'
      'inner join data0008 on data0492.BOM_PTR=data0008.rkey'
      
        'inner join data0005 data05ent on  WZCP0072.ent_userptr=data05ent' +
        '.rkey --'#36755#20837#20154#21592
      
        'left join data0005 data05auth on  WZCP0072.auth_usreptr=data05au' +
        'th.rkey --'#23457#26680#20154#21592
      'where (1=1) ')
    Left = 104
    Top = 24
    object qry72rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qry72rkey_492: TIntegerField
      FieldName = 'rkey_492'
    end
    object qry72work_date: TDateTimeField
      FieldName = 'work_date'
    end
    object qry72ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object qry72ent_userptr: TIntegerField
      FieldName = 'ent_userptr'
    end
    object qry72auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object qry72auth_usreptr: TIntegerField
      FieldName = 'auth_usreptr'
    end
    object qry72status: TWordField
      FieldName = 'status'
    end
    object qry72statusname: TStringField
      FieldName = 'statusname'
      ReadOnly = True
      Size = 6
    end
    object qry72total_workhouse: TBCDField
      FieldName = 'total_workhouse'
      Precision = 6
      Size = 1
    end
    object qry72remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
    object qry72cut_no: TStringField
      FieldName = 'cut_no'
      FixedChar = True
      Size = 12
    end
    object qry72entname: TStringField
      FieldName = 'entname'
      Size = 16
    end
    object qry72authname: TStringField
      FieldName = 'authname'
      Size = 16
    end
    object qry72prod_code: TStringField
      FieldName = 'prod_code'
      Size = 15
    end
    object qry72product_name: TStringField
      FieldName = 'product_name'
      Size = 30
    end
    object qry72product_desc: TStringField
      FieldName = 'product_desc'
      Size = 200
    end
    object qry72rkey05: TAutoIncField
      FieldName = 'rkey05'
      ReadOnly = True
    end
  end
  object qry73: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey72'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      
        'select  wzcp0073.*,  data0005.empl_code, data0005.employee_name,' +
        ' data0034.dept_name from wzcp0073 inner join data0005 on usr_ptr' +
        '=data0005.rkey'
      'left join  data0034 on data0005.employee_id=data0034.rkey '
      'where rkey_cp72=:rkey72')
    Left = 104
    Top = 80
    object qry73RKEY_CP72: TIntegerField
      FieldName = 'RKEY_CP72'
    end
    object qry73USR_PTR: TIntegerField
      FieldName = 'USR_PTR'
    end
    object qry73WORKHOUSE: TBCDField
      FieldName = 'WORKHOUSE'
      Precision = 4
      Size = 1
    end
    object qry73REMARK: TWideStringField
      FieldName = 'REMARK'
      Size = 50
    end
    object qry73empl_code: TStringField
      FieldName = 'empl_code'
      Size = 10
    end
    object qry73employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object qry73dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object qry73begin_date: TDateTimeField
      FieldName = 'begin_date'
    end
    object qry73end_date: TDateTimeField
      FieldName = 'end_date'
    end
  end
  object ds73: TDataSource
    DataSet = qry73
    Left = 144
    Top = 80
  end
  object qryTemp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 40
    Top = 80
  end
  object qry1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      
        'select data0492.cut_no '#39#29983#20135#21333#21495#39',data0008.prod_code '#39#20135#21697#32534#30721#39',data0008' +
        '.product_name '#39#20135#21697#21517#31216#39','
      
        'data0005.empl_code '#39#24037#21495#39', data0005.employee_name '#39#22995#21517#39', data0034.d' +
        'ept_name '#39#37096#38376#39',wzcp0073.workhouse '#39#24037#26102#39'  '
      
        ',wzcp0072.work_date '#39#24037#26102#26085#26399#39',wzcp0073.remark '#39#22791#27880#39',wzcp0073.rkey_cp' +
        '72,wzcp0073.usr_ptr'
      'from wzcp0072 '
      'inner join wzcp0073 on wzcp0072.rkey=wzcp0073.rkey_cp72'
      'inner join data0492 on wzcp0072.rkey_492=data0492.rkey'
      'left join data0008 on data0492.bom_ptr=data0008.rkey'
      'inner join data0005 on wzcp0073.usr_ptr=data0005.rkey'
      'inner join data0034 on data0005.employee_id=data0034.rkey'
      'where wzcp0072.status <> 2'
      '')
    Left = 112
    Top = 200
    object qry1DSDesigner: TStringField
      FieldName = #29983#20135#21333#21495
      FixedChar = True
      Size = 12
    end
    object qry1DSDesigner2: TStringField
      FieldName = #20135#21697#32534#30721
      Size = 15
    end
    object qry1DSDesigner3: TStringField
      FieldName = #20135#21697#21517#31216
      Size = 30
    end
    object qry1DSDesigner4: TStringField
      FieldName = #24037#21495
      Size = 10
    end
    object qry1DSDesigner5: TStringField
      FieldName = #22995#21517
      Size = 16
    end
    object qry1DSDesigner6: TStringField
      FieldName = #37096#38376
      Size = 30
    end
    object qry1DSDesigner7: TBCDField
      FieldName = #24037#26102
      Precision = 4
      Size = 1
    end
    object qry1DSDesigner8: TDateTimeField
      FieldName = #24037#26102#26085#26399
    end
    object qry1DSDesigner9: TWideStringField
      FieldName = #22791#27880
      Size = 50
    end
    object qry1rkey_cp72: TIntegerField
      FieldName = 'rkey_cp72'
    end
    object qry1usr_ptr: TIntegerField
      FieldName = 'usr_ptr'
    end
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 152
    Top = 200
  end
  object ds2: TDataSource
    DataSet = qry2
    Left = 256
    Top = 200
  end
  object qry2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select data0492.cut_no '#39#29983#20135#21333#21495#39','
      'data0008.prod_code '#39#20135#21697#32534#30721#39','
      'data0008.product_name '#39#20135#21697#21517#31216#39','
      'data0034.dept_name '#39#37096#38376#39',sum(wzcp0073.workhouse) '#39#24037#26102#39' '
      'from wzcp0072 '
      'inner join wzcp0073 on wzcp0072.rkey=wzcp0073.rkey_cp72'
      'inner join data0492 on wzcp0072.rkey_492=data0492.rkey'
      'left join data0008 on data0492.bom_ptr=data0008.rkey'
      'inner join data0005 on wzcp0073.usr_ptr=data0005.rkey'
      'inner join data0034 on data0005.employee_id=data0034.rkey'
      'where wzcp0072.status<>2 '
      '')
    Left = 216
    Top = 200
    object qry2DSDesigner: TStringField
      FieldName = #29983#20135#21333#21495
      FixedChar = True
      Size = 12
    end
    object qry2DSDesigner2: TStringField
      FieldName = #20135#21697#32534#30721
      Size = 15
    end
    object qry2DSDesigner3: TStringField
      FieldName = #20135#21697#21517#31216
      Size = 30
    end
    object qry2DSDesigner4: TStringField
      FieldName = #37096#38376
      Size = 30
    end
    object qry2DSDesigner5: TBCDField
      FieldName = #24037#26102
      ReadOnly = True
      Precision = 32
      Size = 1
    end
  end
  object qry3: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select  '#24037#21495','#22995#21517','#37096#38376','#24037#26102#26085#26399','#32771#21220#24037#26102','#24037#26102',case when round('#24037#26102'-'#32771#21220#24037#26102',1)<=0  the' +
        'n 0  ELSE round('#24037#26102'-'#32771#21220#24037#26102',1) end  as '#36229#20986#23567#26102
      'from '
      '(select data0005.empl_code '#39#24037#21495#39',data0005.employee_name '#39#22995#21517#39', '
      
        'data0034.dept_name '#39#37096#38376#39',wzcp0072.WORK_DATE as '#39#24037#26102#26085#26399#39',round(d.rwt' +
        '+d.rot,1) as '#39#32771#21220#24037#26102#39',sum(wzcp0073.workhouse) '#39#24037#26102#39
      'from wzcp0072 '
      'inner join wzcp0073 on wzcp0072.rkey=wzcp0073.rkey_cp72'
      'inner join data0492 on wzcp0072.rkey_492=data0492.rkey'
      'left join data0008 on data0492.bom_ptr=data0008.rkey'
      'inner join data0005 on wzcp0073.usr_ptr=data0005.rkey'
      'inner join data0034 on data0005.employee_id=data0034.rkey'
      'left join employeemsg e on e.employeecode=Data0005.empl_code'
      
        'left join OnOffDutyData d on d.EmployeeID=e.rkey  and d.CheckDat' +
        'e=wzcp0072.WORK_DATE'
      'where wzcp0072.status<>2'
      
        '---group by data0034.dept_name,data0005.empl_code,data0005.emplo' +
        'yee_name,wzcp0072.WORK_DATE ,round(d.rwt+d.rot,1))aa')
    Left = 112
    Top = 256
    object qry3DSDesigner: TStringField
      FieldName = #24037#21495
      Size = 10
    end
    object qry3DSDesigner2: TStringField
      FieldName = #22995#21517
      Size = 16
    end
    object qry3DSDesigner3: TStringField
      FieldName = #37096#38376
      Size = 30
    end
    object qry3DSDesigner4: TBCDField
      FieldName = #24037#26102
      ReadOnly = True
      Precision = 32
      Size = 1
    end
    object dtmfldqry3DSDesigner5: TDateTimeField
      FieldName = #24037#26102#26085#26399
    end
    object fltfldqry3DSDesigner6: TFloatField
      FieldName = #32771#21220#24037#26102
      ReadOnly = True
    end
    object fltfldqry3DSDesigner5: TFloatField
      FieldName = #36229#20986#23567#26102
      ReadOnly = True
    end
  end
  object ds3: TDataSource
    DataSet = qry3
    Left = 152
    Top = 256
  end
  object qryTemp1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 40
    Top = 128
  end
  object qryTemp2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 40
    Top = 176
  end
  object qry72s: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select  * from wzcp0072 where rkey is null')
    Left = 256
    Top = 24
    object qry72sRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qry72sRKEY_492: TIntegerField
      FieldName = 'RKEY_492'
    end
    object qry72sWORK_DATE: TDateTimeField
      FieldName = 'WORK_DATE'
    end
    object qry72sENT_DATE: TDateTimeField
      FieldName = 'ENT_DATE'
    end
    object qry72sENT_USERPTR: TIntegerField
      FieldName = 'ENT_USERPTR'
    end
    object qry72sAUTH_DATE: TDateTimeField
      FieldName = 'AUTH_DATE'
    end
    object qry72sAUTH_USREPTR: TIntegerField
      FieldName = 'AUTH_USREPTR'
    end
    object qry72sSTATUS: TWordField
      FieldName = 'STATUS'
    end
    object qry72sTOTAL_WORKHOUSE: TBCDField
      FieldName = 'TOTAL_WORKHOUSE'
      Precision = 6
      Size = 1
    end
    object qry72sREMARK: TWideStringField
      FieldName = 'REMARK'
      Size = 50
    end
  end
  object qry73s: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select  * from wzcp0073 where RKEY_CP72 is null')
    Left = 256
    Top = 80
    object qry73sRKEY_CP72: TIntegerField
      FieldName = 'RKEY_CP72'
    end
    object qry73sUSR_PTR: TIntegerField
      FieldName = 'USR_PTR'
    end
    object qry73sWORKHOUSE: TBCDField
      FieldName = 'WORKHOUSE'
      Precision = 4
      Size = 1
    end
    object qry73sREMARK: TWideStringField
      FieldName = 'REMARK'
      Size = 50
    end
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 24
  end
  object qry4: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select data0492.cut_no '#39#29983#20135#21333#21495#39','
      'data0008.prod_code '#39#20135#21697#32534#30721#39','
      
        'data0008.product_name '#39#20135#21697#21517#31216#39',data0008.WORKHOUSE  '#39#24635#24037#26102#39',sum(wzcp0' +
        '073.workhouse) '#39#24405#20837#24037#26102#39' ,'
      'cast((case when data0008.WORKHOUSE=0 then 0'
      '      when sum(wzcp0073.workhouse)=0 then 0'
      'else '
      
        '    convert(decimal(10,2),sum(wzcp0073.workhouse)/data0008.WORKH' +
        'OUSE) end )*100 as varchar)+'#39'%'#39' '#39#36827#24230#39'   '
      'from wzcp0072 '
      'inner join wzcp0073 on wzcp0072.rkey=wzcp0073.rkey_cp72'
      'inner join data0492 on wzcp0072.rkey_492=data0492.rkey'
      'left join data0008 on data0492.bom_ptr=data0008.rkey'
      
        'inner join data0005 on wzcp0073.usr_ptr=data0005.rkey  where wzc' +
        'p0072.status<>2')
    Left = 216
    Top = 256
    object qry4DSDesigner: TStringField
      FieldName = #29983#20135#21333#21495
      FixedChar = True
      Size = 12
    end
    object qry4DSDesigner2: TStringField
      FieldName = #20135#21697#32534#30721
      Size = 25
    end
    object qry4DSDesigner3: TStringField
      FieldName = #20135#21697#21517#31216
      Size = 30
    end
    object qry4DSDesigner4: TBCDField
      FieldName = #24635#24037#26102
      ReadOnly = True
      Precision = 32
      Size = 1
    end
    object qry4DSDesigner5: TBCDField
      FieldName = #24405#20837#24037#26102
      ReadOnly = True
      Precision = 32
      Size = 1
    end
    object qry4DSDesigner6: TStringField
      FieldName = #36827#24230
      ReadOnly = True
      Size = 11
    end
  end
  object ds4: TDataSource
    DataSet = qry4
    Left = 264
    Top = 256
  end
end
