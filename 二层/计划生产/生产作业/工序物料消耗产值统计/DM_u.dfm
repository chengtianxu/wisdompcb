object DM: TDM
  OldCreateOrder = False
  Left = 311
  Top = 315
  Height = 313
  Width = 557
  object ADOCon: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 24
  end
  object ADO570: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select data0570.*, '
      '   case when data0570.status=0 then '#39#26377#25928#39
      '           when data0570.status=1 then '#39#24050#23457#39' end status_c,'
      '   case when data0570.ttype=0 then '#39#29289#26009#28040#32791#39
      '           when data0570.ttype=1 then '#39#20135#20540#32479#35745#39' end ttype_c,'
      
        '   d5.employee_name abbr_name,d17.INV_PART_NUMBER,d34.dept_name,' +
        'd34.dept_code,d34.rkey rkey34,d17.INV_PART_DESCRIPTION,'
      '   d2.unit_name,d17.inv_name'
      
        'from data0570  inner join data0005 d5 on  data0570 .empl_ptr=d5.' +
        'rkey '
      
        '               inner join data0034 d34 on data0570.dept_ptr=d34.' +
        'rkey'
      
        '              left join data0017 d17 on data0570.inventory_ptr=d' +
        '17.rkey'
      
        '              left join data0002 d2 on d17.stock_unit_ptr=d2.rke' +
        'y'
      '             ')
    Left = 96
    Top = 104
    object ADO570RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO570number: TStringField
      DisplayLabel = #32479#35745#32534#21495
      FieldName = 'number'
      Size = 15
    end
    object ADO570ttype: TWordField
      FieldName = 'ttype'
    end
    object ADO570status: TWordField
      FieldName = 'status'
    end
    object ADO570DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADO570formula_number: TStringField
      DisplayLabel = #20844#24335#20195#30721
      FieldName = 'formula_number'
      Size = 10
    end
    object ADO570start_date: TDateTimeField
      DisplayLabel = #24320#22987#26085#26399
      FieldName = 'start_date'
    end
    object ADO570end_date: TDateTimeField
      DisplayLabel = #32467#26463#26085#26399
      FieldName = 'end_date'
    end
    object ADO570EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ADO570Statistic_date: TDateTimeField
      DisplayLabel = #32479#35745#26085#26399
      FieldName = 'Statistic_date'
    end
    object ADO570authempl_ptr: TIntegerField
      FieldName = 'authempl_ptr'
    end
    object ADO570auth_date: TDateTimeField
      DisplayLabel = #23457#26680#26085#26399
      FieldName = 'auth_date'
    end
    object ADO570INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ADO570Statistic_ptr: TIntegerField
      FieldName = 'Statistic_ptr'
    end
    object ADO570OPEN_QUANTITY: TBCDField
      DisplayLabel = #26399#21021#25968#37327
      FieldName = 'OPEN_QUANTITY'
      Precision = 10
      Size = 2
    end
    object ADO570expend_QUANTITY: TBCDField
      DisplayLabel = #26412#26399#39046#29992
      FieldName = 'expend_QUANTITY'
      Precision = 10
      Size = 2
    end
    object ADO570CLOSED_QUANTITY: TBCDField
      DisplayLabel = #26399#26411#25968#37327
      FieldName = 'CLOSED_QUANTITY'
      Precision = 10
      Size = 2
    end
    object ADO570theory_result: TBCDField
      DisplayLabel = #29702#35770#35745#31639#32467#26524
      FieldName = 'theory_result'
      Precision = 12
    end
    object ADO570measure_result1: TBCDField
      DisplayLabel = #26368#22823#27979#37327#32467#26524
      FieldName = 'measure_result1'
      Precision = 12
    end
    object ADO570measure_result2: TBCDField
      DisplayLabel = #26368#23567#27979#37327#32467#26524
      FieldName = 'measure_result2'
      Precision = 12
    end
    object ADO570measure_result3: TBCDField
      DisplayLabel = #24179#22343#27979#37327#32467#26524
      FieldName = 'measure_result3'
      Precision = 12
    end
    object ADO570master_remark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'master_remark'
      Size = 50
    end
    object ADO570status_c: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'status_c'
      ReadOnly = True
      Size = 4
    end
    object ADO570abbr_name: TStringField
      DisplayLabel = #32479#35745#20154#21592
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADO570INV_PART_NUMBER: TStringField
      DisplayLabel = #32479#35745#29289#26009
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO570ttype_c: TStringField
      DisplayLabel = #32479#35745#31867#21035
      FieldName = 'ttype_c'
      ReadOnly = True
      Size = 8
    end
    object ADO570dept_name: TStringField
      DisplayLabel = #32479#35745#24037#24207
      FieldName = 'dept_name'
      Size = 30
    end
    object ADO570dept_code: TStringField
      FieldName = 'dept_code'
      Size = 10
    end
    object ADO570rkey34: TAutoIncField
      FieldName = 'rkey34'
      ReadOnly = True
    end
    object ADO570INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #29289#26009#21517#31216
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ADO570theorycalc_meth: TStringField
      FieldName = 'theorycalc_meth'
      Size = 400
    end
    object ADO570measurecalc_meth1: TStringField
      FieldName = 'measurecalc_meth1'
      Size = 400
    end
    object ADO570measurecalc_meth2: TStringField
      FieldName = 'measurecalc_meth2'
      Size = 400
    end
    object ADO570measurecalc_meth3: TStringField
      FieldName = 'measurecalc_meth3'
      Size = 400
    end
    object ADO570unit_name: TStringField
      FieldName = 'unit_name'
    end
    object ADO570inv_name: TStringField
      FieldName = 'inv_name'
      Size = 30
    end
  end
  object tmp: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 368
    Top = 40
  end
  object DS1: TDataSource
    DataSet = ADO570
    Left = 32
    Top = 104
  end
  object ADO570_1: TADOQuery
    Connection = ADOCon
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey570'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0570 where rkey=:rkey570')
    Left = 168
    Top = 104
  end
  object ADO571: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    AfterOpen = ADO571AfterOpen
    AfterScroll = ADO571AfterScroll
    OnNewRecord = ADO571NewRecord
    Parameters = <
      item
        Name = 'rkey570'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0571 where statistic_ptr=:rkey570')
    Left = 96
    Top = 168
    object ADO571Statistic_ptr: TIntegerField
      FieldName = 'Statistic_ptr'
    end
    object ADO571recno_number: TIntegerField
      FieldName = 'recno_number'
    end
    object ADO571ttype: TWordField
      DisplayLabel = #37327'/'#26679
      FieldName = 'ttype'
      OnGetText = ADO571ttypeGetText
    end
    object ADO571WORK_ORDER_number: TStringField
      DisplayLabel = #20316#19994#21333#21495
      FieldName = 'WORK_ORDER_number'
      Size = 22
    end
    object ADO571PANEL_A_B: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'PANEL_A_B'
      Size = 4
    end
    object ADO571customer_name: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'customer_name'
    end
    object ADO571MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADO571MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADO571EPI_NUMBER: TStringField
      DisplayLabel = #22806#21457#21333#21495
      FieldName = 'EPI_NUMBER'
      Size = 15
    end
    object ADO571REMARK: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REMARK'
      Size = 50
    end
    object ADO571pan_qty: TIntegerField
      DisplayLabel = 'PNL'#25968
      FieldName = 'pan_qty'
      OnSetText = ADO571pan_qtySetText
    end
    object ADO571set_qty: TIntegerField
      DisplayLabel = 'SET'#25968
      FieldName = 'set_qty'
      OnSetText = ADO571pan_qtySetText
    end
    object ADO571pcs_qty: TIntegerField
      DisplayLabel = 'PCS'#25968
      FieldName = 'pcs_qty'
    end
    object ADO571pan_size: TStringField
      DisplayLabel = 'PNL'#23610#23544
      FieldName = 'pan_size'
      Size = 30
    end
    object ADO571set_size: TStringField
      DisplayLabel = 'SET'#23610#23544
      FieldName = 'set_size'
      Size = 30
    end
    object ADO571pcs_size: TStringField
      DisplayLabel = 'PCS'#23610#23544
      FieldName = 'pcs_size'
      Size = 30
    end
    object ADO571pan_sqrt: TBCDField
      DisplayLabel = 'PNL'#38754#31215
      FieldName = 'pan_sqrt'
      Precision = 10
      Size = 8
    end
    object ADO571set_sqrt: TBCDField
      DisplayLabel = 'SET'#38754#31215
      FieldName = 'set_sqrt'
      Precision = 10
      Size = 8
    end
    object ADO571pcs_sqrt: TBCDField
      DisplayLabel = 'PCS'#38754#31215
      FieldName = 'pcs_sqrt'
      Precision = 10
      Size = 8
    end
    object ADO571theory_result: TBCDField
      DisplayLabel = #29702#35770#32467#26524
      FieldName = 'theory_result'
      Precision = 12
    end
    object ADO571measure_result1: TBCDField
      DisplayLabel = #26368#22823#27979#37327#32467#26524
      FieldName = 'measure_result1'
      Precision = 12
    end
    object ADO571measure_result2: TBCDField
      DisplayLabel = #26368#23567#27979#37327#32467#26524
      FieldName = 'measure_result2'
      Precision = 12
    end
    object ADO571measure_result3: TBCDField
      DisplayLabel = #24179#22343#27979#37327#32467#26524
      FieldName = 'measure_result3'
      Precision = 12
    end
    object ADO571PARA_PTR_0: TIntegerField
      DisplayLabel = #21442#25968'0'
      FieldName = 'PARA_PTR_0'
    end
    object ADO571PARA_PTR_1: TIntegerField
      DisplayLabel = #21442#25968'1'
      FieldName = 'PARA_PTR_1'
    end
    object ADO571PARA_PTR_2: TIntegerField
      DisplayLabel = #21442#25968'2'
      FieldName = 'PARA_PTR_2'
    end
    object ADO571PARA_PTR_3: TIntegerField
      DisplayLabel = #21442#25968'3'
      FieldName = 'PARA_PTR_3'
    end
    object ADO571PARA_PTR_4: TIntegerField
      DisplayLabel = #21442#25968'4'
      FieldName = 'PARA_PTR_4'
    end
    object ADO571PARA_PTR_5: TIntegerField
      DisplayLabel = #21442#25968'5'
      FieldName = 'PARA_PTR_5'
    end
    object ADO571PARA_PTR_6: TIntegerField
      DisplayLabel = #21442#25968'6'
      FieldName = 'PARA_PTR_6'
    end
    object ADO571PARA_PTR_7: TIntegerField
      DisplayLabel = #21442#25968'7'
      FieldName = 'PARA_PTR_7'
    end
    object ADO571PARA_PTR_8: TIntegerField
      DisplayLabel = #21442#25968'8'
      FieldName = 'PARA_PTR_8'
    end
    object ADO571PARA_PTR_9: TIntegerField
      DisplayLabel = #21442#25968'9'
      FieldName = 'PARA_PTR_9'
    end
    object ADO571PARA_VALUE_0: TStringField
      FieldName = 'PARA_VALUE_0'
      Size = 30
    end
    object ADO571PARA_VALUE_1: TStringField
      FieldName = 'PARA_VALUE_1'
      Size = 30
    end
    object ADO571PARA_VALUE_2: TStringField
      FieldName = 'PARA_VALUE_2'
      Size = 30
    end
    object ADO571PARA_VALUE_3: TStringField
      FieldName = 'PARA_VALUE_3'
      Size = 30
    end
    object ADO571PARA_VALUE_4: TStringField
      FieldName = 'PARA_VALUE_4'
      Size = 30
    end
    object ADO571PARA_VALUE_5: TStringField
      FieldName = 'PARA_VALUE_5'
      Size = 30
    end
    object ADO571PARA_VALUE_6: TStringField
      FieldName = 'PARA_VALUE_6'
      Size = 30
    end
    object ADO571PARA_VALUE_7: TStringField
      FieldName = 'PARA_VALUE_7'
      Size = 30
    end
    object ADO571PARA_VALUE_8: TStringField
      FieldName = 'PARA_VALUE_8'
      Size = 30
    end
    object ADO571PARA_VALUE_9: TStringField
      FieldName = 'PARA_VALUE_9'
      Size = 30
    end
  end
  object ADO572: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    BeforePost = ADO572BeforePost
    BeforeDelete = ADO572BeforeDelete
    OnNewRecord = ADO572NewRecord
    Parameters = <
      item
        Name = 'rkey570'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0572 where statistic_ptr=:rkey570 ')
    Left = 96
    Top = 224
    object ADO572Statistic_ptr: TIntegerField
      FieldName = 'Statistic_ptr'
    end
    object ADO572recno_number: TIntegerField
      FieldName = 'recno_number'
    end
    object ADO572bach_num: TIntegerField
      DisplayLabel = #27979#37327#25209#27425
      FieldName = 'bach_num'
    end
    object ADO572se_num: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'se_num'
    end
    object ADO572au_umply: TBCDField
      DisplayLabel = #37329#21402'(um)'
      FieldName = 'au_umply'
      Precision = 5
    end
    object ADO572measure_empl: TStringField
      DisplayLabel = #27979#37327#20154#21592
      FieldName = 'measure_empl'
      Size = 50
    end
    object ADO572measure_date: TDateTimeField
      DisplayLabel = #27979#37327#26085#26399
      FieldName = 'measure_date'
    end
  end
  object DS2: TDataSource
    DataSet = ADO571
    Left = 32
    Top = 160
  end
  object DS3: TDataSource
    DataSet = ADO572
    Left = 32
    Top = 224
  end
  object ADOCon1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security In' +
      'fo=True;User ID=wzsa;Initial Catalog=172.17.0.188;Data Source=SJ' +
      '_V20_LIVE_3'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 120
    Top = 24
  end
  object tmp1: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 416
    Top = 40
  end
  object ADOPara: TADOQuery
    Connection = ADOCon
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'p1'
        Size = -1
        Value = Null
      end
      item
        Name = 'p2'
        Size = -1
        Value = Null
      end
      item
        Name = 'p3'
        Size = -1
        Value = Null
      end
      item
        Name = 'p4'
        Size = -1
        Value = Null
      end
      item
        Name = 'p4'
        Size = -1
        Value = Null
      end
      item
        Name = 'p5'
        Size = -1
        Value = Null
      end
      item
        Name = 'p6'
        Size = -1
        Value = Null
      end
      item
        Name = 'p7'
        Size = -1
        Value = Null
      end
      item
        Name = 'p8'
        Size = -1
        Value = Null
      end
      item
        Name = 'p8'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select A0.*,A1.*,A2.*,A3.*,A4.*,A5.*,A6.*,A7.*,A8.*,A9.* from'
      '(SELECT 1 as Jo ,Data0278.PARAMETER_DESC PARA_PTR_0,'
      
        '   Data0002.UNIT_NAME Un0,Data0278.PARAMETER_NAME pn0  , Data027' +
        '8.data_type  d_tp0'
      
        '   FROM dbo.Data0002 INNER JOIN  Data0278 ON Data0002.RKEY = Dat' +
        'a0278.UNIT_PTR   '
      '    WHERE Data0278.rkey=:p1)  A0'
      'left join'
      '(SELECT 1 as Jo , Data0278.PARAMETER_DESC PARA_PTR_1, '
      
        '   Data0002.UNIT_NAME Un1,Data0278.PARAMETER_NAME pn1, Data0278.' +
        'data_type  d_tp1'
      
        '   FROM dbo.Data0002 INNER JOIN  Data0278 ON Data0002.RKEY = Dat' +
        'a0278.UNIT_PTR   '
      '    WHERE Data0278.rkey=:p2) A1'
      'on A0.Jo=A1.Jo'
      'left join'
      '(SELECT 1 as Jo , Data0278.PARAMETER_DESC PARA_PTR_2, '
      
        '   Data0002.UNIT_NAME Un2,Data0278.PARAMETER_NAME pn2, Data0278.' +
        'data_type  d_tp2'
      
        '   FROM dbo.Data0002 INNER JOIN  Data0278 ON Data0002.RKEY = Dat' +
        'a0278.UNIT_PTR   '
      '    WHERE Data0278.rkey=:p3) A2'
      'on A0.Jo=A2.Jo'
      'left join'
      '(SELECT 1 as Jo ,Data0278.PARAMETER_DESC PARA_PTR_3, '
      
        '   Data0002.UNIT_NAME Un3,Data0278.PARAMETER_NAME pn3, Data0278.' +
        'data_type  d_tp3'
      
        '   FROM dbo.Data0002 INNER JOIN  Data0278 ON Data0002.RKEY = Dat' +
        'a0278.UNIT_PTR   '
      '    WHERE Data0278.rkey=:p4) A3'
      'on A0.Jo=A3.Jo'
      'left join'
      '(SELECT 1 as Jo , Data0278.PARAMETER_DESC PARA_PTR_4, '
      
        '   Data0002.UNIT_NAME Un4,Data0278.PARAMETER_NAME pn4, Data0278.' +
        'data_type  d_tp4'
      
        '   FROM dbo.Data0002 INNER JOIN  Data0278 ON Data0002.RKEY = Dat' +
        'a0278.UNIT_PTR   '
      '    WHERE Data0278.rkey=:p4) A4'
      'on A0.Jo=A4.Jo'
      'left join'
      '(SELECT 1 as Jo , Data0278.PARAMETER_DESC PARA_PTR_5, '
      
        '   Data0002.UNIT_NAME Un5,Data0278.PARAMETER_NAME pn5, Data0278.' +
        'data_type  d_tp5'
      
        '   FROM dbo.Data0002 INNER JOIN  Data0278 ON Data0002.RKEY = Dat' +
        'a0278.UNIT_PTR   '
      '    WHERE Data0278.rkey=:p5) A5'
      'on A0.Jo=A5.Jo'
      'left join'
      '(SELECT 1 as Jo ,Data0278.PARAMETER_DESC PARA_PTR_6, '
      
        '   Data0002.UNIT_NAME Un6,Data0278.PARAMETER_NAME pn6, Data0278.' +
        'data_type  d_tp6'
      
        '   FROM dbo.Data0002 INNER JOIN  Data0278 ON Data0002.RKEY = Dat' +
        'a0278.UNIT_PTR   '
      '    WHERE Data0278.rkey=:p6) A6'
      'on A0.Jo=A6.Jo'
      'left join'
      '(SELECT 1 as Jo , Data0278.PARAMETER_DESC PARA_PTR_7, '
      
        '   Data0002.UNIT_NAME Un7,Data0278.PARAMETER_NAME pn7, Data0278.' +
        'data_type  d_tp7'
      
        '   FROM dbo.Data0002 INNER JOIN  Data0278 ON Data0002.RKEY = Dat' +
        'a0278.UNIT_PTR   '
      '    WHERE Data0278.rkey=:p7) A7'
      'on A0.Jo=A7.Jo'
      'left join'
      '(SELECT 1 as Jo , Data0278.PARAMETER_DESC PARA_PTR_8, '
      
        '   Data0002.UNIT_NAME Un8,Data0278.PARAMETER_NAME pn8, Data0278.' +
        'data_type  d_tp8'
      
        '   FROM dbo.Data0002 INNER JOIN  Data0278 ON Data0002.RKEY = Dat' +
        'a0278.UNIT_PTR   '
      '    WHERE Data0278.rkey=:p8) A8'
      'on A0.Jo=A8.Jo'
      ''
      'left join'
      '(SELECT 1 as Jo , Data0278.PARAMETER_DESC PARA_PTR_9, '
      
        '   Data0002.UNIT_NAME Un9,Data0278.PARAMETER_NAME pn9, Data0278.' +
        'data_type  d_tp9'
      
        '   FROM dbo.Data0002 INNER JOIN  Data0278 ON Data0002.RKEY = Dat' +
        'a0278.UNIT_PTR   '
      '    WHERE Data0278.rkey=:p8) A9'
      'on A0.Jo=A9.Jo'
      '')
    Left = 208
    Top = 224
  end
  object DS4: TDataSource
    DataSet = ADOPara
    Left = 168
    Top = 224
  end
  object AQ280: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT TOP 100 PERCENT data0280.rkey,Data0280.ENG_TABLE_NAME,'
      '  Data0280.DATA_TYPE,Data0278.DATA_TYPE AS fx_type,'
      '  Data0278_1.DATA_TYPE AS fy_type'
      'FROM dbo.Data0280 INNER JOIN'
      
        '      dbo.Data0278 ON dbo.Data0280.FX = dbo.Data0278.RKEY LEFT O' +
        'UTER JOIN'
      
        '      dbo.Data0278 Data0278_1 ON dbo.Data0280.FY = Data0278_1.RK' +
        'EY'
      'ORDER BY dbo.Data0280.ENG_TABLE_NAME')
    Left = 368
    Top = 168
    object AQ280rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ280ENG_TABLE_NAME: TStringField
      FieldName = 'ENG_TABLE_NAME'
      Size = 10
    end
    object AQ280DATA_TYPE: TIntegerField
      FieldName = 'DATA_TYPE'
    end
    object AQ280fx_type: TWordField
      FieldName = 'fx_type'
    end
    object AQ280fy_type: TWordField
      FieldName = 'fy_type'
    end
  end
  object ADOStoredProc1: TADOStoredProc
    Connection = ADOCon
    CursorType = ctStatic
    ProcedureName = 'WZPR085;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@vptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@vtpx'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 2
      end
      item
        Name = '@vtpy'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 2
      end
      item
        Name = '@vcol0'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = #39#39
      end
      item
        Name = '@vrow0'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = #39#39
      end
      item
        Name = '@vcol'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 7
        Value = 0.000000000000000000
      end
      item
        Name = '@vrow'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 7
        Value = 0.000000000000000000
      end>
    Left = 368
    Top = 224
    object ADOStoredProc1tvalue: TStringField
      FieldName = 'tvalue'
      Size = 50
    end
  end
  object ADO569: TADOQuery
    Connection = ADOCon
    Parameters = <
      item
        Name = 'formula_number'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0569 where formula_number=:formula_number')
    Left = 272
    Top = 224
  end
end
