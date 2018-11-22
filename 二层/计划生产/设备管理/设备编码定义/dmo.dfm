object DM: TDM
  OldCreateOrder = False
  Left = 553
  Top = 216
  Height = 522
  Width = 671
  object ADOConn: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 80
  end
  object ADO417: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    AfterOpen = ADO417AfterOpen
    AfterScroll = ADO417AfterScroll
    CommandText = 
      'SELECT [D845_ptr], DATA0417.RKEY,DATA0417.FASSET_CODE,DATA0417.F' +
      'ASSET_NAME,DATA0417.FASSET_DESC,Data0514.FASSET_TYPE, '#13#10'       D' +
      'ata0034.DEPT_NAME,DATA0417.LOCATION,DATA0417.PURCH_DATE,DATA0417' +
      '.BOOK_DATE,DATA0417.REMARK, '#13#10'       case DATA0417.active_flag w' +
      'hen 1 then '#39#26032#36827#39' when 2 then '#39#20179#24211#30830#35748#39' when 3 then '#39#23433#35013#23436#25104#39' '#13#10'       w' +
      'hen 4 then '#39#39564#25910#21512#26684#39' when 5 then '#39#25253#24223#39' when 6 then '#39#35843#25320#22806#20986#39' when 7 the' +
      'n '#39#38386#32622#39' end AS active_flag,'#13#10'       DATA0417.USER_DATE,Data0005.E' +
      'MPLOYEE_NAME,Data0015.ABBR_NAME,DATA0417.supplier_name,'#13#10'       ' +
      'DATA0417.MAKE_VENDER,DATA0417.confi_date,D05_1.EMPLOYEE_NAME AS ' +
      'confi_user,DATA0417.active_flag [DATA0417active_flag],'#13#10'       D' +
      'ATA0417.install_date,D05_2.EMPLOYEE_NAME AS install_user,DATA041' +
      '7 .[EquiType],'#13#10'       CASE DATA0417 .[EquiType] WHEN 0 THEN '#39#21542#39 +
      ' WHEN 1 THEN '#39#26159#39'  end as '#35774#22791#31867#22411','#13#10'       DATA0417.machine_number,i' +
      'd_code,equipment_grade,DeviType,DATA0417.IsGroup,[D840_ptr],data' +
      '0840.Location as d840_Location'#13#10'FROM   DATA0417 LEFT OUTER JOIN'#13 +
      #10'       Data0514 ON DATA0417.FASSET_TYPE_PTR = Data0514.RKEY LEF' +
      'T OUTER JOIN'#13#10'       Data0034 ON DATA0417.DEPT_PTR = Data0034.RK' +
      'EY LEFT OUTER JOIN'#13#10'       Data0005 ON DATA0417.USER_PTR = Data0' +
      '005.RKEY LEFT OUTER JOIN'#13#10'       Data0015 ON DATA0417.warehouse_' +
      'ptr = Data0015.RKEY LEFT OUTER JOIN'#13#10'       Data0005 AS D05_1 ON' +
      ' dbo.DATA0417.confi_userptr = D05_1.RKEY LEFT OUTER JOIN'#13#10'      ' +
      ' Data0005 AS D05_2 ON dbo.DATA0417.install_userptr = D05_2.RKEY'#13 +
      #10'       left join data0840 on DATA0417.d840_ptr=data0840.rkey'#13#10'W' +
      'HERE  Data0417.active_flag<>:V1 and Data0417.active_flag<>:V2'#13#10' ' +
      '     and Data0417.active_flag<>:V3 and Data0417.active_flag<>:V4' +
      #13#10'      and Data0417.active_flag<>:V5 and Data0417.active_flag<>' +
      ':V6  order by fasset_code'
    Parameters = <
      item
        Name = 'V1'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'V2'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'V3'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'V4'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'V5'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'V6'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end>
    Left = 120
    Top = 80
    object ADO417RKEY: TAutoIncField
      FieldName = 'RKEY'
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
    object ADO417FASSET_TYPE: TStringField
      FieldName = 'FASSET_TYPE'
    end
    object ADO417DeviType: TStringField
      FieldName = 'DeviType'
      Size = 10
    end
    object ADO417DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADO417LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 40
    end
    object ADO417PURCH_DATE: TDateTimeField
      FieldName = 'PURCH_DATE'
    end
    object ADO417BOOK_DATE: TDateTimeField
      FieldName = 'BOOK_DATE'
    end
    object ADO417REMARK: TStringField
      FieldName = 'REMARK'
      Size = 100
    end
    object ADO417active_flag: TStringField
      FieldName = 'active_flag'
      ReadOnly = True
      Size = 8
    end
    object ADO417USER_DATE: TDateTimeField
      FieldName = 'USER_DATE'
    end
    object ADO417EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO417supplier_name: TStringField
      FieldName = 'supplier_name'
      Size = 50
    end
    object ADO417ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADO417MAKE_VENDER: TStringField
      FieldName = 'MAKE_VENDER'
      Size = 50
    end
    object ADO417confi_date: TDateTimeField
      FieldName = 'confi_date'
    end
    object ADO417confi_user: TStringField
      FieldName = 'confi_user'
      Size = 16
    end
    object ADO417install_date: TDateTimeField
      FieldName = 'install_date'
    end
    object ADO417install_user: TStringField
      FieldName = 'install_user'
      Size = 16
    end
    object ADO417machine_number: TStringField
      FieldName = 'machine_number'
      Size = 50
    end
    object ADO417id_code: TStringField
      FieldName = 'id_code'
      Size = 15
    end
    object ADO417equipment_grade: TStringField
      FieldName = 'equipment_grade'
      Size = 50
    end
    object ADO417IsGroup: TBooleanField
      DisplayLabel = #26159#32452
      FieldName = 'IsGroup'
    end
    object ADO417FaultDesc: TStringField
      DisplayLabel = #32500#20462#31867#22411
      FieldKind = fkLookup
      FieldName = 'FaultDesc'
      LookupDataSet = dt_D0845
      LookupKeyFields = 'rkey'
      LookupResultField = 'FaultDesc'
      KeyFields = 'D845_ptr'
      Size = 50
      Lookup = True
    end
    object ADO417D845_ptr: TIntegerField
      FieldName = 'D845_ptr'
    end
    object ADO417d840_Location: TStringField
      DisplayLabel = #36131#20219#23567#32452
      FieldName = 'd840_Location'
      OnChange = ADO417d840_LocationChange
    end
    object ADO417D840_ptr: TIntegerField
      FieldName = 'D840_ptr'
    end
    object ADO417EquiType: TBooleanField
      DisplayLabel = #35774#22791#31867#21035
      FieldName = 'EquiType'
    end
    object ADO417DATA0417active_flag: TWordField
      FieldName = 'DATA0417active_flag'
    end
    object ADO417DSDesigner: TStringField
      FieldName = #35774#22791#31867#22411
      ReadOnly = True
      Size = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO417
    Left = 192
    Top = 80
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 120
    Top = 24
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 120
    Top = 136
  end
  object ADO567: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    CommandText = 
      'SELECT D567.NUMBER,D417.FASSET_CODE,D417.FASSET_NAME,D417.FASSET' +
      '_DESC,D34.DEPT_NAME,'#13#10'       D567.PLACE,D567.failure_date,D05.EM' +
      'PLOYEE_NAME,D567.ent_date,D567.referring_date,'#13#10'       D567.fail' +
      'ure_circs,D05.EMPLOYEE_NAME AS disposal_empl,D567.disposal_date,' +
      #13#10'       D567.maintain_empl,D567.maintain_text,D567.complete_dat' +
      'e,'#13#10'       D05.EMPLOYEE_NAME AS validate_empl,D567.validate_date' +
      #13#10'FROM   DATA0417 D417 INNER JOIN'#13#10'       DATA0567 D567 ON D417.' +
      'RKEY = D567.FASSET_PTR LEFT OUTER JOIN'#13#10'       DATA0034 D34  ON ' +
      'D567.DEPT_PTR=D34.RKEY INNER JOIN'#13#10'       DATA0005 D05  ON D567.' +
      'EMPL_PTR=D05.RKEY INNER JOIN'#13#10'       DATA0005 D05_1 ON D567.disp' +
      'osal_emplptr=D05_1.RKEY INNER JOIN'#13#10'       DATA0005 D05_2 ON D56' +
      '7.validate_emplptr=D05_2.RKEY'#13#10'WHERE  D417.RKEY=:RKEY417'
    Parameters = <
      item
        Name = 'RKEY417'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 120
    Top = 200
    object ADO567NUMBER: TStringField
      FieldName = 'NUMBER'
      Size = 15
    end
    object ADO567FASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
      Size = 10
    end
    object ADO567FASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object ADO567FASSET_DESC: TStringField
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object ADO567DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADO567PLACE: TStringField
      FieldName = 'PLACE'
      Size = 40
    end
    object ADO567failure_date: TDateTimeField
      FieldName = 'failure_date'
    end
    object ADO567EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO567ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object ADO567referring_date: TDateTimeField
      FieldName = 'referring_date'
    end
    object ADO567failure_circs: TStringField
      FieldName = 'failure_circs'
      Size = 200
    end
    object ADO567disposal_empl: TStringField
      FieldName = 'disposal_empl'
      Size = 16
    end
    object ADO567disposal_date: TDateTimeField
      FieldName = 'disposal_date'
    end
    object ADO567maintain_empl: TStringField
      FieldName = 'maintain_empl'
      Size = 50
    end
    object ADO567maintain_text: TStringField
      FieldName = 'maintain_text'
      Size = 200
    end
    object ADO567complete_date: TDateTimeField
      FieldName = 'complete_date'
    end
    object ADO567validate_empl: TStringField
      FieldName = 'validate_empl'
      Size = 16
    end
    object ADO567validate_date: TDateTimeField
      FieldName = 'validate_date'
    end
  end
  object DataSource2: TDataSource
    DataSet = ADO567
    Left = 192
    Top = 200
  end
  object DataSource3: TDataSource
    DataSet = ADO5734
    Left = 192
    Top = 264
  end
  object ADO5734: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    CommandText = 
      'SELECT D417.FASSET_CODE,D417.FASSET_NAME,D417.FASSET_DESC,D573.a' +
      'llocate_number,'#13#10'       D573.allocate_date,D5.EMPLOYEE_NAME,D573' +
      '.ent_date,D573.alloc_outfac,'#13#10'       D573.alloc_outdeptname,D573' +
      '.alloc_infac,D573.alloc_indeptname,'#13#10'       D573.remark,D574.all' +
      'ocate_number,D574.allocate_date,D5_1.EMPLOYEE_NAME AS userName,'#13 +
      #10'       D574.ent_date,D574.remark,D574.detection_remark,D574.scr' +
      'ap_remark'#13#10'FROM   DATA0417 D417 LEFT OUTER JOIN'#13#10'       DATA0573' +
      ' D573 ON D417.RKEY = D573.fasset_ptr LEFT OUTER JOIN'#13#10'       DAT' +
      'A0574 D574 ON D417.RKEY = D574.fasset_ptr LEFT OUTER JOIN'#13#10'     ' +
      '  DATA0005 D5   ON D573.user_ptr=D5.RKEY LEFT OUTER JOIN'#13#10'      ' +
      ' DATA0005 D5_1 ON D574.user_ptr=D5_1.RKEY'#13#10'WHERE  D417.RKEY=:RKE' +
      'Y417'
    Parameters = <
      item
        Name = 'RKEY417'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 120
    Top = 264
    object ADO5734FASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
      Size = 10
    end
    object ADO5734FASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object ADO5734FASSET_DESC: TStringField
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object ADO5734allocate_number: TStringField
      FieldName = 'allocate_number'
      Size = 10
    end
    object ADO5734allocate_date: TDateTimeField
      FieldName = 'allocate_date'
    end
    object ADO5734EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO5734ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object ADO5734alloc_outfac: TStringField
      FieldName = 'alloc_outfac'
    end
    object ADO5734alloc_outdeptname: TStringField
      FieldName = 'alloc_outdeptname'
      Size = 30
    end
    object ADO5734alloc_infac: TStringField
      FieldName = 'alloc_infac'
    end
    object ADO5734alloc_indeptname: TStringField
      FieldName = 'alloc_indeptname'
      Size = 30
    end
    object ADO5734remark: TStringField
      FieldName = 'remark'
      Size = 300
    end
    object ADO5734allocate_number_1: TStringField
      FieldName = 'allocate_number_1'
      Size = 10
    end
    object ADO5734allocate_date_1: TDateTimeField
      FieldName = 'allocate_date_1'
    end
    object ADO5734userName: TStringField
      FieldName = 'userName'
      Size = 16
    end
    object ADO5734ent_date_1: TDateTimeField
      FieldName = 'ent_date_1'
    end
    object ADO5734remark_1: TStringField
      FieldName = 'remark_1'
      Size = 200
    end
    object ADO5734detection_remark: TStringField
      FieldName = 'detection_remark'
      Size = 200
    end
    object ADO5734scrap_remark: TStringField
      FieldName = 'scrap_remark'
      Size = 200
    end
  end
  object ADO418: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select Data0418.fasset_ptr,Data0418.name,Data0418.seq_no,Data041' +
      '8.unit_ptr,Data0002.unit_name,Data0418.qty,Data0418.remark '#13#10'fro' +
      'm Data0418 left outer join Data0002 on Data0418.unit_ptr=Data000' +
      '2.rkey '#13#10'where Data0418.fasset_ptr=:asset_ptr'#13#10'order by Data0418' +
      '.seq_no'
    Parameters = <
      item
        Name = 'asset_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 120
    Top = 328
    object ADO418fasset_ptr: TIntegerField
      FieldName = 'fasset_ptr'
    end
    object ADO418name: TStringField
      FieldName = 'name'
      Size = 30
    end
    object ADO418seq_no: TIntegerField
      FieldName = 'seq_no'
    end
    object ADO418unit_ptr: TIntegerField
      FieldName = 'unit_ptr'
    end
    object ADO418unit_name: TStringField
      FieldName = 'unit_name'
    end
    object ADO418qty: TBCDField
      FieldName = 'qty'
      Precision = 8
      Size = 1
    end
    object ADO418remark: TStringField
      FieldName = 'remark'
      Size = 50
    end
  end
  object DataSource4: TDataSource
    DataSet = ADO418
    Left = 192
    Top = 328
  end
  object Read0811: TADOQuery
    Connection = ADOConn
    Parameters = <>
    SQL.Strings = (
      'select * from data0811')
    Left = 112
    Top = 384
  end
  object qry0813: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'vFASSET_PTR'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select FASSET_PTR,user_ptr,in_date,file_name,remark from data081' +
        '3 where FASSET_PTR=:vFASSET_PTR')
    Left = 112
    Top = 440
    object qry0813FASSET_PTR: TIntegerField
      DisplayLabel = #35774#22791#25351#38024
      FieldName = 'FASSET_PTR'
    end
    object qry0813user_ptr: TIntegerField
      DisplayLabel = #29992#25143#25351#38024
      FieldName = 'user_ptr'
    end
    object qry0813Employee_Name: TStringField
      DisplayLabel = #19978#20256#20154#21592
      FieldKind = fkLookup
      FieldName = 'Employee_Name'
      LookupDataSet = Read0005
      LookupKeyFields = 'rkey'
      LookupResultField = 'Employee_Name'
      KeyFields = 'user_ptr'
      Lookup = True
    end
    object qry0813in_date: TDateTimeField
      DisplayLabel = #19978#20256#26085#26399
      FieldName = 'in_date'
    end
    object qry0813file_name: TStringField
      DisplayLabel = #25991#26723#21517#31216
      FieldName = 'file_name'
      Size = 50
    end
    object qry0813remark: TStringField
      DisplayLabel = #22791#27880#35828#26126
      FieldName = 'remark'
      Size = 50
    end
  end
  object ds0813: TDataSource
    DataSet = qry0813
    Left = 168
    Top = 440
  end
  object qryTemp: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 176
    Top = 392
  end
  object Read0005: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select rkey,Employee_Name from data0005')
    Left = 224
    Top = 440
  end
  object qry0417: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 188
    Top = 26
    object qry0417FASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
    end
    object qry0417FASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object qry0417FASSET_DESC: TStringField
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object qry0417FASSET_TYPE: TStringField
      FieldName = 'FASSET_TYPE'
    end
    object qry0417equipment_grade: TStringField
      FieldName = 'equipment_grade'
      Size = 50
    end
    object qry0417DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object qry0417LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 40
    end
    object qry0417active_flag: TStringField
      FieldName = 'active_flag'
      Size = 8
    end
    object qry0417ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object qry0417DeviType: TStringField
      FieldName = 'DeviType'
      Size = 10
    end
    object qry0417rkey: TIntegerField
      FieldName = 'rkey'
    end
  end
  object Selected0417: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'vrkey'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @TempTable table(selected bit)      '
      '  insert @TempTable'
      '  values (0)'
      
        'SELECT selected,DATA0417.RKEY,DATA0417.FASSET_CODE /*'#35774#22791#20195#30721'*/,DATA' +
        '0417.FASSET_NAME /*'#35774#22791#21517#31216'*/,'
      
        '       DATA0417.FASSET_DESC /*'#35268#26684#22411#21495'*/,Data0514.FASSET_TYPE /*'#35774#22791#31867#21035 +
        '*/,equipment_grade /*'#35774#22791#31561#32423'*/, '
      '       Data0034.DEPT_NAME/*'#37096#38376#21517#31216'*/,DATA0417.LOCATION /*'#20855#20307#20301#32622'*/, '
      
        '       case DATA0417.active_flag when 1 then '#39#26032#36827#39' when 2 then '#39#20179 +
        #24211#30830#35748#39' when 3 then '#39#23433#35013#23436#25104#39' '
      
        '       when 4 then '#39#39564#25910#21512#26684#39' when 5 then '#39#25253#24223#39' when 6 then '#39#35843#25320#22806#20986#39' en' +
        'd AS active_flag/**/,'
      '       Data0015.ABBR_NAME/*'#24037#21378'*/,DeviType/*'#35774#22791#31867#22411'*/'
      'FROM   DATA0417 LEFT OUTER JOIN'
      
        '       Data0514 ON DATA0417.FASSET_TYPE_PTR = Data0514.RKEY LEFT' +
        ' OUTER JOIN'
      
        '       Data0034 ON DATA0417.DEPT_PTR = Data0034.RKEY LEFT OUTER ' +
        'JOIN'
      '       Data0015 ON DATA0417.warehouse_ptr = Data0015.RKEY '
      '       join @TempTable on 1=1'
      
        'WHERE  Data0417.active_flag in (1,2,3,4) and IsGroup=0  and DATA' +
        '0417.Group_Ptr is null'
      
        'and DATA0417.RKEY not in (select DATA0417.RKEY from DATA0417 whe' +
        're Group_Ptr=:vrkey)'
      'order by fasset_code')
    Left = 480
    Top = 32
    object Selected0417selected: TBooleanField
      FieldName = 'selected'
    end
    object Selected0417RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object Selected0417FASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
    end
    object Selected0417FASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object Selected0417FASSET_DESC: TStringField
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object Selected0417FASSET_TYPE: TStringField
      FieldName = 'FASSET_TYPE'
    end
    object Selected0417equipment_grade: TStringField
      FieldName = 'equipment_grade'
      Size = 50
    end
    object Selected0417DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object Selected0417LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 40
    end
    object Selected0417active_flag: TStringField
      FieldName = 'active_flag'
      ReadOnly = True
      Size = 8
    end
    object Selected0417ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object Selected0417DeviType: TStringField
      FieldName = 'DeviType'
      Size = 10
    end
  end
  object dsp0417: TDataSetProvider
    DataSet = qry0417
    Options = [poAllowCommandText]
    Left = 264
    Top = 24
  end
  object cds0417: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT DATA0417.RKEY,DATA0417.FASSET_CODE /*'#35774#22791#20195#30721'*/,DATA0417.FASS' +
      'ET_NAME /*'#35774#22791#21517#31216'*/,'#13#10'       DATA0417.FASSET_DESC /*'#35268#26684#22411#21495'*/,Data0514' +
      '.FASSET_TYPE /*'#35774#22791#31867#21035'*/,equipment_grade /*'#35774#22791#31561#32423'*/, '#13#10'       Data003' +
      '4.DEPT_NAME/*'#37096#38376#21517#31216'*/,DATA0417.LOCATION /*'#20855#20307#20301#32622'*/, '#13#10'       case DA' +
      'TA0417.active_flag when 1 then '#39#26032#36827#39' when 2 then '#39#20179#24211#30830#35748#39' when 3 th' +
      'en '#39#23433#35013#23436#25104#39' '#13#10'       when 4 then '#39#39564#25910#21512#26684#39' when 5 then '#39#25253#24223#39' when 6 th' +
      'en '#39#35843#25320#22806#20986#39' end AS active_flag/**/,'#13#10'       Data0015.ABBR_NAME/*'#24037#21378 +
      '*/,DeviType/*'#35774#22791#31867#22411'*/'#13#10'FROM   DATA0417 LEFT OUTER JOIN'#13#10'       Dat' +
      'a0514 ON DATA0417.FASSET_TYPE_PTR = Data0514.RKEY LEFT OUTER JOI' +
      'N'#13#10'       Data0034 ON DATA0417.DEPT_PTR = Data0034.RKEY LEFT OUT' +
      'ER JOIN'#13#10'       Data0015 ON DATA0417.warehouse_ptr = Data0015.RK' +
      'EY '#13#10'where DATA0417.Group_Ptr=:vrkey'#13#10'order by fasset_code'
    IndexFieldNames = 'FASSET_CODE'
    Params = <
      item
        DataType = ftUnknown
        Name = 'vrkey'
        ParamType = ptUnknown
      end>
    ProviderName = 'dsp0417'
    Left = 360
    Top = 24
    object cds0417RKEY: TAutoIncField
      FieldName = 'RKEY'
    end
    object cds0417FASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
    end
    object cds0417FASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object cds0417FASSET_DESC: TStringField
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object cds0417FASSET_TYPE: TStringField
      FieldName = 'FASSET_TYPE'
    end
    object cds0417equipment_grade: TStringField
      FieldName = 'equipment_grade'
      Size = 50
    end
    object cds0417DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object cds0417LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 40
    end
    object cds0417active_flag: TStringField
      FieldName = 'active_flag'
      Size = 8
    end
    object cds0417ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object cds0417DeviType: TStringField
      FieldName = 'DeviType'
      Size = 10
    end
  end
  object cdsTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 352
    Top = 80
    object AutoIncField1: TAutoIncField
      FieldName = 'RKEY'
    end
    object StringField1: TStringField
      FieldName = 'FASSET_CODE'
    end
    object StringField2: TStringField
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object StringField3: TStringField
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object StringField4: TStringField
      FieldName = 'FASSET_TYPE'
    end
    object StringField5: TStringField
      FieldName = 'equipment_grade'
      Size = 50
    end
    object StringField6: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object StringField7: TStringField
      FieldName = 'LOCATION'
      Size = 40
    end
    object StringField8: TStringField
      FieldName = 'active_flag'
      Size = 8
    end
    object StringField9: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object StringField10: TStringField
      FieldName = 'DeviType'
      Size = 10
    end
  end
  object dt_D0845: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'select rkey,[FaultDesc] from data0845'
    Parameters = <>
    Left = 352
    Top = 200
    object dt_D0845FaultDesc: TStringField
      DisplayLabel = #25925#38556#31867#21035
      DisplayWidth = 25
      FieldName = 'FaultDesc'
      Size = 50
    end
    object dt_D0845rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
  end
  object QryD840: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0840')
    Left = 408
    Top = 200
    object QryD840rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object QryD840Location: TStringField
      DisplayLabel = #35774#22791#36131#20219#23567#32452
      FieldName = 'Location'
    end
  end
  object Copy0417: TADOQuery
    Parameters = <>
    SQL.Strings = (
      
        'SELECT [D845_ptr], DATA0417.RKEY,DATA0417.FASSET_CODE,DATA0417.F' +
        'ASSET_NAME,DATA0417.FASSET_DESC,Data0514.FASSET_TYPE, '
      
        '       Data0034.DEPT_NAME,DATA0417.LOCATION,DATA0417.PURCH_DATE,' +
        'DATA0417.BOOK_DATE,DATA0417.REMARK, '
      
        '       case DATA0417.active_flag when 1 then '#39#26032#36827#39' when 2 then '#39#20179 +
        #24211#30830#35748#39' when 3 then '#39#23433#35013#23436#25104#39' '
      
        '       when 4 then '#39#39564#25910#21512#26684#39' when 5 then '#39#25253#24223#39' when 6 then '#39#35843#25320#22806#20986#39' wh' +
        'en 7 then '#39#38386#32622#39' end AS active_flag,'
      
        '       DATA0417.USER_DATE,Data0005.EMPLOYEE_NAME,Data0015.ABBR_N' +
        'AME,DATA0417.supplier_name,'
      
        '       DATA0417.MAKE_VENDER,DATA0417.confi_date,D05_1.EMPLOYEE_N' +
        'AME AS confi_user,DATA0417.active_flag [DATA0417active_flag],'
      
        '       DATA0417.install_date,D05_2.EMPLOYEE_NAME AS install_user' +
        ',DATA0417 .[EquiType],'
      
        '       CASE DATA0417 .[EquiType] WHEN 0 THEN '#39#21542#39' WHEN 1 THEN '#39#26159#39 +
        '  end as '#35774#22791#31867#22411','
      
        '       DATA0417.machine_number,id_code,equipment_grade,DeviType,' +
        'DATA0417.IsGroup,[D840_ptr],data0840.Location as d840_Location'
      'FROM   DATA0417 LEFT OUTER JOIN'
      
        '       Data0514 ON DATA0417.FASSET_TYPE_PTR = Data0514.RKEY LEFT' +
        ' OUTER JOIN'
      
        '       Data0034 ON DATA0417.DEPT_PTR = Data0034.RKEY LEFT OUTER ' +
        'JOIN'
      
        '       Data0005 ON DATA0417.USER_PTR = Data0005.RKEY LEFT OUTER ' +
        'JOIN'
      
        '       Data0015 ON DATA0417.warehouse_ptr = Data0015.RKEY LEFT O' +
        'UTER JOIN'
      
        '       Data0005 AS D05_1 ON dbo.DATA0417.confi_userptr = D05_1.R' +
        'KEY LEFT OUTER JOIN'
      
        '       Data0005 AS D05_2 ON dbo.DATA0417.install_userptr = D05_2' +
        '.RKEY'
      '       left join data0840 on DATA0417.d840_ptr=data0840.rkey')
    Left = 480
    Top = 96
  end
end
