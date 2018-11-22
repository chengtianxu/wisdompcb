object DM: TDM
  OldCreateOrder = False
  Left = 1032
  Top = 343
  Height = 377
  Width = 302
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ADS417
    Left = 24
    Top = 56
  end
  object ADS417: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterScroll = ADS417AfterScroll
    CommandText = 
      'SELECT D845_ptr, DATA0417.RKEY,DATA0417.FASSET_CODE,DATA0417.FAS' +
      'SET_NAME,DATA0417.FASSET_DESC,Data0514.FASSET_TYPE, '#13#10'       Dat' +
      'a0034.DEPT_NAME,Data0034.DEPT_CODE,DATA0417.LOCATION,DATA0417.PU' +
      'RCH_DATE,DATA0417.BOOK_DATE,DATA0417.REMARK, '#13#10'       case Data0' +
      '034.TTYPE when 1 then '#39#24037#24207#39' when 4 then '#39#37096#38376#39' when 5 then '#39#29677#32452#39' end' +
      ' as ttype,'#13#10'       case DATA0417.active_flag when 1 then '#39#26032#36827#39' wh' +
      'en 2 then '#39#20179#24211#30830#35748#39' when 3 then '#39#23433#35013#23436#25104#39' '#13#10'       when 4 then '#39#39564#25910#21512#26684#39' ' +
      'when 5 then '#39#25253#24223#39' when 6 then '#39#35843#25320#22806#20986#39' when 7 then '#39#38386#32622#39' end AS acti' +
      've_flag,'#13#10'       DATA0417.USER_DATE,Data0005.EMPLOYEE_NAME,Data0' +
      '015.ABBR_NAME,DATA0417.supplier_name,'#13#10'       DATA0417.MAKE_VEND' +
      'ER,DATA0417.confi_date,D05_1.EMPLOYEE_NAME AS confi_user,'#13#10'DATA0' +
      '417.active_flag as DATA0417active_flag,'#13#10'       DATA0417.install' +
      '_date,D05_2.EMPLOYEE_NAME AS install_user,DATA0417.EquiType,'#13#10'  ' +
      '     CASE DATA0417.EquiType WHEN 0 THEN '#39#21542#39' WHEN 1 THEN '#39#26159#39'  end' +
      ' as '#35774#22791#31867#22411','#13#10'       DATA0417.machine_number,id_code,data0417.equip' +
      'ment_grade,data0417.DeviType, '#13#10'Case DATA0417.IsGroup when 0 the' +
      'n '#39#21542#39' when 1 then '#39#26159#39'end as IsGroup,'#13#10'data0417.D840_ptr,data0840' +
      '.Location as d840_Location,'#13#10'DATA0417.DEPT_PTR , data0845.FaultD' +
      'esc'#13#10'FROM   DATA0417 LEFT  JOIN'#13#10'       Data0514 ON DATA0417.FAS' +
      'SET_TYPE_PTR = Data0514.RKEY LEFT OUTER JOIN'#13#10'       Data0034 ON' +
      ' DATA0417.DEPT_PTR = Data0034.RKEY LEFT OUTER JOIN'#13#10'       Data0' +
      '005 ON DATA0417.USER_PTR = Data0005.RKEY LEFT OUTER JOIN'#13#10'      ' +
      ' Data0015 ON DATA0417.warehouse_ptr = Data0015.RKEY LEFT OUTER J' +
      'OIN'#13#10'       Data0005 AS D05_1 ON dbo.DATA0417.confi_userptr = D0' +
      '5_1.RKEY LEFT OUTER JOIN'#13#10'       Data0005 AS D05_2 ON dbo.DATA04' +
      '17.install_userptr = D05_2.RKEY'#13#10'       left join data0840 on DA' +
      'TA0417.d840_ptr=data0840.rkey'#13#10'       left join data0845 on data' +
      '0417.D845_ptr= data0845.rkey'#13#10'where 1=1'#13#10
    IndexFieldNames = 'FASSET_CODE'
    Parameters = <>
    Left = 80
    Top = 56
    object ADS417D845_ptr: TIntegerField
      FieldName = 'D845_ptr'
    end
    object ADS417RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS417FASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
    end
    object ADS417FASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object ADS417FASSET_DESC: TStringField
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object ADS417FASSET_TYPE: TStringField
      FieldName = 'FASSET_TYPE'
    end
    object ADS417DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADS417LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 40
    end
    object ADS417PURCH_DATE: TDateTimeField
      FieldName = 'PURCH_DATE'
    end
    object ADS417BOOK_DATE: TDateTimeField
      FieldName = 'BOOK_DATE'
    end
    object ADS417REMARK: TStringField
      FieldName = 'REMARK'
      Size = 100
    end
    object ADS417active_flag: TStringField
      FieldName = 'active_flag'
      ReadOnly = True
      Size = 8
    end
    object ADS417USER_DATE: TDateTimeField
      FieldName = 'USER_DATE'
    end
    object ADS417EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS417ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADS417supplier_name: TStringField
      FieldName = 'supplier_name'
      Size = 50
    end
    object ADS417MAKE_VENDER: TStringField
      FieldName = 'MAKE_VENDER'
      Size = 50
    end
    object ADS417confi_date: TDateTimeField
      FieldName = 'confi_date'
    end
    object ADS417confi_user: TStringField
      FieldName = 'confi_user'
      Size = 16
    end
    object ADS417DATA0417active_flag: TWordField
      FieldName = 'DATA0417active_flag'
    end
    object ADS417install_date: TDateTimeField
      FieldName = 'install_date'
    end
    object ADS417install_user: TStringField
      FieldName = 'install_user'
      Size = 16
    end
    object ADS417EquiType: TBooleanField
      FieldName = 'EquiType'
    end
    object ADS417DSDesigner: TStringField
      FieldName = #35774#22791#31867#22411
      ReadOnly = True
      Size = 2
    end
    object ADS417machine_number: TStringField
      FieldName = 'machine_number'
      Size = 50
    end
    object ADS417id_code: TStringField
      FieldName = 'id_code'
      Size = 15
    end
    object ADS417equipment_grade: TStringField
      FieldName = 'equipment_grade'
      Size = 50
    end
    object ADS417DeviType: TStringField
      FieldName = 'DeviType'
      Size = 10
    end
    object ADS417D840_ptr: TIntegerField
      FieldName = 'D840_ptr'
    end
    object ADS417d840_Location: TStringField
      FieldName = 'd840_Location'
    end
    object ADS417IsGroup: TStringField
      FieldName = 'IsGroup'
      ReadOnly = True
      Size = 2
    end
    object ADS417DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADS417FaultDesc: TStringField
      FieldName = 'FaultDesc'
      Size = 50
    end
    object ADS417DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADS417ttype: TStringField
      DisplayLabel = #31867#22411
      FieldName = 'ttype'
      ReadOnly = True
      Size = 4
    end
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 152
    Top = 168
  end
  object ADO417: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select rkey,FASSET_CODE,FASSET_NAME,FASSET_DESC,machine_number,l' +
        'ocation,'
      
        '          DEPT_PTR,FASSET_TYPE_PTR,PURCH_DATE,warehouse_ptr,d840' +
        '_ptr,supplier_name,'
      
        '          MAKE_VENDER,equipment_grade,DeviType,REMARK,user_ptr,I' +
        'sGroup,EquiType,USER_DATE,d845_ptr '
      ' from data0417')
    Left = 152
    Top = 64
    object ADO417rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO417FASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
    end
    object ADO417FASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object ADO417FASSET_DESC: TStringField
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object ADO417machine_number: TStringField
      FieldName = 'machine_number'
      Size = 50
    end
    object ADO417location: TStringField
      FieldName = 'location'
      Size = 40
    end
    object ADO417DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADO417FASSET_TYPE_PTR: TSmallintField
      FieldName = 'FASSET_TYPE_PTR'
    end
    object ADO417PURCH_DATE: TDateTimeField
      FieldName = 'PURCH_DATE'
    end
    object ADO417warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ADO417d840_ptr: TIntegerField
      FieldName = 'd840_ptr'
    end
    object ADO417supplier_name: TStringField
      FieldName = 'supplier_name'
      Size = 50
    end
    object ADO417MAKE_VENDER: TStringField
      FieldName = 'MAKE_VENDER'
      Size = 50
    end
    object ADO417equipment_grade: TStringField
      FieldName = 'equipment_grade'
      Size = 50
    end
    object ADO417DeviType: TStringField
      FieldName = 'DeviType'
      Size = 10
    end
    object ADO417REMARK: TStringField
      FieldName = 'REMARK'
      Size = 100
    end
    object ADO417user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADO417IsGroup: TBooleanField
      FieldName = 'IsGroup'
    end
    object ADO417EquiType: TBooleanField
      FieldName = 'EquiType'
    end
    object ADO417USER_DATE: TDateTimeField
      FieldName = 'USER_DATE'
    end
    object ADO417d845_ptr: TIntegerField
      FieldName = 'd845_ptr'
    end
  end
  object ADS573: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'SELECT D417.FASSET_CODE,D417.FASSET_NAME,D417.FASSET_DESC,'#13#10'D573' +
      '.allocate_number,   D573.allocate_date,D5.EMPLOYEE_NAME,D573.ent' +
      '_date,'#13#10'D573.alloc_outfac,      D573.alloc_outdeptname,D573.allo' +
      'c_infac,D573.alloc_indeptname,'#13#10'       D573.remark,D574.allocate' +
      '_number,D574.allocate_date,D5_1.EMPLOYEE_NAME AS userName,'#13#10'    ' +
      '   D574.ent_date,D574.remark,D574.detection_remark,D574.scrap_re' +
      'mark'#13#10#13#10'FROM   DATA0417 D417 LEFT OUTER JOIN'#13#10'       DATA0573 D5' +
      '73 ON D417.RKEY = D573.fasset_ptr LEFT OUTER JOIN'#13#10'       DATA05' +
      '74 D574 ON D417.RKEY = D574.fasset_ptr LEFT OUTER JOIN'#13#10'       D' +
      'ATA0005 D5   ON D573.user_ptr=D5.RKEY LEFT OUTER JOIN'#13#10'       DA' +
      'TA0005 D5_1 ON D574.user_ptr=D5_1.RKEY'#13#10'WHERE  D417.RKEY=:RKEY41' +
      '7'
    Parameters = <
      item
        Name = 'rkey417'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 80
    Top = 152
    object ADS573FASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
    end
    object ADS573FASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object ADS573FASSET_DESC: TStringField
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object ADS573allocate_number: TStringField
      FieldName = 'allocate_number'
      Size = 10
    end
    object ADS573allocate_date: TDateTimeField
      FieldName = 'allocate_date'
    end
    object ADS573EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS573ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object ADS573alloc_outfac: TStringField
      FieldName = 'alloc_outfac'
    end
    object ADS573alloc_outdeptname: TStringField
      FieldName = 'alloc_outdeptname'
      Size = 30
    end
    object ADS573alloc_infac: TStringField
      FieldName = 'alloc_infac'
    end
    object ADS573alloc_indeptname: TStringField
      FieldName = 'alloc_indeptname'
      Size = 30
    end
    object ADS573remark: TStringField
      FieldName = 'remark'
      Size = 300
    end
    object ADS573allocate_number_1: TStringField
      FieldName = 'allocate_number_1'
      Size = 10
    end
    object ADS573allocate_date_1: TDateTimeField
      FieldName = 'allocate_date_1'
    end
    object ADS573userName: TStringField
      FieldName = 'userName'
      Size = 16
    end
    object ADS573ent_date_1: TDateTimeField
      FieldName = 'ent_date_1'
    end
    object ADS573remark_1: TStringField
      FieldName = 'remark_1'
      Size = 200
    end
    object ADS573detection_remark: TStringField
      FieldName = 'detection_remark'
      Size = 200
    end
    object ADS573scrap_remark: TStringField
      FieldName = 'scrap_remark'
      Size = 200
    end
  end
  object DataSource3: TDataSource
    DataSet = ADS573
    Left = 24
    Top = 146
  end
  object ADS813: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    BeforeInsert = ADS813BeforeInsert
    BeforeDelete = ADS813BeforeDelete
    CommandText = 
      'SELECT     dbo.DATA0813.FASSET_PTR, dbo.DATA0813.user_ptr, dbo.D' +
      'ATA0813.in_date, '#13#10'                   dbo.DATA0813.file_name, db' +
      'o.DATA0813.remark '#13#10'FROM        dbo.DATA0813 '#13#10'where         DAT' +
      'A0813.FASSET_PTR = :FASSET_PTR'#13#10
    IndexFieldNames = 'FASSET_PTR'
    Parameters = <
      item
        Name = 'FASSET_PTR'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 84
    Top = 225
    object ADS813FASSET_PTR: TIntegerField
      FieldName = 'FASSET_PTR'
    end
    object ADS813user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADS813in_date: TDateTimeField
      DisplayLabel = #19978#20256#26085#26399
      FieldName = 'in_date'
    end
    object ADS813file_name: TStringField
      DisplayLabel = #25991#26723#21517#31216
      FieldName = 'file_name'
      Size = 50
    end
    object ADS813remark: TStringField
      DisplayLabel = #22791#27880#35828#26126
      FieldName = 'remark'
      Size = 50
    end
    object ADS813EMPLOYEE_NAME: TStringField
      DisplayLabel = #19978#20256#20154#21592
      FieldKind = fkLookup
      FieldName = 'EMPLOYEE_NAME'
      LookupDataSet = Read0005
      LookupKeyFields = 'rkey'
      LookupResultField = 'Employee_Name'
      KeyFields = 'user_ptr'
      Size = 16
      Lookup = True
    end
  end
  object DS813: TDataSource
    DataSet = ADS813
    Left = 20
    Top = 225
  end
  object Read0005: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select rkey,Employee_Name from data0005')
    Left = 144
    Top = 232
  end
end
