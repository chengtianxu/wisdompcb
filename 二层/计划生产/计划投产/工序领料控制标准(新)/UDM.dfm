object DM: TDM
  OldCreateOrder = False
  Left = 819
  Top = 287
  Height = 239
  Width = 423
  object con1: TADOConnection
    CommandTimeout = 300
    ConnectionTimeout = 300
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 8
  end
  object qry_temp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 72
    Top = 8
  end
  object qry_selProcess: TADOQuery
    Connection = con1
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      '  declare @TempTable table(IsSelected bit)      '
      '  insert @TempTable'
      '  values (0)'
      'select b. IsSelected,a.rkey,a.dept_code,a.dept_name'
      'from  data0034  a '
      ' join @TempTable b on 1=1'
      'where a.ACTIVE_FLAG=0')
    Left = 120
    Top = 112
    object blnfld_selProcessIsSelected: TBooleanField
      FieldName = 'IsSelected'
    end
    object atncfld_selProcessrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object strngfld_selProcessdept_code: TStringField
      FieldName = 'dept_code'
      Size = 10
    end
    object strngfld_selProcessdept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
  end
  object qry_SelMateriel: TADOQuery
    Connection = con1
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      '  declare @TempTable table(IsSelected bit)      '
      '  insert @TempTable'
      '  values (0)'
      
        'select  b. IsSelected  ,a.rkey,a.Inv_part_number as  '#26448#26009#32534#21495',a.inv_' +
        'part_number as '#29289#26009#35268#26684', a.inv_Name as '#26448#26009#21517#31216
      
        ',c.unit_name as '#24211#23384#21333#20301', d.unit_name as '#37319#36141#21333#20301',a.STOCK_SELL as '#26631#20934#21333#20301#38754#31215 +
        ',a.STOCK_BASE as '#26631#20934#21333#20301#37325#37327
      'from   data0017 a '
      'join @TempTable b  on 1=1'
      'left join data0002 c on a.STOCK_UNIT_PTR=c.rkey'
      'left join data0002 d on a.PURCH_UNIT_PTR=d.rkey')
    Left = 208
    Top = 112
    object blnfld_SelMaterielIsSelected: TBooleanField
      FieldName = 'IsSelected'
    end
    object atncfld_SelMaterielrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object strngfld_SelMaterielDSDesigner: TStringField
      FieldName = #26448#26009#32534#21495
      Size = 25
    end
    object strngfld_SelMaterielDSDesigner2: TStringField
      FieldName = #29289#26009#35268#26684
      Size = 25
    end
    object strngfld_SelMaterielDSDesigner3: TStringField
      FieldName = #26448#26009#21517#31216
      Size = 30
    end
    object strngfld_SelMaterielDSDesigner4: TStringField
      FieldName = #24211#23384#21333#20301
    end
    object strngfld_SelMaterielDSDesigner5: TStringField
      FieldName = #37319#36141#21333#20301
    end
    object fltfld_SelMaterielDSDesigner6: TFloatField
      FieldName = #26631#20934#21333#20301#38754#31215
    end
    object fltfld_SelMaterielDSDesigner7: TFloatField
      FieldName = #26631#20934#21333#20301#37325#37327
    end
  end
  object qry_SelMan: TADOQuery
    Connection = con1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      '  declare @TempTable table(IsSelected bit)      '
      '  insert @TempTable'
      '  values (0)'
      
        'select b. IsSelected,a.rkey,a.user_login_name,a.user_full_name,d' +
        '05.phone '#30005#35805', case when d05.active_flag='#39'Y'#39' then '#39#26377#25928#39' else '#39#26080#25928#39' e' +
        'nd as '#26159#21542#26377#25928
      'from  data0073  a '
      ' INNER JOIN  dbo.Data0005  d05 ON a.EMPLOYEE_PTR = d05.RKEY '
      'join @TempTable b on 1=1'
      'where  d05.active_flag='#39'Y'#39)
    Left = 320
    Top = 104
    object blnfld_SelManIsSelected: TBooleanField
      FieldName = 'IsSelected'
    end
    object atncfld_SelManrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object strngfld_SelManuser_login_name: TStringField
      FieldName = 'user_login_name'
      Size = 15
    end
    object strngfld_SelManuser_full_name: TStringField
      FieldName = 'user_full_name'
      Size = 30
    end
    object qry_SelManDSDesigner: TStringField
      FieldName = #30005#35805
      Size = 14
    end
    object qry_SelManDSDesigner2: TStringField
      FieldName = #26159#21542#26377#25928
      ReadOnly = True
      Size = 4
    end
  end
  object qry1: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 160
    Top = 40
  end
end
