object DM: TDM
  OldCreateOrder = False
  Left = 265
  Top = 190
  Height = 467
  Width = 540
  object ADOConnection1: TADOConnection
    ConnectionTimeout = 0
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 32
  end
  object ADS492: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADS492CalcFields
    CommandText = 
      ' if exists (select * from tempdb.dbo.sysobjects                 ' +
      '          '#13#10'where id = object_id(N'#39'tempdb..#temp492'#39') and type='#39 +
      'U'#39')  drop table #temp492                                        ' +
      '         '#13#10'SELECT data0492.CUT_NO,data0492.PLANNED_QTY,data0492.' +
      'ISSUED_QTY,data0492.SCH_COMPL_DATE,data0492.ISSUE_DATE, '#13#10'      ' +
      ' data0492.rkey,data0492.TSTATUS,data0492.remark,data0492.FG_QTY,' +
      'data0492.WIP_QTY,data0492.QTY_REJECT, '#13#10'       data0492.ORD_REQ_' +
      'QTY,Data0005.EMPLOYEE_NAME,Data0008.PROD_CODE,Data0008.PRODUCT_N' +
      'AME, '#13#10'       Data0008.PRODUCT_DESC,Data0034.DEPT_CODE,Data0034.' +
      'DEPT_NAME,data0492.CUT_NO AS cutno, '#13#10'       CASE data0492.ttype' +
      ' WHEN 0 THEN '#39#35746#21333#25237#20135#39' WHEN 1 THEN '#39#34917#26009#25237#20135#39' WHEN 4 THEN '#39#25353#20135#21697#25237#20135#39' END A' +
      'S v_ttype, '#13#10'       data0492.WHOUSE_PTR,data0492.PRINTED_BY_PTR,' +
      'data0492.mrb_ptr,data0492.BOM_PTR, '#13#10'       Data0015.WAREHOUSE_C' +
      'ODE,data0492.SO_NO,Data0010.CUST_CODE,Data0010.ABBR_NAME,WZCP007' +
      '1.price,'#13#10#9'   data34s.dept_name dept_names,case when dbo.Data000' +
      '8.if_control=1 then case when cp100.csi_ptr is not null then 0 e' +
      'lse 1 end else 0 end as ctrl'#13#10'      ,isnull(data0492.re_WorkHour' +
      ',0) as RHour,isnull(data0008.WORKHOUSE,0)*data0492.ISSUED_QTY  a' +
      's PHour'#13#10'       ,ARHour=(select sum(TOTAL_WORKHOUSE) from wzcp00' +
      '72 where WZCP0072.RKEY_492=data0492.rkey)'#13#10'into #temp492      '#13#10 +
      'FROM   data0492 INNER JOIN'#13#10'       Data0005 ON data0492.CREATED_' +
      'BY_PTR = Data0005.RKEY INNER JOIN'#13#10'       Data0008 ON data0492.B' +
      'OM_PTR = Data0008.RKEY INNER JOIN'#13#10'       Data0034 ON data0492.m' +
      'rb_ptr = Data0034.RKEY INNER JOIN'#13#10'       Data0015 ON data0492.W' +
      'HOUSE_PTR = Data0015.RKEY INNER JOIN'#13#10'       WZCP0070 ON data049' +
      '2.SO_NO = WZCP0070.sales_order left JOIN'#13#10'      data0034 data34s' +
      ' on wzcp0070.entrust_deptptr= data34s.rkey INNER JOIN'#13#10'       WZ' +
      'CP0071 ON WZCP0071.so_ptr=WZCP0070.RKEY and data0492.BOM_PTR = w' +
      'zcp0071.prod_ptr LEFT OUTER JOIN'#13#10'       Data0010 ON WZCP0070.cu' +
      'stomer_ptr = Data0010.RKEY left join '#13#10'(SELECT     CSI_PTR, PROC' +
      '_PTR FROM dbo.WZCP0100 WHERE (CSI_PTR =:uptr2)) AS cp100  '#13#10'on d' +
      'bo.Data0008.RKEY = cp100.proc_ptr '#13#10'where 1=1  and data0492.ISSU' +
      'E_DATE>=:dtpk1 and  data0492.ISSUE_DATE<=:dtpk2'
    IndexFieldNames = 'CUT_NO'
    Parameters = <
      item
        Name = 'uptr2'
        DataType = ftInteger
        Size = 1
        Value = 0
      end
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 40179d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 40452d
      end>
    Left = 112
    Top = 96
    object ADS492CUT_NO: TStringField
      DisplayLabel = #29983#20135#21333#21495
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADS492SO_NO: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'SO_NO'
      Size = 12
    end
    object ADS492PLANNED_QTY: TIntegerField
      DisplayLabel = #35746#21333#25968#37327
      FieldName = 'PLANNED_QTY'
    end
    object ADS492ISSUED_QTY: TIntegerField
      DisplayLabel = #25237#20135#25968#37327
      FieldName = 'ISSUED_QTY'
    end
    object ADS492SCH_COMPL_DATE: TDateTimeField
      DisplayLabel = #23436#24037#26085#26399
      FieldName = 'SCH_COMPL_DATE'
    end
    object ADS492ISSUE_DATE: TDateTimeField
      DisplayLabel = #25237#20135#26085#26399
      FieldName = 'ISSUE_DATE'
    end
    object ADS492rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS492TSTATUS: TWordField
      DisplayLabel = #29366#24577
      FieldName = 'TSTATUS'
    end
    object ADS492REMARK: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REMARK'
      Size = 100
    end
    object ADS492FG_QTY: TIntegerField
      DisplayLabel = #23436#24037#25968#37327
      FieldName = 'FG_QTY'
    end
    object ADS492WIP_QTY: TIntegerField
      DisplayLabel = #22312#32447#25968#37327
      FieldName = 'WIP_QTY'
    end
    object ADS492QTY_REJECT: TIntegerField
      DisplayLabel = #25253#24223#25968#37327
      FieldName = 'QTY_REJECT'
    end
    object ADS492ORD_REQ_QTY: TIntegerField
      DisplayLabel = #24453#20837#24211#25968#37327
      FieldName = 'ORD_REQ_QTY'
    end
    object ADS492EMPLOYEE_NAME: TStringField
      DisplayLabel = #25237#20135#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS492PROD_CODE: TStringField
      DisplayLabel = #20135#21697#20195#30721
      DisplayWidth = 20
      FieldName = 'PROD_CODE'
      Size = 25
    end
    object ADS492PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADS492PRODUCT_DESC: TStringField
      DisplayLabel = #20135#21697#35268#26684
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
    object ADS492DEPT_CODE: TStringField
      DisplayLabel = #21046#36896#37096#38376
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADS492DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADS492v_ttype: TStringField
      DisplayLabel = #25237#20135#31867#22411
      FieldName = 'v_ttype'
      ReadOnly = True
      Size = 10
    end
    object ADS492PRINTED_BY_PTR: TIntegerField
      FieldName = 'PRINTED_BY_PTR'
    end
    object ADS492mrb_ptr: TIntegerField
      FieldName = 'mrb_ptr'
    end
    object ADS492BOM_PTR: TIntegerField
      FieldName = 'BOM_PTR'
    end
    object ADS492WHOUSE_PTR: TIntegerField
      FieldName = 'WHOUSE_PTR'
    end
    object ADS492warehouse_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
    object ADS492cutno: TStringField
      FieldName = 'cutno'
      FixedChar = True
      Size = 12
    end
    object ADS492CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADS492ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADS492price: TBCDField
      FieldName = 'price'
      Precision = 10
      Size = 2
    end
    object ADS492dept_names: TStringField
      FieldName = 'dept_names'
      Size = 30
    end
    object ADS492v_TSTATUS: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'v_TSTATUS'
      Size = 10
      Calculated = True
    end
    object ADS492ctrl: TIntegerField
      FieldName = 'ctrl'
    end
    object ADS492RHour: TBCDField
      FieldName = 'RHour'
      Precision = 10
      Size = 2
    end
    object ADS492PHour: TBCDField
      FieldName = 'PHour'
      Precision = 10
      Size = 2
    end
    object ADS492ARHour: TBCDField
      FieldName = 'ARHour'
      Precision = 32
      Size = 1
    end
    object strngfldADS492progress: TStringField
      FieldName = 'progress'
      ReadOnly = True
      Size = 31
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS492
    Left = 48
    Top = 96
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 128
    Top = 32
  end
  object aqy04: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT     CONTROL_NO_LENGTH, SEED_FLAG, SEED_VALUE'
      'FROM         Data0004'
      'WHERE     (RKEY = 55)')
    Left = 192
    Top = 96
    object aqy04CONTROL_NO_LENGTH: TSmallintField
      FieldName = 'CONTROL_NO_LENGTH'
    end
    object aqy04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
    object aqy04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 200
    Top = 32
  end
  object DataSource2: TDataSource
    DataSet = ADS468
    Left = 40
    Top = 168
  end
  object ADS468: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT '#9'dbo.Data0017.INV_PART_NUMBER, '#13#10#9'dbo.Data0017.INV_NAME, ' +
      #9#13#10#9'dbo.Data0017.INV_DESCRIPTION,'#13#10'                dbo.Data0017.' +
      'QUAN_ON_HAND,'#13#10'                dbo.Data0468.RKEY,'#13#10'             ' +
      '   dbo.Data0468.CUT_NO,'#13#10'    '#9'dbo.Data0468.QUAN_BOM, '#13#10'         ' +
      '       dbo.Data0468.QUAN_ISSUED, '#9#9#13#10#9'dbo.Data0002.UNIT_NAME,'#13#10' ' +
      '               dbo.Data0468.STATUS,'#13#10#9'CASE dbo.Data0468.STATUS W' +
      'HEN 0 THEN '#39#26377#25928#39' WHEN 1 THEN '#39#20851#38381#39' WHEN 2 THEN '#39#24453#30830#35748#39' WHEN 3 THEN '#39 +
      #34987#36864#22238#39' END AS '#29366#24577', '#13#10'                 '#39#26631#20934#29289#26009#39' AS '#31867#22411','#13#10#9'dbo.Data0468.' +
      'VENDOR,dbo.DATA0268.number '#13#10'                       '#13#10'FROM      ' +
      'dbo.Data0002 INNER JOIN'#13#10'                dbo.Data0468 INNER JOIN' +
      #13#10'                dbo.Data0017 ON dbo.Data0468.INVENT_PTR = dbo.' +
      'Data0017.RKEY ON '#13#10'dbo.Data0002.RKEY = dbo.Data0017.STOCK_UNIT_P' +
      'TR  INNER JOIN dbo.DATA0268 ON dbo.Data0468.FLOW_NO = dbo.DATA02' +
      '68.rkey'#13#10#13#10'WHERE     (dbo.Data0468.invent_or = 0) AND (dbo.Data0' +
      '268.CUT_NO = :cut_no ) '#13#10'   '#13#10#13#10'union all'#13#10#13#10'SELECT     '#9'TOP (10' +
      '0) PERCENT'#13#10#9#9#9'dbo.Data0008.PROD_CODE,'#13#10#9#9#9'dbo.Data0008.PRODUCT_' +
      'NAME, '#13#10#9#9#9'dbo.Data0008.PRODUCT_DESC,'#13#10'                         ' +
      '                       dbo.Data0008.qty_onhand,'#13#10'               ' +
      '                                 dbo.Data0468.RKEY,'#13#10'           ' +
      '                                     dbo.Data0468.CUT_NO, '#13#10#9#9#9'd' +
      'bo.Data0468.QUAN_BOM, '#9' '#13#10'  '#9#9#9'dbo.Data0468.QUAN_ISSUED, '#13#10#9#9#9'db' +
      'o.Data0002.UNIT_NAME,'#13#10'                                         ' +
      '       dbo.Data0468.STATUS,'#13#10'                                   ' +
      '             CASE dbo.Data0468.STATUS WHEN 0 THEN '#39#26377#25928#39' WHEN 1 TH' +
      'EN '#39#20851#38381#39' WHEN 2 THEN '#39#24453#30830#35748#39' WHEN 3 THEN '#39#34987#36864#22238#39' END AS '#29366#24577', '#13#10'       ' +
      '                                          '#39#21322#25104#21697#39'  AS '#31867#22411','#13#10#9#9#9'dbo.' +
      'Data0468.VENDOR,DATA0492.CUT_NO'#13#10#13#10'FROM        dbo.Data0468 INNE' +
      'R JOIN'#13#10'                  dbo.Data0008 ON dbo.Data0468.INVENT_PT' +
      'R = dbo.Data0008.RKEY'#13#10' INNER JOIN'#13#10'            dbo.Data0002 ON ' +
      'dbo.Data0008.unit_ptr = dbo.Data0002.RKEY  INNER JOIN dbo.DATA04' +
      '92 ON dbo.Data0468.CUT_NO = dbo.DATA0492.CUT_NO'#13#10#13#10'WHERE     (db' +
      'o.Data0468.invent_or = 1) AND (dbo.Data0492.CUT_NO = :cut_no )  ' +
      #13#10#13#10'order by Data0017.INV_PART_NUMBER'
    DataSource = DataSource1
    MasterFields = 'cut_no;cutno'
    Parameters = <
      item
        Name = 'cut_no'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'cut_no'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    Left = 112
    Top = 168
    object ADS468INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      ReadOnly = True
      Size = 25
    end
    object ADS468INV_NAME: TStringField
      FieldName = 'INV_NAME'
      ReadOnly = True
      Size = 30
    end
    object ADS468INV_DESCRIPTION: TStringField
      DisplayWidth = 50
      FieldName = 'INV_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ADS468QUAN_BOM: TFloatField
      FieldName = 'QUAN_BOM'
      ReadOnly = True
    end
    object ADS468QUAN_ISSUED: TFloatField
      FieldName = 'QUAN_ISSUED'
      ReadOnly = True
    end
    object ADS468UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
      ReadOnly = True
    end
    object ADS468DSDesigner2: TStringField
      FieldName = #31867#22411
      ReadOnly = True
      Size = 8
    end
    object ADS468VENDOR: TStringField
      FieldName = 'VENDOR'
      ReadOnly = True
      Size = 15
    end
    object ADS468CUT_NO: TStringField
      FieldName = 'CUT_NO'
      ReadOnly = True
      FixedChar = True
      Size = 12
    end
    object ADS468RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS468STATUS: TSmallintField
      FieldName = 'STATUS'
      ReadOnly = True
    end
    object ADS468QUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      ReadOnly = True
      Precision = 19
    end
    object ADS468DSDesigner: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 6
    end
    object ADS468number: TStringField
      FieldName = 'number'
      ReadOnly = True
      Size = 10
    end
  end
  object ADS492_P: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT     dbo.data0492.CUT_NO,'#13#10'                   dbo.data0492' +
      '.CUT_NO as '#29983#20135#21333#21495', '#13#10'                   dbo.data0492.SO_NO as '#38144#21806#35746#21333 +
      ', '#13#10'                   dbo.data0492.PLANNED_QTY as '#35746#21333#25968#37327', '#13#10'     ' +
      '              dbo.data0492.ISSUED_QTY as '#25237#20135#25968#37327', '#13#10'               ' +
      '    dbo.data0492.SCH_COMPL_DATE as '#35745#21010#23436#24037#26085#26399', '#13#10'                   ' +
      'dbo.data0492.ISSUE_DATE as '#25237#20135#26085#26399', '#13#10'                   dbo.data04' +
      '92.rkey, '#13#10'                   dbo.data0492.TSTATUS, '#13#10'          ' +
      '         dbo.data0492.REMARK as '#22791#27880', '#13#10'                   dbo.Dat' +
      'a0005.EMPLOYEE_NAME as '#21592#24037#22995#21517', '#13#10'                   dbo.Data0008.P' +
      'ROD_CODE as '#20135#21697#20195#30721', '#13#10'                   dbo.Data0008.PRODUCT_NAME' +
      ' as '#20135#21697#21517#31216', '#13#10'                   dbo.Data0008.PRODUCT_DESC as '#20135#21697#35268#26684 +
      ', '#13#10'                   dbo.Data0034.DEPT_CODE as '#37096#38376#20195#30721', '#13#10'       ' +
      '            dbo.Data0034.DEPT_NAME as '#37096#38376#21517#31216', '#13#10'                  ' +
      ' CASE data0492.ttype WHEN 0 THEN '#39#35746#21333#25237#20135#39' WHEN 1 THEN '#39#34917#26009#25237#20135#39' WHEN ' +
      '4 THEN '#39#25353#20135#21697#25237#20135#39' END AS v_ttype, '#13#10'                   dbo.Data0015' +
      '.WAREHOUSE_CODE as '#24037#21378#20195#30721', '#13#10'                   dbo.Data0015.WAREH' +
      'OUSE_NAME as '#24037#21378#21517#31216', '#13#10'                   dbo.Data0005.EMPL_CODE a' +
      's '#21592#24037#20195#30721', '#13#10'                   dbo.data0492.con_date as '#26368#21518#30830#35748#26085#26399', '#13#10 +
      '                   d05.employee_name as '#26368#21518#30830#35748#20154#21592#13#10#13#10'FROM         d' +
      'bo.data0492 INNER JOIN'#13#10'                   dbo.Data0005 ON dbo.d' +
      'ata0492.CREATED_BY_PTR = dbo.Data0005.RKEY INNER JOIN'#13#10'         ' +
      '          dbo.Data0008 ON dbo.data0492.BOM_PTR = dbo.Data0008.RK' +
      'EY INNER JOIN'#13#10'                   dbo.Data0034 ON dbo.data0492.m' +
      'rb_ptr = dbo.Data0034.RKEY INNER JOIN'#13#10'                   dbo.Da' +
      'ta0015 ON dbo.data0492.WHOUSE_PTR = dbo.Data0015.RKEY left outer' +
      ' JOIN'#13#10'data0005 as d05 on data0492.con_user_ptr=d05.rkey'#13#10'where ' +
      ' '#13#10' dbo.data0492.CUT_NO=:cutno'
    Parameters = <
      item
        Name = 'cutno'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = Null
      end>
    Left = 328
    Top = 184
    object ADS492_PCUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADS492_PDSDesigner: TStringField
      FieldName = #29983#20135#21333#21495
      FixedChar = True
      Size = 12
    end
    object ADS492_PDSDesigner2: TStringField
      FieldName = #38144#21806#35746#21333
      Size = 12
    end
    object ADS492_PDSDesigner3: TIntegerField
      FieldName = #35746#21333#25968#37327
    end
    object ADS492_PDSDesigner4: TIntegerField
      FieldName = #25237#20135#25968#37327
    end
    object ADS492_PDSDesigner5: TDateTimeField
      FieldName = #35745#21010#23436#24037#26085#26399
    end
    object ADS492_PDSDesigner6: TDateTimeField
      FieldName = #25237#20135#26085#26399
    end
    object ADS492_Prkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS492_PTSTATUS: TWordField
      FieldName = 'TSTATUS'
    end
    object ADS492_PDSDesigner7: TStringField
      FieldName = #22791#27880
      Size = 100
    end
    object ADS492_PDSDesigner8: TStringField
      FieldName = #21592#24037#22995#21517
      Size = 16
    end
    object ADS492_PDSDesigner9: TStringField
      FieldName = #20135#21697#20195#30721
      Size = 25
    end
    object ADS492_PDSDesigner10: TStringField
      FieldName = #20135#21697#21517#31216
      Size = 30
    end
    object ADS492_PDSDesigner11: TStringField
      DisplayWidth = 50
      FieldName = #20135#21697#35268#26684
      Size = 200
    end
    object ADS492_PDSDesigner12: TStringField
      FieldName = #37096#38376#20195#30721
      Size = 10
    end
    object ADS492_PDSDesigner13: TStringField
      FieldName = #37096#38376#21517#31216
      Size = 30
    end
    object ADS492_Pv_ttype: TStringField
      FieldName = 'v_ttype'
      ReadOnly = True
      Size = 10
    end
    object ADS492_PDSDesigner14: TStringField
      FieldName = #24037#21378#20195#30721
      Size = 5
    end
    object ADS492_PDSDesigner15: TStringField
      FieldName = #24037#21378#21517#31216
      Size = 70
    end
    object ADS492_PDSDesigner16: TStringField
      FieldName = #21592#24037#20195#30721
      Size = 10
    end
    object ADS492_PDSDesigner17: TDateTimeField
      FieldName = #26368#21518#30830#35748#26085#26399
    end
    object ADS492_PDSDesigner18: TStringField
      FieldName = #26368#21518#30830#35748#20154#21592
      Size = 16
    end
  end
  object ADS468_P: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     '#9'TOP (100) PERCENT'#13#10#9#9#9'dbo.Data0008.PROD_CODE as '#39#26448#26009#32534 +
      #30721#39','#13#10#9#9#9'dbo.Data0008.PRODUCT_NAME as '#39#26448#26009#21517#31216#39', '#13#10#9#9#9'dbo.Data0008.P' +
      'RODUCT_DESC as '#39#26448#26009#35268#26684#39','#13#10'                                        ' +
      '        dbo.Data0008.qty_onhand as '#39#24403#21069#24211#23384#39','#13#10'                    ' +
      '                            dbo.Data0468.RKEY,'#13#10'                ' +
      '                                dbo.Data0468.CUT_NO as '#39#29983#20135#21333#39','#13#10#9 +
      #9#9'dbo.Data0468.QUAN_BOM as '#39#37197#39069#25968#37327#39', '#9' '#13#10'  '#9#9#9'dbo.Data0468.QUAN_IS' +
      'SUED as '#39#24050#21457#25918#25968#37327#39', '#13#10#9#9#9'dbo.Data0002.UNIT_NAME as '#39#21333#20301#39','#13#10'         ' +
      '                                       dbo.Data0468.STATUS,     ' +
      '                                            '#39#21322#25104#21697#39'  AS '#31867#22411','#13#10#9#9#9'db' +
      'o.Data0468.VENDOR AS '#39#22791#27880#39#13#10#13#10'FROM        dbo.Data0468 INNER JOIN' +
      #13#10'                  dbo.Data0008 ON dbo.Data0468.INVENT_PTR = db' +
      'o.Data0008.RKEY INNER JOIN '#13#10'                   dbo.Data0002 ON ' +
      'dbo.Data0008.unit_ptr = dbo.Data0002.RKEY'#13#10'WHERE     (dbo.Data04' +
      '68.invent_or = 1) AND '#13#10'                  (dbo.Data0468.CUT_NO =' +
      ' :CUT_NO ) AND  '#13#10'                 (dbo.Data0468.STATUS =0)'#13#10#13#10'o' +
      'rder by Data0008.PROD_CODE'
    DataSource = DataSource3
    MasterFields = 'CUT_NO'
    Parameters = <
      item
        Name = 'CUT_NO'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = Null
      end>
    Left = 328
    Top = 248
    object ADS468_PDSDesigner: TStringField
      FieldName = #26448#26009#32534#30721
      ReadOnly = True
      Size = 25
    end
    object ADS468_PDSDesigner2: TStringField
      FieldName = #26448#26009#21517#31216
      ReadOnly = True
      Size = 30
    end
    object ADS468_PDSDesigner3: TStringField
      DisplayWidth = 50
      FieldName = #26448#26009#35268#26684
      ReadOnly = True
      Size = 100
    end
    object ADS468_PDSDesigner4: TBCDField
      FieldName = #24403#21069#24211#23384
      ReadOnly = True
      Precision = 19
    end
    object ADS468_PRKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS468_PDSDesigner5: TStringField
      FieldName = #29983#20135#21333
      ReadOnly = True
      FixedChar = True
      Size = 12
    end
    object ADS468_PDSDesigner6: TFloatField
      FieldName = #37197#39069#25968#37327
      ReadOnly = True
    end
    object ADS468_PDSDesigner7: TFloatField
      FieldName = #24050#21457#25918#25968#37327
      ReadOnly = True
    end
    object ADS468_PDSDesigner8: TStringField
      FieldName = #21333#20301
      ReadOnly = True
    end
    object ADS468_PSTATUS: TSmallintField
      FieldName = 'STATUS'
      ReadOnly = True
    end
    object ADS468_PDSDesigner9: TStringField
      FieldName = #31867#22411
      ReadOnly = True
      Size = 8
    end
    object ADS468_PDSDesigner10: TStringField
      FieldName = #22791#27880
      ReadOnly = True
      Size = 15
    end
  end
  object DataSource3: TDataSource
    DataSet = ADS492_P
    Left = 248
    Top = 184
  end
  object DataSource4: TDataSource
    DataSet = ADS468_P
    Left = 248
    Top = 248
  end
  object qrytemp: TADOQuery
    Connection = ADOConnection1
    CommandTimeout = 0
    Parameters = <>
    Left = 40
    Top = 256
  end
  object ADOCommand1: TADOCommand
    Connection = ADOConnection1
    Parameters = <>
    Left = 120
    Top = 256
  end
  object ADS0493: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      ' select data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,wzcp0493.*,'#13#10' ' +
      'case wzcp0493.tstatus when 7 then '#39#24050#26242#20572#39' '#13#10' when 0 then '#39#24050#23457#26680#39#13#10' w' +
      'hen 1 then '#39#26410#23457#26680#39#13#10' when 2 then '#39#19981#23457#26680#39#13#10'when 8 then '#39#24050#24674#22797#39' end as '#29366 +
      #24577' '#13#10#13#10'from wzcp0493'#13#10' join data0005 on wzcp0493.[Oper_Empl]=data' +
      '0005.rkey where wzcp0493.[D492_ptr]=:rkey'
    DataSource = DataSource1
    IndexFieldNames = 'D492_ptr'
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 120
    Top = 312
    object ADS0493Rkey: TIntegerField
      FieldName = 'Rkey'
      ReadOnly = True
      Visible = False
    end
    object ADS0493D492_ptr: TIntegerField
      FieldName = 'D492_ptr'
      Visible = False
    end
    object ADS0493OldSTATUS: TWordField
      FieldName = 'OldSTATUS'
      Visible = False
    end
    object ADS0493TSTATUS: TWordField
      DisplayLabel = #29366#24577
      DisplayWidth = 6
      FieldName = 'TSTATUS'
      Visible = False
    end
    object ADS0493DSDesigner: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 6
    end
    object ADS0493Oper_date: TDateTimeField
      DisplayLabel = #26085#26399
      DisplayWidth = 16
      FieldName = 'Oper_date'
    end
    object ADS0493Oper_Empl: TIntegerField
      FieldName = 'Oper_Empl'
      Visible = False
    end
    object ADS0493EMPL_CODE: TStringField
      DisplayLabel = #25805#20316#20154#20195#30721
      DisplayWidth = 6
      FieldName = 'EMPL_CODE'
      Visible = False
      Size = 10
    end
    object ADS0493EMPLOYEE_NAME: TStringField
      DisplayLabel = #25805#20316#20154
      DisplayWidth = 10
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS0493remark: TWideStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 50
      FieldName = 'remark'
      Size = 50
    end
  end
  object ADOQuery3: TADOQuery
    Parameters = <>
    Left = 408
    Top = 120
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 312
    Top = 80
  end
end
