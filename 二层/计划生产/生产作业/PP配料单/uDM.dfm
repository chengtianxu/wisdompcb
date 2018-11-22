object DM: TDM
  OldCreateOrder = False
  Left = 665
  Top = 199
  Height = 361
  Width = 383
  object adoConn: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 19
    Top = 8
  end
  object dsBrowse: TDataSource
    DataSet = adsBrowse
    Left = 203
    Top = 8
  end
  object adsBrowse: TADODataSet
    Connection = adoConn
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterOpen = adsBrowseAfterOpen
    AfterScroll = adsBrowseAfterScroll
    CommandText = 
      'SELECT t731.*,t25.MANU_PART_NUMBER,t25.MANU_PART_DESC,t34.DEPT_C' +
      'ODE,t34.DEPT_NAME,'#13#10#9'CASE t731.TTYPE WHEN 0 THEN '#39#27491#24120#37197#26009#21333#39' WHEN 1 ' +
      'THEN '#39#34917#26009#37197#26009#21333#39' END AS '#37197#26009#21333#31867#22411','#13#10#9'CASE t731.TSTATUS WHEN 0 THEN '#39#26410#30830#35748#39 +
      ' WHEN 1 THEN '#39#24050#30830#35748#39' END AS '#29366#24577','#13#10#9'CASE t731.print_flag WHEN 0 THEN' +
      ' '#39#26410#25171#21360#39' WHEN 1 THEN '#39#24050#25171#21360#39' END AS '#25171#21360#26631#35782','#13#10#9'CASE t731.qg_flag WHEN 0' +
      ' THEN '#39#21542#39' WHEN 1 THEN '#39#26159#39' END AS '#26159#21542#20999#21106','#13#10#9'CASE t731.matrece_flag ' +
      'WHEN 0 THEN '#39#21542#39' WHEN 1 THEN '#39#26159#39' END AS '#26159#21542#39046#26009','#13#10#9't5.EMPLOYEE_NAME ' +
      'AS '#21019#24314#20154#21592',t5_1.EMPLOYEE_NAME AS '#30830#35748#20154#21592#13#10'FROM DATA0731 t731'#13#10'--INNER ' +
      'JOIN DATA0732 t732 ON t731.rkey=t732.rkey731'#13#10'INNER JOIN DATA002' +
      '5 t25 ON t731.rkey25=t25.RKEY'#13#10'INNER JOIN Data0034 t34 ON t731.d' +
      'ept_ptr=t34.RKEY'#13#10'INNER JOIN Data0005 t5 ON t731.empl_ptr=t5.RKE' +
      'Y'#13#10'LEFT  JOIN Data0005 t5_1 ON t731.confirm_ptr=t5_1.RKEY'#13#10'WHERE' +
      ' t731.creare_date Between :dtpk1 And :dtpk2'
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    Left = 144
    Top = 8
    object adsBrowserkey: TIntegerField
      DisplayLabel = #25209#27425#21495
      DisplayWidth = 6
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adsBrowserkey25: TIntegerField
      FieldName = 'rkey25'
      Visible = False
    end
    object adsBrowseMANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      DisplayWidth = 12
      FieldName = 'MANU_PART_NUMBER'
    end
    object adsBrowseMANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      DisplayWidth = 20
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object adsBrowsedept_ptr: TIntegerField
      FieldName = 'dept_ptr'
      Visible = False
    end
    object adsBrowseDEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object adsBrowseDEPT_NAME: TStringField
      DisplayLabel = #24037#24207#21517#31216
      DisplayWidth = 12
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object adsBrowselam2: TStringField
      DisplayLabel = #26448#26009#21378#21830
      DisplayWidth = 15
      FieldName = 'lam2'
      Size = 30
    end
    object adsBrowselam_ty_gp: TStringField
      DisplayLabel = #26448#26009#22411#21495
      DisplayWidth = 18
      FieldName = 'lam_ty_gp'
      Size = 30
    end
    object adsBrowseTTYPE: TWordField
      FieldName = 'TTYPE'
      Visible = False
    end
    object adsBrowseDSDesigner: TStringField
      FieldName = #37197#26009#21333#31867#22411
      ReadOnly = True
      Size = 10
    end
    object adsBrowsemanuf_qty: TIntegerField
      DisplayLabel = #29983#20135#24635#25968#37327'(PNL)'
      DisplayWidth = 15
      FieldName = 'manuf_qty'
    end
    object adsBrowsepanel_qty: TIntegerField
      DisplayLabel = 'PP'#37197#26009#24635#24352#25968
      DisplayWidth = 12
      FieldName = 'panel_qty'
    end
    object adsBrowsepp_quota_len: TBCDField
      DisplayLabel = 'PP'#37197#39069#24635#38271#24230'('#31859')'
      DisplayWidth = 16
      FieldName = 'pp_quota_len'
      Precision = 10
      Size = 5
    end
    object adsBrowseempl_ptr: TIntegerField
      FieldName = 'empl_ptr'
      Visible = False
    end
    object adsBrowseDSDesigner5: TStringField
      DisplayWidth = 8
      FieldName = #21019#24314#20154#21592
      Size = 16
    end
    object adsBrowsecreare_date: TDateTimeField
      DisplayLabel = #21019#24314#26085#26399
      FieldName = 'creare_date'
    end
    object adsBrowseconfirm_ptr: TIntegerField
      FieldName = 'confirm_ptr'
      Visible = False
    end
    object adsBrowseDSDesigner6: TStringField
      DisplayWidth = 8
      FieldName = #30830#35748#20154#21592
      Size = 16
    end
    object adsBrowseconfirm_time: TDateTimeField
      DisplayLabel = #30830#35748#26085#26399
      FieldName = 'confirm_time'
    end
    object adsBrowseTSTATUS: TWordField
      FieldName = 'TSTATUS'
      Visible = False
    end
    object adsBrowseDSDesigner2: TStringField
      DisplayWidth = 8
      FieldName = #29366#24577
      ReadOnly = True
      Size = 6
    end
    object adsBrowseprint_flag: TBooleanField
      FieldName = 'print_flag'
      Visible = False
    end
    object adsBrowseDSDesigner3: TStringField
      DisplayWidth = 8
      FieldName = #25171#21360#26631#35782
      ReadOnly = True
      Size = 6
    end
    object adsBrowseqg_flag: TBooleanField
      FieldName = 'qg_flag'
      Visible = False
    end
    object adsBrowseDSDesigner4: TStringField
      DisplayWidth = 8
      FieldName = #26159#21542#20999#21106
      ReadOnly = True
      Size = 2
    end
    object adsBrowsematrece_flag: TBooleanField
      FieldName = 'matrece_flag'
      Visible = False
    end
    object adsBrowseDSDesigner7: TStringField
      FieldName = #26159#21542#39046#26009
      ReadOnly = True
      Size = 2
    end
    object adsBrowseremark: TWideStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 30
      FieldName = 'remark'
      Size = 100
    end
  end
  object aqTmp: TADOQuery
    Connection = adoConn
    Parameters = <>
    Left = 83
    Top = 8
  end
  object aqFindWO: TADOQuery
    Connection = adoConn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'ENGG_PROD_FLAG'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'MANU_PART_NUMBER'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT  Distinct Cast(0 as tinyint) as IsSelected,t6.RKEY,t6.WOR' +
        'K_ORDER_NUMBER,t25.RKEY AS RKEY25,t25.MANU_PART_NUMBER,t25.MANU_' +
        'PART_DESC,t6.PANELS,t56.STEP,t34_1.DEPT_CODE,t34_1.DEPT_NAME,'
      
        #9'CASE t6.PROD_STATUS WHEN 2 THEN '#39#24453#21457#25918#39' WHEN 3 THEN '#39#29983#20135#20013#39' WHEN 4 ' +
        'THEN '#39#22806#21457#29983#20135#39' WHEN 5 THEN '#39#24453#20837#20179#39' WHEN 6 THEN '#39#24453#20998#37197#39' WHEN 103 THEN '#39#29983 +
        #20135#20013#26242#32531#39' ELSE '#39#39' END AS '#20316#19994#21333#29366#24577
      'FROM Data0025 t25'
      'INNER JOIN Data0038 t38 ON t25.RKEY=t38.SOURCE_PTR'
      'INNER JOIN Data0034 t34 ON t38.DEPT_PTR=t34.RKEY'
      'INNER JOIN Data0006 t6 ON t25.RKEY=t6.BOM_PTR'
      'LEFT JOIN Data0056 t56 ON t6.RKEY=t56.WO_PTR'
      'LEFT JOIN Data0034 t34_1 ON t56.DEPT_PTR=t34_1.RKEY'
      'WHERE t6.PROD_STATUS IN(2,3,4)'
      'AND ISNULL(t6.ENGG_PROD_FLAG,0)= :ENGG_PROD_FLAG'
      'AND t34.TTYPE=1 AND t34.DEPT_NAME LIKE '#39'%'#21387'%'#39
      'AND t25.MANU_PART_NUMBER = :MANU_PART_NUMBER')
    Left = 144
    Top = 56
    object aqFindWOIsSelected: TWordField
      DisplayLabel = #36873#25321
      DisplayWidth = 5
      FieldName = 'IsSelected'
    end
    object aqFindWORKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object aqFindWORKEY25: TAutoIncField
      FieldName = 'RKEY25'
      ReadOnly = True
      Visible = False
    end
    object aqFindWOWORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      DisplayWidth = 18
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object aqFindWOMANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      DisplayWidth = 15
      FieldName = 'MANU_PART_NUMBER'
    end
    object aqFindWOMANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      DisplayWidth = 20
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object aqFindWOPANELS: TIntegerField
      DisplayLabel = #25237#20135#25968'(PNL)'
      DisplayWidth = 12
      FieldName = 'PANELS'
    end
    object aqFindWOSTEP: TSmallintField
      DisplayLabel = #27493#39588
      DisplayWidth = 5
      FieldName = 'STEP'
    end
    object aqFindWODEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object aqFindWODEPT_NAME: TStringField
      DisplayLabel = #24037#24207#21517#31216
      DisplayWidth = 10
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object aqFindWODSDesigner: TStringField
      FieldName = #20316#19994#21333#29366#24577
      ReadOnly = True
      Size = 10
    end
  end
  object dsFindWO: TDataSource
    DataSet = cdsFindWO
    Left = 203
    Top = 56
  end
  object cdsFindWO: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFindWO'
    Left = 19
    Top = 56
    object cdsFindWOIsSelected: TSmallintField
      DisplayLabel = #36873#25321
      DisplayWidth = 5
      FieldName = 'IsSelected'
    end
    object cdsFindWORKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object cdsFindWORKEY25: TAutoIncField
      FieldName = 'RKEY25'
      ReadOnly = True
      Visible = False
    end
    object cdsFindWOWORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      DisplayWidth = 18
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object cdsFindWOMANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      DisplayWidth = 15
      FieldName = 'MANU_PART_NUMBER'
    end
    object cdsFindWOMANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      DisplayWidth = 20
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object cdsFindWOPANELS: TIntegerField
      DisplayLabel = #25237#20135#25968'(PNL)'
      DisplayWidth = 12
      FieldName = 'PANELS'
    end
    object cdsFindWOSTEP: TSmallintField
      DisplayLabel = #27493#39588
      DisplayWidth = 5
      FieldName = 'STEP'
    end
    object cdsFindWODEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object cdsFindWODEPT_NAME: TStringField
      DisplayLabel = #24037#24207#21517#31216
      DisplayWidth = 10
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object cdsFindWOCDSDesigner: TStringField
      FieldName = #20316#19994#21333#29366#24577
      ReadOnly = True
      Size = 10
    end
  end
  object dspFindWO: TDataSetProvider
    DataSet = aqFindWO
    Left = 83
    Top = 56
  end
  object aspBuild: TADOStoredProc
    Connection = adoConn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'SP_MakePPDistrib'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@Type'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@MANU_PART_NUMBER'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end
      item
        Name = '@STR'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2147483647
        Value = Null
      end
      item
        Name = '@STEP'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 19
    Top = 112
  end
  object aq731: TADOQuery
    Connection = adoConn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterScroll = aq731AfterScroll
    Parameters = <
      item
        Name = 'RKEY731'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * FROM Data0731'
      'WHERE RKEY = :RKEY731')
    Left = 83
    Top = 112
    object aq731rkey: TAutoIncField
      FieldName = 'rkey'
    end
    object aq731rkey25: TIntegerField
      FieldName = 'rkey25'
      OnChange = aq731rkey25Change
    end
    object aq731dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
      OnChange = aq731dept_ptrChange
    end
    object aq731lam2: TStringField
      FieldName = 'lam2'
      Size = 30
    end
    object aq731lam_ty_gp: TStringField
      FieldName = 'lam_ty_gp'
      Size = 30
    end
    object aq731TTYPE: TWordField
      FieldName = 'TTYPE'
    end
    object aq731manuf_qty: TIntegerField
      FieldName = 'manuf_qty'
    end
    object aq731panel_qty: TIntegerField
      FieldName = 'panel_qty'
    end
    object aq731pp_quota_len: TBCDField
      FieldName = 'pp_quota_len'
      Precision = 10
      Size = 5
    end
    object aq731empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
      OnChange = aq731empl_ptrChange
    end
    object aq731creare_date: TDateTimeField
      FieldName = 'creare_date'
    end
    object aq731confirm_ptr: TIntegerField
      FieldName = 'confirm_ptr'
      OnChange = aq731confirm_ptrChange
    end
    object aq731confirm_time: TDateTimeField
      FieldName = 'confirm_time'
    end
    object aq731TSTATUS: TWordField
      FieldName = 'TSTATUS'
    end
    object aq731print_flag: TBooleanField
      FieldName = 'print_flag'
    end
    object aq731qg_flag: TBooleanField
      FieldName = 'qg_flag'
    end
    object aq731matrece_flag: TBooleanField
      FieldName = 'matrece_flag'
    end
    object aq731remark: TWideStringField
      FieldName = 'remark'
      Size = 100
    end
  end
  object aq732: TADOQuery
    Connection = adoConn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    OnCalcFields = aq732CalcFields
    EnableBCD = False
    Parameters = <
      item
        Name = 'RKEY731'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT dbo.DATA0732.rkey,dbo.DATA0732.rkey731,dbo.DATA0732.rkey0' +
        '6,dbo.DATA0732.rkey17,dbo.DATA0732.manuf_qty, '
      
        '       dbo.DATA0732.pp_quota, dbo.DATA0732.panel_qty, dbo.DATA07' +
        '32.panel_ln, dbo.DATA0732.panel_wd, dbo.DATA0732.PP_TYP, dbo.DAT' +
        'A0732.pp_rc, '
      
        '       dbo.DATA0732.pp_tg, dbo.DATA0732.pp_quota_len, dbo.DATA07' +
        '32.pp_quota_roll, dbo.DATA0732.qg_flag, dbo.DATA0732.matrece_fla' +
        'g, dbo.DATA0732.remark'
      'FROM dbo.DATA0732'
      'WHERE dbo.DATA0732.rkey731 = :RKEY731')
    Left = 144
    Top = 112
    object aq732rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object aq732rkey731: TIntegerField
      FieldName = 'rkey731'
      Visible = False
    end
    object aq732rkey06: TIntegerField
      FieldName = 'rkey06'
      Visible = False
    end
    object aq732rkey17: TIntegerField
      FieldName = 'rkey17'
      Visible = False
      OnChange = aq732rkey17Change
    end
    object aq732WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      DisplayWidth = 16
      FieldKind = fkLookup
      FieldName = 'WORK_ORDER_NUMBER'
      LookupDataSet = aq06
      LookupKeyFields = 'RKEY'
      LookupResultField = 'WORK_ORDER_NUMBER'
      KeyFields = 'rkey06'
      LookupCache = True
      Size = 22
      Lookup = True
    end
    object aq732INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      DisplayWidth = 22
      FieldKind = fkLookup
      FieldName = 'INV_PART_NUMBER'
      LookupDataSet = aq17
      LookupKeyFields = 'RKEY'
      LookupResultField = 'INV_PART_NUMBER'
      KeyFields = 'rkey17'
      LookupCache = True
      Size = 25
      Lookup = True
    end
    object aq732INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #21697#21517#35268#26684
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'INV_PART_DESCRIPTION'
      LookupDataSet = aq17
      LookupKeyFields = 'RKEY'
      LookupResultField = 'INV_PART_DESCRIPTION'
      KeyFields = 'rkey17'
      LookupCache = True
      Size = 100
      Lookup = True
    end
    object aq732manuf_qty: TIntegerField
      DisplayLabel = #29983#20135#25968#37327'(panel)'
      FieldName = 'manuf_qty'
      OnChange = aq732manuf_qtyChange
    end
    object aq732pp_quota: TIntegerField
      DisplayLabel = 'PP'#37197#39069#27604#20363
      FieldName = 'pp_quota'
      OnChange = aq732manuf_qtyChange
    end
    object aq732panel_qty: TIntegerField
      DisplayLabel = 'PP'#37197#26009#24352#25968
      FieldName = 'panel_qty'
    end
    object aq732panel_ln: TBCDField
      DisplayLabel = 'panel'#38271#24230'('#32428#21521')'
      FieldName = 'panel_ln'
      Precision = 7
      Size = 2
    end
    object aq732panel_wd: TBCDField
      DisplayLabel = 'panel'#23485#24230'('#32463#21521')'
      FieldName = 'panel_wd'
      Precision = 7
      Size = 2
    end
    object aq732PP_TYP: TStringField
      DisplayLabel = 'PP'#22411#21495
      DisplayWidth = 25
      FieldName = 'PP_TYP'
      Size = 30
    end
    object aq732pp_rc: TStringField
      DisplayLabel = #26641#33026#21547#37327'%'
      DisplayWidth = 20
      FieldName = 'pp_rc'
      Size = 30
    end
    object aq732pp_tg: TStringField
      DisplayLabel = 'TG'#20540
      DisplayWidth = 10
      FieldName = 'pp_tg'
      Size = 30
    end
    object aq732pp_quota_len: TBCDField
      DisplayLabel = 'PP'#37197#39069#24635#38271#24230'('#31859')'
      FieldName = 'pp_quota_len'
      Precision = 10
      Size = 5
    end
    object aq732pp_quota_roll: TBCDField
      DisplayLabel = 'PP'#37197#39069#24635#21367#25968'('#21367')'
      FieldName = 'pp_quota_roll'
      Precision = 10
      Size = 5
    end
    object aq732qg_flag: TBooleanField
      FieldName = 'qg_flag'
      Visible = False
    end
    object aq732qg: TStringField
      DisplayLabel = #26159#21542#20999#21106
      FieldKind = fkCalculated
      FieldName = 'qg'
      Size = 2
      Calculated = True
    end
    object aq732matrece_flag: TBooleanField
      FieldName = 'matrece_flag'
      Visible = False
    end
    object aq732matrece: TStringField
      DisplayLabel = #26159#21542#39046#26009
      FieldKind = fkCalculated
      FieldName = 'matrece'
      Size = 2
      Calculated = True
    end
    object aq732remark: TWideStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 100
    end
    object aq732IES_PARAMETER_VALUE2: TStringField
      FieldKind = fkLookup
      FieldName = 'IES_PARAMETER_VALUE2'
      LookupDataSet = aq17
      LookupKeyFields = 'RKEY'
      LookupResultField = 'IES_PARAMETER_VALUE2'
      KeyFields = 'rkey17'
      LookupCache = True
      Visible = False
      Size = 30
      Lookup = True
    end
    object aq732IES_PARAMETER_VALUE3: TStringField
      FieldKind = fkLookup
      FieldName = 'IES_PARAMETER_VALUE3'
      LookupDataSet = aq17
      LookupKeyFields = 'RKEY'
      LookupResultField = 'IES_PARAMETER_VALUE3'
      KeyFields = 'rkey17'
      LookupCache = True
      Visible = False
      Size = 30
      Lookup = True
    end
  end
  object ds731: TDataSource
    DataSet = aq731
    Left = 203
    Top = 112
  end
  object ds732: TDataSource
    DataSet = aq732
    Left = 203
    Top = 112
  end
  object aq05: TADOQuery
    Connection = adoConn
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'RKEY05'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT EMPL_CODE,EMPLOYEE_NAME FROM Data0005'
      'WHERE RKEY=:RKEY05')
    Left = 19
    Top = 168
    object aq05EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object aq05EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object aq25: TADOQuery
    Connection = adoConn
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'RKEY25'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT MANU_PART_NUMBER,MANU_PART_DESC,layers_image,layers_info,' +
        'RTRIM(LTRIM(CURRENT_REV)) AS CURRENT_REV FROM Data0025'
      'WHERE RKEY=:RKEY25')
    Left = 144
    Top = 168
    object aq25MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object aq25MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object aq25layers_image: TBlobField
      FieldName = 'layers_image'
    end
    object aq25layers_info: TMemoField
      FieldName = 'layers_info'
      BlobType = ftMemo
    end
    object aq25CURRENT_REV: TStringField
      FieldName = 'CURRENT_REV'
      ReadOnly = True
      Size = 10
    end
  end
  object aq34: TADOQuery
    Connection = adoConn
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'RKEY34'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT DEPT_CODE,DEPT_NAME FROM Data0034'
      'WHERE TTYPE=1 AND RKEY=:RKEY34')
    Left = 203
    Top = 168
    object aq34DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object aq34DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
  end
  object aq05_1: TADOQuery
    Connection = adoConn
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'RKEY05'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT EMPL_CODE,EMPLOYEE_NAME FROM Data0005'
      'WHERE RKEY=:RKEY05')
    Left = 83
    Top = 168
    object StringField1: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object StringField2: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object ds05: TDataSource
    DataSet = aq05
    Left = 19
    Top = 224
  end
  object ds05_1: TDataSource
    DataSet = aq05_1
    Left = 83
    Top = 224
  end
  object ds25: TDataSource
    DataSet = aq25
    Left = 144
    Top = 224
  end
  object ds34: TDataSource
    DataSet = aq34
    Left = 203
    Top = 224
  end
  object aqProcParam: TADOQuery
    Connection = adoConn
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'RKEY25'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'RKEY34'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT t494.seq_no,t494.PARAMETER_PTR,t278.PARAMETER_NAME,t278.P' +
        'ARAMETER_DESC,t494.PARAMETER_VALUE'
      'FROM Data0494 t494'
      
        'INNER JOIN Data0038 t38 on t494.custpart_ptr = t38.SOURCE_PTR AN' +
        'D t494.step_number = t38.step_number'
      'INNER JOIN Data0278 t278 on t494.PARAMETER_PTR = t278.RKEY'
      'INNER JOIN Data0034 t34 ON t38.DEPT_PTR=t34.RKEY'
      'WHERE t494.custpart_ptr = :RKEY25'
      'AND t34.RKEY = :RKEY34'
      'ORDER BY t494.seq_no')
    Left = 19
    Top = 280
    object aqProcParamseq_no: TSmallintField
      DisplayLabel = #24207#21495
      DisplayWidth = 5
      FieldName = 'seq_no'
    end
    object aqProcParamPARAMETER_PTR: TIntegerField
      FieldName = 'PARAMETER_PTR'
      Visible = False
    end
    object aqProcParamPARAMETER_NAME: TStringField
      DisplayLabel = #21442#25968#21517#31216
      FieldName = 'PARAMETER_NAME'
      Visible = False
      Size = 10
    end
    object aqProcParamPARAMETER_DESC: TStringField
      DisplayLabel = #21442#25968#25551#36848
      DisplayWidth = 12
      FieldName = 'PARAMETER_DESC'
    end
    object aqProcParamPARAMETER_VALUE: TStringField
      DisplayLabel = #21442#25968#20540
      DisplayWidth = 15
      FieldName = 'PARAMETER_VALUE'
      Size = 30
    end
  end
  object dsProcParam: TDataSource
    DataSet = aqProcParam
    Left = 83
    Top = 280
  end
  object aq17: TADOQuery
    Connection = adoConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT t17.RKEY,t17.INV_PART_NUMBER,t17.INV_PART_DESCRIPTION,t17' +
        '.INV_NAME,t17.INV_DESCRIPTION,t17.IES_PARAMETER_VALUE2,t17.IES_P' +
        'ARAMETER_VALUE3'
      
        'FROM Data0017 t17 INNER JOIN Data0496 t496 ON t17.GROUP_PTR=t496' +
        '.RKEY'
      'INNER JOIN Data0192 t192 ON t496.RKEY=t192.CLOSE_HOURTH'
      'ORDER BY t17.INV_PART_NUMBER')
    Left = 144
    Top = 280
    object aq17RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq17INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object aq17INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object aq17INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object aq17INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object aq17IES_PARAMETER_VALUE2: TStringField
      FieldName = 'IES_PARAMETER_VALUE2'
      Size = 30
    end
    object aq17IES_PARAMETER_VALUE3: TStringField
      FieldName = 'IES_PARAMETER_VALUE3'
      Size = 30
    end
  end
  object aq06: TADOQuery
    Connection = adoConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT RKEY,WORK_ORDER_NUMBER FROM Data0006 WHERE PROD_STATUS IN' +
        '(2,3,4)'
      'UNION'
      'SELECT DISTINCT DATA0732.rkey06,Data0006.WORK_ORDER_NUMBER'
      
        'FROM DATA0732 INNER JOIN Data0006 ON DATA0732.rkey06=Data0006.RK' +
        'EY')
    Left = 203
    Top = 280
    object aq06RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq06WORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
  end
  object dsFindWO1: TDataSource
    DataSet = aqFindWO1
    Left = 328
    Top = 56
  end
  object aqFindWO1: TADOQuery
    Connection = adoConn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'RKEY25'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      '/*  --'#35201#27714#21482#26174#31034#20854#19979#19968#20010#23618#32423','#25925#32780#23631#34109
      ';WITH CTE(RKEY) AS'
      '('
      #9'SELECT RKEY FROM Data0025'
      #9'WHERE PARENT_PTR = :RKEY25'
      '  UNION ALL'
      #9'SELECT t25.RKEY'
      #9'FROM Data0025 t25 INNER JOIN CTE t ON t25.PARENT_PTR=t.RKEY'
      ')'
      
        'SELECT t6.WORK_ORDER_NUMBER AS '#39#20316#19994#21333#21495#39',t25.MANU_PART_NUMBER AS '#39#26412 +
        #21378#32534#21495#39',t25.MANU_PART_DESC AS '#39#23458#25143#22411#21495#39','
      
        #9't6.PANELS AS '#39#25237#20135#25968'(PNL)'#39',t56.STEP AS '#39#27493#39588#39',t34.DEPT_CODE AS '#39#24037#24207#20195#30721 +
        #39',t34.DEPT_NAME AS '#39#24037#24207#21517#31216#39','
      
        #9'CASE t6.PROD_STATUS WHEN 2 THEN '#39#24453#21457#25918#39' WHEN 3 THEN '#39#29983#20135#20013#39' WHEN 4 ' +
        'THEN '#39#22806#21457#29983#20135#39' WHEN 5 THEN '#39#24453#20837#20179#39' WHEN 6 THEN '#39#24453#20998#37197#39
      
        ' '#9#9#9#9#9#9'WHEN 9 THEN '#39#29983#20135#32467#26463#39' WHEN 102 THEN '#39#29983#20135#21069#26242#32531#39' WHEN 103 THEN '#39#29983 +
        #20135#20013#26242#32531#39' WHEN 202 THEN '#39#21462#28040#39' ELSE '#39#39' END AS '#20316#19994#21333#29366#24577
      'FROM CTE INNER JOIN Data0025 t25 ON CTE.RKEY=t25.RKEY'
      'INNER JOIN Data0006 t6 ON t25.RKEY=t6.BOM_PTR'
      'LEFT JOIN Data0056 t56 ON t6.RKEY=t56.WO_PTR'
      'LEFT JOIN Data0034 t34 ON t56.DEPT_PTR=t34.RKEY'
      'WHERE t6.PROD_STATUS IN(2,3,4,6)'
      'ORDER BY t6.WORK_ORDER_NUMBER'
      '*/'
      ''
      
        'SELECT t6.WORK_ORDER_NUMBER AS '#39#20316#19994#21333#21495#39',t25.MANU_PART_NUMBER AS '#39#26412 +
        #21378#32534#21495#39',t25.MANU_PART_DESC AS '#39#23458#25143#22411#21495#39','
      
        #9't6.PANELS AS '#39#25237#20135#25968'(PNL)'#39',t56.STEP AS '#39#27493#39588#39',t34.DEPT_CODE AS '#39#24037#24207#20195#30721 +
        #39',t34.DEPT_NAME AS '#39#24037#24207#21517#31216#39','
      
        #9'CASE t6.PROD_STATUS WHEN 2 THEN '#39#24453#21457#25918#39' WHEN 3 THEN '#39#29983#20135#20013#39' WHEN 4 ' +
        'THEN '#39#22806#21457#29983#20135#39' WHEN 5 THEN '#39#24453#20837#20179#39' WHEN 6 THEN '#39#24453#20998#37197#39
      
        ' '#9#9#9#9#9#9'WHEN 9 THEN '#39#29983#20135#32467#26463#39' WHEN 102 THEN '#39#29983#20135#21069#26242#32531#39' WHEN 103 THEN '#39#29983 +
        #20135#20013#26242#32531#39' WHEN 202 THEN '#39#21462#28040#39' ELSE '#39#39' END AS '#20316#19994#21333#29366#24577
      'FROM Data0025 t25 INNER JOIN Data0006 t6 ON t25.RKEY=t6.BOM_PTR'
      'LEFT JOIN Data0056 t56 ON t6.RKEY=t56.WO_PTR'
      'LEFT JOIN Data0034 t34 ON t56.DEPT_PTR=t34.RKEY'
      'WHERE t25.PARENT_PTR = :RKEY25'
      'AND t6.PROD_STATUS IN(2,3,4,6)'
      'ORDER BY t6.WORK_ORDER_NUMBER')
    Left = 269
    Top = 56
    object aqFindWO1DSDesigner: TStringField
      FieldName = #20316#19994#21333#21495
      ReadOnly = True
      Size = 22
    end
    object aqFindWO1DSDesigner2: TStringField
      FieldName = #26412#21378#32534#21495
      ReadOnly = True
    end
    object aqFindWO1DSDesigner3: TStringField
      FieldName = #23458#25143#22411#21495
      ReadOnly = True
      Size = 80
    end
    object aqFindWO1PNL: TIntegerField
      FieldName = #25237#20135#25968'(PNL)'
      ReadOnly = True
    end
    object aqFindWO1DSDesigner4: TSmallintField
      FieldName = #27493#39588
      ReadOnly = True
    end
    object aqFindWO1DSDesigner5: TStringField
      FieldName = #24037#24207#20195#30721
      ReadOnly = True
      Size = 10
    end
    object aqFindWO1DSDesigner6: TStringField
      DisplayWidth = 10
      FieldName = #24037#24207#21517#31216
      ReadOnly = True
      Size = 30
    end
    object aqFindWO1DSDesigner7: TStringField
      FieldName = #20316#19994#21333#29366#24577
      ReadOnly = True
      Size = 10
    end
  end
  object dsBrowse1: TDataSource
    DataSet = aqBrowse1
    Left = 328
    Top = 8
  end
  object aqBrowse1: TADOQuery
    Connection = adoConn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'RKEY731'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT t732.rkey,t732.rkey731,t732.rkey06,t732.rkey17,t732.manuf' +
        '_qty, '
      
        '       t732.pp_quota, t732.panel_qty, t732.panel_ln, t732.panel_' +
        'wd, t732.PP_TYP, t732.pp_rc, '
      
        '       t732.pp_tg, t732.pp_quota_len, t732.pp_quota_roll, t732.q' +
        'g_flag, t732.matrece_flag, t732.remark,'
      
        '       t6.WORK_ORDER_NUMBER, t17.INV_PART_NUMBER, t17.INV_PART_D' +
        'ESCRIPTION'
      
        'FROM dbo.DATA0732 t732 INNER JOIN dbo.DATA0006 t6 ON t732.rkey06' +
        '=t6.RKEY'
      'INNER JOIN dbo.DATA0017 t17 ON t732.rkey17=t17.RKEY'
      'WHERE t732.rkey731 = :RKEY731')
    Left = 269
    Top = 8
    object aqBrowse1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aqBrowse1rkey731: TIntegerField
      FieldName = 'rkey731'
    end
    object aqBrowse1rkey06: TIntegerField
      FieldName = 'rkey06'
    end
    object aqBrowse1rkey17: TIntegerField
      FieldName = 'rkey17'
    end
    object aqBrowse1manuf_qty: TIntegerField
      DisplayLabel = #29983#20135#25968#37327'(panel)'
      FieldName = 'manuf_qty'
    end
    object aqBrowse1pp_quota: TIntegerField
      DisplayLabel = 'PP'#37197#39069#27604#20363
      FieldName = 'pp_quota'
    end
    object aqBrowse1panel_qty: TIntegerField
      DisplayLabel = 'PP'#37197#26009#24352#25968
      FieldName = 'panel_qty'
    end
    object aqBrowse1panel_ln: TBCDField
      DisplayLabel = 'panel'#38271#24230'('#32428#21521')'
      FieldName = 'panel_ln'
      Precision = 7
      Size = 2
    end
    object aqBrowse1panel_wd: TBCDField
      DisplayLabel = 'panel'#23485#24230'('#32463#21521')'
      FieldName = 'panel_wd'
      Precision = 7
      Size = 2
    end
    object aqBrowse1PP_TYP: TStringField
      DisplayLabel = 'PP'#22411#21495
      DisplayWidth = 25
      FieldName = 'PP_TYP'
      Size = 30
    end
    object aqBrowse1pp_rc: TStringField
      DisplayLabel = #26641#33026#21547#37327'%'
      DisplayWidth = 20
      FieldName = 'pp_rc'
      Size = 30
    end
    object aqBrowse1pp_tg: TStringField
      DisplayLabel = 'TG'#20540
      DisplayWidth = 10
      FieldName = 'pp_tg'
      Size = 30
    end
    object aqBrowse1pp_quota_len: TBCDField
      DisplayLabel = 'PP'#37197#39069#24635#38271#24230'('#31859')'
      FieldName = 'pp_quota_len'
      Precision = 10
      Size = 5
    end
    object aqBrowse1pp_quota_roll: TBCDField
      DisplayLabel = 'PP'#37197#39069#24635#21367#25968'('#21367')'
      FieldName = 'pp_quota_roll'
      Precision = 10
      Size = 5
    end
    object aqBrowse1qg_flag: TBooleanField
      FieldName = 'qg_flag'
    end
    object aqBrowse1matrece_flag: TBooleanField
      FieldName = 'matrece_flag'
    end
    object aqBrowse1remark: TWideStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 100
    end
    object aqBrowse1WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      DisplayWidth = 16
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object aqBrowse1INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      DisplayWidth = 22
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object aqBrowse1INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #21697#21517#35268#26684
      DisplayWidth = 30
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
  end
end
