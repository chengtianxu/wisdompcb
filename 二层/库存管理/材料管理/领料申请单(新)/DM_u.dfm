object DM: TDM
  OldCreateOrder = False
  Left = 590
  Top = 276
  Height = 496
  Width = 782
  object ADOCon: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 8
    Top = 32
  end
  object tmp: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 216
    Top = 24
  end
  object DS1: TDataSource
    DataSet = ADO268
    Left = 8
    Top = 88
  end
  object DS2: TDataSource
    DataSet = ADO468
    Left = 8
    Top = 155
  end
  object ADO268: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    AfterOpen = ADO268AfterScroll
    AfterScroll = ADO268AfterScroll
    Parameters = <>
    SQL.Strings = (
      'SELECT   '
      
        '  dbo.DATA0268.rkey, dbo.DATA0268.number, dbo.DATA0268.dept_ptr,' +
        ' dbo.DATA0268.DATE, dbo.DATA0268.EMPL_PTR, dbo.DATA0268.status, '
      
        '                      dbo.DATA0268.auth_emplptr, dbo.DATA0268.au' +
        'th_date, dbo.DATA0268.reference, dbo.Data0034.DEPT_CODE, dbo.Dat' +
        'a0034.DEPT_NAME, '
      
        '                      dbo.Data0005.EMPL_CODE, dbo.Data0005.EMPLO' +
        'YEE_NAME AS abbr_name, Data0005_1.EMPL_CODE AS Auditcode, '
      
        '                      Data0005_1.EMPLOYEE_NAME AS Auditname, dbo' +
        '.Data0268.cut_no,'
      
        '                      CASE WHEN data0268.status = 0 THEN '#39#24453#25552#20132#39' W' +
        'HEN data0268.status = 1 THEN '#39#24453#23457#26680#39' WHEN data0268.status = 2 THEN' +
        ' '#39#24050#23457#26680#39' WHEN data0268.status'
      
        '                       = 3 THEN '#39#34987#36864#22238#39' WHEN data0268.status = 4 T' +
        'HEN '#39#24050#21457#26009#39' END AS status_c, dbo.DATA0268.auth_ptr, dbo.Data0094.R' +
        'KEY AS rkey94, '
      
        '                      dbo.Data0094.CODE, dbo.Data0094.PURCHASE_A' +
        'PPROV_DESC, dbo.Data0015.ABBR_NAME AS fac_name, dbo.DATA0268.war' +
        'ehouse_ptr, '
      
        '                      dbo.DATA0268.Prted, dbo.DATA0268.allow_sub' +
        'mit, '
      
        '                      CASE WHEN data0268.allow_submit = 0 THEN '#39 +
        #19981#30830#35748#39' WHEN data0268.allow_submit = 1 THEN '#39#24453#30830#35748#39' WHEN data0268.all' +
        'ow_submit = 2 THEN '#39#24050#30830#35748#39
      
        '                               WHEN data0268.allow_submit = 3 TH' +
        'EN '#39#24453#30830#35748#39
      
        '                       END AS allow_submit_c, Data0005_2.EMPL_CO' +
        'DE AS allow_submit_person_code, Data0005_2.EMPLOYEE_NAME AS allo' +
        'w_submit_person_name, '
      
        '                      dbo.DATA0268.allow_submit_time, dbo.DATA02' +
        '68.control_ptr,data0268.ismsgsended , ConfMan'
      'FROM         dbo.DATA0268 INNER JOIN'
      
        '                      dbo.Data0034 ON dbo.DATA0268.dept_ptr = db' +
        'o.Data0034.RKEY INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.DATA0268.EMPL_PTR = db' +
        'o.Data0005.RKEY LEFT JOIN'
      
        '                      dbo.Data0005 AS Data0005_1 ON dbo.DATA0268' +
        '.auth_emplptr = Data0005_1.RKEY INNER JOIN'
      
        '                      dbo.Data0094 ON dbo.DATA0268.auth_ptr = db' +
        'o.Data0094.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.DATA0268.warehouse_ptr' +
        ' = dbo.Data0015.RKEY LEFT JOIN'
      
        '                      dbo.Data0005 AS Data0005_2 ON dbo.DATA0268' +
        '.allow_submit_person = Data0005_2.RKEY '
      '        ')
    Left = 56
    Top = 88
    object ADO268rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO268number: TStringField
      DisplayLabel = #30003#39046#21333#21495
      FieldName = 'number'
      Size = 50
    end
    object ADO268dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ADO268DATE: TDateTimeField
      DisplayLabel = #30003#35831#26085#26399
      FieldName = 'DATE'
    end
    object ADO268EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ADO268status: TWordField
      FieldName = 'status'
    end
    object ADO268auth_emplptr: TIntegerField
      FieldName = 'auth_emplptr'
    end
    object ADO268auth_date: TDateTimeField
      DisplayLabel = #23457#26680#26085#26399
      FieldName = 'auth_date'
    end
    object ADO268reference: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'reference'
      Size = 100
    end
    object ADO268DEPT_CODE: TStringField
      DisplayLabel = #30003#39046#37096#38376
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADO268DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADO268EMPL_CODE: TStringField
      DisplayLabel = #30003#39046#21592#24037#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ADO268ABBR_NAME: TStringField
      DisplayLabel = #30003#39046#21592#24037#21517#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADO268Auditcode: TStringField
      DisplayLabel = #23457#26680#21592#24037#20195#30721
      FieldName = 'Auditcode'
      Size = 10
    end
    object ADO268Auditname: TStringField
      DisplayLabel = #30003#39046#21592#24037#21517#31216
      FieldName = 'Auditname'
      Size = 10
    end
    object ADO268status_c: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'status_c'
      ReadOnly = True
      Size = 6
    end
    object ADO268auth_ptr: TIntegerField
      FieldName = 'auth_ptr'
    end
    object ADO268code: TStringField
      FieldName = 'code'
      Size = 5
    end
    object ADO268PURCHASE_APPROV_DESC: TStringField
      FieldName = 'PURCHASE_APPROV_DESC'
      Size = 40
    end
    object ADO268fac_name: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'fac_name'
      Size = 10
    end
    object ADO268warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ADO268Prted: TBooleanField
      DisplayLabel = #25171#21360#21542
      FieldName = 'Prted'
    end
    object ADO268allow_submit: TWordField
      FieldName = 'allow_submit'
    end
    object ADO268allow_submit_c: TStringField
      FieldName = 'allow_submit_c'
      ReadOnly = True
      Size = 6
    end
    object ADO268allow_submit_person_code: TStringField
      FieldName = 'allow_submit_person_code'
      Size = 10
    end
    object ADO268allow_submit_person_name: TStringField
      FieldName = 'allow_submit_person_name'
      Size = 16
    end
    object ADO268allow_submit_time: TDateTimeField
      FieldName = 'allow_submit_time'
    end
    object ADO268control_ptr: TIntegerField
      FieldName = 'control_ptr'
    end
    object ADO268cut_no: TStringField
      FieldName = 'cut_no'
      FixedChar = True
      Size = 12
    end
    object atncfldADO268rkey94: TAutoIncField
      FieldName = 'rkey94'
      ReadOnly = True
    end
    object ADO268ismsgsended: TIntegerField
      FieldName = 'ismsgsended'
    end
    object wdstrngfldADO268ConfMan: TWideStringField
      FieldName = 'ConfMan'
      Size = 10
    end
  end
  object ADO468: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey268'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT      dbo.Data0468.RKEY, dbo.Data0468.CUT_NO, dbo.Data0468' +
        '.SO_NO, dbo.Data0468.FLOW_NO, dbo.Data0468.STEP, '
      
        'dbo.Data0468.DEPT_PTR, dbo.Data0468.INVENT_PTR, dbo.Data0468.QUA' +
        'N_BOM, dbo.Data0468.QUAN_ISSUED, '
      
        'dbo.Data0468.STATUS, dbo.Data0468.PRINTIT, dbo.Data0468.VENDOR, ' +
        'dbo.Data0468.Invent_or,dbo.Data0468.quan_alloc,'
      
        'dbo.Data0468.overproof, dbo.Data0017.INV_PART_NUMBER, dbo.Data00' +
        '17.INV_PART_DESCRIPTION,data0002.unit_name,'
      
        'case dbo.Data0468.PRINTIT when '#39'Y'#39' then '#39#26222#36890#24211#23384#39' when '#39'N'#39' then '#39'VM' +
        'I'#24211#23384#39' END AS PRINTIT_S, '
      
        'data0468.control_ptr,d136.control_name,dbo.Data0468.remark,data0' +
        '468.supplier_ptr,data0468.ExReason,data0468.standards,'
      'data0468.wzcp0492_ptr'
      'FROM    dbo.Data0468 '
      
        'INNER JOIN dbo.Data0017 ON dbo.Data0468.INVENT_PTR = dbo.Data001' +
        '7.RKEY'
      'left  join data0002 on data0468.Runit=data0002.rkey'
      'left join data0136 d136 on data0468.control_ptr=d136.rkey'
      'where dbo.DATA0468.flow_no=:rkey268'
      'order by  d136.control_name')
    Left = 56
    Top = 152
    object ADO468RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO468FLOW_NO: TIntegerField
      FieldName = 'FLOW_NO'
    end
    object ADO468STEP: TSmallintField
      FieldName = 'STEP'
    end
    object ADO468DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADO468INVENT_PTR: TIntegerField
      FieldName = 'INVENT_PTR'
    end
    object ADO468QUAN_BOM: TFloatField
      DisplayLabel = #30003#39046#25968#37327
      FieldName = 'QUAN_BOM'
    end
    object ADO468VENDOR: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'VENDOR'
      Size = 15
    end
    object ADO468Invent_or: TSmallintField
      FieldName = 'Invent_or'
    end
    object ADO468INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO468INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#21517#31216'/'#35268#26684
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ADO468unit_name: TStringField
      DisplayLabel = #24211#23384#21333#20301
      FieldName = 'unit_name'
    end
    object ADO468QUAN_ISSUED: TFloatField
      DisplayLabel = #24050#21457#25918#25968#37327
      FieldName = 'QUAN_ISSUED'
    end
    object ADO468CUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADO468SO_NO: TStringField
      FieldName = 'SO_NO'
      FixedChar = True
      Size = 12
    end
    object ADO468STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object ADO468PRINTIT: TStringField
      FieldName = 'PRINTIT'
      FixedChar = True
      Size = 1
    end
    object strngfldADO468control_name: TStringField
      FieldName = 'control_name'
      Size = 50
    end
    object strngfldADO468remark: TStringField
      FieldName = 'remark'
      Size = 500
    end
    object ADO468PRINTIT_S: TStringField
      FieldName = 'PRINTIT_S'
      ReadOnly = True
      Size = 8
    end
    object ADO468quan_alloc: TBCDField
      FieldName = 'quan_alloc'
      Precision = 9
      Size = 2
    end
    object ADO468overproof: TWordField
      FieldName = 'overproof'
    end
    object intgrfldADO468control_ptr: TIntegerField
      FieldName = 'control_ptr'
    end
    object intgrfldADO468supplier_ptr: TIntegerField
      FieldName = 'supplier_ptr'
    end
    object strngfldADO468ExReason: TStringField
      FieldName = 'ExReason'
      Size = 200
    end
    object strngfldADO468standards: TStringField
      FieldName = 'standards'
    end
    object intgrfldADO468wzcp0492_ptr: TIntegerField
      FieldName = 'wzcp0492_ptr'
    end
  end
  object ADO268_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey268'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     rkey, number, dept_ptr, DATE, EMPL_PTR, status, auth_' +
        'emplptr, auth_date, auth_ptr, reference, warehouse_ptr, Prted,'
      'allow_submit,control_ptr,cut_no,data0268.ismsgsended, ConfMan'
      'FROM         dbo.DATA0268  '
      'where rkey= :rkey268'
      ''
      '')
    Left = 128
    Top = 88
  end
  object ADO468_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey268'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     RKEY, CUT_NO, SO_NO, FLOW_NO, STEP, DEPT_PTR, INVENT_' +
        'PTR, QUAN_BOM, QUAN_ISSUED, STATUS, PRINTIT, VENDOR, Invent_or,q' +
        'uan_alloc,overproof'
      
        ',control_ptr,remark,supplier_ptr,data0468.ExReason,data0468.stan' +
        'dards, data0468.RUnit,data0468.wzcp0492_ptr'
      'FROM         dbo.Data0468'
      ' where flow_no=:rkey268')
    Left = 128
    Top = 152
  end
  object ADO17: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        '( SELECT     dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, db' +
        'o.Data0017.INV_PART_DESCRIPTION,  '
      
        '   SUM(dbo.Data0022.QUAN_ON_HAND) AS Qty, dbo.Data0002.UNIT_NAME' +
        ', dbo.Data0023.ABBR_NAME,  '
      
        ' d23_2.ABBR_NAME as '#21697#29260#20379#24212#21830',(case when d23_2.rkey is not null then' +
        '  d23_2.rkey else Data0023.rkey end ) as rkey23,'
      '  dbo.data0016.LOCATION ,'#39#26222#36890#24211#23384#39' AS XY,d15.abbr_name as '#24037#21378' '
      
        ' , (case when (d391.status=2) or (d391.status is null )  then '#39#26159 +
        #39'  else '#39#21542#39'  end )  as  '#39#26159#21542#21487#21457#26009#39' '
      '  FROM  dbo.Data0017 INNER JOIN  '
      
        ' dbo.Data0022 ON dbo.Data0017.RKEY = dbo.Data0022.INVENTORY_PTR ' +
        'INNER JOIN  '
      
        '  dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.' +
        'RKEY INNER JOIN '
      
        '  dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER' +
        ' JOIN '
      
        '   dbo.data0016 ON dbo.data0022.LOCATION_PTR = dbo.data0016.RKEY' +
        ' INNER JOIN '
      '  dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY '
      
        ' left join data0023 as d23_2 on Data0022.ORIG_ABBRNAME=d23_2.ABB' +
        'R_NAME  '
      
        ' inner join data0015 d15 on dbo.Data0456.warehouse_ptr=d15.rkey ' +
        ' '
      ' left join data0391 d391 on data0022.rkey391=d391.rkey '
      
        '  WHERE   dbo.Data0017.RKEY not in (0) AND (dbo.Data0022.QUAN_ON' +
        '_HAND > 0)  '
      '  GROUP BY dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, '
      
        '  dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0002.UNIT_NAME, dbo' +
        '.Data0023.ABBR_NAME,d23_2.ABBR_NAME,d23_2.rkey,  '
      
        '  dbo.data0016.LOCATION,Data0023.rkey,d15.abbr_name,d391.status ' +
        ')  '
      '  union all  '
      '  (    '
      
        '  SELECT     dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, db' +
        'o.Data0017.INV_PART_DESCRIPTION, '
      
        '  SUM(dbo.Data0134.QUAN_ON_HAND) AS Qty, dbo.Data0002.UNIT_NAME,' +
        'dbo.Data0023.ABBR_NAME, '
      
        ' d23_2.ABBR_NAME as '#21697#29260#20379#24212#21830',(case when d23_2.rkey is not null then' +
        '  d23_2.rkey else Data0023.rkey end ) as rkey23,'
      '  dbo.Data0016.LOCATION , '#39'VMI'#24211#23384#39' AS XY_1,d15.abbr_name   '
      
        ' , (case when (d391.status=2) or (d391.status is null )  then '#39#26159 +
        #39'  else '#39#21542#39'  end )  as  '#39#26159#21542#21487#21457#26009#39' '
      '  FROM   dbo.DATA0134 INNER JOIN '
      
        '  dbo.DATA0133 ON dbo.DATA0134.GRN_PTR = dbo.DATA0133.RKEY INNER' +
        ' JOIN '
      
        '  dbo.Data0017 ON dbo.DATA0134.INVENTORY_PTR = dbo.Data0017.RKEY' +
        ' INNER JOIN  '
      
        '   dbo.Data0016 ON dbo.DATA0134.LOCATION_PTR = dbo.Data0016.RKEY' +
        ' INNER JOIN '
      
        '  dbo.Data0002 ON dbo.DATA0134.UNIT_PTR = dbo.Data0002.RKEY INNE' +
        'R JOIN '
      '   dbo.Data0023 ON dbo.DATA0133.SUPP_PTR = dbo.Data0023.RKEY   '
      
        ' left join data0023 as d23_2 on Data0134.ORIG_ABBRNAME=d23_2.ABB' +
        'R_NAME  '
      
        '  INNER JOIN  dbo.Data0001 ON dbo.DATA0133.currency_ptr = dbo.Da' +
        'ta0001.RKEY  '
      
        ' inner join data0015 d15 on dbo.Data0133.warehouse_ptr=d15.rkey ' +
        ' '
      ' left join data0391 d391 on DATA0134.rkey391=d391.rkey '
      
        '  WHERE   dbo.Data0017.RKEY not in (0) AND (dbo.Data0134.QUAN_ON' +
        '_HAND > 0) '
      '  GROUP BY dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER,    '
      
        '  dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0002.UNIT_NAME, dbo' +
        '.Data0023.ABBR_NAME,d23_2.ABBR_NAME,d23_2.rkey,   '
      
        '  dbo.data0016.LOCATION,Data0023.rkey,d15.abbr_name,d391.status ' +
        ' )    '
      '  ORDER BY    data0017.INV_PART_NUMBER  '
      ' ')
    Left = 16
    Top = 224
    object ADO17RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO17INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      ReadOnly = True
      Size = 25
    end
    object ADO17INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ADO17Qty: TBCDField
      FieldName = 'Qty'
      ReadOnly = True
      Precision = 32
    end
    object ADO17UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
      ReadOnly = True
    end
    object ADO17ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      ReadOnly = True
      Size = 16
    end
    object ADO17LOCATION: TStringField
      FieldName = 'LOCATION'
      ReadOnly = True
    end
    object ADO17XY: TStringField
      FieldName = 'XY'
      ReadOnly = True
      Size = 8
    end
    object intgrfldADO17rkey23: TIntegerField
      FieldName = 'rkey23'
      ReadOnly = True
    end
    object strngfldADO17DSDesigner: TStringField
      FieldName = #24037#21378
      ReadOnly = True
      Size = 10
    end
    object ADO17DSDesigner: TStringField
      FieldName = #26159#21542#21487#21457#26009
      ReadOnly = True
      Size = 2
    end
    object strngfldADO17DSDesigner2: TStringField
      FieldName = #21697#29260#20379#24212#21830
      ReadOnly = True
      Size = 16
    end
  end
  object tmp1: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 216
    Top = 80
  end
  object ADO368: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey268'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Data0073.user_login_name USER_ID,Data0073.USER_FULL_NAME,' +
        'data0368.user_ptr,'
      
        '                      data0368.auth_date,data0368.ranking,data03' +
        '68.auth_flag FROM dbo.Data0073 INNER JOIN dbo.data0368 '
      
        '                     ON dbo.Data0073.RKEY = dbo.data0368.user_pt' +
        'r '
      '                     WHERE dbo.data0368.apply_ptr=:rkey268'
      '                      order by dbo.data0368.ranking')
    Left = 72
    Top = 288
    object ADO368USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADO368USER_ID: TStringField
      FieldName = 'USER_ID'
      Size = 15
    end
    object ADO368user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADO368auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object ADO368ranking: TWordField
      FieldName = 'ranking'
    end
    object ADO368auth_flag: TStringField
      FieldName = 'auth_flag'
      FixedChar = True
      Size = 1
    end
  end
  object DS3: TDataSource
    DataSet = ADO368
    Left = 24
    Top = 288
  end
  object tmp2: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 216
    Top = 128
  end
  object tmp3: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 216
    Top = 184
  end
  object ADO137: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Parameters = <>
    Left = 216
    Top = 248
  end
  object ADO192: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select ppc_control3 from data0192')
    Left = 216
    Top = 296
    object ADO192ppc_control3: TWordField
      FieldName = 'ppc_control3'
    end
  end
  object sms1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 320
    Top = 32
  end
  object ds14: TDataSource
    DataSet = ADO14
    Left = 272
    Top = 104
  end
  object ADO14: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT     rkey, MESSAGE, senddate, whosend'
      'FROM         dbo.Data0014')
    Left = 312
    Top = 104
    object ADO14rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO14MESSAGE: TStringField
      FieldName = 'MESSAGE'
      Size = 2000
    end
    object ADO14senddate: TDateTimeField
      FieldName = 'senddate'
    end
    object ADO14whosend: TIntegerField
      FieldName = 'whosend'
    end
  end
  object ADO14_1: TADOQuery
    Connection = ADOCon
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'SELECT     rkey, MESSAGE, senddate, whosend'
      'FROM         dbo.Data0014'
      'where rkey = 0')
    Left = 376
    Top = 96
  end
  object sms_ToWhom: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 312
    Top = 224
  end
  object ds314: TDataSource
    DataSet = ADO314
    Left = 272
    Top = 160
  end
  object ADO314: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT     rkey, emp_ptr, d14_ptr, hread, deleted, if_note'
      'FROM         dbo.data0314')
    Left = 320
    Top = 160
    object AutoIncField1: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object StringField1: TStringField
      FieldName = 'MESSAGE'
      Size = 2000
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'senddate'
    end
    object IntegerField1: TIntegerField
      FieldName = 'whosend'
    end
  end
  object ADO314_1: TADOQuery
    Connection = ADOCon
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'SELECT     rkey, emp_ptr, d14_ptr, hread, deleted, if_note'
      'FROM         dbo.data0314'
      'where rkey = 0')
    Left = 384
    Top = 160
  end
  object ADOVMI: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
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
    SQL.Strings = (
      
        'SELECT     dbo.DATA0268.rkey, dbo.DATA0268.number AS '#39046#26009#21333#21495', dbo.D' +
        'ata0005.EMPLOYEE_NAME AS '#30003#39046#20154#21592', dbo.Data0034.DEPT_NAME AS '#37096#38376', '
      
        '                      dbo.Data0017.INV_PART_NUMBER AS '#26448#26009#32534#30721', dbo.' +
        'Data0017.INV_NAME AS '#26448#26009#21517#31216', dbo.Data0017.INV_DESCRIPTION AS '#26448#26009#35268#26684',' +
        ' '
      
        '                      dbo.Data0468.VENDOR AS '#20379#24212#21830', dbo.Data0002.U' +
        'NIT_NAME AS '#21333#20301', dbo.Data0468.QUAN_BOM AS '#30003#39046#25968#37327', '
      
        '                      dbo.Data0468.QUAN_ISSUED AS '#24050#21457#25918#25968#37327', dbo.DAT' +
        'A0268.DATE AS '#30003#39046#26085#26399', dbo.DATA0268.DATE, dbo.DATA0268.reference AS' +
        ' '#22791#27880', '
      
        '                      dbo.Data0015.WAREHOUSE_CODE AS '#24037#21378#20195#30721', dbo.D' +
        'ata0015.ABBR_NAME AS '#24037#21378#31616#31216
      'FROM         dbo.Data0468 INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.Data0468.INVENT_PTR = ' +
        'dbo.Data0017.RKEY INNER JOIN'
      
        '                      dbo.DATA0268 ON dbo.Data0468.FLOW_NO = dbo' +
        '.DATA0268.rkey INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PT' +
        'R = dbo.Data0002.RKEY INNER JOIN'
      
        '                      dbo.Data0034 ON dbo.DATA0268.dept_ptr = db' +
        'o.Data0034.RKEY INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.DATA0268.EMPL_PTR = db' +
        'o.Data0005.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.DATA0268.warehouse_ptr' +
        ' = dbo.Data0015.RKEY'
      
        'WHERE  ---   (dbo.DATA0268.status = 2) AND (dbo.Data0468.STATUS ' +
        '= 0) AND'
      ' data0268.ttype in (0,1) and'
      '(dbo.DATA0268.DATE >= :dtpk1) AND (dbo.DATA0268.DATE <= :dtpk2)'
      '')
    Left = 96
    Top = 224
    object ADOVMIDSDesigner: TStringField
      FieldName = #39046#26009#21333#21495
      Size = 10
    end
    object ADOVMIDSDesigner2: TStringField
      FieldName = #30003#39046#20154#21592
      Size = 16
    end
    object ADOVMIDSDesigner3: TStringField
      FieldName = #37096#38376
      Size = 30
    end
    object ADOVMIDSDesigner4: TStringField
      FieldName = #26448#26009#32534#30721
      Size = 25
    end
    object ADOVMIDSDesigner5: TStringField
      FieldName = #26448#26009#21517#31216
      Size = 30
    end
    object ADOVMIDSDesigner6: TStringField
      FieldName = #26448#26009#35268#26684
      Size = 70
    end
    object ADOVMIDSDesigner7: TStringField
      FieldName = #20379#24212#21830
      Size = 15
    end
    object ADOVMIDSDesigner8: TStringField
      FieldName = #21333#20301
    end
    object ADOVMIDSDesigner9: TFloatField
      FieldName = #30003#39046#25968#37327
    end
    object ADOVMIDSDesigner10: TFloatField
      FieldName = #24050#21457#25918#25968#37327
    end
    object ADOVMIDSDesigner11: TDateTimeField
      FieldName = #30003#39046#26085#26399
    end
    object ADOVMIDSDesigner12: TStringField
      FieldName = #22791#27880
      Size = 100
    end
    object ADOVMIrkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOVMIDATE: TDateTimeField
      FieldName = 'DATE'
    end
    object ADOVMIDSDesigner13: TStringField
      FieldName = #24037#21378#20195#30721
      Size = 5
    end
    object ADOVMIDSDesigner14: TStringField
      FieldName = #24037#21378#31616#31216
      Size = 70
    end
  end
  object DS4: TDataSource
    DataSet = ADOVMI
    Left = 144
    Top = 224
  end
  object ADO155_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey017'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.DATA0155.control_ptr, dbo.DATA0155.invt_ptr, dbo.' +
        'Data0017.INV_NAME, dbo.Data0002.UNIT_NAME,dbo.Data0002.RKEY AS R' +
        'key02,'
      '                dbo.Data0017.INV_PART_NUMBER'
      'FROM         dbo.DATA0155 INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.DATA0155.invt_ptr = db' +
        'o.Data0017.RKEY INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.Data0017.PURCH_UNIT_PT' +
        'R = dbo.Data0002.RKEY AND dbo.Data0017.STOCK_UNIT_PTR = dbo.Data' +
        '0002.RKEY'
      'WHERE control_ptr= :rkey017')
    Left = 456
    Top = 36
    object ADO155_1control_ptr: TIntegerField
      FieldName = 'control_ptr'
    end
    object ADO155_1invt_ptr: TIntegerField
      FieldName = 'invt_ptr'
    end
    object ADO155_1INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADO155_1UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ADO155_1INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO155_1Rkey02: TAutoIncField
      FieldName = 'Rkey02'
      ReadOnly = True
    end
  end
  object ADO154_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey034'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.DATA0154.control_ptr, dbo.DATA0154.dept_ptr, dbo.' +
        'Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME'
      'FROM         dbo.DATA0154 INNER JOIN'
      
        '                      dbo.Data0034 ON dbo.DATA0154.dept_ptr = db' +
        'o.Data0034.RKEY'
      'WHERE control_ptr= :rkey034')
    Left = 528
    Top = 36
    object ADO154_1control_ptr: TIntegerField
      FieldName = 'control_ptr'
    end
    object ADO154_1dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ADO154_1DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADO154_1DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
  end
  object DataSource2: TDataSource
    DataSet = ADO154_1
    Left = 532
    Top = 91
  end
  object DataSource3: TDataSource
    DataSet = ADO155_1
    Left = 460
    Top = 91
  end
  object ADO136: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    AfterScroll = ADO136AfterScroll
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     dbo.DATA0136.rkey, dbo.Data0015.WAREHOUSE_NAME, dbo.D' +
        'ata0015.WAREHOUSE_CODE, dbo.Data0015.ABBR_NAME, dbo.DATA0136.sta' +
        'n_consume, '
      
        '                      dbo.DATA0136.warehouse_ptr, dbo.DATA0136.c' +
        'ontrol_name, dbo.DATA0136.unit_ptr, dbo.DATA0136.group_id, dbo.D' +
        'ATA0136.Important_mtl, '
      
        '                      dbo.DATA0136.Prod_Area_Type, dbo.DATA0136.' +
        'Depletion, dbo.DATA0136.Plating, dbo.DATA0136.Depth, dbo.DATA013' +
        '6.Density, dbo.DATA0136.Formula, '
      
        '                      dbo.DATA0136.Formula_Result, dbo.DATA0136.' +
        'Mtl_Type'
      'FROM         dbo.Data0015 INNER JOIN'
      
        '                      dbo.DATA0136 ON dbo.Data0015.RKEY = dbo.DA' +
        'TA0136.warehouse_ptr'
      'WHERE     (1 = 1)')
    Left = 462
    Top = 160
    object ADO136rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO136warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ADO136WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADO136WAREHOUSE_NAME: TStringField
      DisplayLabel = #24037#21378#21517#31216
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object ADO136ABBR_NAME: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADO136stan_consume: TBCDField
      DisplayLabel = #26631#20934#20135#20986'('#13217')'
      FieldName = 'stan_consume'
      Precision = 8
      Size = 2
    end
    object ADO136control_name: TStringField
      FieldName = 'control_name'
      Size = 50
    end
    object ADO136unit_ptr: TIntegerField
      FieldName = 'unit_ptr'
    end
    object ADO136group_id: TWordField
      FieldName = 'group_id'
    end
    object ADO136Important_mtl: TWordField
      FieldName = 'Important_mtl'
    end
    object ADO136Prod_Area_Type: TWordField
      FieldName = 'Prod_Area_Type'
    end
    object ADO136Depletion: TFloatField
      FieldName = 'Depletion'
    end
    object ADO136Plating: TFloatField
      FieldName = 'Plating'
    end
    object ADO136Depth: TFloatField
      FieldName = 'Depth'
    end
    object ADO136Density: TFloatField
      FieldName = 'Density'
    end
    object ADO136Formula: TStringField
      FieldName = 'Formula'
      Size = 200
    end
    object ADO136Formula_Result: TFloatField
      FieldName = 'Formula_Result'
    end
    object ADO136Mtl_Type: TWordField
      FieldName = 'Mtl_Type'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO136
    Left = 532
    Top = 155
  end
  object adsKZXM: TADODataSet
    Connection = ADOCon
    CursorType = ctStatic
    CommandText = 
      'SELECT     DATA0136.control_name, DATA0136.rkey'#13#10'FROM         DA' +
      'TA0154 INNER JOIN'#13#10'                      DATA0155 ON DATA0154.co' +
      'ntrol_ptr = DATA0155.control_ptr INNER JOIN'#13#10'                   ' +
      '   DATA0136 ON DATA0154.control_ptr = DATA0136.rkey AND DATA0155' +
      '.control_ptr = DATA0136.rkey INNER JOIN'#13#10'                      D' +
      'ata0015 ON DATA0136.warehouse_ptr = Data0015.RKEY INNER JOIN'#13#10'  ' +
      '                    Data0017 ON DATA0155.invt_ptr = Data0017.RKE' +
      'Y '#13#10'WHERE     (DATA0155.invt_ptr  = :PRKey17) AND (Data0015.RKEY' +
      ' = :PRKey15) AND (DATA0154.dept_ptr = :PRKey34)'#13#10'GROUP BY DATA01' +
      '36.control_name, DATA0136.rkey'
    Parameters = <
      item
        Name = 'PRKey17'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'PRKey15'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'PRKey34'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 672
    Top = 112
  end
  object qrytmp: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 424
    Top = 296
  end
  object ADOProc_PreM: TADOStoredProc
    Connection = ADOCon
    CursorType = ctStatic
    ProcedureName = 'proc_PreciousMetalConsumption'
    Parameters = <
      item
        Name = '@startDate'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@endDate'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@rkey136'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 520
    Top = 288
    object ADOProc_PreMcal_value: TFloatField
      FieldName = 'cal_value'
      ReadOnly = True
    end
  end
  object Important_Metal: TADOQuery
    Connection = ADOCon
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Important_Metal.Rkey, dbo.Important_Metal.Corolla' +
        'ry_Result, dbo.Important_Metal.UNIT_NAME468, dbo.Important_Metal' +
        '.QUAN_BOM468, '
      
        '                dbo.Important_Metal.Calc_Result, dbo.Important_M' +
        'etal.Record_Time, dbo.Important_Metal.SMS, dbo.Data0034.DEPT_COD' +
        'E, '
      
        '                      dbo.Data0034.DEPT_NAME, dbo.DATA0268.numbe' +
        'r, dbo.DATA0136.control_name'
      'FROM         dbo.Important_Metal INNER JOIN'
      
        '                      dbo.DATA0268 ON dbo.Important_Metal.Ptr268' +
        ' = dbo.DATA0268.rkey INNER JOIN'
      
        '                      dbo.Data0034 ON dbo.Important_Metal.Dept_P' +
        'tr = dbo.Data0034.RKEY INNER JOIN'
      
        '                      dbo.DATA0136 ON dbo.Important_Metal.Contro' +
        'l_Ptr = dbo.DATA0136.rkey'
      'where '
      
        '(dbo.Important_Metal.Record_Time >= :dtpk1) AND ( dbo.Important_' +
        'Metal.Record_Time<= :dtpk2)')
    Left = 192
    Top = 360
    object Important_MetalRkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object Important_MetalCorollary_Result: TFloatField
      FieldName = 'Corollary_Result'
    end
    object Important_MetalUNIT_NAME468: TIntegerField
      FieldName = 'UNIT_NAME468'
    end
    object Important_MetalQUAN_BOM468: TFloatField
      FieldName = 'QUAN_BOM468'
    end
    object Important_MetalCalc_Result: TFloatField
      FieldName = 'Calc_Result'
    end
    object Important_MetalRecord_Time: TDateTimeField
      FieldName = 'Record_Time'
    end
    object Important_MetalDEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object Important_MetalDEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object Important_Metalnumber: TStringField
      FieldName = 'number'
      Size = 10
    end
    object Important_Metalcontrol_name: TStringField
      FieldName = 'control_name'
      Size = 50
    end
  end
  object DataSource4: TDataSource
    DataSet = Important_Metal
    Left = 108
    Top = 363
  end
  object IM_Tmp: TADOQuery
    Connection = ADOCon
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     Rkey, Corollary_Result, UNIT_NAME468, QUAN_BOM468, Ca' +
        'lc_Result, Record_Time, SMS, Ptr268, Dept_Ptr, Control_Ptr'
      'FROM         dbo.Important_Metal')
    Left = 264
    Top = 360
    object IM_TmpRkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object IM_TmpCorollary_Result: TFloatField
      FieldName = 'Corollary_Result'
    end
    object IM_TmpUNIT_NAME468: TIntegerField
      FieldName = 'UNIT_NAME468'
    end
    object IM_TmpQUAN_BOM468: TFloatField
      FieldName = 'QUAN_BOM468'
    end
    object IM_TmpCalc_Result: TFloatField
      FieldName = 'Calc_Result'
    end
    object IM_TmpRecord_Time: TDateTimeField
      FieldName = 'Record_Time'
    end
    object IM_TmpSMS: TStringField
      FieldName = 'SMS'
      Size = 500
    end
    object IM_TmpPtr268: TIntegerField
      FieldName = 'Ptr268'
    end
    object IM_TmpDept_Ptr: TIntegerField
      FieldName = 'Dept_Ptr'
    end
    object IM_TmpControl_Ptr: TIntegerField
      FieldName = 'Control_Ptr'
    end
  end
  object tmp4: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 424
    Top = 240
  end
  object qry_temp: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 560
    Top = 376
  end
  object qry_temp2: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 632
    Top = 376
  end
  object sp1: TADOStoredProc
    Connection = ADOCon
    ProcedureName = 'sp_GetEveryQty'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@CType'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4
        Value = Null
      end
      item
        Name = '@warehouse_ptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@control_ptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@cost_ptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ReqDate'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@NowQty'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@AllQty'
        Attributes = [paNullable]
        DataType = ftFloat
        Direction = pdInputOutput
        Precision = 15
        Value = Null
      end
      item
        Name = '@GetQty'
        Attributes = [paNullable]
        DataType = ftFloat
        Direction = pdInputOutput
        Precision = 15
        Value = Null
      end
      item
        Name = '@QCQty'
        Attributes = [paNullable]
        DataType = ftFloat
        Direction = pdInputOutput
        Precision = 15
        Value = Null
      end
      item
        Name = '@smessage'
        Attributes = [paNullable]
        DataType = ftString
        Direction = pdInputOutput
        Size = 500
        Value = Null
      end>
    Left = 680
    Top = 24
  end
  object qry_temp3: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 720
    Top = 376
  end
  object qry_temp22: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 632
    Top = 376
  end
  object qry_temp33: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 680
    Top = 328
  end
  object qry_WZCP492: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterScroll = qry_WZCP492AfterScroll
    Parameters = <
      item
        Name = 'rkey492'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'declare @TempTable table(sel bit,vendor2 varchar(20),rkey23 int)' +
        '      '
      '  insert @TempTable'
      '  values (0,'#39#39',0) '
      
        'SELECT  a.Sel,d17.QUAN_ON_HAND,d17.QUAN_ON_HAND-d17.QUAN_ASSIGN ' +
        ' as QUAN_ON_HAND  ,cp492.QUAN_ASSIGN,cp492.STD_QTY, cp492.App_QT' +
        'Y, cp492.Con_QTY, '
      ''
      
        'case  when  isNull(cp492.STD_QTY,0)-isnull(cp492.App_QTY,0)>0 th' +
        'en '
      '(case  when  cp492.QUAN_ASSIGN>0  then cp492.QUAN_ASSIGN else '
      
        '( case when d17.QUAN_ON_HAND-d17.QUAN_ASSIGN>isNull(cp492.STD_QT' +
        'Y,0)-isnull(cp492.App_QTY,0) then isNull(cp492.STD_QTY,0)-isnull' +
        '(cp492.App_QTY,0)'
      
        'else d17.QUAN_ON_HAND-d17.QUAN_ASSIGN end ) end )  else 0  end  ' +
        'as dQUAN_BOM,a.rkey23  AS  dQUAN_BOM2,'
      ''
      ' cp492.D492_ptr,'
      
        'cp492.D017_ptr, d17.INV_PART_NUMBER, d17.INV_DESCRIPTION, d17.IN' +
        'V_NAME,d17.Rkey  as Rkey17, '
      
        'd492.CUT_NO, d492.SO_NO, d492.PLANNED_QTY,d492.ISSUED_QTY, d492.' +
        'FG_QTY,cp492.Rkey,'
      'd492.TSTATUS, data0002.unit_name'
      'FROM  dbo.wzcp0492 cp492'
      'INNER JOIN      dbo.data0492 d492 ON cp492.D492_ptr = d492.rkey '
      'INNER JOIN       dbo.Data0017 d17 ON cp492.D017_ptr=d17.rkey'
      
        'INNER join      dbo.data0002 on d17.STOCK_UNIT_PTR=dbo.data0002.' +
        'rkey'
      'join @TempTable a  on 1=1'
      'where d492.rkey= :rkey492')
    Left = 344
    Top = 384
    object qry_WZCP492Sel: TBooleanField
      FieldName = 'Sel'
    end
    object qry_WZCP492QUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      Precision = 19
    end
    object qry_WZCP492QUAN_ON_HAND_1: TBCDField
      FieldName = 'QUAN_ON_HAND_1'
      ReadOnly = True
      Precision = 20
    end
    object qry_WZCP492QUAN_ASSIGN: TBCDField
      FieldName = 'QUAN_ASSIGN'
      Precision = 12
    end
    object qry_WZCP492STD_QTY: TBCDField
      FieldName = 'STD_QTY'
      Precision = 12
    end
    object qry_WZCP492App_QTY: TBCDField
      FieldName = 'App_QTY'
      Precision = 12
    end
    object qry_WZCP492Con_QTY: TBCDField
      FieldName = 'Con_QTY'
      Precision = 12
    end
    object qry_WZCP492dQUAN_BOM: TBCDField
      FieldName = 'dQUAN_BOM'
      Precision = 20
    end
    object intgrfld_WZCP492D492_ptr: TIntegerField
      FieldName = 'D492_ptr'
    end
    object intgrfld_WZCP492D017_ptr: TIntegerField
      FieldName = 'D017_ptr'
    end
    object strngfld_WZCP492INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object strngfld_WZCP492INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object strngfld_WZCP492INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object atncfld_WZCP492Rkey17: TAutoIncField
      FieldName = 'Rkey17'
      ReadOnly = True
    end
    object strngfld_WZCP492CUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object strngfld_WZCP492SO_NO: TStringField
      FieldName = 'SO_NO'
      FixedChar = True
      Size = 12
    end
    object intgrfld_WZCP492PLANNED_QTY: TIntegerField
      FieldName = 'PLANNED_QTY'
    end
    object intgrfld_WZCP492ISSUED_QTY: TIntegerField
      FieldName = 'ISSUED_QTY'
    end
    object intgrfld_WZCP492FG_QTY: TIntegerField
      FieldName = 'FG_QTY'
    end
    object atncfld_WZCP492Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object wrdfld_WZCP492TSTATUS: TWordField
      FieldName = 'TSTATUS'
    end
    object strngfld_WZCP492unit_name: TStringField
      FieldName = 'unit_name'
    end
    object intgrfld_WZCP492dQUAN_BOM2: TIntegerField
      FieldName = 'dQUAN_BOM2'
    end
  end
  object ds_WZCP492: TDataSource
    DataSet = qry_WZCP492
    Left = 440
    Top = 392
  end
end
