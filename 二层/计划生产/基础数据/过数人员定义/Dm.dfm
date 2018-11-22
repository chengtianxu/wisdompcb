object dmcon: Tdmcon
  OldCreateOrder = False
  Left = 487
  Top = 215
  Height = 326
  Width = 427
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 16
  end
  object adsWorkerList: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select data0486.rkey,data0486.EMPL_PTR, data0486.LOGIN_NAME, '#13#10'(' +
      'rtrim(data0486.LOGIN_NAME)+'#39'$'#39'+rtrim(data0486.LOGIN_PASS)) LOGIN' +
      '_PASS , '#13#10'data0486.PRIV, data0486.Pswd_Decode, data0486.OutSourc' +
      'e,'#13#10'data0005.empl_code,data0005.employee_name,data0015.ABBR_NAME' +
      ','#13#10'data0034.dept_code,data0034.dept_name,data0005.tpostion,'#13#10'dat' +
      'a0005.active_flag,case data0005.active_flag when '#39'Y'#39' then '#39#22312#32844#39' w' +
      'hen '#39'N'#39' then '#39#31163#32844#39' end as Emp_Status'#13#10' from data0486 '#13#10'join data0' +
      '005 on data0486.empl_ptr=data0005.rkey'#13#10'join data0034 on data000' +
      '5.employee_id=data0034.rkey'#13#10'left join data0015 on data0015.rkey' +
      '=data0486.warehouse_ptr'#13#10'order by data0034.dept_name,data0005.em' +
      'pl_code'#13#10
    Parameters = <>
    Left = 112
    Top = 16
  end
  object dsWorkerList: TDataSource
    DataSet = adsWorkerList
    Left = 184
    Top = 16
  end
  object adsWorker: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterOpen = adsWorkerAfterOpen
    AfterInsert = adsWorkerAfterInsert
    AfterScroll = adsWorkerAfterScroll
    OnCalcFields = adsWorkerCalcFields
    CommandText = 'select * from data0486 where rKey=:F01'
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 32
    Top = 80
    object adsWorkerRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object adsWorkerEMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
      OnGetText = adsWorkerEMPL_PTRGetText
      OnSetText = adsWorkerEMPL_PTRSetText
    end
    object adsWorkerLOGIN_NAME: TStringField
      FieldName = 'LOGIN_NAME'
      FixedChar = True
      Size = 10
    end
    object adsWorkerLOGIN_PASS: TStringField
      FieldName = 'LOGIN_PASS'
      FixedChar = True
      Size = 12
    end
    object adsWorkerPRIV: TWordField
      FieldName = 'PRIV'
    end
    object adsWorkerEmpl_Name: TStringField
      FieldKind = fkCalculated
      FieldName = 'Empl_Name'
      Calculated = True
    end
    object adsWorkerPswd_Decode: TStringField
      FieldName = 'Pswd_Decode'
      Size = 16
    end
    object adsWorkerOutSource: TBooleanField
      FieldName = 'OutSource'
    end
    object adsWorkerwarehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object adsWorkerWAREHOUSE_CODE: TStringField
      FieldKind = fkCalculated
      FieldName = 'WAREHOUSE_CODE'
      Size = 50
      Calculated = True
    end
    object adsWorkerWAREHOUSE_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'ABBR_NAME'
      Size = 50
      Calculated = True
    end
  end
  object dsWorker: TDataSource
    DataSet = adsWorker
    Left = 104
    Top = 80
  end
  object adsWorkFlow: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeInsert = adsWorkFlowBeforeEdit
    BeforeEdit = adsWorkFlowBeforeEdit
    BeforeDelete = adsWorkFlowBeforeEdit
    CommandText = 'select * from Data0487 where User_Ptr=:F01'
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 32
    Top = 128
    object adsWorkFlowRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object adsWorkFlowUSER_PTR: TIntegerField
      FieldName = 'USER_PTR'
    end
    object adsWorkFlowDEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object adsWorkFlowDept_Code: TStringField
      FieldKind = fkLookup
      FieldName = 'Dept_Code'
      LookupDataSet = aqDepartment
      LookupKeyFields = 'RKEY'
      LookupResultField = 'DEPT_CODE'
      KeyFields = 'DEPT_PTR'
      Lookup = True
    end
    object adsWorkFlowDept_Name: TStringField
      FieldKind = fkLookup
      FieldName = 'Dept_Name'
      LookupDataSet = aqDepartment
      LookupKeyFields = 'RKEY'
      LookupResultField = 'DEPT_NAME'
      KeyFields = 'DEPT_PTR'
      Lookup = True
    end
  end
  object dsWorkFlow: TDataSource
    DataSet = adsWorkFlow
    Left = 104
    Top = 128
  end
  object aqDepartment: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * from data0034 where ttype=1')
    Left = 176
    Top = 128
  end
  object aqEmployee: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select rKey,Empl_Code,Employee_Name from data0005')
    Left = 176
    Top = 80
  end
  object adsPickWorkShop: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    AfterOpen = adsPickWorkShopAfterOpen
    CommandText = 
      'declare @IsSelected bit '#13#10'select @IsSelected as IsSelected, rKey' +
      ',upper(Dept_Code) as Dept_Code,'#13#10'upper(Dept_Name)+'#39' '#39' as Dept_Na' +
      'me from Data0034 where ttype=1 order by dept_Code'
    Parameters = <>
    Left = 32
    Top = 184
    object adsPickWorkShopIsSelected: TBooleanField
      FieldName = 'IsSelected'
    end
    object adsPickWorkShoprKey: TIntegerField
      FieldName = 'rKey'
      ReadOnly = True
    end
    object adsPickWorkShopDept_Code: TStringField
      FieldName = 'Dept_Code'
      Size = 10
    end
    object adsPickWorkShopDept_Name: TStringField
      FieldName = 'Dept_Name'
      Size = 30
    end
  end
  object dsPickWorkShop: TDataSource
    DataSet = cdsPickWorkShop
    Left = 328
    Top = 184
  end
  object cdsPickWorkShop: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 184
  end
  object dspPickWorkShop: TDataSetProvider
    DataSet = adsPickWorkShop
    Left = 232
    Top = 184
  end
  object adsPrintDesc: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select rtrim(D34.Dept_Code)+'#39'('#39'+rtrim(d34.Dept_Name)+'#39')'#39' as Dept' +
      ' from data0487 D487 inner join Data0034 D34 on D487.dept_ptr=d34' +
      '.rKey'#13#10'where D487.User_ptr=:F01'
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 32
    Top = 240
  end
  object Read0015: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select Rkey,WAREHOUSE_CODE,ABBR_NAME from dbo.Data0015')
    Left = 192
    Top = 239
  end
end
