object DM: TDM
  OldCreateOrder = False
  Left = 574
  Top = 221
  Height = 468
  Width = 345
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdompcb1077;Persist Security Info' +
      '=True;User ID=sa;Initial Catalog=demo2;Data Source=172.18.8.37'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 37
    Top = 7
  end
  object DataSource1: TDataSource
    DataSet = ADP400
    Left = 38
    Top = 55
  end
  object ADP400: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADP400CalcFields
    ProcedureName = 'ep196;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@dtpk1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 38718d
      end
      item
        Name = '@dtpk2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 39052d
      end
      item
        Name = '@v1'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = 9
      end
      item
        Name = '@v2'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = 9
      end>
    Left = 112
    Top = 56
    object ADP400rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADP400wip_code: TStringField
      DisplayLabel = #30424#28857#20195#30721
      FieldName = 'wip_code'
      FixedChar = True
      Size = 10
    end
    object ADP400user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADP400ent_date: TDateTimeField
      DisplayLabel = #21019#24314#26085#26399
      FieldName = 'ent_date'
    end
    object ADP400status: TWordField
      FieldName = 'status'
    end
    object ADP400serial_no: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'serial_no'
      Size = 15
    end
    object ADP400whouse_ptr: TIntegerField
      FieldName = 'whouse_ptr'
    end
    object ADP400EMPL_CODE: TStringField
      DisplayLabel = #21592#24037#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 5
    end
    object ADP400EMPLOYEE_NAME: TStringField
      DisplayLabel = #21019#24314#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADP400WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADP400WAREHOUSE_NAME: TStringField
      DisplayLabel = #24037#21378#21517#31216
      FieldName = 'WAREHOUSE_NAME'
      Size = 30
    end
    object ADP400ttype: TStringField
      DisplayLabel = #29366#24577
      DisplayWidth = 8
      FieldKind = fkCalculated
      FieldName = 'ttype'
      Size = 6
      Calculated = True
    end
    object ADP400group_ptr: TIntegerField
      FieldName = 'group_ptr'
    end
    object ADP400update_date: TDateTimeField
      DisplayLabel = #26356#26032#26085#26399
      FieldName = 'update_date'
    end
  end
  object ADO34: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select rkey,dept_code,dept_name'
      'from data0034'
      'where ttype='#39'1'#39
      'order by dept_code')
    Left = 109
    Top = 5
    object ADO34rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO34dept_code: TStringField
      FieldName = 'dept_code'
      Size = 10
    end
    object ADO34dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 187
    Top = 5
  end
  object ADO401: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey401'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0401'
      'where status<>2 and '
      '   rkey=:rkey401')
    Left = 112
    Top = 112
    object ADO401rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO401header_ptr: TIntegerField
      FieldName = 'header_ptr'
    end
    object ADO401wo_ptr: TIntegerField
      FieldName = 'wo_ptr'
    end
    object ADO401dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ADO401reject_ptr: TIntegerField
      FieldName = 'reject_ptr'
    end
    object ADO401wip_system_qty: TFloatField
      FieldName = 'wip_system_qty'
    end
    object ADO401physical_count_qty: TFloatField
      FieldName = 'physical_count_qty'
    end
    object ADO401enterted_ptr: TIntegerField
      FieldName = 'enterted_ptr'
    end
    object ADO401count_ptr: TIntegerField
      FieldName = 'count_ptr'
    end
    object ADO401wip_ptr: TIntegerField
      FieldName = 'wip_ptr'
    end
    object ADO401ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object ADO401user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADO401status: TWordField
      FieldName = 'status'
    end
    object ADO401seaial_no: TIntegerField
      FieldName = 'seaial_no'
    end
    object ADO401panels: TIntegerField
      FieldName = 'panels'
    end
    object ADO401wiprkey_ptr: TIntegerField
      FieldName = 'wiprkey_ptr'
    end
    object ADO401physical_panels: TIntegerField
      FieldName = 'physical_panels'
    end
    object ADO401check_no: TStringField
      FieldName = 'check_no'
      Size = 50
    end
    object ADO401WTYPE: TSmallintField
      FieldName = 'WTYPE'
    end
    object ADO401wharehouse_ptr: TIntegerField
      FieldName = 'wharehouse_ptr'
    end
    object ADO401INTIME: TDateTimeField
      FieldName = 'INTIME'
    end
  end
  object ADO56: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey34'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey15'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Data0056.QTY_BACKLOG, Data0056.WO_PTR, Data0056.RKEY, dat' +
        'a0056.LOC_PTR,data0056.INTIME,'
      
        '      dbo.Data0056.DEPT_PTR, dbo.Data0056.STEP, dbo.Data0056.PAN' +
        'ELS,data0056.WTYPE'
      'FROM         dbo.Data0056 INNER JOIN'
      
        '                      dbo.Data0006 ON dbo.Data0056.WO_PTR = dbo.' +
        'Data0006.RKEY INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo' +
        '.Data0025.RKEY INNER JOIN'
      
        '                      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR' +
        ' = dbo.Data0008.RKEY INNER JOIN'
      
        '                      dbo.data0492 ON dbo.Data0006.CUT_NO = dbo.' +
        'data0492.CUT_NO'
      'where Data0056.DEPT_PTR = :rkey34 and'
      '      data0056.LOC_PTR = :rkey15'
      '')
    Left = 37
    Top = 111
    object ADO56QTY_BACKLOG: TFloatField
      FieldName = 'QTY_BACKLOG'
    end
    object ADO56WO_PTR: TIntegerField
      FieldName = 'WO_PTR'
    end
    object ADO56DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADO56step: TSmallintField
      FieldName = 'step'
    end
    object ADO56PANELS: TIntegerField
      DisplayLabel = #22823#26495#25968'panels'
      FieldName = 'PANELS'
    end
    object ADO56rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO56WTYPE: TSmallintField
      FieldName = 'WTYPE'
    end
    object ADO56LOC_PTR: TSmallintField
      FieldName = 'LOC_PTR'
    end
    object ADO56INTIME: TDateTimeField
      FieldName = 'INTIME'
    end
  end
  object ADP401: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'ep196;2'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@rkey400'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 26
      end>
    Left = 112
    Top = 168
    object ADP401WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #24037#20316#23450#21333
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 50
    end
    object ADP401wip_system_qty: TFloatField
      DisplayLabel = #21407#31995#32479#25968#37327'pcs'
      FieldName = 'wip_system_qty'
    end
    object ADP401REJECT_DESCRIPTION: TStringField
      DisplayLabel = #25253#24223#21407#22240
      FieldName = 'REJECT_DESCRIPTION'
      FixedChar = True
      Size = 30
    end
    object ADP401wip_ptr: TIntegerField
      DisplayLabel = #27493#39588
      FieldName = 'wip_ptr'
    end
    object ADP401MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
      FixedChar = True
    end
    object ADP401MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADP401CUST_CODE: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADP401EMPLOYEE_NAME: TStringField
      DisplayLabel = #28165#28857#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADP401physical_count_qty: TFloatField
      DisplayLabel = #28165#28857#25968#37327'pcs'
      FieldName = 'physical_count_qty'
    end
    object ADP401rkey: TIntegerField
      DisplayLabel = 'rkey401'
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADP401reject_ptr: TIntegerField
      FieldName = 'reject_ptr'
    end
    object ADP401count_ptr: TIntegerField
      FieldName = 'count_ptr'
    end
    object ADP401DEPT_CODE_2: TStringField
      DisplayLabel = #29677#32452#20195#30721
      FieldName = 'DEPT_CODE_2'
      Size = 10
    end
    object ADP401DEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADP401parts_per_panel: TFloatField
      DisplayLabel = 'pcs'#25968'/'#27599'panel'
      FieldName = 'parts_per_panel'
    end
    object ADP401pnls: TIntegerField
      DisplayLabel = #28165#28857'panel'#25968
      FieldName = 'pnls'
    end
    object ADP401physical_panels: TIntegerField
      DisplayLabel = #31995#32479'panel'#25968
      FieldName = 'physical_panels'
    end
    object ADP401check_no: TStringField
      FieldName = 'check_no'
      Size = 50
    end
  end
  object ADO58: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0058'
      'where rkey is null')
    Left = 38
    Top = 168
    object ADO58RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO58MRB_NO: TStringField
      FieldName = 'MRB_NO'
      FixedChar = True
      Size = 10
    end
    object ADO58WO_PTR: TIntegerField
      FieldName = 'WO_PTR'
    end
    object ADO58TRAN_PTR: TIntegerField
      FieldName = 'TRAN_PTR'
    end
    object ADO58DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADO58REJECT_PTR: TIntegerField
      FieldName = 'REJECT_PTR'
    end
    object ADO58QTY_REJECT: TFloatField
      FieldName = 'QTY_REJECT'
    end
    object ADO58FLOW_NO: TIntegerField
      FieldName = 'FLOW_NO'
    end
    object ADO58STEP: TIntegerField
      FieldName = 'STEP'
    end
    object ADO58EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ADO58TDATETIME: TDateTimeField
      FieldName = 'TDATETIME'
    end
    object ADO58AUDIT_EMPL_PTR: TIntegerField
      FieldName = 'AUDIT_EMPL_PTR'
    end
    object ADO58AUDIT_DATETIME: TDateTimeField
      FieldName = 'AUDIT_DATETIME'
    end
    object ADO58RESP_DEPT_PTR: TIntegerField
      FieldName = 'RESP_DEPT_PTR'
    end
    object ADO58REFERENCE: TStringField
      FieldName = 'REFERENCE'
      FixedChar = True
      Size = 30
    end
    object ADO58TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object ADO58QTY_ORG_REJ: TIntegerField
      FieldName = 'QTY_ORG_REJ'
    end
    object ADO58PANELS: TIntegerField
      FieldName = 'PANELS'
    end
    object ADO58warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
  end
  object ADOupdate1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey400'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 2
      end>
    SQL.Strings = (
      'SELECT DATA0401.wip_system_qty,DATA0401.wip_ptr,data0401.rkey,'
      '       Data0056.PANELS as PANELS56,Data0056.QTY_BACKLOG,'
      
        '      DATA0401.physical_count_qty,DATA0401.dept_ptr,DATA0401.wo_' +
        'ptr,'
      '      DATA0401.count_ptr,data0401.panels as count_pan,'
      
        '      DATA0401.wip_system_qty - DATA0401.physical_count_qty AS d' +
        'ivergent,'
      '      data0056.panels - data0401.panels as divergent_pan,'
      '      DATA0401.reject_ptr,DATA0401.status,DATA0401.ent_date'
      'FROM  DATA0401 INNER JOIN Data0056'
      '       ON DATA0401.wiprkey_ptr = Data0056.RKEY'
      'WHERE (DATA0401.status = 1) AND (data0401.header_ptr =:rkey400)')
    Left = 40
    Top = 225
    object ADOupdate1wip_system_qty: TFloatField
      FieldName = 'wip_system_qty'
    end
    object ADOupdate1wip_ptr: TIntegerField
      FieldName = 'wip_ptr'
    end
    object ADOupdate1PANELS56: TIntegerField
      FieldName = 'PANELS56'
    end
    object ADOupdate1QTY_BACKLOG: TFloatField
      FieldName = 'QTY_BACKLOG'
    end
    object ADOupdate1physical_count_qty: TFloatField
      FieldName = 'physical_count_qty'
    end
    object ADOupdate1dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ADOupdate1wo_ptr: TIntegerField
      FieldName = 'wo_ptr'
    end
    object ADOupdate1count_ptr: TIntegerField
      FieldName = 'count_ptr'
    end
    object ADOupdate1count_pan: TIntegerField
      FieldName = 'count_pan'
    end
    object ADOupdate1divergent: TFloatField
      FieldName = 'divergent'
      ReadOnly = True
    end
    object ADOupdate1divergent_pan: TIntegerField
      FieldName = 'divergent_pan'
      ReadOnly = True
    end
    object ADOupdate1reject_ptr: TIntegerField
      FieldName = 'reject_ptr'
    end
    object ADOupdate1status: TWordField
      FieldName = 'status'
    end
    object ADOupdate1ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object ADOupdate1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'rkey06'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0056'
      'where rkey=:rkey06')
    Left = 188
    Top = 55
    object ADOQuery1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1WO_PTR: TIntegerField
      FieldName = 'WO_PTR'
    end
    object ADOQuery1DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADOQuery1UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object ADOQuery1EMPLOYEE_PTR: TIntegerField
      FieldName = 'EMPLOYEE_PTR'
    end
    object ADOQuery1FLOW_NO: TSmallintField
      FieldName = 'FLOW_NO'
    end
    object ADOQuery1STEP: TSmallintField
      FieldName = 'STEP'
    end
    object ADOQuery1QTY_BACKLOG: TFloatField
      FieldName = 'QTY_BACKLOG'
    end
    object ADOQuery1INTIME: TDateTimeField
      FieldName = 'INTIME'
    end
    object ADOQuery1PANELS: TIntegerField
      FieldName = 'PANELS'
    end
    object ADOQuery1TO_BE_STOCKED: TFloatField
      FieldName = 'TO_BE_STOCKED'
    end
    object ADOQuery1TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object ADOQuery1LOC_PTR: TSmallintField
      FieldName = 'LOC_PTR'
    end
  end
  object ADO493: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 189
    Top = 113
    object ADO493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object ADO493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object ADO493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object ADO493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object ADO493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object ADO493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object ADO493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
    object ADO493Company_name2: TStringField
      FieldName = 'Company_name2'
      Size = 50
    end
    object ADO493Company_name3: TStringField
      FieldName = 'Company_name3'
      Size = 50
    end
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey400'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT TOP 100 PERCENT dbo.DATA0401.wip_system_qty, '
      
        '      dbo.DATA0401.physical_count_qty, dbo.DATA0401.physical_pan' +
        'els, '
      '      dbo.DATA0401.panels, '
      
        '      dbo.DATA0401.wip_system_qty - dbo.DATA0401.physical_count_' +
        'qty AS divergent, '
      
        '      dbo.DATA0401.physical_panels - dbo.DATA0401.panels AS dive' +
        'rgent_pan, '
      '      dbo.Data0006.WORK_ORDER_NUMBER, dbo.DATA0401.wip_ptr, '
      '      dbo.Data0025.MANU_PART_NUMBER, dbo.Data0010.ABBR_NAME, '
      
        '      dbo.Data0039.REJECT_DESCRIPTION, dbo.Data0034.DEPT_CODE,db' +
        'o.Data0034.DEPT_NAME, '
      
        '      dbo.DATA0401.check_no, dbo.Data0025.MANU_PART_DESC,ROUND(D' +
        'ata0025.unit_sq,7) AS mianji,'
      
        '      ROUND((Data0006.panel_ln * Data0006.panel_wd * 0.000001 )/' +
        ' Data0006.PARTS_PER_PANEL,7) AS mianji_1,'
      
        '      ROUND((dbo.DATA0401.wip_system_qty - dbo.DATA0401.physical' +
        '_count_qty)*Data0025.unit_sq,8) as MJ,'
      
        '      ROUND((dbo.DATA0401.wip_system_qty - dbo.DATA0401.physical' +
        '_count_qty)*((Data0006.panel_ln * Data0006.panel_wd * 0.000001) ' +
        '/ Data0006.PARTS_PER_PANEL),8) as MJ_1'
      'FROM dbo.Data0006 INNER JOIN'
      
        '      dbo.DATA0401 ON dbo.Data0006.RKEY = dbo.DATA0401.wo_ptr IN' +
        'NER JOIN'
      
        '      dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY I' +
        'NNER JOIN'
      
        '      dbo.Data0034 ON dbo.DATA0401.dept_ptr = dbo.Data0034.RKEY ' +
        'INNER JOIN'
      '      dbo.Data0010 ON '
      
        '      dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY LEFT OUTER J' +
        'OIN'
      
        '      dbo.Data0039 ON dbo.DATA0401.reject_ptr = dbo.Data0039.RKE' +
        'Y'
      'WHERE (data0401.header_ptr =:rkey400) and'
      '      (data0401.status<>0) and'
      
        '      ((DATA0401.wip_system_qty - DATA0401.physical_count_qty <>' +
        ' 0) or'
      '      (data0401.physical_panels-data0401.panels <> 0))'
      'order by  Data0034.DEPT_CODE,Data0025.MANU_PART_NUMBER,'
      'Data0006.WORK_ORDER_NUMBER')
    Left = 192
    Top = 223
    object ADOQuery3WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #24037#20316#23450#21333
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 50
    end
    object ADOQuery3wip_system_qty: TFloatField
      DisplayLabel = #31995#32479#25968#37327'pcs'
      FieldName = 'wip_system_qty'
    end
    object ADOQuery3wip_ptr: TIntegerField
      DisplayLabel = #24403#21069#27493#39588
      FieldName = 'wip_ptr'
    end
    object ADOQuery3physical_count_qty: TFloatField
      DisplayLabel = #28165#28857#25968#37327'pcs'
      FieldName = 'physical_count_qty'
    end
    object ADOQuery3divergent: TFloatField
      DisplayLabel = #24046#24322'(pcs'#25968')'
      FieldName = 'divergent'
      ReadOnly = True
    end
    object ADOQuery3MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
      FixedChar = True
    end
    object ADOQuery3ABBR_NAME: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOQuery3REJECT_DESCRIPTION: TStringField
      DisplayLabel = #25253#24223#21407#22240
      FieldName = 'REJECT_DESCRIPTION'
      FixedChar = True
      Size = 30
    end
    object ADOQuery3DEPT_CODE: TStringField
      DisplayLabel = #24037#24207
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADOQuery3divergent_pan: TIntegerField
      DisplayLabel = #24046#24322'(panel'#25968')'
      FieldName = 'divergent_pan'
      ReadOnly = True
    end
    object ADOQuery3physical_PANELS: TIntegerField
      DisplayLabel = #31995#32479'panel'#25968
      FieldName = 'physical_PANELS'
    end
    object ADOQuery3panels: TIntegerField
      DisplayLabel = #28165#28857'panel'#25968
      FieldName = 'panels'
    end
    object ADOQuery3check_no: TStringField
      DisplayLabel = #30424#28857#33778#21495
      FieldName = 'check_no'
      Size = 50
    end
    object ADOQuery3MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADOQuery3DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADOQuery3mianji: TFloatField
      FieldName = 'mianji'
    end
    object ADOQuery3mianji_1: TFloatField
      FieldName = 'mianji_1'
      ReadOnly = True
    end
    object ADOQuery3MJ: TFloatField
      FieldName = 'MJ'
      ReadOnly = True
    end
    object ADOQuery3MJ_1: TFloatField
      FieldName = 'MJ_1'
      ReadOnly = True
    end
  end
  object ADO402: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey400'
        DataType = ftString
        Size = 1
        Value = '9'
      end>
    SQL.Strings = (
      'select * from data0402'
      'where wipcode_ptr=:rkey400')
    Left = 41
    Top = 281
    object ADO402rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO402wo_ptr: TIntegerField
      FieldName = 'wo_ptr'
    end
    object ADO402wipcode_ptr: TIntegerField
      FieldName = 'wipcode_ptr'
    end
    object ADO402system_quan: TFloatField
      FieldName = 'system_quan'
    end
    object ADO402dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ADO402step: TIntegerField
      FieldName = 'step'
    end
    object ADO402reject_ptr: TIntegerField
      FieldName = 'reject_ptr'
    end
    object ADO402employee_ptr: TIntegerField
      FieldName = 'employee_ptr'
    end
    object ADO402panels: TIntegerField
      FieldName = 'panels'
    end
  end
  object Adomax_no: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT         MAX(seaial_no) + 1 AS max_no'
      'FROM             DATA0401'
      'where  header_ptr=:rkey')
    Left = 191
    Top = 168
    object Adomax_nomax_no: TIntegerField
      FieldName = 'max_no'
      ReadOnly = True
    end
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery3
    Left = 114
    Top = 224
  end
  object ado0006: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltPessimistic
    Parameters = <
      item
        Name = 'wo_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      
        'select data0006.quan_sch,data0006.quan_prod,data0006.QUAN_REJ,da' +
        'ta0006.PROD_STATUS,data0006.panels,'
      '           data0492.QTY_REJECT,data0492.WIP_QTY'
      'from data0006 inner join data0492 on'
      '        data0006.CUT_NO=data0492.CUT_NO'
      'where data0006.rkey = :wo_ptr')
    Left = 114
    Top = 279
    object ado0006QUAN_REJ: TFloatField
      FieldName = 'QUAN_REJ'
    end
    object ado0006PROD_STATUS: TSmallintField
      FieldName = 'PROD_STATUS'
    end
    object ado0006panels: TIntegerField
      FieldName = 'panels'
    end
    object ado0006quan_sch: TFloatField
      FieldName = 'quan_sch'
    end
    object ado0006quan_prod: TFloatField
      FieldName = 'quan_prod'
    end
    object ado0006QTY_REJECT: TIntegerField
      FieldName = 'QTY_REJECT'
    end
    object ado0006WIP_QTY: TIntegerField
      FieldName = 'WIP_QTY'
    end
  end
  object ADOQuery4: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = ADOQuery4CalcFields
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     TOP (100) PERCENT dbo.Data0006.WORK_ORDER_NUMBER, dbo' +
        '.Data0006.PARTS_PER_PANEL, dbo.DATA0401.wip_system_qty, dbo.DATA' +
        '0401.physical_count_qty,'
      
        '                       dbo.DATA0401.panels AS pnls, dbo.DATA0401' +
        '.physical_panels, dbo.Data0039.REJECT_DESCRIPTION, dbo.DATA0401.' +
        'wip_ptr, dbo.DATA0401.status, '
      
        '                      dbo.Data0010.ABBR_NAME AS CUST_CODE, dbo.D' +
        'ata0005.EMPLOYEE_NAME, dbo.DATA0401.check_no, Data0034_2.DEPT_CO' +
        'DE AS DEPT_CODE_2, '
      
        '                      dbo.Data0025.MANU_PART_NUMBER, dbo.Data002' +
        '5.MANU_PART_DESC, Data0034_3.DEPT_CODE, dbo.Data0025.unit_sq, Da' +
        'ta0034_3.DEPT_NAME, '
      
        '                      ROUND(dbo.DATA0401.wip_system_qty * dbo.Da' +
        'ta0025.unit_sq, 6) AS '#19981#21547#26495#36793#38754#31215', '
      
        '                      ROUND(dbo.DATA0401.wip_system_qty * dbo.Da' +
        'ta0006.panel_ln * dbo.Data0006.panel_wd * 0.000001 / dbo.Data000' +
        '6.PARTS_PER_PANEL, 6) AS '#21547#26495#36793#38754#31215', '
      
        '                      CASE data0401.wtype WHEN 0 THEN '#39#27491#24120#39' ELSE ' +
        #39#36820#24037#39' END AS onlinestatus, '
      
        '                      CASE data0006.prod_status WHEN 3 THEN '#39#29983#20135#20013 +
        #39' WHEN 4 THEN '#39#22806#21457#29983#20135#39' WHEN 5 THEN '#39#24453#20837#20179#39' WHEN 6 THEN '#39#24453#20998#37197#39' WHEN 10' +
        '3 THEN '#39#29983#20135#20013#26242#32531#39' END AS wostatus,'
      
        '                       dbo.Data0015.ABBR_NAME, dbo.Data0008.PROD' +
        'UCT_NAME as '#20135#21697#31867#22411','
      'DATEDIFF(hh, dbo.Data0401.INTIME, GETDATE()) as '#22312#21046#23567#26102
      'FROM         dbo.Data0006 INNER JOIN'
      
        '                      dbo.DATA0401 ON dbo.Data0006.RKEY = dbo.DA' +
        'TA0401.wo_ptr INNER JOIN'
      
        '                      dbo.Data0034 AS Data0034_3 ON dbo.DATA0401' +
        '.dept_ptr = Data0034_3.RKEY INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo' +
        '.Data0025.RKEY INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.Data0025.CUSTOMER_PTR ' +
        '= dbo.Data0010.RKEY INNER JOIN'
      
        '                      dbo.Data0034 AS Data0034_2 ON Data0034_3.B' +
        'IG_DEPT_PTR = Data0034_2.RKEY INNER JOIN'
      
        '                      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR' +
        ' = dbo.Data0008.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0015 ON dbo.DATA0401.wharehouse_pt' +
        'r = dbo.Data0015.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0039 ON dbo.DATA0401.reject_ptr = ' +
        'dbo.Data0039.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0005 ON dbo.DATA0401.count_ptr = d' +
        'bo.Data0005.RKEY'
      'WHERE     (dbo.DATA0401.header_ptr = :rkey)'
      
        'ORDER BY Data0034_3.DEPT_CODE, dbo.Data0025.MANU_PART_NUMBER, db' +
        'o.Data0006.WORK_ORDER_NUMBER')
    Left = 192
    Top = 279
    object ADOQuery4WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ADOQuery4wostatus: TStringField
      DisplayLabel = #20316#19994#21333#29366#24577
      FieldName = 'wostatus'
      ReadOnly = True
      Size = 10
    end
    object ADOQuery4wip_ptr: TIntegerField
      DisplayLabel = #22312#32447#27493#39588
      FieldName = 'wip_ptr'
    end
    object ADOQuery4CUST_CODE: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADOQuery4MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
      FixedChar = True
    end
    object ADOQuery4MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADOQuery4unit_sq: TFloatField
      DisplayLabel = #21333#21482#38754#31215
      FieldName = 'unit_sq'
    end
    object ADOQuery4parts_per_panel: TFloatField
      DisplayLabel = 'pcs'#25968'/'#27599'panel'
      FieldName = 'parts_per_panel'
    end
    object ADOQuery4wip_system_qty: TFloatField
      DisplayLabel = #31995#32479'pcs'#25968
      FieldName = 'wip_system_qty'
    end
    object ADOQuery4physical_count_qty: TFloatField
      DisplayLabel = #28165#28857'pcs'#25968
      FieldName = 'physical_count_qty'
    end
    object ADOQuery4physical_panels: TIntegerField
      DisplayLabel = #31995#32479'panel'#25968
      FieldName = 'physical_panels'
    end
    object ADOQuery4pnls: TIntegerField
      DisplayLabel = #28165#28857'panel'#25968
      FieldName = 'pnls'
    end
    object ADOQuery4DSDesigner: TFloatField
      FieldName = #19981#21547#26495#36793#38754#31215
      ReadOnly = True
    end
    object ADOQuery4DSDesigner2: TFloatField
      FieldName = #21547#26495#36793#38754#31215
      ReadOnly = True
    end
    object ADOQuery4DEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADOQuery4DEPT_name: TStringField
      DisplayLabel = #24037#24207#21517#31216
      FieldName = 'DEPT_name'
      Size = 30
    end
    object ADOQuery4DEPT_CODE_2: TStringField
      DisplayLabel = #29677#32452#20195#30721
      FieldName = 'DEPT_CODE_2'
      Size = 10
    end
    object ADOQuery4DSDesigner4: TIntegerField
      FieldName = #22312#21046#23567#26102
      ReadOnly = True
    end
    object ADOQuery4EMPLOYEE_NAME: TStringField
      DisplayLabel = #28165#28857#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQuery4REJECT_DESCRIPTION: TStringField
      DisplayLabel = #25253#24223#21407#22240
      FieldName = 'REJECT_DESCRIPTION'
      FixedChar = True
      Size = 30
    end
    object ADOQuery4onlinestatus: TStringField
      DisplayLabel = #29983#20135#29366#24577
      FieldName = 'onlinestatus'
      ReadOnly = True
      Size = 4
    end
    object ADOQuery4DSDesigner3: TStringField
      FieldName = #20135#21697#31867#22411
      Size = 30
    end
    object ADOQuery4check_no: TStringField
      DisplayLabel = #30424#28857#33778#21495
      FieldName = 'check_no'
      Size = 50
    end
    object ADOQuery4type: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'type'
      Size = 6
      Calculated = True
    end
    object ADOQuery4abbr_name: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'abbr_name'
      ReadOnly = True
      Size = 10
    end
    object ADOQuery4status: TWordField
      FieldName = 'status'
    end
  end
  object ADOQuery5: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 20
      end>
    SQL.Strings = (
      
        'SELECT     TOP (100) PERCENT Data0034_3.DEPT_CODE AS '#24037#24207#20195#30721', Data0' +
        '034_3.DEPT_NAME AS '#24037#24207#21517#31216', dbo.Data0025.MANU_PART_NUMBER AS '#26412#21378#32534#21495', '
      
        '                      dbo.Data0025.MANU_PART_DESC AS '#23458#25143#22411#21495', ROUND' +
        '(dbo.Data0025.unit_sq, 10) AS '#21333#21482#38754#31215', '
      
        '                      CASE dbo.Data0025.ttype WHEN 0 THEN '#39#37327#20135#39' W' +
        'HEN 1 THEN '#39#26679#26495#39' END AS '#20135#21697#23646#24615', dbo.Data0010.CUST_CODE AS '#23458#25143#20195#30721', '
      
        '                      dbo.Data0006.PARTS_PER_PANEL AS '#27599'PNL'#30340'PCS, ' +
        'SUM(dbo.DATA0401.wip_system_qty) AS '#31995#32479'PCS'#25968', '
      
        '                      ROUND(SUM(dbo.DATA0401.wip_system_qty * db' +
        'o.Data0025.unit_sq), 6) AS '#19981#21547#26495#36793#38754#31215', '
      
        '                      ROUND(SUM(dbo.DATA0401.wip_system_qty * db' +
        'o.Data0006.panel_ln * dbo.Data0006.panel_wd * 0.000001 / dbo.Dat' +
        'a0006.PARTS_PER_PANEL), 6) AS '#21547#26495#36793#38754#31215', '
      
        '                      SUM(dbo.DATA0401.physical_count_qty) AS '#28165#28857 +
        'PCS'#25968', SUM(dbo.DATA0401.panels) AS '#31995#32479'PNL'#25968', SUM(dbo.DATA0401.physi' +
        'cal_panels) AS '#28165#28857'PNL'#25968','
      ' dbo.Data0008.PRODUCT_NAME as '#20135#21697#31867#22411
      'FROM         dbo.Data0006 INNER JOIN'
      
        '                      dbo.DATA0401 ON dbo.Data0006.RKEY = dbo.DA' +
        'TA0401.wo_ptr INNER JOIN'
      
        '                      dbo.Data0034 AS Data0034_3 ON dbo.DATA0401' +
        '.dept_ptr = Data0034_3.RKEY INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo' +
        '.Data0025.RKEY INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.Data0025.CUSTOMER_PTR ' +
        '= dbo.Data0010.RKEY  INNER JOIN'
      
        '                      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR' +
        ' = dbo.Data0008.RKEY'
      'WHERE     (dbo.DATA0401.header_ptr = :rkey)'
      
        'GROUP BY Data0034_3.DEPT_CODE, Data0034_3.DEPT_NAME, dbo.Data002' +
        '5.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC, dbo.Data0025.un' +
        'it_sq, '
      
        '                      dbo.Data0010.CUST_CODE, dbo.Data0006.PARTS' +
        '_PER_PANEL, dbo.Data0025.ttype, dbo.Data0008.PRODUCT_NAME'
      'ORDER BY '#24037#24207#20195#30721', '#26412#21378#32534#21495)
    Left = 192
    Top = 336
    object ADOQuery5DSDesigner: TStringField
      FieldName = #24037#24207#20195#30721
      Size = 10
    end
    object ADOQuery5DSDesigner2: TStringField
      FieldName = #24037#24207#21517#31216
      Size = 30
    end
    object ADOQuery5DSDesigner3: TStringField
      FieldName = #26412#21378#32534#21495
    end
    object ADOQuery5DSDesigner4: TStringField
      FieldName = #23458#25143#22411#21495
      Size = 40
    end
    object ADOQuery5DSDesigner5: TFloatField
      FieldName = #21333#21482#38754#31215
      ReadOnly = True
    end
    object ADOQuery5DSDesigner7: TStringField
      FieldName = #20135#21697#23646#24615
      ReadOnly = True
      Size = 4
    end
    object ADOQuery5DSDesigner6: TStringField
      FieldName = #23458#25143#20195#30721
      Size = 10
    end
    object ADOQuery5PNLPCS: TFloatField
      FieldName = #27599'PNL'#30340'PCS'
    end
    object ADOQuery5PCS: TFloatField
      FieldName = #31995#32479'PCS'#25968
      ReadOnly = True
    end
    object ADOQuery5DSDesigner8: TFloatField
      FieldName = #19981#21547#26495#36793#38754#31215
      ReadOnly = True
    end
    object ADOQuery5DSDesigner9: TFloatField
      FieldName = #21547#26495#36793#38754#31215
      ReadOnly = True
    end
    object ADOQuery5PCS2: TFloatField
      FieldName = #28165#28857'PCS'#25968
      ReadOnly = True
    end
    object ADOQuery5PNL: TIntegerField
      FieldName = #31995#32479'PNL'#25968
      ReadOnly = True
    end
    object ADOQuery5PNL2: TIntegerField
      FieldName = #28165#28857'PNL'#25968
      ReadOnly = True
    end
    object ADOQuery5DSDesigner10: TStringField
      FieldName = #20135#21697#31867#22411
      Size = 30
    end
  end
  object qrytmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 40
    Top = 352
  end
end
