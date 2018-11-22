object DM: TDM
  OldCreateOrder = False
  Left = 475
  Top = 96
  Height = 496
  Width = 782
  object ADOCon: TADOConnection
    ConnectionTimeout = 0
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
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
    OnDataChange = DS1DataChange
    Left = 14
    Top = 90
  end
  object DS2: TDataSource
    DataSet = ADO468
    Left = 17
    Top = 154
  end
  object ADO268: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    BeforeOpen = ADO268BeforeOpen
    Parameters = <
      item
        Name = 'uptr1'
        Size = -1
        Value = Null
      end
      item
        Name = 'uptr2'
        Size = -1
        Value = Null
      end
      item
        Name = 'uptr3'
        Size = -1
        Value = Null
      end
      item
        Name = 'uptr4'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.DATA0268.rkey, case when data0008.if_control=1 th' +
        'en  case when csi_ptr= :uptr1 then dbo.DATA0268.number else '#39'***' +
        '****'#39' end else dbo.DATA0268.number end as number,'
      
        '           dbo.DATA0268.dept_ptr, dbo.DATA0268.DATE, dbo.DATA026' +
        '8.EMPL_PTR, dbo.DATA0268.status, '
      
        '                      dbo.DATA0268.auth_emplptr, dbo.DATA0268.au' +
        'th_date, dbo.DATA0268.reference, dbo.Data0034.DEPT_CODE, dbo.Dat' +
        'a0034.DEPT_NAME, '
      
        '                     dbo.Data0005.rkey rkey05, dbo.Data0005.EMPL' +
        '_CODE, dbo.Data0005.EMPLOYEE_NAME AS abbr_name, '
      
        '                      CASE WHEN data0268.status = 0 THEN '#39#24453#25552#20132#39' W' +
        'HEN data0268.status = 1 THEN '#39#24453#23457#26680#39' WHEN data0268.status = 2 THEN' +
        ' '#39#24050#23457#26680#39' WHEN data0268.status'
      
        '                       = 3 THEN '#39#34987#36864#22238#39' WHEN data0268.status = 4 T' +
        'HEN '#39#24050#21457#26009#39' END AS status_c, '
      
        '                      dbo.Data0015.ABBR_NAME AS fac_name, dbo.DA' +
        'TA0268.warehouse_ptr, '
      
        '                      case when data0008.if_control=1 then  case' +
        ' when csi_ptr= :uptr2 then data0268.cut_no else '#39'*******'#39' end el' +
        'se data0268.cut_no end as cut_no,'
      
        '                      dbo.DATA0268.Prted,data0492.bom_ptr,data04' +
        '92.ISSUED_QTY,data0008.prod_code,data0008.product_name,data0492.' +
        'Rkey as Rkey492,'
      
        '                      case dbo.DATA0268.Prted when 0 then '#39#21542#39' wh' +
        'en 1 then '#39#26159#39' end as Prted_T,data0268.user_name,'
      
        '                      case when data0008.if_control=1 then  case' +
        ' when csi_ptr= :uptr3 then 0 else 1 end else 0 end as if_control'
      'FROM         dbo.DATA0268 INNER JOIN'
      
        '                      dbo.Data0034 ON dbo.DATA0268.dept_ptr = db' +
        'o.Data0034.RKEY  INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.DATA0268.EMPL_PTR = db' +
        'o.Data0005.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.DATA0268.warehouse_ptr' +
        ' = dbo.Data0015.RKEY inner join '
      
        '                    data0492 on data0268.cut_no=data0492.cut_no ' +
        'inner join data0008 on data0492.bom_ptr=data0008.rkey left join'
      
        '                                                (SELECT     CSI_' +
        'PTR, PROC_PTR'
      '                            FROM          dbo.WZCP0100'
      
        '                            WHERE      (CSI_PTR = :uptr4 )) AS c' +
        'p100 on dbo.Data0008.RKEY = cp100.proc_ptr            '
      'where data0268.ttype=1'
      '')
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
    object ADO268status_c: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'status_c'
      ReadOnly = True
      Size = 6
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
    object ADO268cut_no: TStringField
      DisplayLabel = #29983#20135#21333#21495
      FieldName = 'cut_no'
      FixedChar = True
      Size = 12
    end
    object ADO268bom_ptr: TIntegerField
      FieldName = 'bom_ptr'
    end
    object ADO268prod_code: TStringField
      FieldName = 'prod_code'
      Size = 10
    end
    object ADO268product_name: TStringField
      FieldName = 'product_name'
      Size = 30
    end
    object ADO268ISSUED_QTY: TIntegerField
      FieldName = 'ISSUED_QTY'
    end
    object ADO268auth_emplptr: TIntegerField
      FieldName = 'auth_emplptr'
    end
    object ADO268auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object ADO268rkey05: TAutoIncField
      FieldName = 'rkey05'
      ReadOnly = True
    end
    object ADO268Rkey492: TAutoIncField
      FieldName = 'Rkey492'
      ReadOnly = True
    end
    object ADO268Prted_T: TStringField
      FieldName = 'Prted_T'
      ReadOnly = True
      Size = 2
    end
    object ADO268user_name: TStringField
      FieldName = 'user_name'
      Size = 50
    end
    object ADO268if_control: TIntegerField
      FieldName = 'if_control'
    end
  end
  object ADO468: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey268_0'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 1
      end>
    SQL.Strings = (
      
        'SELECT      dbo.Data0468.RKEY, dbo.Data0468.CUT_NO, dbo.Data0468' +
        '.SO_NO, dbo.Data0468.FLOW_NO, '
      
        'dbo.Data0468.STEP, dbo.Data0468.DEPT_PTR, dbo.Data0468.INVENT_PT' +
        'R, dbo.Data0468.QUAN_BOM, '
      
        'dbo.Data0468.QUAN_ISSUED, dbo.Data0468.STATUS, dbo.Data0468.PRIN' +
        'TIT, dbo.Data0468.VENDOR, '
      
        'dbo.Data0468.Invent_or,dbo.Data0468.quan_alloc,dbo.Data0468.over' +
        'proof, data0468.bom_list_ptr,dbo.Data0017.INV_PART_NUMBER, dbo.D' +
        'ata0017.INV_name,dbo.Data0017.INV_DESCRIPTION,'
      
        'data0002.unit_name,'#39#26448#26009#39' Tp, data0017.QUAN_ON_HAND,data0468.wzcp0' +
        '492_ptr,wzcp0495.rkey as wzcp495Rkey'
      ',data0017.rkey rkey17, dbo.wzcp0494.part_name'
      'FROM         dbo.Data0468 INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.Data0468.INVENT_PTR = ' +
        'dbo.Data0017.RKEY'
      '    inner join data0002 on data0017.STOCK_UNIT_PTR=data0002.rkey'
      '    left join wzcp0492 on data0468.wzcp0492_ptr=wzcp0492.rkey'
      '    left join wzcp0495 on wzcp0492.wzcp0495_ptr=wzcp0495.rkey'
      '    left join wzcp0494 on wzcp0495.PARTBOM_PTR=wzcp0494.rkey'
      ' '
      'where Data0468.invent_or=0 and  dbo.DATA0468.flow_no=:rkey268_0')
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
      DisplayLabel = #20379#24212#21830'/'#22791#27880
      DisplayWidth = 60
      FieldName = 'VENDOR'
      Size = 60
    end
    object ADO468Invent_or: TSmallintField
      FieldName = 'Invent_or'
    end
    object ADO468INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO468INV_name: TStringField
      DisplayLabel = #29289#26009#21517#31216
      FieldName = 'INV_name'
      ReadOnly = True
      Size = 30
    end
    object ADO468INV_DESCRIPTION: TStringField
      DisplayLabel = #29289#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      ReadOnly = True
      Size = 200
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
    object ADO468overproof: TWordField
      FieldName = 'overproof'
    end
    object ADO468quan_alloc: TBCDField
      FieldName = 'quan_alloc'
      Precision = 9
      Size = 2
    end
    object ADO468Tp: TStringField
      DisplayLabel = #31867#21035
      FieldName = 'Tp'
      ReadOnly = True
      Size = 6
    end
    object ADO468bom_list_ptr: TIntegerField
      FieldName = 'bom_list_ptr'
      ReadOnly = True
    end
    object ADO468rkey17: TAutoIncField
      FieldName = 'rkey17'
      ReadOnly = True
    end
    object ADO468QUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      Precision = 19
    end
    object ADO468part_name: TStringField
      FieldName = 'part_name'
    end
    object ADO468wzcp0492_ptr: TIntegerField
      FieldName = 'wzcp0492_ptr'
    end
    object ADO468wzcp495Rkey: TAutoIncField
      FieldName = 'wzcp495Rkey'
      ReadOnly = True
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
      'SELECT    *'
      'FROM         dbo.DATA0268  '
      'where rkey=:rkey268')
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
      'SELECT     *  FROM    dbo.Data0468  where flow_no=:rkey268'
      ''
      '')
    Left = 128
    Top = 152
  end
  object ADO17: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey140_1'
        DataType = ftString
        Size = 1
        Value = '1'
      end
      item
        Name = 'rkey140_1'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT cast(0 as bit) Sel, data0148.* ,  data0148.quan_bom*1 Tot' +
        'alQty ,data0140.part_name,data0005.employee_name,'
      
        '     '#39#26448#26009#39' invent_tp, cast(0 as numeric(15,2)) Qty ,cast('#39#39' as va' +
        'rchar(30)) remark, cast(0 as bit) TD,  '
      
        '          d17_0.inv_part_number,d17_0.inv_name,d17_0.INV_DESCRIP' +
        'TION,(d17_0.QUAN_ON_HAND-d17_0.QUAN_ASSIGN) valQty,'
      
        '          d17_1.inv_part_number inv_part_number_r ,d17_1.inv_nam' +
        'e inv_name_r,d17_1.INV_DESCRIPTION INV_DESCRIPTION_r,d02.unit_na' +
        'me,(d17_1.QUAN_ON_HAND-d17_1.QUAN_ASSIGN) valQty_r'
      
        '          FROM data0140 inner join DATA0148 on data0140.rkey=dat' +
        'a0148.part_ptr  inner join '
      '          data0005 on data0140.user_ptr=data0005.rkey inner join'
      
        '               data0017 d17_0 on data0148.invent_ptr=d17_0.rkey ' +
        'inner join data0002 d02 on d17_0.STOCK_UNIT_PTR=d02.rkey'
      
        '                         left join data0017 d17_1 on data0148.re' +
        'pl_invt_ptr=d17_1.rkey'
      
        '         WHERE   data0140.status=1 and   (dbo.DATA0148.Invent_or' +
        ' = 1) and dbo.DATA0140.PART_PTR=:rkey140_1'
      ''
      '          union all'
      ''
      
        'SELECT cast(0 as bit) Sel,dbo.wzcp0492.STD_QTY, dbo.wzcp0492.App' +
        '_QTY, dbo.wzcp0492.Con_QTY, '
      
        'dbo.wzcp0492.QUAN_ASSIGN, dbo.wzcp0492.D492_ptr,dbo.wzcp0492.D14' +
        '8_PTR,'
      
        'dbo.wzcp0492.D017_ptr, d17_1.INV_PART_NUMBER, d17_1.INV_DESCRIPT' +
        'ION, d17_1.INV_NAME, dbo.data0140.part_name,'
      
        'dbo.data0492.CUT_NO, dbo.data0492.SO_NO, dbo.data0492.PLANNED_QT' +
        'Y, dbo.data0492.ISSUED_QTY, dbo.data0492.FG_QTY,'
      'dbo.data0492.TSTATUS,d17_1.QUAN_ON_HAND,data0002.unit_name,'
      
        'isNull(dbo.wzcp0492.STD_QTY,0)-isnull(dbo.wzcp0492.App_QTY,0) as' +
        ' dQUAN_BOM,'#39#39' as vendor '
      'FROM  dbo.wzcp0492 INNER JOIN'
      
        '      dbo.data0492 ON dbo.wzcp0492.D492_ptr = dbo.data0492.rkey ' +
        'left join'
      
        '      dbo.data0148 on dbo.wzcp0492.D148_PTR=dbo.data0148.Rkey in' +
        'ner join'
      
        '      dbo.data0140 on dbo.data0148.PART_PTR=dbo.data0140.Rkey le' +
        'ft JOIN'
      
        '      data0017 d17_1 on data0148.repl_invt_ptr=d17_1.rkey inner ' +
        'join'
      '      dbo.data0002 on d17_1.STOCK_UNIT_PTR=dbo.data0002.rkey '
      'where dbo.wzcp0492.D492_ptr=:rkey140_1'
      ''
      '          order by data0140.part_name,d17_0.inv_part_number')
    Left = 18
    Top = 224
    object ADO17Sel: TBooleanField
      DisplayLabel = #36873#25321
      FieldName = 'Sel'
      ProviderFlags = [pfInWhere]
    end
    object ADO17INV_PART_NUMBER: TStringField
      DisplayLabel = #29289#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO17inv_name: TStringField
      DisplayLabel = #29289#26009#21517#31216
      FieldName = 'inv_name'
      ReadOnly = True
      Size = 30
    end
    object ADO17INV_DESCRIPTION: TStringField
      DisplayLabel = #29289#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      ReadOnly = True
      Size = 200
    end
    object ADO17UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ADO17quan_bom: TFloatField
      DisplayLabel = 'BOM'#24635#38656#27714
      FieldName = 'quan_bom'
      ReadOnly = True
    end
    object ADO17valQty: TBCDField
      DisplayLabel = #26377#25928#24211#23384
      FieldName = 'valQty'
      ReadOnly = True
      Precision = 20
    end
    object ADO17STD_COST: TBCDField
      DisplayLabel = #26631#20934#25104#26412
      FieldName = 'STD_COST'
      ReadOnly = True
      Precision = 11
      Size = 2
    end
    object ADO17invent_tp: TStringField
      DisplayLabel = #29289#26009#31867#21035
      FieldName = 'invent_tp'
      ReadOnly = True
      Size = 6
    end
    object ADO17inv_part_number_r: TStringField
      DisplayLabel = #20195#26367#29289#26009#32534#30721
      FieldName = 'inv_part_number_r'
      ReadOnly = True
      Size = 25
    end
    object ADO17inv_name_r: TStringField
      DisplayLabel = #20195#26367#29289#26009#21517#31216
      FieldName = 'inv_name_r'
      ReadOnly = True
      Size = 30
    end
    object ADO17INV_DESCRIPTION_r: TStringField
      DisplayLabel = #20195#26367#29289#26009#35268#26684
      FieldName = 'INV_DESCRIPTION_r'
      ReadOnly = True
      Size = 200
    end
    object ADO17valQty_r: TBCDField
      DisplayLabel = #20195#26367#29289#26009#24211#23384
      FieldName = 'valQty_r'
      ReadOnly = True
      Precision = 20
    end
    object ADO17INVENT_PTR: TIntegerField
      FieldName = 'INVENT_PTR'
      ReadOnly = True
    end
    object ADO17repl_invt_ptr: TIntegerField
      FieldName = 'repl_invt_ptr'
      ReadOnly = True
    end
    object ADO17Qty: TBCDField
      DisplayLabel = #30003#39046#25968
      DisplayWidth = 20
      FieldName = 'Qty'
      ReadOnly = True
      currency = True
      Precision = 15
    end
    object ADO17remark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      ReadOnly = True
      Size = 30
    end
    object ADO17TD: TBooleanField
      DisplayLabel = #26159#21542#26367#20195
      FieldName = 'TD'
      ReadOnly = True
    end
    object ADO17part_name: TStringField
      DisplayLabel = 'BOM'#21517#31216
      FieldName = 'part_name'
      ReadOnly = True
    end
    object ADO17employee_name: TStringField
      DisplayLabel = 'BOM'#23457#26680#21592
      DisplayWidth = 10
      FieldName = 'employee_name'
      ReadOnly = True
      Size = 10
    end
    object ADO17rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO17PART_PTR: TIntegerField
      FieldName = 'PART_PTR'
      ReadOnly = True
    end
    object ADO17VENDOR: TStringField
      FieldName = 'VENDOR'
      ReadOnly = True
      Size = 50
    end
    object ADO17Invent_or: TSmallintField
      FieldName = 'Invent_or'
      ReadOnly = True
    end
    object ADO17TotalQty: TFloatField
      FieldName = 'TotalQty'
      ReadOnly = True
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
    Left = 57
    Top = 289
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
    Left = 16
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
    Top = 240
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
    Parameters = <
      item
        Name = 'rkey014'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT     rkey, MESSAGE, senddate, whosend'
      'FROM         dbo.Data0014'
      ''
      'where rkey =  :rkey014')
    Left = 360
    Top = 104
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
    Left = 312
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
    Parameters = <
      item
        Name = 'rkey314'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT     rkey, emp_ptr, d14_ptr, hread, deleted, if_note'
      'FROM         dbo.data0314'
      'where rkey =  :rkey314')
    Left = 360
    Top = 160
  end
  object qryGetsystem_date: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 304
    Top = 304
  end
  object ADOVMI: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filter = 'notallowed = 0'
    Filtered = True
    Parameters = <
      item
        Name = 'uptr'
        Size = -1
        Value = Null
      end
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
        'NIT_NAME AS '#21333#20301', dbo.Data0468.QUAN_BOM AS '#30003#39046#25968#37327', dbo.Data0468.QUAN' +
        '_ISSUED AS '#24050#21457#25918#25968#37327', '
      
        '                      dbo.DATA0268.DATE AS '#30003#39046#26085#26399', dbo.DATA0268.re' +
        'ference AS '#22791#27880', dbo.Data0015.WAREHOUSE_CODE AS '#24037#21378#20195#30721', dbo.Data0015' +
        '.ABBR_NAME AS '#24037#21378#31616#31216', '
      
        '                      dbo.DATA0268.CUT_NO AS '#29983#20135#21333#21495', dbo.data0492.' +
        'SO_NO AS '#38144#21806#35746#21333', dbo.Data0008.PROD_CODE AS '#20135#21697#32534#30721', dbo.Data0008.PROD' +
        'UCT_NAME AS '#20135#21697#21517#31216', '
      '                      dbo.Data0008.PRODUCT_DESC AS '#20135#21697#35268#26684', '
      
        '                      CASE data0268.status WHEN 0 THEN '#39#24453#25552#20132#39' WHE' +
        'N 1 THEN '#39#24453#23457#26680#39' WHEN 2 THEN '#39#24050#23457#26680#39' WHEN 3 THEN '#39#34987#36864#22238#39' WHEN 4 THEN '#39 +
        #24050#21457#25918#39' END AS '#39046#26009#21333#29366#24577', '
      
        '                      CASE data0468.status WHEN 0 THEN '#39#26377#25928#39' WHEN' +
        ' 1 THEN '#39#20851#38381#39' END AS '#39046#26009#26126#32454#29366#24577','
      
        '                      case when data0008.if_control=1 then  case' +
        ' when csi_ptr= :uptr then 0 else 1 end else 0 end as notallowed'
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
        ' = dbo.Data0015.RKEY INNER JOIN'
      
        '                      dbo.data0492 ON dbo.DATA0268.CUT_NO = dbo.' +
        'data0492.CUT_NO INNER JOIN'
      
        '                      dbo.Data0008 ON dbo.data0492.BOM_PTR = dbo' +
        '.Data0008.RKEY  left join'
      
        '                      dbo.wzcp0100 on dbo.Data0008.RKEY = wzcp01' +
        '00.proc_ptr'
      'WHERE     (dbo.DATA0268.TTYPE = 1) and'
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
      Size = 60
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
    object ADOVMIDSDesigner13: TStringField
      FieldName = #24037#21378#20195#30721
      Size = 5
    end
    object ADOVMIDSDesigner14: TStringField
      FieldName = #24037#21378#31616#31216
      Size = 70
    end
    object ADOVMIDSDesigner15: TStringField
      FieldName = #29983#20135#21333#21495
      FixedChar = True
      Size = 12
    end
    object ADOVMIDSDesigner16: TStringField
      FieldName = #38144#21806#35746#21333
      Size = 12
    end
    object ADOVMIDSDesigner17: TStringField
      FieldName = #20135#21697#32534#30721
      Size = 15
    end
    object ADOVMIDSDesigner18: TStringField
      DisplayWidth = 20
      FieldName = #20135#21697#21517#31216
      Size = 30
    end
    object ADOVMIDSDesigner19: TStringField
      DisplayWidth = 20
      FieldName = #20135#21697#35268#26684
      Size = 200
    end
    object ADOVMIDSDesigner20: TStringField
      FieldName = #39046#26009#21333#29366#24577
      ReadOnly = True
      Size = 6
    end
    object ADOVMIDSDesigner21: TStringField
      FieldName = #39046#26009#26126#32454#29366#24577
      ReadOnly = True
      Size = 4
    end
  end
  object DS4: TDataSource
    DataSet = ADOVMI
    Left = 144
    Top = 224
  end
  object AdoWzcp492: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      
        'SELECT cast(0 as bit) Sel,dbo.wzcp0492.STD_QTY, dbo.wzcp0492.App' +
        '_QTY, dbo.wzcp0492.Con_QTY, '
      
        'dbo.wzcp0492.QUAN_ASSIGN, dbo.wzcp0492.D492_ptr,dbo.wzcp0492.D14' +
        '8_PTR,wzcp0492.wzcp0495_ptr,'
      
        'dbo.wzcp0492.D017_ptr,d17_0.Rkey Rkey17_0, d17_0.INV_PART_NUMBER' +
        ', d17_0.INV_DESCRIPTION, d17_0.INV_NAME, dbo.wzcp0494.part_name,'
      
        'dbo.data0492.CUT_NO, dbo.data0492.SO_NO, dbo.data0492.PLANNED_QT' +
        'Y, dbo.data0492.ISSUED_QTY, dbo.data0492.FG_QTY,'
      'dbo.data0492.TSTATUS,d17_0.QUAN_ON_HAND,data0002.unit_name,'
      
        'd17_1.inv_part_number inv_part_number_r ,d17_1.inv_name inv_name' +
        '_r,d17_1.INV_DESCRIPTION INV_DESCRIPTION_r,d17_1.QUAN_ON_HAND QU' +
        'AN_ON_HAND_r,d17_1.Rkey Rkey17_r,'
      
        'isNull(dbo.wzcp0492.STD_QTY,0)-isnull(dbo.wzcp0492.App_QTY,0) as' +
        ' dQUAN_BOM,'#39#39' as vendor,'#39#39' as vendor2,wzcp0492.Rkey'
      'FROM  dbo.wzcp0492 INNER JOIN'
      
        '      dbo.data0492 ON dbo.wzcp0492.D492_ptr = dbo.data0492.rkey ' +
        'left join'
      
        '      dbo.wzcp0495 on dbo.wzcp0492.wzcp0495_ptr=dbo.wzcp0495.Rke' +
        'y  left join'
      
        '      dbo.wzcp0494 on dbo.wzcp0495.PARTBOM_PTR=dbo.wzcp0494.Rkey' +
        ' INNER JOIN'
      
        '      dbo.Data0017 d17_0 ON wzcp0492.D017_ptr=d17_0.rkey inner j' +
        'oin'
      
        '      dbo.data0002 on d17_0.STOCK_UNIT_PTR=dbo.data0002.rkey lef' +
        't JOIN'
      '      data0017 d17_1 on wzcp0495.repl_invt_ptr=d17_1.rkey ')
    Left = 48
    Top = 368
    object AdoWzcp492Sel: TBooleanField
      FieldName = 'Sel'
    end
    object AdoWzcp492STD_QTY: TBCDField
      FieldName = 'STD_QTY'
      Precision = 12
    end
    object AdoWzcp492App_QTY: TBCDField
      FieldName = 'App_QTY'
      Precision = 12
    end
    object AdoWzcp492Con_QTY: TBCDField
      FieldName = 'Con_QTY'
      Precision = 12
    end
    object AdoWzcp492QUAN_ASSIGN: TBCDField
      FieldName = 'QUAN_ASSIGN'
      Precision = 12
    end
    object AdoWzcp492D492_ptr: TIntegerField
      FieldName = 'D492_ptr'
    end
    object AdoWzcp492D017_ptr: TIntegerField
      FieldName = 'D017_ptr'
    end
    object AdoWzcp492INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object AdoWzcp492INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object AdoWzcp492CUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object AdoWzcp492SO_NO: TStringField
      FieldName = 'SO_NO'
      Size = 12
    end
    object AdoWzcp492PLANNED_QTY: TIntegerField
      FieldName = 'PLANNED_QTY'
    end
    object AdoWzcp492ISSUED_QTY: TIntegerField
      FieldName = 'ISSUED_QTY'
    end
    object AdoWzcp492FG_QTY: TIntegerField
      FieldName = 'FG_QTY'
    end
    object AdoWzcp492TSTATUS: TWordField
      FieldName = 'TSTATUS'
    end
    object AdoWzcp492QUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      Precision = 19
    end
    object AdoWzcp492INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object AdoWzcp492unit_name: TStringField
      FieldName = 'unit_name'
    end
    object AdoWzcp492dQUAN_BOM: TBCDField
      FieldName = 'dQUAN_BOM'
      Precision = 13
    end
    object AdoWzcp492vendor: TStringField
      FieldName = 'vendor'
      Size = 30
    end
    object AdoWzcp492D148_PTR: TIntegerField
      FieldName = 'D148_PTR'
    end
    object AdoWzcp492part_name: TStringField
      FieldName = 'part_name'
    end
    object AdoWzcp492inv_part_number_r: TStringField
      FieldName = 'inv_part_number_r'
      Size = 25
    end
    object AdoWzcp492inv_name_r: TStringField
      FieldName = 'inv_name_r'
      Size = 30
    end
    object AdoWzcp492INV_DESCRIPTION_r: TStringField
      FieldName = 'INV_DESCRIPTION_r'
      Size = 70
    end
    object AdoWzcp492QUAN_ON_HAND_r: TBCDField
      FieldName = 'QUAN_ON_HAND_r'
      Precision = 19
    end
    object AdoWzcp492Rkey17_0: TAutoIncField
      FieldName = 'Rkey17_0'
      ReadOnly = True
    end
    object AdoWzcp492Rkey17_r: TAutoIncField
      FieldName = 'Rkey17_r'
      ReadOnly = True
    end
    object AdoWzcp492vendor2: TStringField
      DisplayWidth = 1
      FieldName = 'vendor2'
      Size = 30
    end
    object AdoWzcp492wzcp0495_ptr: TIntegerField
      FieldName = 'wzcp0495_ptr'
    end
    object AdoWzcp492Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
  end
end
